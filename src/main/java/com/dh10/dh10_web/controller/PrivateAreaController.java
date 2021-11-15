package com.dh10.dh10_web.controller;

import com.dh10.dh10_web.service.SinonymousService;
import com.dh10.stringchecker.model.beans.Synonymus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
        
   
   
        model.addAttribute("stats",service.getAlgorithmStats());

        Map<String, Integer> stats = service.getAlgorithmStats();
        Set<String> keys = stats.keySet();
        String html = "['Algoritmi', 'Numero'],";
        for (String k : keys){
            html +=  "['" + k + "',"+stats.get(k) + "],";
        }
        System.out.println("HTML--->"+ html);
        model.addAttribute("html", html);
        
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

    @GetMapping("/country/{name}")
    public String getEmployeesById(@PathVariable String name,Model model) {
        model.addAttribute("state",name);
        return "countryview";
    }

}
