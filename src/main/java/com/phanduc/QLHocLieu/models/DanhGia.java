package com.phanduc.QLHocLieu.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "danhgia")
public class DanhGia {
    @Id
    private String maDanhGia;
    private String maTaiLieu;
    private String maNguoiDung;
    private int giaTriDanhGia;

    public DanhGia() {
    }

    public DanhGia(String maDanhGia, String maTaiLieu, String maNguoiDung, int giaTriDanhGia) {
        this.maDanhGia = maDanhGia;
        this.maTaiLieu = maTaiLieu;
        this.maNguoiDung = maNguoiDung;
        this.giaTriDanhGia = giaTriDanhGia;
    }

    public String getMaDanhGia() {
        return maDanhGia;
    }

    public void setMaDanhGia(String maDanhGia) {
        this.maDanhGia = maDanhGia;
    }

    public String getMaTaiLieu() {
        return maTaiLieu;
    }

    public void setMaTaiLieu(String maTaiLieu) {
        this.maTaiLieu = maTaiLieu;
    }

    public String getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(String maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public int getGiaTriDanhGia() {
        return giaTriDanhGia;
    }

    public void setGiaTriDanhGia(int giaTriDanhGia) {
        this.giaTriDanhGia = giaTriDanhGia;
    }
}
