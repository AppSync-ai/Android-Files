package com.example.androidtemplate.Models;

import static android.util.Log.wtf;
import static com.example.androidtemplate.Modules.Admin.getLineNumber;

import android.util.Log;

import androidx.lifecycle.MutableLiveData;

import com.example.androidtemplate.Modules.Admin;
import com.example.androidtemplate.Reqs.ServerResponse;
import com.example.androidtemplate.Modules.GetDataService;
import com.example.androidtemplate.Modules.RetrofitClientInstanceGson;

import java.io.File;

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ModelFileUpload {
    public static MutableLiveData<ServerResponse> response_data = new MutableLiveData<>();

    public static void load(File file) {
        response_data.setValue(null);
        GetDataService serviceGson = RetrofitClientInstanceGson.getRetrofitInstance().create(GetDataService.class);

        RequestBody requestBody = RequestBody.create(MediaType.parse("*/*"), file);
        MultipartBody.Part fileToUpload = MultipartBody.Part.createFormData("file", file.getName(), requestBody);
        RequestBody filename = RequestBody.create(MediaType.parse("text/plain"), file.getName());

        Call<ServerResponse> call = serviceGson.uploadFile(fileToUpload, filename);
        call.enqueue(new Callback<ServerResponse>() {
            @Override
            public void onResponse(Call<ServerResponse> call, Response<ServerResponse> response) {
                try {
//                    wtf("Hulk-" + getClass().getName() + "-" + getLineNumber(), "" + response.raw().request().url());
                    response_data.setValue(response.body());
                    wtf("Hulk-" + getClass().getName() + "-" + getLineNumber(), "" + response.isSuccessful());

                } catch (Exception e) {
                    wtf("Hulk-" + getClass().getName() + "-" + getLineNumber(), "" + e);
                    response_data.setValue(null);
                }
            }

            @Override
            public void onFailure(Call<ServerResponse> call, Throwable t) {
                wtf("Hulk-" + getClass().getName() + "-" + getLineNumber(), "" + t);
                response_data.setValue(null);
            }
        });

    }

}
