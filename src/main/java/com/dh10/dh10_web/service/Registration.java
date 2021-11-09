package com.dh10.dh10_web.service;

import com.dh10.access.model.beans.User;
import com.dh10.access.model.dao.Dao;
import com.dh10.access.model.dao.UserDao;
import com.dh10.stringchecker.CountryChecker;
import com.dh10.stringchecker.StringChecker;

import java.util.Optional;

public class Registration {
	

	private Dao<User> userDao = new UserDao();

	public boolean firstNameCheck(String firstName) {
		return firstName.length() <= 30;
	}
			
	public boolean lastNameCheck(String lastname) {
		return lastname.length() <= 30;
	}
	
	public boolean userCheck(String user) {
		if(user.length()<30){
			return !userDao.get(user).isPresent(); //user exist
		}
		return false;
	}
	
	public boolean passwordCheck(String password) {
		return password.matches("((?=.*[0-9])(?=.*[a-zA-Z]).{8,20})");
	}
	
	public String countryCheck(String country) {
		StringChecker countrycheck = new CountryChecker();
		//la stringa è valida se è diversa da null
		return countrycheck.find_standard(country);
	}
	

	public void saveRegistration(User newuser){
		userDao.save(newuser);
	}
	
	
}
