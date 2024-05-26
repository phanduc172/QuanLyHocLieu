package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.CheckLogin;
import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import org.hibernate.engine.jdbc.connections.internal.UserSuppliedConnectionProviderImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "/admin")
public class AdminNguoiDungController {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    private CheckLogin loginChecker = new CheckLogin();

    @GetMapping("/profile/{maNguoiDung}")
    public String getNguoiDungById(ModelMap modelMap, HttpSession session) {
        if (!loginChecker.checkLoginAdmin(session)) {
            return "redirect:/admin/login";
        }
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInAdmin");
        modelMap.addAttribute("nguoiDung",nguoiDung);
        return "admin/AdminProfile";
    }

        @PostMapping("/profile/update")
        public String updateProfile(@RequestParam("maNguoiDung") Integer maNguoiDung,
                                 @RequestParam("updateUsername") String username,
                                 @RequestParam("updateFullName") String fullName,
                                 @RequestParam("updateEmail") String email,
                                 @RequestParam("updatePassword") String password,
                                 @ModelAttribute("nguoiDung") NguoiDung nguoiDung,
                                HttpSession session
        ) {
            try {
                if (nguoiDung == null) {
                    return "Không tìm thấy người dùng với mã người dùng: " + maNguoiDung;
                }
                if (username.isEmpty() || fullName.isEmpty() || email.isEmpty() || password.isEmpty()) {
                    return "/admin/Error404";
                }
                nguoiDung.setTenNguoiDung(username);
                nguoiDung.setHoTen(fullName);
                nguoiDung.setEmail(email);
                nguoiDung.setMatKhau(password);
                nguoiDung.setMaVaiTro(1);
                nguoiDungRepository.save(nguoiDung);
                session.setAttribute("loggedInAdmin", nguoiDung);
                return "redirect:/admin/profile/"+ maNguoiDung+"?updateSuccess=true";
            } catch (Exception e) {
                System.out.println("Đã xảy ra lỗi trong quá trình cập nhật người dùng:" + e.getMessage());
                return "redirect:/admin/Error404";
            }
        }



}
