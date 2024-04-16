package com.phanduc.QLHocLieu.models;

import javax.servlet.http.HttpSession;

public class CheckLogin {
    public static boolean isLoggedIn(HttpSession session) {
        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        return loggedInUser != null;
    }

    public static String redirectToHomePage() {
        return "redirect:/trangchu";
    }
}
