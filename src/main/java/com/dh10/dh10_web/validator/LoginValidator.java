package com.dh10.dh10_web.validator;


import com.dh10.dh10_web.model.LoginBean;
import com.dh10.dh10_web.service.LoginCheck;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class LoginValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return LoginBean.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        LoginBean loginBean = (LoginBean) o;
        LoginCheck loginCheck = new LoginCheck();

        if(!loginCheck.checkLogin(loginBean,errors)){
            errors.rejectValue("userId", "userId.invalid");
            errors.rejectValue("password","password.invalid");
        }


    }

}
