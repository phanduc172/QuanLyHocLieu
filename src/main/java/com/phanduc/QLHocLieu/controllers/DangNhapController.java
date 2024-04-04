package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DangNhapController {
    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(String tenNguoiDung, String matKhau) {
        // Thực hiện đăng nhập với dữ liệu từ cơ sở dữ liệu
        NguoiDung nguoiDung = nguoiDungRepository.findByTenNguoiDungAndMatKhau(tenNguoiDung, matKhau);
        nguoiDungRepository.printUser(tenNguoiDung, matKhau);
        if (nguoiDung != null) {
            return "redirect:/tailieu/trangchu";
        } else {
            // Nếu thông tin đăng nhập không đúng, chuyển hướng đến trang đăng nhập lại và hiển thị thông báo lỗi
            return "redirect:/login?error";
        }
    }
}
