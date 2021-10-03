package com.mt.spingamer.Models;

import static android.util.Log.wtf;
import static com.mt.spingamer.AllModules.Admin.service;

import android.util.Log;

import androidx.lifecycle.MutableLiveData;

import com.mt.spingamer.AllModules.Admin;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class BlankModelVersion2 {
    static String id;
    public static MutableLiveData<String> response_data = new MutableLiveData<>();
    public static ArrayList<String> list = new ArrayList<>();

    public BlankModelVersion2 load() {
		GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
        Call<String> call = service.get_offerwall(Admin.tinyDB.getString("userid"));
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                if (response.isSuccessful()) {
                    try {
                        list.clear();
                        JSONArray jsonArray = new JSONObject(response.body()).getJSONArray("result");
                        if (jsonArray.length() > 0) {
//                            data available
                            for (int i = 0; i < jsonArray.length(); i++) {
                                JSONObject obj = jsonArray.getJSONObject(i);
                                setId(obj.getString("id"));


                            }

                        } else {
//                            No data available
                        }
                        response_data.setValue(response.body());
                    } catch (JSONException e) {
                        Log.wtf("Hulk-59", e.getMessage());
                    }

                } else {
                    //not got response
                }
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                wtf("Hulk-63-err", t.getMessage());
            }
        });
        return this;
    }


    public static String getId() {
        return id;
    }

    public static void setId(String id) {
        BlankModelVersion2.id = id;
    }
}
