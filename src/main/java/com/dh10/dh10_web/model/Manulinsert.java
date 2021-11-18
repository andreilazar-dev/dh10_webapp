package com.dh10.dh10_web.model;

public class Manulinsert {

    String synonimous;
    String country;

    public Manulinsert() {
    }

    public Manulinsert(String synonimous, String country) {
        this.synonimous = synonimous;
        this.country = country;
    }

    public String getSynonimous() {
        return synonimous;
    }

    public void setSynonimous(String synonimous) {
        this.synonimous = synonimous;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
