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

import java.util.*;
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
    @Autowired
    private KhoaRepository khoaRepository;

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
        Integer trangThaiChoDuyet = 2;
        Pageable pageable = PageRequest.of(page, size);
        Page<TaiLieu> taiLieuPage = taiLieuRepository.findByMaTrangThai(trangThaiChoDuyet, pageable);
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
        modelMap.addAttribute("titleTaiLieu","Tài liệu chờ duyệt");
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

    @GetMapping("/approve/reject")
    public String pheDuyetTaiLieuTuChoi(@RequestParam(defaultValue = "0") int page,
                                  @RequestParam(defaultValue = "10") int size,
                                  ModelMap modelMap) {
        Integer trangThaiTuChoi = 3;
        Pageable pageable = PageRequest.of(page, size);
        Page<TaiLieu> taiLieuPage = taiLieuRepository.findByMaTrangThai(trangThaiTuChoi, pageable);
        List<TaiLieu> listTaiLieuTuChoi = taiLieuPage.getContent();
        List<String> tenDanhMuc = new ArrayList<>();
        List<String> tenChuyenNganh = new ArrayList<>();
        List<String> tenTrangThai = new ArrayList<>();
        List<String> tenNguoiDung = new ArrayList<>();
        for (TaiLieu taiLieutuchoi : listTaiLieuTuChoi) {
            tenDanhMuc.add(getTenDanhMuc(taiLieutuchoi));
            tenChuyenNganh.add(getTenChuyenNganh(taiLieutuchoi));
            tenTrangThai.add(getTenTrangThai(taiLieutuchoi));
            tenNguoiDung.add(getTenNguoiDung(taiLieutuchoi));

        }
        modelMap.addAttribute("titleTaiLieu","Tài liệu từ chối");
        modelMap.addAttribute("listTaiLieuTuChoi", listTaiLieuTuChoi);
        modelMap.addAttribute("tenDanhMuc", tenDanhMuc);
        modelMap.addAttribute("tenChuyenNganh", tenChuyenNganh);
        modelMap.addAttribute("tenTrangThai", tenTrangThai);
        modelMap.addAttribute("tenNguoiDung", tenNguoiDung);
        modelMap.addAttribute("currentPage", taiLieuPage.getNumber());
        modelMap.addAttribute("totalPages", taiLieuPage.getTotalPages());
        modelMap.addAttribute("size", size);

        return "admin/PheDuyetTaiLieu";
    }

    @DeleteMapping("/approve/reject/delete/{maTaiLieu}")
    public ResponseEntity<String> deleteDocumentReject(@PathVariable("maTaiLieu") Integer maTaiLieu) {
        TaiLieu taiLieu = taiLieuRepository.findTaiLieuByMaTaiLieu(maTaiLieu);
        if (taiLieu != null) {
            taiLieuRepository.delete(taiLieu);
            return new ResponseEntity<>("Xóa tài liệu thành công", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Tài liệu không tồn tại", HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/approve/detail/{maTaiLieu}")
    public String duyetTaiLieuById(@PathVariable("maTaiLieu") Integer maTaiLieu, ModelMap modelMap) {
        TaiLieu taiLieu = taiLieuRepository.findTaiLieuByMaTaiLieu(maTaiLieu);
        String tenDanhMuc = getTenDanhMuc(taiLieu);
        modelMap.addAttribute("tenDanhMuc", tenDanhMuc);
        String tenChuyenNganh = getTenChuyenNganh(taiLieu);
        modelMap.addAttribute("tenChuyenNganh", tenChuyenNganh);
        String tenTrangThai = getTenTrangThai(taiLieu);
        modelMap.addAttribute("tenTrangThai", tenTrangThai);
        String tenNguoiDung = getTenNguoiDung(taiLieu);
        modelMap.addAttribute("tenNguoiDung", tenNguoiDung);
        String maChuyenNganh = taiLieu.getMaChuyenNganh();
        Integer maKhoa = getMaKhoaByMaChuyenNganh(maChuyenNganh);
        String tenKhoa = getTenKhoa(maKhoa);
        modelMap.addAttribute("tenKhoa", tenKhoa);
        modelMap.addAttribute("taiLieu", taiLieu);
        return "/admin/PheDuyetTaiLieu";
    }

    @PostMapping("/detail/action")
    public String approveDocument(@RequestParam("maTaiLieu") Integer maTaiLieu, @RequestParam("action") String action) {
        Integer trangThaiDuyet = 1;
        Integer trangThaiTuChoi = 3;
        TaiLieu taiLieu = taiLieuRepository.findTaiLieuByMaTaiLieu(maTaiLieu);
        if (action.equals("accept")) {
            taiLieu.setMaTrangThai(trangThaiDuyet);
            taiLieuRepository.save(taiLieu);
            return "redirect:/document/approve";
        } else if (action.equals("reject")) {
            taiLieu.setMaTrangThai(trangThaiTuChoi);
            taiLieuRepository.save(taiLieu);
            return "redirect:/document/approve/reject";
        }
        return null;
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

    public Integer getMaKhoaByMaChuyenNganh(String maChuyenNganh) {
        ChuyenNganh chuyenNganh = chuyenNganhRepository.findById(maChuyenNganh).orElse(null);
        return chuyenNganh != null ? chuyenNganh.getMaKhoa() : null;
    }

    public String getTenKhoa(Integer maKhoa) {
        Khoa khoa = khoaRepository.findById(maKhoa).orElse(null);
        return khoa != null ? khoa.getTenKhoa() : "Unknown";
    }





}
