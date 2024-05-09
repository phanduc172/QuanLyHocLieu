package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.NguoiDung;
import com.phanduc.QLHocLieu.repositories.NguoiDungRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "/manager")
public class AdminNguoiDungController {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @GetMapping("/profile")
    public String getNguoiDung() {
        return "admin/AdminProfile";
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
