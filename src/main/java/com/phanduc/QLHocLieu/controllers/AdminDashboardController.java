package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.ChuyenNganh;
import com.phanduc.QLHocLieu.models.Khoa;
import com.phanduc.QLHocLieu.repositories.ChuyenNganhRepository;
import com.phanduc.QLHocLieu.repositories.KhoaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(path = "/dashboard")
//http://localhost:8080/dashboard
public class AdminDashboardController {
    @Autowired
    private KhoaRepository khoaRepository;
    @Autowired
    private ChuyenNganhRepository chuyenNganhRepository;
    @GetMapping("")
    public String getDashboard(ModelMap modelMap) {
        List<Khoa> listKhoa = khoaRepository.findAll();
        List<ChuyenNganh> listChuyenNganh = chuyenNganhRepository.findAll();
        modelMap.addAttribute("listKhoa",listKhoa);
        modelMap.addAttribute("listChuyenNganh",listChuyenNganh);
        return "admin/AdminTrangChu";
    }



}
