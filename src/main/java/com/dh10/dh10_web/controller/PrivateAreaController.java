package com.dh10.dh10_web.controller;

import com.dh10.dh10_web.service.SinonymousService;
import com.dh10.stringchecker.model.beans.Synonymus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@SessionAttributes("userName")
public class PrivateAreaController {

    private SinonymousService service = new SinonymousService();

    @RequestMapping(value = "/reserve",method = RequestMethod.GET)
    public String init(Model model) {
    	      
        model.addAttribute("countAll", service.countAll()); 
        model.addAttribute("countToApprove", service.countToApprove());
        model.addAttribute("countToAssociate", service.countToAssociate());
        model.addAttribute("countCountry",service.countCountry());
        return "reserve";
    }

    @RequestMapping(value = "/reserve", method=RequestMethod.POST)
    public String logout(HttpSession session,Model model) {
        model.asMap().clear();
        session.invalidate();
        return  "login";//"redirect:/";
    }


    @RequestMapping(value = "/fetch", method = RequestMethod.POST)
    public ModelAndView listSynonymus(ModelAndView model) throws IOException {

        List<Synonymus> listSyn = service.synonymusAll();
        int n = listSyn.size();
        model.addObject("listSyn", listSyn);
        model.addObject("numSyn", n);
        model.setViewName("visallsyno");

        return model;
    }

    @RequestMapping(value = "/fetchNoFound", method = RequestMethod.POST)
    public ModelAndView listSynonymusNotFound(ModelAndView model) throws IOException {

        List<Synonymus> listSyn = service.synonymusUnassociated();
        int n= listSyn.size();
        model.addObject("listSyn", listSyn);
        model.addObject("numSyn", n);
        model.setViewName("visnofound");
        return model;
    }

    @RequestMapping(value = "/fetchApprove", method = RequestMethod.POST)
    public ModelAndView listSynonymusApprove(ModelAndView model) throws IOException {

        List<Synonymus> listSyn = service.synonymusToApprove();
        int n=listSyn.size();
        model.addObject("listSyn", listSyn);
        model.addObject("numSyn", n);
        model.setViewName("visapprove");
        return model;
    }
    
    @RequestMapping(value = "/fetchCountry", method = RequestMethod.POST)
    public ModelAndView listCountry(ModelAndView model) throws IOException {

        List<String> listSyn = service.getCountries();
        List<Integer> numSyn= new ArrayList <Integer>();
        int n= service.countCountry();
        for(String s : listSyn) {
        	numSyn.add(service.countSynonymusCountry(s));
        }
        model.addObject("listCountry", listSyn);
        model.addObject("numSyn", numSyn);
        model.addObject("numCountry", n);
        model.setViewName("viscountry");
        return model;
    }
}
