//package com.phanduc.QLHocLieu.controllers;
//
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import javax.servlet.http.HttpSession;
//
//@Controller
//public class OAuth2LoginController {
//
//    @GetMapping("/login/google")
//    public String googleLogin() {
//        return "redirect:/oauth2/authorization/google";
//    }
//
//    @GetMapping("/user")
//    @ResponseBody
//    public String getUserDetails(HttpSession session) {
//        // Lấy thông tin về người dùng từ SecurityContext
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        // Kiểm tra xem người dùng đã đăng nhập chưa
//        if (authentication != null && authentication.isAuthenticated()) {
//            // Lấy thông tin về người dùng từ Authentication
//            String username = authentication.getName();
//            // Lưu thông tin đăng nhập vào session
//            session.setAttribute("loggedInUser", username);
//            // In ra thông tin về người dùng
//            return "Logged in as: " + username;
//        } else {
//            return "User not logged in";
//        }
//    }
//}
