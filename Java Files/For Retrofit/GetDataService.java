<<<<<<< Updated upstream
package com.navo.agri.Models;
=======
package com.example.mvc.Modules;
>>>>>>> Stashed changes

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;

public interface GetDataService {

    @GET("api/anouncment")
    Call<String> get_anouncements();

	@POST("api/bidHistory")
	@FormUrlEncoded
	Call<String> get_bid_history(@Field("userid") String userid);

}
