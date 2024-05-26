package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.*;
import com.phanduc.QLHocLieu.services.StorageService;
import org.hibernate.annotations.Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "")
public class NguoiDungController {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    @Autowired
    TaiLieuRepository taiLieuRepository;
    @Autowired
    KhoaRepository khoaRepository;
    @Autowired
    DanhMucRepository danhMucRepository;
    @Autowired
    ChuyenNganhRepository chuyenNganhRepository;
    @Autowired
    HoatDongGanDayRepository hoatDongGanDayRepository;
    @Autowired
    @Qualifier("uploadImageService")
    private StorageService storageService;


    @GetMapping("/userinfo/{id}")
    public String getUserInfoById(@PathVariable("id") Integer maNguoiDung, ModelMap modelMap, HttpSession session) {
        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        Integer trangThaiDaDuyet = 1;
        Integer trangThaiChoDuyet = 2;
        Integer trangThaiTuChoi = 3;
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        List<Khoa> khoas = khoaRepository.findAll();
        List<ChuyenNganh> chuyenNganhs = chuyenNganhRepository.findAll();
        modelMap.addAttribute("danhMucs", danhMucs);
        if (loggedInUser == null) {
            return "redirect:/trangchu";
        }
        if(loggedInUser != null) {
            modelMap.addAttribute("currentPasswordHidden", loggedInUser.getMatKhau());
        }
        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
//        List<TaiLieu> taiLieus = taiLieuRepository.findByTaiLenBoi(maNguoiDung);
        List<TaiLieu> taiLieus = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(trangThaiDaDuyet, maNguoiDung);
        List<TaiLieu> taiLieuWait = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(trangThaiChoDuyet, maNguoiDung);
        List<TaiLieu> taiLieuReject = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(trangThaiTuChoi, maNguoiDung);
        List<Khoa> listKhoa = khoaRepository.findAll();
        if (taiLieus == null || taiLieus.isEmpty()) {
            modelMap.addAttribute("noDocuments", "Bạn chưa tải lên tài liệu nào!");
        }
        calculateDocumentTotals(modelMap, taiLieus, taiLieuWait, taiLieuReject);
        modelMap.addAttribute("listKhoa", listKhoa);
        modelMap.addAttribute("nguoiDung", nguoiDung);
        modelMap.addAttribute("taiLieus", taiLieus);
        modelMap.addAttribute("khoas", khoas);
        modelMap.addAttribute("chuyenNganhs", chuyenNganhs);

        return "UserInfo";
    }

    @GetMapping("/userinfo/{id}/wait")
    public String getDocumentWaitById(@PathVariable("id") Integer maNguoiDung, ModelMap modelMap, HttpSession session) {
        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        Integer trangThaiDaDuyet = 1;
        Integer trangThaiChoDuyet = 2;
        Integer trangThaiTuChoi = 3;
        if (loggedInUser == null) {
            return "redirect:/trangchu";
        }
        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        List<Khoa> listKhoa = khoaRepository.findAll();
        List<TaiLieu> taiLieus = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(trangThaiDaDuyet, maNguoiDung);
        List<TaiLieu> taiLieuWait = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(trangThaiChoDuyet, maNguoiDung);
        List<TaiLieu> taiLieuReject = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(trangThaiTuChoi, maNguoiDung);

        // Kiểm tra nếu danh sách tài liệu rỗng, gán nội dung cho modal
        if (taiLieuWait == null || taiLieuWait.isEmpty()) {
            modelMap.addAttribute("noDocuments", "Không có tài liệu nào đang chờ!");
        }

        calculateDocumentTotals(modelMap, taiLieus, taiLieuWait, taiLieuReject);

        modelMap.addAttribute("listKhoa", listKhoa);
        modelMap.addAttribute("nguoiDung", nguoiDung);
        modelMap.addAttribute("taiLieus", taiLieuWait);
        modelMap.addAttribute("loggedInUser",loggedInUser);
        modelMap.addAttribute("trangThai", trangThaiChoDuyet);
        return "UserInfo";
    }

    @GetMapping("/userinfo/{id}/reject")
    public String getDocumentRejectById(@PathVariable("id") Integer maNguoiDung, ModelMap modelMap, HttpSession session) {
        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        Integer trangThaiDaDuyet = 1;
        Integer trangThaiChoDuyet = 2;
        Integer trangThaiTuChoi = 3;
        if (loggedInUser == null) {
            return "redirect:/trangchu";
        }
        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        List<Khoa> listKhoa = khoaRepository.findAll();
        List<TaiLieu> taiLieus = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(trangThaiDaDuyet, maNguoiDung);
        List<TaiLieu> taiLieuWait = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(trangThaiChoDuyet, maNguoiDung);
        List<TaiLieu> taiLieuReject = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(trangThaiTuChoi, maNguoiDung);

        // Kiểm tra nếu danh sách tài liệu bị từ chối rỗng, gán nội dung cho modal
        if (taiLieuReject == null || taiLieuReject.isEmpty()) {
            modelMap.addAttribute("noDocuments", "Không có tài liệu nào bị từ chối!");
        }

        calculateDocumentTotals(modelMap, taiLieus, taiLieuWait, taiLieuReject);

        modelMap.addAttribute("listKhoa", listKhoa);
        modelMap.addAttribute("nguoiDung", nguoiDung);
        modelMap.addAttribute("taiLieus", taiLieuReject);
        modelMap.addAttribute("loggedInUser", loggedInUser);
        modelMap.addAttribute("trangThai", trangThaiTuChoi);
        return "UserInfo";
    }

    private void calculateDocumentTotals(ModelMap modelMap, List<TaiLieu> taiLieus, List<TaiLieu> taiLieuWait, List<TaiLieu> taiLieuReject) {
        Integer totalApprove = taiLieus.size();
        Integer totalWait = taiLieuWait.size();
        Integer totalReject = taiLieuReject.size();
        modelMap.addAttribute("totalApprove", totalApprove);
        modelMap.addAttribute("totalWait", totalWait);
        modelMap.addAttribute("totalReject", totalReject);
    }


    @PostMapping("/userinfo/update")
    public String updateInfoById(@ModelAttribute("nguoiDung") NguoiDung nguoiDung, HttpSession session) {
        Integer maNguoiDung = ((NguoiDung) session.getAttribute("loggedInUser")).getMaNguoiDung();
        NguoiDung existingUser = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        if (existingUser == null) {
            return "trangchu";
        }
        existingUser.setHoTen(nguoiDung.getHoTen());
        existingUser.setTenNguoiDung(nguoiDung.getTenNguoiDung());
        existingUser.setEmail(nguoiDung.getEmail());
        nguoiDungRepository.save(existingUser);
        HoatDongGanDay hoatDong = new HoatDongGanDay();
        hoatDong.setMaNguoiDung(nguoiDung.getMaNguoiDung());
        hoatDong.setLoaiHoatDong("Cập nhật");
        hoatDong.setMoTaHoatDong("Cập nhật người dùng: " + existingUser.getHoTen());
        hoatDong.setNgay(new Date());
        return "redirect:/userinfo/" + existingUser.getMaNguoiDung();
    }

    @PostMapping("/userinfo/update-avatar")
    public RedirectView updateAvatar(@RequestParam("file") MultipartFile file, HttpSession session) {
        Integer maNguoiDung = ((NguoiDung) session.getAttribute("loggedInUser")).getMaNguoiDung();
        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        String filePath = storageService.store(file);
        String prefixedFilePath = "/upload/images/" + filePath;
        nguoiDung.setAnh(prefixedFilePath);
        nguoiDungRepository.save(nguoiDung);
        // Lấy thông tin người dùng mới từ CSDL sau khi cập nhật
        nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        // Cập nhật lại session với người dùng mới
        session.setAttribute("loggedInUser", nguoiDung);
        System.out.println("Đường dẫn của tệp đã được lưu: " + prefixedFilePath);
        System.out.println("Lưu đường dẫn vào CSDL thành công");

        HoatDongGanDay hoatDong = new HoatDongGanDay();
        hoatDong.setMaNguoiDung(nguoiDung.getMaNguoiDung());
        hoatDong.setLoaiHoatDong("Cập nhật");
        hoatDong.setMoTaHoatDong("Vừa cập nhật ảnh đại diện");
        hoatDong.setNgay(new Date());
        hoatDongGanDayRepository.save(hoatDong);
        return new RedirectView("/userinfo/" + maNguoiDung.toString());
    }


    @PostMapping("/changepassword")
    public String changePassword(@RequestParam("currentPassword") String currentPassword,
                                 @RequestParam("newPassword") String newPassword,
                                 @RequestParam("confirmNewPassword") String confirmNewPassword,
                                 ModelMap modelMap,
                                 HttpSession session) {

        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        String currentPasswordHidden = loggedInUser.getMatKhau();
        System.out.println(currentPasswordHidden);
        modelMap.addAttribute("currentPasswordHidden", loggedInUser.getMatKhau());
        // Kiểm tra xác thực mật khẩu hiện tại
        if (loggedInUser != null && loggedInUser.getMatKhau().equals(currentPassword)) {
            // Kiểm tra xác nhận mật khẩu mới
            if (!newPassword.equals(confirmNewPassword)) {
                System.out.println("Mật khẩu mới không trùng nhau");
                return "redirect:/userinfo/" + loggedInUser.getMaNguoiDung();
            }
            loggedInUser.setMatKhau(newPassword);
            nguoiDungRepository.save(loggedInUser);

            System.out.println("Mật khẩu đã được thay đổi thành công");
        } else {
            System.out.println("Mật khẩu hiện tại không đúng");
        }

        return "redirect:/userinfo/" + loggedInUser.getMaNguoiDung();
    }







}
