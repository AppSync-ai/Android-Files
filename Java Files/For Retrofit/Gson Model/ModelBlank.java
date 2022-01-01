package wrteam.multivendor.shop.helper;
import static android.util.Log.*;
import static android.util.Log.wtf;
import android.util.Log;
import androidx.lifecycle.MutableLiveData;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class ModelBlank {

    public static MutableLiveData<ArrayList<String>> response_data = new MutableLiveData<>();

    public static void load() {
		response_data.setValue(null);
        JsonPlaceHolderAPI serviceGson = RetrofitClientInstanceGson.getRetrofitInstance().create(JsonPlaceHolderAPI.class);
        Call<ArrayList<String>> call = serviceGson.getUsers();
        call.enqueue(new Callback<ArrayList<String>>() {
            @Override
            public void onResponse(Call<ArrayList<String>> call, Response<ArrayList<String>> response) {
                try {
				response_data.setValue(response.body());
                } catch (Exception e) {
                   wtf("Hulk-" + getClass().getSimpleName() + "-" + Admin.getLineNumber(), ""+t);
                    response_data.setValue(null);
                }
            }

            @Override
            public void onFailure(Call<ArrayList<String>> call, Throwable t) {
                wtf("Hulk-" + getClass().getSimpleName() + "-" + Admin.getLineNumber(), ""+t);
                response_data.setValue(null);
            }
        });


    }

}
