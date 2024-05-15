package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.HoatDongGanDay;
import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(path = "/admin")
public class AdminDangNhapController {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @GetMapping("/login")
    public String login() {
        return "admin/AdminDangNhap";
    }

    @PostMapping("/login")
    public String login(@RequestParam(name = "tenNguoiDung") String tenNguoiDung,
                        @RequestParam(name = "matKhau") String matKhau,
                        HttpSession session, ModelMap modelMap) {
        Integer maVaiTroAdmin = 1;
        NguoiDung nguoiDung = nguoiDungRepository.findByTenNguoiDungAndMatKhau(tenNguoiDung, matKhau);
        if (nguoiDung != null && nguoiDung.getMaVaiTro() == maVaiTroAdmin) {
            session.setAttribute("loggedInAdmin", nguoiDung);
            System.out.println("Đăng nhập thành công");
            return "redirect:/dashboard?statusLogin=true";
        } else {
            System.out.println("Đăng nhập không thành công");
            session.setAttribute("notLoggedInUser", nguoiDung);
            modelMap.addAttribute("notLoggedInAdmin", true);
            return "redirect:/admin/login?statusLogin=false";
        }
    }


    @RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
    public String logout(HttpSession session) {
        session.removeAttribute("loggedInAdmin");
        System.out.println("Đăng xuất thành công");
        return "redirect:/dashboard";
    }
}
