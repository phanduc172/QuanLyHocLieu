package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.DanhMuc;
import com.phanduc.QLHocLieu.models.TaiLieu;
import com.phanduc.QLHocLieu.repositories.DanhMucRepository;
import com.phanduc.QLHocLieu.repositories.TaiLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(path = "trangchu")
//http://localhost:8080/trangchu
public class TaiLieuController {
    @Autowired
    DanhMucRepository danhMucRepository;
    @Autowired
    TaiLieuRepository taiLieuRepository;
    @GetMapping("")
    public String getAllTaiLieuAndDanhMuc(ModelMap modelMap) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        List<TaiLieu> taiLieus = taiLieuRepository.findAll();

        modelMap.addAttribute("danhMucs", danhMucs);
        modelMap.addAttribute("taiLieus", taiLieus);
        return "TrangChu";
    }

    @GetMapping("/danhmuc/{maDanhMuc}")
    public String getTaiLieuByMaDanhMuc(@PathVariable("maDanhMuc") String maDanhMuc, ModelMap modelMap) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        modelMap.addAttribute("danhMucs", danhMucs);
        List<TaiLieu> taiLieus = taiLieuRepository.findByMaDanhMuc(maDanhMuc);
        if (taiLieus == null || taiLieus.isEmpty()) {
            System.out.println("Không tìm thấy tài liệu với mã danh mục: " + maDanhMuc);
            return "notfound";
        } else {
            modelMap.addAttribute("taiLieus", taiLieus);
            return "TrangChu";
        }
    }


}
