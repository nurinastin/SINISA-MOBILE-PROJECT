package com.project.sinisa.sewa;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.project.sinisa.R;
import com.project.sinisa.config.AppController;
import com.project.sinisa.config.AuthData;
import com.project.sinisa.config.ServerAccess;
import com.project.sinisa.penyuluhan.Penyuluhan;
import com.project.sinisa.penyuluhan.adapter.Adapter_Penyuluhan;
import com.project.sinisa.penyuluhan.model.Penyuluhan_Model;
import com.project.sinisa.sewa.adapter.Adapter_Sewa;
import com.project.sinisa.sewa.model.Sewa_Model;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class Sewa extends AppCompatActivity {
    private Adapter_Sewa adapter;
    private List<Sewa_Model> list;
    private RecyclerView listdata;
    RecyclerView.LayoutManager mManager;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sewa);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setNavigationIcon(R.drawable.back);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        listdata = (RecyclerView) findViewById(R.id.listdata);
        listdata.setHasFixedSize(true);
        list = new ArrayList<>();
        adapter = new Adapter_Sewa(this,(ArrayList<Sewa_Model>) list, this);
        mManager = new LinearLayoutManager(getBaseContext(),LinearLayoutManager.VERTICAL,false);
        listdata.setLayoutManager(mManager);
        listdata.setAdapter(adapter);
        loadJson();
    }
    private void loadJson()
    {
        Intent data = getIntent();
        StringRequest senddata = new StringRequest(Request.Method.GET, ServerAccess.SEWA+"?type=list&nik="+ AuthData.getInstance(getBaseContext()).getNik(), new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                JSONObject res = null;
                try {
                    res = new JSONObject(response);
                    JSONArray arr = res.getJSONArray("data");
                    if(arr.length() > 0) {
                        for (int i = 0; i < arr.length(); i++) {
                            try {
                                JSONObject data = arr.getJSONObject(i);
                                Sewa_Model md = new Sewa_Model();
                                md.setKode(data.getString("nik"));
                                md.setNama(data.getString("nama"));
                                md.setNo_telepon(data.getString("no_telepon"));
                                md.setNama_barang(data.getString("nama_barang"));
                                md.setTanggal_sewa(data.getString("tanggal_sewa"));
                                md.setTanggal_kembali(data.getString("tanggal_kembali"));
                                md.setJumlah_hari(data.getString("jumlah_hari"));
                                md.setHarga_sewa(data.getString("harga_sewa"));
                                md.setAsal(data.getString("asal"));
                                md.setAlamat(data.getString("alamat"));
                                list.add(md);
                            } catch (Exception ea) {
                                ea.printStackTrace();
                            }
                        }
                        adapter.notifyDataSetChanged();
                    }else{
                        Toast.makeText(Sewa.this, "Data Kosong", Toast.LENGTH_SHORT).show();
                    }
                } catch (JSONException e) {
                    Toast.makeText(Sewa.this, "Data Kosong", Toast.LENGTH_SHORT).show();
                    Log.d("pesan", "error "+e.getMessage());
                    e.printStackTrace();
                }
            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(Sewa.this, "Data Kosong", Toast.LENGTH_SHORT).show();
                        Log.d("volley", "errornya : " + error.getMessage());
                    }
                });
        AppController.getInstance().addToRequestQueue(senddata);
    }
}
