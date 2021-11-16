package com.dh10.dh10_web.service;

import com.dh10.access.model.beans.User;
import com.dh10.access.model.dao.Dao;
import com.dh10.access.model.dao.UserDao;
import com.dh10.dh10_web.model.LoginBean;
import org.springframework.validation.Errors;

public class LoginCheck {

    private Dao<User> userDao = new UserDao();

    public boolean checkLogin (LoginBean loginBean, Errors errors){ 
        User user = userDao.get(loginBean.getUserId());
        if(user==null) {
        	 //errors.rejectValue("userId", "userId.invalid");
        	return false;
        }
       
        if(!user.getPassword().equals(loginBean.getPassword())) {
        	//errors.rejectValue("password","password.invalid");
        	return false;
        }
        //aggiungere errore
        return true;
    }

    public String getNameOfUser(LoginBean loginBean){
        User user = userDao.get(loginBean.getUserId());
        return user.getFirstName();
    }
}
