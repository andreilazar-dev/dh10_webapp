package com.dh10.dh10_web.controller;

import com.dh10.dh10_web.model.LoginBean;
import com.dh10.dh10_web.validator.LoginValidator;
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
            return "login";
        }else{
            model.addAttribute("userName",loginBean.getUserId());
            return "redirect:/reserve";
        //if (loginBean != null && loginBean.getUserId() != null & loginBean.getPassword() != null) {
            //TODO : mettere il dao per restituire il check del login
          //  if (loginBean.getUserId().equals("root") && loginBean.getPassword().equals("root")) {
            //    model.addAttribute("userName",loginBean.getUserId());
              //  return "redirect:/reserve";
           // } 
            //andrà modificata è solo una prova
            //if (loginBean.getUserId().equals("a") && loginBean.getPassword().equals("a")) {
                //model.addAttribute("userName",loginBean.getUserId());
              //  return "home";
            //}else {
              //  return "error";
            //}
        //} else {
          //  return "error";
        //}
    }
}