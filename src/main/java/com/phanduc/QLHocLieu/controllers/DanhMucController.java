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
@RequestMapping(path = "danhmuc")
public class DanhMucController {
    @Autowired
    private DanhMucRepository danhMucRepository;

    @GetMapping("")
    public String getAllDanhMuc(ModelMap modelMap) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();

        // In danh sách danh mục ra console
        System.out.println("Danh sách Danh mục:");
        for (DanhMuc danhMuc : danhMucs) {
            System.out.println("Mã danh mục: " + danhMuc.getMaDanhMuc());
            System.out.println("Tên danh mục: " + danhMuc.getTenDanhMuc());
        }
        // Thêm danh sách danh mục vào model map để trả về cho view
        modelMap.addAttribute("danhmucs", danhMucs);

        // Trả về tên view để hiển thị
        return "DanhMuc";
    }
}
