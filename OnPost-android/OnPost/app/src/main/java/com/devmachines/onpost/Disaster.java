package com.devmachines.onpost;

import java.math.BigDecimal;

/**
 * Created by stoian on 01.10.16.
 */
public class Disaster {
    private int power;
    private int type;
    private String discription;
    private BigDecimal latitude;
    private BigDecimal longitude;

    public Disaster() {
    }


    public Disaster(int power, int type, String discription, BigDecimal latitude, BigDecimal longitude) {
        this.power = power;
        this.type = type;
        this.discription = discription;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public int getPower() {
        return power;
    }

    public int getType() {
        return type;
    }

    public String getDiscription() {
        return discription;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }
}
