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
		if (firstName.length() <= 30 && firstName.length() >=3)
			return true;
		else {
			System.out.println("nome sbagliato");
			return false;
		}
	}
			
	public boolean lastNameCheck(String lastname) {
		return (lastname.length() <= 30 && lastname.length()>=3);
	}
	
	public boolean userCheck(String user) {
		if(user.length()<30 && user.length()>=3){
			return userDao.get(user) != null; //user exist
		}
		System.out.println("user sbagliato");
		return true;
		
	}
	
	public boolean passwordCheck(String password) {
		return password.matches("((?=.*[0-9])(?=.*[a-zA-Z]).{8,20})");
	}
	
	public String countryCheck(String country) {
		StringChecker countrycheck = new CountryChecker();
		if(country.length()<3) {
			System.out.println("nazione sbagliato");
			return null;
			
		}
		//la stringa è valida se è diversa da null
		return countrycheck.find_standard(country);
	}
	

	public void saveRegistration(User newuser){
		userDao.save(newuser);
	}
	
	
}
