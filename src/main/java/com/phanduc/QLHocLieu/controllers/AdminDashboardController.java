package com.phanduc.QLHocLieu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/admin")
public class AdminDashboardController {
    @GetMapping("/dashboard")
    public String getDashboard() {
        return "admin/AdminTrangChu";
    }
}
