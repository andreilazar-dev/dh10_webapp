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
import java.util.List;

@Controller
@SessionAttributes("userName")
public class PrivateAreaController {

    private SinonymousService synDao = new SinonymousService();

    @RequestMapping(value = "/reserve",method = RequestMethod.GET)
    public String init(Model model) {
        int leve = 1;
        int contains = 3;
        int jaro= 5;
        model.addAttribute("levenstein", leve);
        model.addAttribute("contains", contains);
        model.addAttribute("jarowinkler", jaro);
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

        List<Synonymus> listSyn = synDao.synonymusAll();
        int n = listSyn.size();
        model.addObject("listSyn", listSyn);
        model.addObject("numSyn", n);
        model.setViewName("visallsyno");

        return model;
    }

    @RequestMapping(value = "/fetchNoFound", method = RequestMethod.POST)
    public ModelAndView listSynonymusNotFound(ModelAndView model) throws IOException {

        List<Synonymus> listSyn = synDao.synonymusUnassociated();
        int n= listSyn.size();


        model.addObject("listSyn", listSyn);
        model.addObject("numSyn", n);
        model.setViewName("visnofound");
        return model;
    }

    @RequestMapping(value = "/fetchApprove", method = RequestMethod.POST)
    public ModelAndView listSynonymusApprove(ModelAndView model) throws IOException {

        List<Synonymus> listSyn = synDao.synonymusToApprove();
        int n=listSyn.size();
        model.addObject("listSyn", listSyn);
        model.addObject("numSyn", n);
        model.setViewName("visapprove");
        return model;
    }
}
