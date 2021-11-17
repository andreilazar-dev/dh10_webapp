package com.dh10.dh10_web.controller;

import javax.servlet.http.HttpSession;

import com.dh10.access.model.beans.User;
import com.dh10.dh10_web.model.LoginBean;
import com.dh10.dh10_web.service.HomeService;
import com.dh10.dh10_web.service.SinonymousService;
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

    private HomeService service = new HomeService();

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String init(Model model) {
        return "home";
    }


    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(Model model) {
        User user = service.getUser((String)model.getAttribute("userName"));
        model.addAttribute("Name",user.getFirstName());
        model.addAttribute("LastName",user.getLastName());
        model.addAttribute("Country",user.getCountry());
        return "profile";
    }
	    @RequestMapping(value = "/countryexplorer",method = RequestMethod.GET)
	    public String countryexplorer(Model model) {
	    	        return "countryexplorer";
	    }
}