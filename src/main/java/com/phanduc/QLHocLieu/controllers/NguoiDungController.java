package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.models.TaiLieu;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import com.phanduc.QLHocLieu.repositories.TaiLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(path = "")
public class NguoiDungController {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    @Autowired
    TaiLieuRepository taiLieuRepository;
    @GetMapping("/userinfo/{id}")
    public String getUserInfoById(@PathVariable("id") String id, Model model, HttpSession session) {
        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/trangchu";
        }
        NguoiDung nguoiDung = nguoiDungRepository.findById(id).orElse(null);
        if (nguoiDung == null) {
            return "redirect:/trangchu";
        }
        String maNguoiDung = loggedInUser.getMaNguoiDung();
        List<TaiLieu> taiLieus = taiLieuRepository.findByTaiLenBoi(maNguoiDung);
        model.addAttribute("nguoiDung", nguoiDung);
        model.addAttribute("taiLieus", taiLieus);
        return "UserInfo";
    }



}
