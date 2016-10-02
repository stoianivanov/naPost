package com.devmachines.onpost;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.math.BigDecimal;

public class MainActivity extends AppCompatActivity {

    private ListView disasters;
    private FirebaseListAdapter mAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        disasters = (ListView) findViewById(R.id.disasters_list_view);

        Disaster dis = new Disaster(1,2,"dsadsa", new BigDecimal("dsadsa"),new BigDecimal("dsa"));
        Disaster dis1 = new Disaster(1,2,"dsadsa", new BigDecimal("dsadsa"),new BigDecimal("dsa"));
        Disaster dis2 = new Disaster(1,2,"dsadsa", new BigDecimal("dsadsa"),new BigDecimal("dsa"));
        Disaster dis3 = new Disaster(1,2,"dsadsa", new BigDecimal("dsadsa"),new BigDecimal("dsa"));
        Disaster dis4 = new Disaster(1,2,"dsadsa", new BigDecimal("dsadsa"),new BigDecimal("dsa"));
        Disaster dis5 = new Disaster(1,2,"dsadsa", new BigDecimal("dsadsa"),new BigDecimal("dsa"));
        DatabaseReference ref = FirebaseDatabase.getInstance().getReference();

        ref.push().setValue(dis);
        ref.push().setValue(dis1);
        ref.push().setValue(dis2);
        ref.push().setValue(dis3);
        ref.push().setValue(dis4);
        ref.push().setValue(dis5);

    }
}
