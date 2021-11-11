package com.dh10.dh10_web.validator;

import com.dh10.access.model.beans.User;
import com.dh10.dh10_web.model.LoginBean;
import com.dh10.dh10_web.service.LoginCheck;
import com.dh10.dh10_web.service.Registration;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegistrationValidator implements Validator {
	
	private Registration r;
	
	public RegistrationValidator(Registration r) {
		this.r = r;
	}
	
    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        User user = (User) o;
        r = new Registration();

        /*if(r.userCheck(user.getUserId())){
            errors.rejectValue("userId", "userId.exist");
        }*/
        if(r.countryCheck(user.getCountry()) == null){
            errors.rejectValue("country", "country.notFind");
        }
        if(r.firstNameCheck(user.getFirstName())){
            errors.rejectValue("firstName", "insert a valid first name");
        }
        if(r.lastNameCheck(user.getLastName())){
            errors.rejectValue("lastName", "insert a valid last name");
        }
        if(r.passwordCheck(user.getPassword())){
            errors.rejectValue("password", "insert a valid password");
        }
    }
}




