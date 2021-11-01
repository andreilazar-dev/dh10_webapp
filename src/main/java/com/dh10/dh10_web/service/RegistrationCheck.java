package com.dh10.dh10_web.service;

import com.dh10.dh10_web.model.UserBean;
import com.dh10.stringchecker.CountryChecker;
import com.dh10.stringchecker.StringChecker;

public class RegistrationCheck {
	

	public boolean firstNameCheck(UserBean user) {
			
			String s = user.getFirstname();
			if(s.length()>30)
				return false;
			
			return true;
	}
			
	public boolean secondNameCheck(UserBean user) {
			String s = user.getLastname();
			if(s.length()>30)
				return false;
			
			return true;
			
	}
	
	public boolean userCheck(UserBean user) {
		String s = user.getUsername();
		
		//TODO:interrogare DB per vedere se ho gia username uguale
		
		if(s.length()>30)
			return false;
		
		return true;
		
	}
	
	public boolean passwordCheck(UserBean user) {
		String s = user.getPassword();
		if (s.matches("((?=.*[0-9])(?=.*[a-zA-Z]).{8,20})"))
			return true;
		return false;
	}
	
	public String countryCheck(UserBean user) {
		String s = user.getCountry();
		
		StringChecker countrycheck = new CountryChecker();
		
		//la stringa è valida se è diversa da null
		return countrycheck.find_standard(s);
	}
	
	
	
	
}
