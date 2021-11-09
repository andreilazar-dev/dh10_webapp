package com.dh10.dh10_web.model;

public class LoginBean {
    private String userId;
    private String password;

    public LoginBean(){

    }
    public LoginBean(String userId, String password) {
        this.userId = userId;
        this.password = password;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
