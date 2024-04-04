package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.DanhMuc;
import com.phanduc.QLHocLieu.repositories.DanhMucRepository;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "danhmuc")
public class DanhMucController {
    @Autowired
    private DanhMucRepository danhMucRepository;
    @GetMapping("")
    public String getAllDanhMuc(ModelMap modelMap) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        modelMap.addAttribute("danhmucs", danhMucs);
        return "DanhMuc";
    }
}
