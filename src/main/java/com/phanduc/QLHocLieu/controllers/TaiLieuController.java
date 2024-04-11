package com.phanduc.QLHocLieu.controllers;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


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
    public String getTaiLieuByMaDanhMuc(@PathVariable("maDanhMuc") String maDanhMuc, ModelMap modelMap, HttpSession session) {
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

    @GetMapping("document/{maTaiLieu}")
    //http://localhost:8080/document/5
    public String getDocumentById(@PathVariable("maTaiLieu") String maTaiLieu, Model model) {
        Optional<TaiLieu> optionalTaiLieu = taiLieuRepository.findById(maTaiLieu);
        if (optionalTaiLieu.isPresent()) {
            TaiLieu taiLieu = optionalTaiLieu.get();
            String maNguoiDung = taiLieu.getTaiLenBoi();
            Optional<NguoiDung> optionalNguoiDung = nguoiDungRepository.findById(maNguoiDung);
            if (optionalNguoiDung.isPresent()) {
                NguoiDung nguoiDung = optionalNguoiDung.get();
                model.addAttribute("taiLieu", taiLieu);
                model.addAttribute("nguoiDung", nguoiDung);
                return "ChiTietTaiLieu";
            } else {
                return "notfound";
            }
        } else {
            return "notfound";
        }
    }






}
