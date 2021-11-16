package com.dh10.dh10_web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("userName")
public class HomeController {
	
    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String init(Model model) {
        return "home";
    }
    
	 
    @RequestMapping(value = "/logout")
	 public String logout(HttpSession session) {
	     session.invalidate();
	     return "redirect:/";
	 } 
}
