package com.dh10.dh10_web.validator;

import com.dh10.access.model.beans.User;
import com.dh10.dh10_web.model.LoginBean;
import com.dh10.dh10_web.service.LoginCheck;
import com.dh10.dh10_web.service.Registration;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegistrationValidator implements Validator {


    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        User user = (User) o;
        Registration registration = new Registration();

        if(registration.userCheck(user.getUserId())){
            errors.rejectValue("userId", "userId.exist");
        }
        if(registration.countryCheck(user.getCountry()) == null){
            errors.rejectValue("country", "country.notFind");
        }
    }
}
