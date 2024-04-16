package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.CheckLogin;
import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.models.TaiLieu;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import com.phanduc.QLHocLieu.repositories.TaiLieuRepository;
import com.phanduc.QLHocLieu.services.StorageService;
import org.hibernate.annotations.Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private StorageService storageService;
    @GetMapping("/userinfo/{id}")
    public String getUserInfoById(@PathVariable("id") Integer maNguoiDung, Model model, HttpSession session) {

        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/trangchu";
        }
        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        List<TaiLieu> taiLieus = taiLieuRepository.findByTaiLenBoi(maNguoiDung);
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
//    public String updateAvatar(@RequestParam("file") MultipartFile file, HttpSession session) {
//        Integer maNguoiDung = ((NguoiDung) session.getAttribute("loggedInUser")).getMaNguoiDung();
//        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
//        String filePath = storageService.store(file); // Lấy đường dẫn của tệp đã được lưu
//        // Bây giờ bạn có thể làm bất kỳ điều gì với đường dẫn này, ví dụ: lưu vào CSDL, hiển thị cho người dùng, vv.
//        String prefixedFilePath = "/images/" + filePath;
//        nguoiDung.setAnh(prefixedFilePath);
//        nguoiDungRepository.save(nguoiDung);
//        System.out.println("Đường dẫn của tệp đã được lưu: " + prefixedFilePath);
//        System.out.println("Lưu đường dẫn vào CSDL thành công");
//        return "redirect:/userinfo/" + nguoiDung.getMaNguoiDung().toString();
//    }

    @PostMapping("/userinfo/update-avatar")
    public RedirectView updateAvatar(@RequestParam("file") MultipartFile file, HttpSession session) {
        Integer maNguoiDung = ((NguoiDung) session.getAttribute("loggedInUser")).getMaNguoiDung();
        NguoiDung nguoiDung = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
        String filePath = storageService.store(file); // Lấy đường dẫn của tệp đã được lưu
        String prefixedFilePath = "/upload/images/" + filePath;
        nguoiDung.setAnh(prefixedFilePath);
        nguoiDungRepository.save(nguoiDung);
        System.out.println("Đường dẫn của tệp đã được lưu: " + prefixedFilePath);
        System.out.println("Lưu đường dẫn vào CSDL thành công");
        return new RedirectView("/userinfo/" + maNguoiDung.toString());
    }



}
