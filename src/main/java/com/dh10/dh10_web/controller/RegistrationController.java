package com.dh10.dh10_web.controller;


import com.dh10.access.model.beans.User;
import com.dh10.dh10_web.service.Registration;


import com.dh10.dh10_web.validator.LoginValidator;
import com.dh10.dh10_web.validator.RegistrationValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class RegistrationController {


	  @RequestMapping(value = "/register", method = RequestMethod.GET)
	    public ModelAndView showRegister() {
	        ModelAndView mav = new ModelAndView("register");
	        mav.addObject("user", new User());

	        return mav;
	    }

    @RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user, BindingResult result, Model model) {
    	
    	Registration r = new Registration();

		new RegistrationValidator().validate(user,result);


		if(result.hasErrors()){
			return "register";
		}else{
			return "reserve";
		}


    	/*if(!r.firstNameCheck(user.getFirstName()) || !r.passwordCheck(user.getPassword()) || !r.lastNameCheck(user.getLastName()) || !r.userCheck(user.getUserId()))
    		return "error";
    	*//*
    	 if(r.countryCheck(user.getCountry()) == null)
    		return "error";
    	*//*


    	r.saveRegistration(user);
    	return "reserve";
    	*/
    	
    	 //if(r.countryCheck(user.getCountry()) == null)
    	//	return "error"; 
    	
    	
    	
    	//r.saveRegistration(user);
    	//return "home";
    	
    
    
    	//call addUser when implemented
    	
    	
        //return new ModelAndView("welcome", "firstname", user.getFirstname());
    	
 
    }
}
