package com.mt.spingamer.Models.Profile;

import static android.util.Log.*;
import static android.util.Log.wtf;

import android.util.Log;

import androidx.lifecycle.MutableLiveData;

import com.mt.spingamer.AllModules.Admin;
import com.mt.spingamer.AllModules.RetrofitClientInstanceGson;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class ModelProfile {
    public static MutableLiveData<String> message = new MutableLiveData<>();
    public static MutableLiveData<String> user_balance = new MutableLiveData<>();
    public static MutableLiveData<Profile> response_data = new MutableLiveData<>();

    public static void load() {
        user_balance.setValue("0.01");
        JsonPlaceHolderAPI serviceGson = RetrofitClientInstanceGson.getRetrofitInstance().create(JsonPlaceHolderAPI.class);
        Call<Profile> call = serviceGson.get_profile(Admin.tinyDB.getString("userid"));
        call.enqueue(new Callback<Profile>() {
            @Override
            public void onResponse(Call<Profile> call, Response<Profile> response) {
                try {
                    wtf("Hulk-widow-34", response.body().getResult().getBalance());
                } catch (Exception e) {
                    wtf("Hulk-widow-29", e.getMessage());
                    message.setValue("No data to show");
                }
            }

            @Override
            public void onFailure(Call<Profile> call, Throwable t) {
                wtf("Hulk-widow-38", t);
                message.setValue("Failed to load data");
            }
        });


    }

}
