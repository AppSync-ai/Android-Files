package com.teamup.sarkarichakri.AllModules;

import android.content.Context;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class SendNotification {
    public static void sendNotification(String to, String title, String body, Context context, String value) {

        RequestQueue requestQueue;
        requestQueue = Volley.newRequestQueue(context);
        String URL = "https://fcm.googleapis.com/fcm/send";

        JSONObject mainObj = new JSONObject();
        try {

            mainObj.put("to", "/topics/" + to);

            JSONObject notifObject = new JSONObject();
            notifObject.put("title", title);
            notifObject.put("body", body);
            notifObject.put("sound", "default");

            mainObj.put("notification", notifObject);

            JSONObject dataObject = new JSONObject();
            dataObject.put("key_1", value);

            mainObj.put("data", dataObject);

            JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, URL,
                    mainObj,
                    new Response.Listener<JSONObject>() {
                        @Override
                        public void onResponse(JSONObject response) {


                        }
                    }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {

                }
            }
            ) {
                @Override
                public Map<String, String> getHeaders() throws AuthFailureError {
                    Map<String, String> header = new HashMap<>();
                    header.put("content-type", "application/json");
                    header.put("authorization", "key=AAAArwn_XIo:APA91bHepNevIS4G9pnulDjFZ8ylgJVFMvtFMEdc2pD5wc62oA5JIFoUQJ-wtdhdU_4Jxjgfqu1GLJXNd45kELomghnPqKH8jjdyDdugNoAwfoX-eBa4cJrAmJI18MRzPc0r_nUquDa6");
                    return header;
                }
            };

            requestQueue.add(request);


        } catch (Exception c) {
            Toast.makeText(context, "" + c, Toast.LENGTH_SHORT).show();
        }

    }

    public static void sendNotification(String to, String title, String body, Context context, String value, String key) {

        RequestQueue requestQueue;
        requestQueue = Volley.newRequestQueue(context);
        String URL = "https://fcm.googleapis.com/fcm/send";

        JSONObject mainObj = new JSONObject();
        try {

            mainObj.put("to", "/topics/" + to);

            JSONObject notifObject = new JSONObject();
            notifObject.put("title", title);
            notifObject.put("body", body);
            notifObject.put("sound", "default");

            mainObj.put("notification", notifObject);

            JSONObject dataObject = new JSONObject();
            dataObject.put(key, value);

            mainObj.put("data", dataObject);

            JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, URL,
                    mainObj,
                    new Response.Listener<JSONObject>() {
                        @Override
                        public void onResponse(JSONObject response) {


                        }
                    }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {

                }
            }
            ) {
                @Override
                public Map<String, String> getHeaders() throws AuthFailureError {
                    Map<String, String> header = new HashMap<>();
                    header.put("content-type", "application/json");
                    header.put("authorization", "key=AAAArwn_XIo:APA91bHepNevIS4G9pnulDjFZ8ylgJVFMvtFMEdc2pD5wc62oA5JIFoUQJ-wtdhdU_4Jxjgfqu1GLJXNd45kELomghnPqKH8jjdyDdugNoAwfoX-eBa4cJrAmJI18MRzPc0r_nUquDa6");
                    return header;
                }
            };

            requestQueue.add(request);


        } catch (Exception c) {
            Toast.makeText(context, "" + c, Toast.LENGTH_SHORT).show();
        }

    }


    public static void sendNotification(String to, String title, String body, Context context, String value, String key, String img_url) {

        RequestQueue requestQueue;
        requestQueue = Volley.newRequestQueue(context);
        String URL = "https://fcm.googleapis.com/fcm/send";

        JSONObject mainObj = new JSONObject();
        try {

            mainObj.put("to", "/topics/" + to);

            JSONObject notifObject = new JSONObject();
            notifObject.put("title", title);
            notifObject.put("body", body);
            notifObject.put("sound", "default");
            notifObject.put("image", img_url);

            mainObj.put("notification", notifObject);

            JSONObject dataObject = new JSONObject();
            dataObject.put(key, value);

            mainObj.put("data", dataObject);

            JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, URL,
                    mainObj,
                    new Response.Listener<JSONObject>() {
                        @Override
                        public void onResponse(JSONObject response) {


                        }
                    }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {

                }
            }
            ) {
                @Override
                public Map<String, String> getHeaders() throws AuthFailureError {
                    Map<String, String> header = new HashMap<>();
                    header.put("content-type", "application/json");
                    header.put("authorization", "key=AAAArwn_XIo:APA91bHepNevIS4G9pnulDjFZ8ylgJVFMvtFMEdc2pD5wc62oA5JIFoUQJ-wtdhdU_4Jxjgfqu1GLJXNd45kELomghnPqKH8jjdyDdugNoAwfoX-eBa4cJrAmJI18MRzPc0r_nUquDa6");
                    return header;
                }
            };

            requestQueue.add(request);


        } catch (Exception c) {
            Toast.makeText(context, "" + c, Toast.LENGTH_SHORT).show();
        }

    }


}
