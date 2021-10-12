package wrteam.multivendor.shop.helper;

import static android.util.Log.*;
import static android.util.Log.wtf;

import android.util.Log;

import androidx.lifecycle.MutableLiveData;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class ModelBlank {
    public static MutableLiveData<String> message = new MutableLiveData<>();
    public static MutableLiveData<String> response_data = new MutableLiveData<>();

    public static void load() {
        JsonPlaceHolderAPI serviceGson = RetrofitClientInstanceGson.getRetrofitInstance().create(JsonPlaceHolderAPI.class);
        Call<String> call = serviceGson.getUsers();
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                try {
                    wtf("Hulk-widow-34", response.body());
                } catch (Exception e) {
                    wtf("Hulk-widow-29", e.getMessage());
                    message.setValue("No data to show");
                }
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                wtf("Hulk-widow-38", t);
                message.setValue("Failed to load data");
            }
        });


    }

}
