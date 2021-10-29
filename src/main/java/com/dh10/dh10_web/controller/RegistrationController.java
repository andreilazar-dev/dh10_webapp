package com.dh10.dh10_web.controller;


import com.dh10.dh10_web.model.UserBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class RegistrationController {


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("register");
        mav.addObject("user", new UserBean());

        return mav;
    }

    @RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
    public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
                                @ModelAttribute("user") UserBean user) {

        //TODO: fare tutta la gestione di controllo e segnalazione errore dei parametri
        //TODO: chiamare un service per corregere la stringa Country e salvarla standardizzata nel Db

        //call user register when i implement it

        //Pagina di Mockup da cambiare succesivamente
    	
    	
        return new ModelAndView("welcome", "firstname", user.getFirstname());
    }
}
