package com.mt.spingamer.Models;

import static android.util.Log.wtf;
import static com.mt.spingamer.AllModules.Admin.service;

import androidx.lifecycle.MutableLiveData;

import com.google.gson.Gson;
import com.mt.spingamer.AllReqs.BannersReq;
import com.mt.spingamer.AllReqs.SocialReq;

import java.util.ArrayList;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class ModelBanners {
    public static MutableLiveData<String> message = new MutableLiveData<>();
    public static MutableLiveData<BannersReq> response_data = new MutableLiveData<>();

    public static void load() {
        Call<String> call = service.get_socials_v2();
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                if (response.isSuccessful()) {
                    try {
                        Gson gson = new Gson();
                        BannersReq banners = gson.fromJson(response.body().toString(), BannersReq.class);

                        response_data.setValue(banners);
                    } catch (Exception e) {
                        wtf("Hulk-36", e.getMessage());
                        message.setValue("Service error while loading data");
                    }

                } else {
                    //not got response
                    message.setValue("No data to show");
                }
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                wtf("Hulk-46-err", t.getMessage());
                message.setValue("Error loading data");

            }
        });
    }

}
