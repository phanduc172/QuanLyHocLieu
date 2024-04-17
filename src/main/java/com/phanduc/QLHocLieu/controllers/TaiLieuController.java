package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.CheckLogin;
import com.phanduc.QLHocLieu.models.DanhMuc;
import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.models.TaiLieu;
import com.phanduc.QLHocLieu.repositories.DanhMucRepository;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import com.phanduc.QLHocLieu.repositories.TaiLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "")
public class TaiLieuController {
    @Autowired
    DanhMucRepository danhMucRepository;
    @Autowired
    TaiLieuRepository taiLieuRepository;
    @Autowired
    NguoiDungRepository nguoiDungRepository;

    @GetMapping("/")
    public String home() {
        return "redirect:/trangchu";
    }

    @GetMapping("/trangchu")
    //http://localhost:8080/trangchu
    public String getAllTaiLieuAndDanhMuc(ModelMap modelMap, HttpSession session) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        List<TaiLieu> taiLieus = taiLieuRepository.findAll();
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        modelMap.addAttribute("danhMucs", danhMucs);
        modelMap.addAttribute("taiLieus", taiLieus);
        modelMap.addAttribute("nguoiDung", nguoiDung);
        return "TrangChu";
    }

    @GetMapping("/danhmuc/{maDanhMuc}")
    //http://localhost:8080/danhmuc/1
    public String getTaiLieuByMaDanhMuc(@PathVariable("maDanhMuc") int maDanhMuc, ModelMap modelMap, HttpSession session) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        List<TaiLieu> taiLieus = taiLieuRepository.findByMaDanhMuc(maDanhMuc);
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        modelMap.addAttribute("nguoiDung", nguoiDung);
        modelMap.addAttribute("danhMucs", danhMucs);
        if (taiLieus == null || taiLieus.isEmpty()) {
            System.out.println("Không tìm thấy tài liệu với mã danh mục: " + maDanhMuc);
            modelMap.addAttribute("message", "Không có tài liệu thuộc danh mục này");
            return "TrangChu";
        } else {
            modelMap.addAttribute("taiLieus", taiLieus);
            return "TrangChu";
        }
    }

    @GetMapping("/document/{maTaiLieu}")
    public String getDocumentById(@PathVariable("maTaiLieu") Integer maTaiLieu, Model modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        Optional<TaiLieu> optionalTaiLieu = taiLieuRepository.findByMaTaiLieu(maTaiLieu);
        modelMap.addAttribute("nguoiDung", nguoiDung);
        if (optionalTaiLieu.isPresent()) {
            TaiLieu taiLieu = optionalTaiLieu.get();
            String nguoiTaiLen = taiLieuRepository.findHoTenByMaNguoiDung(taiLieu.getTaiLenBoi());
            String docImage = taiLieuRepository.findAnhByMaNguoiDung(taiLieu.getTaiLenBoi());
            modelMap.addAttribute("nguoiTaiLen", nguoiTaiLen);
            modelMap.addAttribute("taiLieu", taiLieu);
            modelMap.addAttribute("docImage", docImage);
            System.out.println(docImage);
            return "ChiTietTaiLieu";
        } else {
            return "notfound";
        }
    }




    @PostMapping("/search/{keyword}")
    public String timKiemTaiLieu(@RequestParam("keyword") String keyword, ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        modelMap.addAttribute("danhMucs", danhMucs);
        modelMap.addAttribute("nguoiDung", nguoiDung);
        keyword = keyword.trim().toLowerCase();
        List<TaiLieu> taiLieus = taiLieuRepository.findByTieuDeContaining(keyword);
        if (taiLieus == null || taiLieus.isEmpty()) {
            modelMap.addAttribute("message", "Không tìm thấy tài liệu");
            return "TrangChu";
        } else {
            modelMap.addAttribute("taiLieus", taiLieus);
            return "TrangChu";
        }

    }


    @GetMapping("uploadfile")
    public String uploadDocument(ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        modelMap.addAttribute("nguoiDung", nguoiDung);
        return "TaiLenTaiLieu";
    }


}

//        if (!CheckLogin.isLoggedIn(session)) {
//            modelMap.addAttribute("message", "Bạn cần đăng nhập để truy cập tính năng này.");
//            return "redirect:/trangchu";
//        }
