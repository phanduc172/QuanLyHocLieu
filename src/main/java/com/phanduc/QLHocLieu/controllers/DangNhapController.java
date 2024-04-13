package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class DangNhapController {
    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(@RequestParam String tenNguoiDung, @RequestParam String matKhau, HttpSession session, Model model) {
        NguoiDung nguoiDung = nguoiDungRepository.findByTenNguoiDungAndMatKhau(tenNguoiDung, matKhau);
        if (nguoiDung != null && "2".equals(nguoiDung.getMaVaiTro())) {
            // Lưu thông tin đăng nhập vào session
            session.setAttribute("loggedInUser", nguoiDung);
//            model.addAttribute("loggedInUser", "true");
            System.out.println("Đăng nhập thành công");
            return "redirect:/trangchu";
        } else {
            System.out.println("Đăng nhập không thành công");
            return "redirect:/trangchu";
        }
    }

    @RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
    public String logout(HttpSession session) {
        // Xóa thông tin đăng nhập khỏi session khi đăng xuất
        session.removeAttribute("loggedInUser");
        System.out.println("Đăng xuất thành công");
        return "redirect:/trangchu";
    }
}
