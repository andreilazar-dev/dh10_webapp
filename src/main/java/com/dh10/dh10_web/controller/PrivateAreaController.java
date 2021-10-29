package com.dh10.dh10_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/reserve")
@SessionAttributes("userName")
public class PrivateAreaController {

    @RequestMapping(method = RequestMethod.GET)
    public String init(Model model) {
        return "reserve";
    }

    @RequestMapping(method=RequestMethod.POST)
    public String logout(HttpSession session,Model model) {
        model.asMap().clear();
        session.invalidate();
        return "redirect:/";
    }
}
