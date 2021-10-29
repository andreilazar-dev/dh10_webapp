package com.dh10.dh10_web.dao;

import com.dh10.dh10_web.model.LoginBean;

import java.util.List;

public interface LoginDao {

    public List<LoginBean> getAllLogin();

    public Boolean contain(LoginBean loginBean);
}
