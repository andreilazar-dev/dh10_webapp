package com.dh10.dh10_web.controller;

import com.dh10.dh10_web.model.LoginBean;
import com.dh10.dh10_web.service.LoginCheck;
import com.dh10.dh10_web.validator.LoginValidator;
import com.dh10.stringchecker.model.dao.Dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.*;

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
         
        new LoginValidator().validate(loginBean,result);


        if(result.hasErrors()){
        	model.addAttribute("loginBean",loginBean);
            return "login";

        }else {
            model.addAttribute("userName", loginBean.getUserId());
            String user = loginBean.getUserId();
            if(user.equals("Rei")||user.equals("Alex")||user.equals("Delga")||user.equals("Dari")){
                return "redirect:reserve";
            }
            return "redirect:home";
        }
         
    }
}