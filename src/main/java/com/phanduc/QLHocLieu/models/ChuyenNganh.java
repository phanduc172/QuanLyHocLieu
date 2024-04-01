package com.phanduc.QLHocLieu.models;

import jakarta.persistence.*;

@Entity
@Table(name = "chuyennganh")
public class ChuyenNganh {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String maChuyenNganh;
    private String tenChuyenNganh;
    private String maKhoa;

    public ChuyenNganh() {
    }

    public ChuyenNganh(String maChuyenNganh, String tenChuyenNganh, String maKhoa) {
        this.maChuyenNganh = maChuyenNganh;
        this.tenChuyenNganh = tenChuyenNganh;
        this.maKhoa = maKhoa;
    }

    public String getMaChuyenNganh() {
        return maChuyenNganh;
    }

    public void setMaChuyenNganh(String maChuyenNganh) {
        this.maChuyenNganh = maChuyenNganh;
    }

    public String getTenChuyenNganh() {
        return tenChuyenNganh;
    }

    public void setTenChuyenNganh(String tenChuyenNganh) {
        this.tenChuyenNganh = tenChuyenNganh;
    }

    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }
}
