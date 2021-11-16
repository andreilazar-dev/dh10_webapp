package com.dh10.dh10_web.controller;

import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dh10.dh10_web.service.SinonymousService;

@Controller
public class HomeController {

	 private SinonymousService service = new SinonymousService();

	    @RequestMapping(value = "/countryexplorer",method = RequestMethod.GET)
	    public String init(Model model) {
	    	        return "countryexplorer";
	    }
	
}
