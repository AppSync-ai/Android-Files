package com.mt.spingamer.Models;

import static android.util.Log.*;
import static android.util.Log.wtf;
import static com.mt.spingamer.AllModules.Admin.service;

import android.util.Log;

import androidx.lifecycle.MutableLiveData;

import com.google.gson.Gson;
import com.mt.spingamer.AllModules.Admin;
import com.mt.spingamer.AllReqs.SocialReq;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class ModelSocial {
    public static MutableLiveData<String> message = new MutableLiveData<>();
    public static MutableLiveData<String> response_data = new MutableLiveData<>();
    public static ArrayList<String> list = new ArrayList<>();

    public static void load() {
        Call<String> call = service.get_socials_v2();
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                if (response.isSuccessful()) {
                    try {
                        Gson gson = new Gson();
                        SocialReq social = gson.fromJson(response.body().toString(), SocialReq.class);
                        wtf("Hulk-40", social.getResult().get(0).getMessage());
                        response_data.setValue(response.body());
                    } catch (Exception e) {
                        wtf("Hulk-51uuis", e.getMessage());
                    }

                } else {
                    //not got response
                }
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                wtf("Hulk-63ds-err", t.getMessage());
            }
        });
    }

}
