package com.phanduc.QLHocLieu.services;

import com.phanduc.QLHocLieu.models.NguoiDung;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class NguoiDungValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return NguoiDung.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        NguoiDung nguoiDung = (NguoiDung) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hoTen", "NotEmpty.nguoiDung.hoTen");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tenNguoiDung", "NotEmpty.nguoiDung.tenNguoiDung");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "matKhau", "NotEmpty.nguoiDung.matKhau");

        if (nguoiDung.getMatKhau().length() < 6) {
            errors.rejectValue("matKhau", "Size.nguoiDung.matKhau");
        }
    }
}
