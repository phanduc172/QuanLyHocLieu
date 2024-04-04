package com.phanduc.QLHocLieu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "user")
public class NguoiDungController {
    //http://localhost:8080/user/info
    @GetMapping("/info")
    public String infoUser() {
        return "UserInfo";
    }
}
