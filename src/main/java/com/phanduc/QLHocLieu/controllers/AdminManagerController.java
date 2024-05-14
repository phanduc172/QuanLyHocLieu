package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.*;
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
    @Autowired
    private NguoiDungRepository nguoiDungRepository;

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

    @GetMapping("/user/list")
    //http://localhost:8080/manager/user/list
    public String getAllNguoiDung(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            ModelMap modelMap) {
        Pageable pageable = PageRequest.of(page, size);
        Page<NguoiDung> nguoiDungPage = nguoiDungRepository.findAll(pageable);

        modelMap.addAttribute("nguoiDung", nguoiDungPage.getContent());
        modelMap.addAttribute("currentPage", nguoiDungPage.getNumber());
        modelMap.addAttribute("totalPages", nguoiDungPage.getTotalPages());
        modelMap.addAttribute("totalItems", nguoiDungPage.getTotalElements());
        modelMap.addAttribute("size", size);
        modelMap.addAttribute("nguoiDungPage",nguoiDungPage);

        return "admin/QuanLyNguoiDung";
    }

    @PostMapping("/update")
    public String updateUser(@RequestParam("maNguoiDung") String maNguoiDung,
                             @RequestParam("updateUsername") String username,
                             @RequestParam("updateFullName") String fullName,
                             @RequestParam("updateEmail") String email,
                             @RequestParam("updatePassword") String password,
                             @RequestParam("updateRoleId") Integer roleId,
                             @ModelAttribute("nguoiDung") NguoiDung nguoiDung
    ) {
        try {
            if (nguoiDung == null) {
                return "Không tìm thấy người dùng với mã người dùng: " + maNguoiDung;
            }
            if (username.isEmpty() || fullName.isEmpty() || email.isEmpty() || password.isEmpty() || roleId == null) {
                return "/admin/Error404";
            }
            // Cập nhật thông tin người dùng
            nguoiDung.setTenNguoiDung(username);
            nguoiDung.setHoTen(fullName);
            nguoiDung.setEmail(email);
            nguoiDung.setMatKhau(password);
            nguoiDung.setMaVaiTro(roleId);
            nguoiDungRepository.save(nguoiDung);
            return "redirect:/manager/user/list?updateSuccess=true";
        } catch (Exception e) {
            System.out.println("Đã xảy ra lỗi trong quá trình cập nhật người dùng:" + e.getMessage());
            return "redirect:/admin/Error404";
        }
    }

    @DeleteMapping("/delete/{maNguoiDung}")
    public ResponseEntity<String> deleteUser(@PathVariable("maNguoiDung") Integer maNguoiDung) {
        Optional<NguoiDung> optionalNguoiDung = nguoiDungRepository.findById(maNguoiDung);
        if (optionalNguoiDung.isPresent()) {
            return new ResponseEntity<>("Xóa người dùng thành công", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Người dùng không tồn tại", HttpStatus.NOT_FOUND);
        }
    }


}
