package com.dh10.dh10_web.controller;

import com.dh10.access.model.beans.User;
import com.dh10.dh10_web.model.Manulinsert;
import com.dh10.dh10_web.model.WrapperManualInsert;
import com.dh10.dh10_web.service.SinonymousService;
import com.dh10.stringchecker.model.beans.Synonymus;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
@SessionAttributes("userName")
public class PrivateAreaController {

    private SinonymousService service = new SinonymousService();

    @RequestMapping(value = "/reserve",method = RequestMethod.GET)
    public String init(Model model) {

        User usersession = service.getUser((String) model.getAttribute("userName"));
        model.addAttribute("name",usersession.getFirstName());
        model.addAttribute("surname",usersession.getLastName());
        model.addAttribute("countAll", service.countAll()); 
        model.addAttribute("countToApprove", service.countToApprove());
        model.addAttribute("countToAssociate", service.countToAssociate());
        model.addAttribute("countCountry",service.countCountry());

        Map<String, Integer> stats = service.getAlgorithmStats();
        Set<String> keys = stats.keySet();
        String html = "['Algoritmi', 'Numero'],";
        for (String k : keys){
            html +=  "['" + k + "',"+stats.get(k) + "],";
        }
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

    @RequestMapping(value = "/fetchNoFound/mod", method = RequestMethod.POST)
    public ModelAndView listSynonymusNotFoundPost(ModelAndView model, @RequestBody String json) throws IOException {
        System.out.println("--->Post received:"+json);

        ObjectMapper mapper = new ObjectMapper();
        mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        try {
            // convert JSON array to Java List
            List<Manulinsert> list = mapper.readValue(json, new TypeReference<List<Manulinsert>>() {});

            // print list of users
            list.forEach(System.out::println);

        } catch (Exception ex) {
            ex.printStackTrace();
        }


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

    @RequestMapping(value = "/fetchApprove/approved", method = RequestMethod.POST)
    public ModelAndView listSynonymusApprovePost(ModelAndView model, @RequestBody List<String> jsonApproved) throws IOException {
        //System.out.println("POST RECEIVED ______>"+ jsonApproved.get(1));
        service.synonymousUpdate(jsonApproved);
        service.refreshList();
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
        
        String html = "['Country', 'N. Synonymus'],";
        for (int k=0; k<listSyn.size(); k++){
            html +=  "['" + listSyn.get(k) + "',"+numSyn.get(k) + "],";
        }
        model.addObject("html", html);
        
        model.setViewName("viscountry");
        return model;
    }
    
    @RequestMapping(value = "/refreshallsyno")
    public ModelAndView refresh(ModelAndView model) throws IOException {
    	service.refreshList();
    	this.listSynonymus(model);   	
    	return model;
    }
    @RequestMapping(value = "/refreshtoapprove")
    public ModelAndView refreshToApprove(ModelAndView model) throws IOException {
    	service.refreshList();
    	this.listSynonymusApprove(model);   	
    	return model;
    }
    @RequestMapping(value = "/refreshnofound")
    public ModelAndView refreshNotFound(ModelAndView model) throws IOException {
    	service.refreshList();
    	this.listSynonymusNotFound(model);   	
    	return model;
    }

    @GetMapping("/country/{name}")
    public String getEmployeesById(@PathVariable String name,Model model) {
        model.addAttribute("state",name);
        return "countryview";
    }

    @RequestMapping(value = "/signout")
    public String signout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
