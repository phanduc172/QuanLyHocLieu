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

    public boolean checkLoginAdmin(HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return false;
        }
        return true;
    }

}
