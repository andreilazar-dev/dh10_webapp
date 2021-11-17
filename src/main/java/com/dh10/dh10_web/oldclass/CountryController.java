package com.dh10.dh10_web.oldclass;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dh10.stringchecker.CountryChecker;
import com.dh10.stringchecker.StringChecker;



@Controller
@RequestMapping("/countryServlet")
public class CountryController {
	
	@RequestMapping(value = "/country", method = RequestMethod.GET)
	   public ModelAndView country() {
	      return new ModelAndView("country", "command", new String());
	   }
	
	@RequestMapping(value = "/countryTest", method = RequestMethod.GET)
	   public String countryTest(@ModelAttribute("SpringWeb")String country, ModelMap model) {
	      model.addAttribute("message", "Hello Spring MVC Framework!");
	      
	      StringChecker countrycheck = new CountryChecker();
	       if(countrycheck.find_standard(country)!=null)
	            model.addAttribute("mex" , "Nazione Trovata");
	       model.addAttribute("mex" , "Nazione non Trovata");
	        
	      return "result";
	   }
}

