package com.dh10.dh10_web.service;

import com.dh10.access.model.beans.User;
import com.dh10.access.model.dao.Dao;
import com.dh10.access.model.dao.UserDao;
import com.dh10.dh10_web.model.LoginBean;

import java.util.Optional;

public class LoginCheck {

    private Dao<User> userDao = new UserDao();

    public boolean checkLogin (LoginBean loginBean){
        Optional<User> user = userDao.get(loginBean.getUserId());
        return user.map(value -> value.getPassword().equals(loginBean.getPassword())).orElse(false);
    }
}
