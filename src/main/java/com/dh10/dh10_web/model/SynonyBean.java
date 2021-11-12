package com.dh10.dh10_web.model;

import com.dh10.stringchecker.model.beans.Country;

public class SynonyBean {
	private String synonymus_name;
    private String algorithm_name;
    private int status;
    private Country country;

    public SynonyBean(){

    }
    public SynonyBean(String synonymus, String algorithm, int status, Country country) {
        this.synonymus_name = synonymus;
        this.algorithm_name = algorithm;
        this.status = status;
        this.country= country;
    }
	public String getSynonymus() {
		return synonymus_name;
	}
	public void setSynonymus(String synonymus) {
		this.synonymus_name = synonymus;
	}
	public String getAlgorithm() {
		return algorithm_name;
	}
	public void setAlgorithm(String algorithm) {
		this.algorithm_name = algorithm;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Country getCountry() {
		return country;
	}
	public void setCountry(Country country) {
		this.country = country;
	}

   
}
