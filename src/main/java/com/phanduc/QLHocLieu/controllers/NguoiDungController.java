package com.phanduc.QLHocLieu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "info")
public class NguoiDungController {
    //http://localhost:8080/info/user
    @GetMapping("/user")
    public String infoUser() {
        return "UserInfo";
    }
}
