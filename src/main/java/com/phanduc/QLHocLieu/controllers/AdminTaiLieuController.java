package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping(path = "/document")
public class AdminTaiLieuController {
    @Autowired
    private TaiLieuRepository taiLieuRepository;
    @Autowired
    private DanhMucRepository danhMucRepository;
    @Autowired
    private ChuyenNganhRepository chuyenNganhRepository;
    @Autowired
    private TrangThaiTaiLieuRepository trangThaiTaiLieuRepository;
    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    public String getTaiLieu() {
        return "";
    }

    @GetMapping("/approve")
    //ht
    public String pheDuyetTaiLieu(ModelMap modelMap) {
        List<TaiLieu> listTaiLieu = taiLieuRepository.findByMaTrangThai(2);
        List<String> tenDanhMuc = new ArrayList<>();
        List<String> tenChuyenNganh = new ArrayList<>();
        List<String> tenTrangThai = new ArrayList<>();
        List<String> tenNguoiDung = new ArrayList<>();
        for (TaiLieu taiLieu : listTaiLieu) {
            DanhMuc danhMuc = danhMucRepository.findById(taiLieu.getMaDanhMuc()).orElse(null);
            ChuyenNganh chuyenNganh = chuyenNganhRepository.findById(taiLieu.getMaChuyenNganh()).orElse(null);
            TrangThaiTaiLieu trangThaiTaiLieu = trangThaiTaiLieuRepository.findById(taiLieu.getMaTrangThai()).orElse(null);
            NguoiDung nguoiDung = nguoiDungRepository.findById(taiLieu.getTaiLenBoi()).orElse(null);
            if (danhMuc != null) {
                tenDanhMuc.add(danhMuc.getTenDanhMuc());
            } else {
                tenDanhMuc.add("Unknown");
            }
            if (chuyenNganh != null) {
                tenChuyenNganh.add(chuyenNganh.getTenChuyenNganh());
            } else {
                tenChuyenNganh.add("Unknown");
            }
            if (trangThaiTaiLieu != null) {
                tenTrangThai.add(trangThaiTaiLieu.getMoTaTrangThai());
            } else {
                tenTrangThai.add("Unknown");
            }
            if (nguoiDung != null) { // Thay đổi tại đây
                tenNguoiDung.add(nguoiDung.getHoTen());
            } else {
                tenNguoiDung.add("Unknown");
            }
        }
        modelMap.addAttribute("listTaiLieu", listTaiLieu);
        modelMap.addAttribute("tenDanhMuc", tenDanhMuc);
        modelMap.addAttribute("tenChuyenNganh", tenChuyenNganh);
        modelMap.addAttribute("tenTrangThai", tenTrangThai);
        modelMap.addAttribute("tenNguoiDung", tenNguoiDung);
        return "admin/PheDuyetTaiLieu";
    }



}
