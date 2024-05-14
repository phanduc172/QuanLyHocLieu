package com.phanduc.QLHocLieu.dto;

import java.util.Date;

public class ActivityCurrentDto {
    private String ngay;
    private String loaiHoatDong;
    private Long soLuongHoatDong;


    public String getNgay() {
        return ngay;
    }

    public void setNgay(String ngay) {
        this.ngay = ngay;
    }

    public String getLoaiHoatDong() {
        return loaiHoatDong;
    }

    public void setLoaiHoatDong(String loaiHoatDong) {
        this.loaiHoatDong = loaiHoatDong;
    }

    public Long getSoLuongHoatDong() {
        return soLuongHoatDong;
    }

    public void setSoLuongHoatDong(Long soLuongHoatDong) {
        this.soLuongHoatDong = soLuongHoatDong;
    }

    public ActivityCurrentDto(String ngay, String loaiHoatDong, Long soLuongHoatDong) {
        this.ngay = ngay;
        this.loaiHoatDong = loaiHoatDong;
        this.soLuongHoatDong = soLuongHoatDong;
    }
}
