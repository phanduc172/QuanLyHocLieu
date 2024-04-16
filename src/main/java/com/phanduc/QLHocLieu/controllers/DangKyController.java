package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import com.phanduc.QLHocLieu.services.NguoiDungValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DangKyController {
    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    @Autowired
    private NguoiDungValidator nguoiDungValidator;

    @PostMapping("/register")
    public String register(NguoiDung nguoiDung, BindingResult bindingResult) {
        nguoiDungValidator.validate(nguoiDung, bindingResult);
        NguoiDung  existingUser = nguoiDungRepository.findByTenNguoiDung(nguoiDung.getTenNguoiDung());
        if(existingUser!=null) {
            System.out.println("Tên người dùng đã tồn tại!");
            return "redirect:/trangchu?register=false";
        }
        if (bindingResult.hasErrors()) {
            System.out.println("Vui lòng điền đầy đủ thông tin!");
            return "redirect:/trangchu?register=false";
        }
        nguoiDungRepository.save(nguoiDung);
        return "redirect:/trangchu?register=true";
    }
}
