package com.dh10.dh10_web.validator;

import com.dh10.access.model.beans.User;
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
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,
                "userId", "required.username","Field Username is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,
                "password", "required.username","Field password is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,
                "firstName", "required.username","Field firstName is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,
                "lastName", "required.username","Field lastName is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,
                "Country", "required.username","Field Country is required.");
    }
}
