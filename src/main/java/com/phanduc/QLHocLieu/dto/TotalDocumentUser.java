package com.phanduc.QLHocLieu.dto;

public class TotalDocumentUser {
    private String hoTen;
    private String anh;
    private Long soLuongTaiLieu;

    public TotalDocumentUser() {
    }

    public TotalDocumentUser(String hoTen, String anh, Long soLuongTaiLieu) {
        this.hoTen = hoTen;
        this.anh = anh;
        this.soLuongTaiLieu = soLuongTaiLieu;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public Long getSoLuongTaiLieu() {
        return soLuongTaiLieu;
    }

    public void setSoLuongTaiLieu(Long soLuongTaiLieu) {
        this.soLuongTaiLieu = soLuongTaiLieu;
    }
}
