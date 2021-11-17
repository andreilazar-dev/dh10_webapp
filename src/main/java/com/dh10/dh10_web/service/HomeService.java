package com.dh10.dh10_web.service;

import com.dh10.access.model.beans.User;
import com.dh10.access.model.dao.Dao;
import com.dh10.access.model.dao.UserDao;

public class HomeService {

    private final Dao<User> userDao = new UserDao();

    public User getUser (String id){
        return userDao.get(id);
    }

}
