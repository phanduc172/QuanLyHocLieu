package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.HoatDongGanDay;
import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.repositories.HoatDongGanDayRepository;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import com.phanduc.QLHocLieu.services.NguoiDungValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
public class DangKyController {
    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    @Autowired
    private NguoiDungValidator nguoiDungValidator;
    @Autowired
    private HoatDongGanDayRepository hoatDongGanDayRepository;

    @PostMapping("/register")
    public String register(NguoiDung nguoiDung, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        nguoiDungValidator.validate(nguoiDung, bindingResult);
        NguoiDung  existingUser = nguoiDungRepository.findByTenNguoiDung(nguoiDung.getTenNguoiDung());
        if(existingUser!=null) {
            System.out.println("Tên người dùng đã tồn tại!");
            redirectAttributes.addFlashAttribute("messageRegister", "Tên người dùng đã tồn tại!");
            return "redirect:/trangchu";
        }
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("messageRegister", "Vui lòng điền đầy đủ thông tin!");
            System.out.println("Vui lòng điền đầy đủ thông tin!");
            return "redirect:/trangchu";
        }
        nguoiDungRepository.save(nguoiDung);
        HoatDongGanDay hoatDong = new HoatDongGanDay();
        hoatDong.setMaNguoiDung(nguoiDung.getMaNguoiDung());
        hoatDong.setLoaiHoatDong("Đăng ký");
        hoatDong.setMoTaHoatDong("Đăng ký thành viên hệ thống");
        hoatDong.setNgay(new Date());
        hoatDongGanDayRepository.save(hoatDong);
        redirectAttributes.addFlashAttribute("messageRegisterSuccess", "Đăng ký tài khoản thành công!");
        return "redirect:/trangchu";
    }
}
