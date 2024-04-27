package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.CheckLogin;
import com.phanduc.QLHocLieu.models.Khoa;
import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.models.TaiLieu;
import com.phanduc.QLHocLieu.repositories.KhoaRepository;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import com.phanduc.QLHocLieu.repositories.TaiLieuRepository;
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
    @Qualifier("uploadImageService")
    private StorageService storageService;


    @GetMapping("/userinfo/{id}")
    public String getUserInfoById(@PathVariable("id") Integer maNguoiDung, Model model, HttpSession session) {

        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/trangchu";
        }
        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        List<TaiLieu> taiLieus = taiLieuRepository.findByTaiLenBoi(maNguoiDung);
        List<Khoa> listKhoa = khoaRepository.findAll();
        model.addAttribute("listKhoa", listKhoa);
        model.addAttribute("nguoiDung", nguoiDung);
        model.addAttribute("taiLieus", taiLieus);
        return "UserInfo";
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

        return "redirect:/userinfo/" + existingUser.getMaNguoiDung();
    }

//    @PostMapping("/userinfo/update-avatar")
//    public RedirectView updateAvatar(@RequestParam("file") MultipartFile file, HttpSession session) {
//        Integer maNguoiDung = ((NguoiDung) session.getAttribute("loggedInUser")).getMaNguoiDung();
//        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
//        String filePath = storageService.store(file);
//        String prefixedFilePath = "/upload/images/" + filePath;
//        nguoiDung.setAnh(prefixedFilePath);
//        nguoiDungRepository.save(nguoiDung);
//        System.out.println("Đường dẫn của tệp đã được lưu: " + prefixedFilePath);
//        System.out.println("Lưu đường dẫn vào CSDL thành công");
//        return new RedirectView("/userinfo/" + maNguoiDung.toString());
//    }

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
        return new RedirectView("/userinfo/" + maNguoiDung.toString());
    }


//    @PostMapping("/changepassword")
//    public String changePassword(@RequestParam("currentPassword") String currentPassword,@RequestParam("newPassword") String newPassword,
//            @RequestParam("confirmNewPassword") String confirmNewPassword,ModelMap modelMap,HttpSession session) {
//        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
//        // Kiểm tra xác thực mật khẩu hiện tại
//        if (loggedInUser != null && loggedInUser.getMatKhau().equals(currentPassword)) {
//            // Kiểm tra xác nhận mật khẩu mới
//            if (!newPassword.equals(confirmNewPassword)) {
//                modelMap.addAttribute("error", "Mật khẩu mới và xác nhận mật khẩu không khớp.");
//                System.out.println("Mật khẩu mới không trùng nhau");
//                return "redirect:/userinfo/" + loggedInUser.getMaNguoiDung();
//            }
//            loggedInUser.setMatKhau(newPassword);
//            nguoiDungRepository.save(loggedInUser);
//            modelMap.addAttribute("success", "Mật khẩu đã được thay đổi thành công.");
//            System.out.println("Mật khẩu đã được thay đổi thành công");
//        } else {
//            modelMap.addAttribute("error", "Mật khẩu hiện tại không đúng.");
//            System.out.println("Mật khẩu hiện tại không đúng");
//        }
//        return "redirect:/userinfo/" + loggedInUser.getMaNguoiDung();
//    }

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
