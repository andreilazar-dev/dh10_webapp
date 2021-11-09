package com.dh10.dh10_web.controller;

import com.dh10.dh10_web.model.LoginBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/")
@SessionAttributes("userName")
public class LoginController {
    @RequestMapping(method = RequestMethod.GET)
    public String init(Model model) {
        LoginBean login = new LoginBean();
        model.addAttribute("loginBean",login);
        return "login";
    }

    @RequestMapping(method = RequestMethod.POST )
    public String submit(@ModelAttribute("loginBean") LoginBean loginBean, BindingResult result,Model model) {
        if (loginBean != null && loginBean.getUserName() != null & loginBean.getPassword() != null) {
            //TODO : mettere il dao per restituire il check del login
            //TODO : gestire le caselle di errore
            //TODO : Optionale inserire una figura admin che viene reindirizzata a una pagina apposita 
            if (loginBean.getUserName().equals("root") && loginBean.getPassword().equals("root")) {
                model.addAttribute("userName",loginBean.getUserName());
                return "redirect:/reserve";
            } else {
                result.reject("Invalid Details");
                return "login";
            }
        } else {
            result.reject("Please enter Details");
            return "login";
        }
    }
}