package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.dto.ActivityCurrentDto;
import com.phanduc.QLHocLieu.dto.DailyUploadStatsDto;
import com.phanduc.QLHocLieu.dto.TotalDocumentUser;
import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(path = "/dashboard")
//http://localhost:8080/dashboard
public class AdminDashboardController {
    @Autowired
    private KhoaRepository khoaRepository;
    @Autowired
    private ChuyenNganhRepository chuyenNganhRepository;
    @Autowired
    private TaiLieuRepository taiLieuRepository;
    @Autowired
    private HoatDongGanDayRepository hoatDongGanDayRepository;
    @Autowired
    private DanhMucRepository danhMucRepository;

    @GetMapping("")
    public String getDashboard(HttpSession session, ModelMap modelMap) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }

        List<Khoa> listKhoa = khoaRepository.findAll();
        List<ChuyenNganh> listChuyenNganh = chuyenNganhRepository.findAll();

        Integer totalTaiLieu = countTotalTaiLieu();
        modelMap.addAttribute("totalTaiLieu", totalTaiLieu);
        long totalKhoa = khoaRepository.count();
        modelMap.addAttribute("totalKhoa", totalKhoa);
        long totalChuyenNganh = chuyenNganhRepository.count();
        modelMap.addAttribute("totalChuyenNganh", totalChuyenNganh);
        long totalNguoiDung = chuyenNganhRepository.count();
        modelMap.addAttribute("totalNguoiDung", totalNguoiDung);
        long totalDanhMuc = danhMucRepository.count();
        modelMap.addAttribute("totalDanhMuc", totalDanhMuc);
        modelMap.addAttribute("listKhoa", listKhoa);
        modelMap.addAttribute("listChuyenNganh", listChuyenNganh);

        return "admin/AdminTrangChu";
    }

    @GetMapping("/api/tailieu")
    public ResponseEntity<List<DailyUploadStatsDto>> getDailyUploadStats() {
        List<Object[]> statsDocument = taiLieuRepository.findDailyUploadStats();
        List<DailyUploadStatsDto> dailyUploadStatsList = new ArrayList<>();

        statsDocument.forEach(stat -> {
            java.sql.Date ngay = (java.sql.Date) stat[0];
            Long soLuongTaiLieu = ((Number) stat[1]).longValue();
            dailyUploadStatsList.add(new DailyUploadStatsDto(ngay, soLuongTaiLieu));
        });

        return ResponseEntity.ok(dailyUploadStatsList);
    }


    @GetMapping("/api/hoatdong")
    public ResponseEntity<List<ActivityCurrentDto>> getActivityCurrentMonth() {
        List<Object[]> statsActivity = hoatDongGanDayRepository.statisticActivityCurrent();
        List<ActivityCurrentDto> activityCurrentList = new ArrayList<>();

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

        for (Object[] stat : statsActivity) {
            java.util.Date ngay = (java.util.Date) stat[0];
            String ngayFormatted = dateFormat.format(ngay);
            String loaiHoatDong = (String) stat[1];
            Long soLuongHoatDong = ((Number) stat[2]).longValue();
            activityCurrentList.add(new ActivityCurrentDto(ngayFormatted, loaiHoatDong, soLuongHoatDong));
        }
        return ResponseEntity.ok(activityCurrentList);
    }

    @GetMapping("/api/soluongtailieu")
    public ResponseEntity<List<TotalDocumentUser>> getSoLuongTaiLieuJson() {
        List<TotalDocumentUser> soLuongTaiLieuByNguoiDung = taiLieuRepository.getSoLuongTaiLieuByNguoiDung();
        return ResponseEntity.ok().body(soLuongTaiLieuByNguoiDung);
    }

    @GetMapping("error")
    public String eror404() {
        return "/admin/Error404";
    }

    private void getLoggerAdmin(HttpSession session, ModelMap modalMap) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInAdmin");
        modalMap.addAttribute("loggedInAdmin", nguoiDung);
    }
    private Integer countTotalTaiLieu() {
        return taiLieuRepository.countTotalTaiLieu();
    }

}
