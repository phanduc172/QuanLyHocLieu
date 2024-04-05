package com.phanduc.QLHocLieu.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "nguoidung")
public class NguoiDung {
    @Id
    private String maNguoiDung;
    @Column(name = "TenNguoiDung")
    private String tenNguoiDung;
    @Column(name = "MatKhau")
    private String matKhau;
    private String hoTen;
    private String anh;
    private String email;
    private String maVaiTro;

    public NguoiDung() {
    }

    public NguoiDung(String maNguoiDung, String tenNguoiDung, String matKhau, String hoTen, String anh, String email, String maVaiTro) {
        this.maNguoiDung = maNguoiDung;
        this.tenNguoiDung = tenNguoiDung;
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.anh = anh;
        this.email = email;
        this.maVaiTro = maVaiTro;
    }

    public String getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(String maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public String getTenNguoiDung() {
        return tenNguoiDung;
    }

    public void setTenNguoiDung(String tenNguoiDung) {
        this.tenNguoiDung = tenNguoiDung;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMaVaiTro() {
        return maVaiTro;
    }

    public void setMaVaiTro(String maVaiTro) {
        this.maVaiTro = maVaiTro;
    }
}
