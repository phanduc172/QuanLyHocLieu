package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.CheckLogin;
import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.models.TaiLieu;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import com.phanduc.QLHocLieu.repositories.TaiLieuRepository;
import org.hibernate.annotations.Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "")
public class NguoiDungController {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    @Autowired
    TaiLieuRepository taiLieuRepository;
    @GetMapping("/userinfo/{id}")
    public String getUserInfoById(@PathVariable("id") Integer maNguoiDung, Model model, HttpSession session) {

        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/trangchu";
        }
        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        List<TaiLieu> taiLieus = taiLieuRepository.findByTaiLenBoi(maNguoiDung);
        model.addAttribute("nguoiDung", nguoiDung);
        model.addAttribute("taiLieus", taiLieus);
        return "UserInfo";
    }

    @PostMapping("/userinfo/update")
    public String updateInfoById(@ModelAttribute("nguoiDung") NguoiDung nguoiDung, HttpSession session) {
        Integer maNguoiDung = ((NguoiDung) session.getAttribute("loggedInUser")).getMaNguoiDung();
        NguoiDung existingUser = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        if (existingUser == null) {
            return "trangchu";
        }

        existingUser.setHoTen(nguoiDung.getHoTen());
        existingUser.setTenNguoiDung(nguoiDung.getTenNguoiDung());
        existingUser.setEmail(nguoiDung.getEmail());

        nguoiDungRepository.save(existingUser);

        return "redirect:/userinfo/" + existingUser.getMaNguoiDung();
    }

}
