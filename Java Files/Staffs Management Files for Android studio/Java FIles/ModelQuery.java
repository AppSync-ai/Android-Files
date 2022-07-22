package com.example.androidtemplate.Models;

import static android.util.Log.wtf;

import androidx.lifecycle.MutableLiveData;

import com.example.androidtemplate.Modules.Admin;
import com.example.androidtemplate.Modules.GetDataService;
import com.example.androidtemplate.Modules.RetrofitClientInstanceGson;

import java.util.ArrayList;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class ModelQuery {

    public static MutableLiveData<String> response_data = new MutableLiveData<>();

    public static void load(String query, String code) {
        response_data.setValue(null);
        GetDataService serviceGson = RetrofitClientInstanceGson.getRetrofitInstance().create(GetDataService.class);
        Call<String> call = serviceGson.make_it_query(query, code);
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                try {
                    response_data.setValue(response.body());
                } catch (Exception e) {
                    wtf("Hulk-" + getClass().getSimpleName() + "-" + Admin.getLineNumber(), "" + e);
                    response_data.setValue(null);
                }
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                wtf("Hulk-" + getClass().getSimpleName() + "-" + Admin.getLineNumber(), "" + t);
                response_data.setValue(null);
            }
        });


    }

}
