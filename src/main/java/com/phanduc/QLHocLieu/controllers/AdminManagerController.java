package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.ChuyenNganhRepository;
import com.phanduc.QLHocLieu.repositories.DanhMucRepository;
import com.phanduc.QLHocLieu.repositories.KhoaRepository;
import com.phanduc.QLHocLieu.repositories.TaiLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "/manager")
public class AdminManagerController {
    @Autowired
    private KhoaRepository khoaRepository;
    @Autowired
    private ChuyenNganhRepository chuyenNganhRepository;
    @Autowired
    private DanhMucRepository danhMucRepository;
    @Autowired
    private TaiLieuRepository taiLieuRepository;

    @GetMapping("/tailieu")
    //http://localhost:8080/manager/tailieu
    public String getAllTaiLieu(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            ModelMap modelMap
    ) {
        Pageable pageable = PageRequest.of(page, size);
        Page<TaiLieu> taiLieuPage = taiLieuRepository.findAll(pageable);
        List<TaiLieu> listTaiLieu = taiLieuPage.getContent();
        modelMap.addAttribute("listTaiLieu", listTaiLieu);
        modelMap.addAttribute("currentPage", taiLieuPage.getNumber());
        modelMap.addAttribute("totalPages", taiLieuPage.getTotalPages());
        modelMap.addAttribute("size", size);

        return "admin/QuanLyTaiLieu";
    }

    @GetMapping("/khoachuyennganh")
    //http://localhost:8080/manager/khoachuyennganh
    public String getKhoaChuyenNganh(@RequestParam(defaultValue = "0") int khoaPage,
                                     @RequestParam(defaultValue = "0") int chuyenNganhPage,
                                     @RequestParam(defaultValue = "10") int size,
                                     ModelMap modelMap) {
        Page<Khoa> listKhoa = khoaRepository.findAll(PageRequest.of(khoaPage, size));
        Page<ChuyenNganh> listChuyenNganh = chuyenNganhRepository.findAll(PageRequest.of(chuyenNganhPage, size));
        modelMap.addAttribute("listKhoa", listKhoa.getContent());
        modelMap.addAttribute("listChuyenNganh", listChuyenNganh.getContent());
        modelMap.addAttribute("currentPageKhoa", listKhoa.getNumber());
        modelMap.addAttribute("totalPagesKhoa", listKhoa.getTotalPages());
        modelMap.addAttribute("currentPageChuyenNganh", listChuyenNganh.getNumber());
        modelMap.addAttribute("totalPagesChuyenNganh", listChuyenNganh.getTotalPages());
        modelMap.addAttribute("size", size);
        return "admin/QuanLyKhoaChuyenNganh";
    }

    @GetMapping("/danhmuc")
    //http://localhost:8080/manager/danhmuc
    public String getAllDanhMuc(ModelMap modelMap) {
        List<DanhMuc> listDanhMuc = danhMucRepository.findAll();
        modelMap.addAttribute("listDanhMuc",listDanhMuc);
        return "admin/QuanLyDanhMuc";
    }

    @PostMapping("/danhmuc/addcategory")
    //http://localhost:8080/manager/danhmuc/addcategory
    public String themDanhMuc(@RequestParam("tenDanhMuc") String tenDanhMuc) {
        DanhMuc danhMuc = new DanhMuc();
        danhMuc.setTenDanhMuc(tenDanhMuc);
        danhMucRepository.save(danhMuc);
        return "redirect:/manager/danhmuc";
    }

    @DeleteMapping("/danhmuc/delete/{maDanhMuc}")
    //http://localhost:8080/manager/danhmuc/delete/
    public ResponseEntity<String> deleteCategory(@PathVariable("maDanhMuc") Integer maDanhMuc) {
        Optional<DanhMuc> danhMuc = danhMucRepository.findById(maDanhMuc);
        if (danhMuc.isPresent()) {
            danhMucRepository.deleteById(maDanhMuc);
            return new ResponseEntity<>("Xóa danh mục thành công", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Danh mục không tồn tại", HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/danhmuc/update")
    public String updateDanhMuc(@RequestParam("maDanhMuc") Integer maDanhMuc, @RequestParam("tenDanhMuc") String tenDanhMuc) {
        Optional<DanhMuc> optionalDanhMuc = danhMucRepository.findById(maDanhMuc);
        if (optionalDanhMuc.isPresent()) {
            DanhMuc danhMuc = optionalDanhMuc.get();
            danhMuc.setTenDanhMuc(tenDanhMuc);
            danhMucRepository.save(danhMuc);
            return "redirect:/manager/danhmuc";
        } else {
            return "redirect:/manager/danhmuc";
        }
    }


}
