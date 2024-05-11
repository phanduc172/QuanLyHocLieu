package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

//    @GetMapping("/approve")
//    public String pheDuyetTaiLieu(ModelMap modelMap) {
//        List<TaiLieu> listTaiLieu = taiLieuRepository.findByMaTrangThai(2);
//        List<String> tenDanhMuc = new ArrayList<>();
//        List<String> tenChuyenNganh = new ArrayList<>();
//        List<String> tenTrangThai = new ArrayList<>();
//        List<String> tenNguoiDung = new ArrayList<>();
//        for (TaiLieu taiLieu : listTaiLieu) {
//            DanhMuc danhMuc = danhMucRepository.findById(taiLieu.getMaDanhMuc()).orElse(null);
//            ChuyenNganh chuyenNganh = chuyenNganhRepository.findById(taiLieu.getMaChuyenNganh()).orElse(null);
//            TrangThaiTaiLieu trangThaiTaiLieu = trangThaiTaiLieuRepository.findById(taiLieu.getMaTrangThai()).orElse(null);
//            NguoiDung nguoiDung = nguoiDungRepository.findById(taiLieu.getTaiLenBoi()).orElse(null);
//            if (danhMuc != null) {
//                tenDanhMuc.add(danhMuc.getTenDanhMuc());
//            } else {
//                tenDanhMuc.add("Unknown");
//            }
//            if (chuyenNganh != null) {
//                tenChuyenNganh.add(chuyenNganh.getTenChuyenNganh());
//            } else {
//                tenChuyenNganh.add("Unknown");
//            }
//            if (trangThaiTaiLieu != null) {
//                tenTrangThai.add(trangThaiTaiLieu.getMoTaTrangThai());
//            } else {
//                tenTrangThai.add("Unknown");
//            }
//            if (nguoiDung != null) {
//                tenNguoiDung.add(nguoiDung.getHoTen());
//            } else {
//                tenNguoiDung.add("Unknown");
//            }
//        }
//        modelMap.addAttribute("listTaiLieu", listTaiLieu);
//        modelMap.addAttribute("tenDanhMuc", tenDanhMuc);
//        modelMap.addAttribute("tenChuyenNganh", tenChuyenNganh);
//        modelMap.addAttribute("tenTrangThai", tenTrangThai);
//        modelMap.addAttribute("tenNguoiDung", tenNguoiDung);
//        return "admin/PheDuyetTaiLieu";
//    }

    @GetMapping("/approve")
    public String pheDuyetTaiLieu(@RequestParam(defaultValue = "0") int page,
                                  @RequestParam(defaultValue = "10") int size,
                                  ModelMap modelMap) {
        Pageable pageable = PageRequest.of(page, size);
        Page<TaiLieu> taiLieuPage = taiLieuRepository.findByMaTrangThai(2, pageable);

        List<TaiLieu> listTaiLieu = taiLieuPage.getContent();

        List<String> tenDanhMuc = new ArrayList<>();
        List<String> tenChuyenNganh = new ArrayList<>();
        List<String> tenTrangThai = new ArrayList<>();
        List<String> tenNguoiDung = new ArrayList<>();
        for (TaiLieu taiLieu : listTaiLieu) {
            tenDanhMuc.add(getTenDanhMuc(taiLieu));
            tenChuyenNganh.add(getTenChuyenNganh(taiLieu));
            tenTrangThai.add(getTenTrangThai(taiLieu));
            tenNguoiDung.add(getTenNguoiDung(taiLieu));

        }

        modelMap.addAttribute("listTaiLieu", listTaiLieu);
        modelMap.addAttribute("tenDanhMuc", tenDanhMuc);
        modelMap.addAttribute("tenChuyenNganh", tenChuyenNganh);
        modelMap.addAttribute("tenTrangThai", tenTrangThai);
        modelMap.addAttribute("tenNguoiDung", tenNguoiDung);
        modelMap.addAttribute("currentPage", taiLieuPage.getNumber());
        modelMap.addAttribute("totalPages", taiLieuPage.getTotalPages());
        modelMap.addAttribute("size", size);

        return "admin/PheDuyetTaiLieu";
    }

    private String getTenDanhMuc(TaiLieu taiLieu) {
        DanhMuc danhMuc = danhMucRepository.findById(taiLieu.getMaDanhMuc()).orElse(null);
        return danhMuc != null ? danhMuc.getTenDanhMuc() : "Unknown";
    }

    private String getTenChuyenNganh(TaiLieu taiLieu) {
        ChuyenNganh chuyenNganh = chuyenNganhRepository.findById(taiLieu.getMaChuyenNganh()).orElse(null);
        return chuyenNganh != null ? chuyenNganh.getTenChuyenNganh() : "Unknown";
    }

    private String getTenTrangThai(TaiLieu taiLieu) {
        TrangThaiTaiLieu trangThaiTaiLieu = trangThaiTaiLieuRepository.findById(taiLieu.getMaTrangThai()).orElse(null);
        return trangThaiTaiLieu != null ? trangThaiTaiLieu.getMoTaTrangThai() : "Unknown";
    }

    private String getTenNguoiDung(TaiLieu taiLieu) {
        NguoiDung nguoiDung = nguoiDungRepository.findById(taiLieu.getTaiLenBoi()).orElse(null);
        return nguoiDung != null ? nguoiDung.getHoTen() : "Unknown";
    }




}
