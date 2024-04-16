package com.phanduc.QLHocLieu.models;

import javax.persistence.*;

@Entity
@Table(name = "danhgia")
public class DanhGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maDanhGia;
    private int maTaiLieu;
    private int maNguoiDung;
    private int giaTriDanhGia;

    public DanhGia() {
    }

    public DanhGia(Integer maDanhGia, Integer maTaiLieu, Integer maNguoiDung, int giaTriDanhGia) {
        this.maDanhGia = maDanhGia;
        this.maTaiLieu = maTaiLieu;
        this.maNguoiDung = maNguoiDung;
        this.giaTriDanhGia = giaTriDanhGia;
    }

    public Integer getMaDanhGia() {
        return maDanhGia;
    }

    public void setMaDanhGia(Integer maDanhGia) {
        this.maDanhGia = maDanhGia;
    }

    public Integer getMaTaiLieu() {
        return maTaiLieu;
    }

    public void setMaTaiLieu(Integer maTaiLieu) {
        this.maTaiLieu = maTaiLieu;
    }

    public Integer getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(Integer maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public int getGiaTriDanhGia() {
        return giaTriDanhGia;
    }

    public void setGiaTriDanhGia(int giaTriDanhGia) {
        this.giaTriDanhGia = giaTriDanhGia;
    }
}
