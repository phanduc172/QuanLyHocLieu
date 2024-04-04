package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.DanhMuc;
import com.phanduc.QLHocLieu.repositories.DanhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(path = "tailieu")
public class TaiLieuController {
    //http://localhost:8080/tailieu/trangchu
//    @GetMapping("/trangchu")
//    public String trangChu() {
//        return "TrangChu";
//    }
//
    @Autowired
    DanhMucRepository danhMucRepository;
    @GetMapping("/trangchu")
    public String getAllDanhMuc(ModelMap modelMap) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        modelMap.addAttribute("danhMucs", danhMucs);
        return "TrangChu";
    }
}
