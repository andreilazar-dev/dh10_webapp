package com.dh10.dh10_web.service;

import com.dh10.access.model.beans.User;
import com.dh10.access.model.dao.Dao;
import com.dh10.access.model.dao.UserDao;
import com.dh10.dh10_web.model.UserBean;
import com.dh10.stringchecker.CountryChecker;
import com.dh10.stringchecker.StringChecker;

public class RegistrationCheck {
	
	private Dao<User> userDao = new UserDao();
	

	public boolean firstNameCheck(String firstName) {
		if(firstName==null) {
			System.out.println("nome nullo");
			return false;
		}
		
		if( firstName.length() > 30 || firstName.length()<1) {
			System.out.println("nome sbagliato");
			return false;
		}
		
		return true;
	}
			
	public boolean lastNameCheck(String lastname) {
		if(lastname==null) {
			System.out.println("nome nullo");
			return false;
		}
		
		if(lastname.length() > 30 || lastname.length()<1) {
			System.out.println("nome sbagliato");
			return false;
		}
		
		return true;
	}
	
	public boolean userCheck(String user) {
	/*if(user==null)
			return false;
		if(user.length()<30){
			return !userDao.get(user).isPresent(); //user exist
		}
		return false;
	*/
		return true;
	}
	
	public boolean passwordCheck(String password) {
		//return password.matches("((?=.*[0-9])(?=.*[a-zA-Z]).{8,20})");
		return true;
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
