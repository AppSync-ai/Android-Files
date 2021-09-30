package com.mt.spingamer.AllModules;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.GET;

public interface GetDataService {

    @GET("api/anouncment")
    Call<String> get_anouncements();
}