package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.HoatDongGanDay;
import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.repositories.HoatDongGanDayRepository;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class DangNhapController {
    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    @Autowired
    private HoatDongGanDayRepository hoatDongGanDayRepository;

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(@RequestParam String tenNguoiDung, @RequestParam String matKhau, HttpSession session, Model model) {
        Integer maVaiTroNguoiDung = 2;
        NguoiDung nguoiDung = nguoiDungRepository.findByTenNguoiDungAndMatKhau(tenNguoiDung, matKhau);
        if (nguoiDung != null && nguoiDung.getMaVaiTro()==maVaiTroNguoiDung) {
            // Lưu thông tin đăng nhập vào session
            session.setAttribute("loggedInUser", nguoiDung);

            HoatDongGanDay hoatDong = new HoatDongGanDay();
            hoatDong.setMaNguoiDung(nguoiDung.getMaNguoiDung());
            hoatDong.setLoaiHoatDong("Đăng nhập");
            hoatDong.setMoTaHoatDong("Vừa đăng nhập vào hệ thống");
            hoatDong.setNgay(new Date());
            hoatDongGanDayRepository.save(hoatDong);

            System.out.println("Đăng nhập thành công");
            return "redirect:/trangchu?statusLogin=true";
        } else {
            System.out.println("Đăng nhập không thành công");
            session.setAttribute("notLoggedInUser", nguoiDung);
            model.addAttribute("notLoggedInUser", true);
            return "redirect:/trangchu?statusLogin=false";
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
