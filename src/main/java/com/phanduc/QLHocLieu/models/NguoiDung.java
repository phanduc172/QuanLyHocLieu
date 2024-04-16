package com.phanduc.QLHocLieu.models;

import javax.persistence.*;

@Entity
@Table(name = "nguoidung")
public class NguoiDung {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maNguoiDung;
    @Column(name = "TenNguoiDung")
    private String tenNguoiDung;
    @Column(name = "MatKhau")
    private String matKhau;
    private String hoTen;
    private String anh;
    private String email;
    @Column(name = "maVaiTro", columnDefinition = "INT DEFAULT 2")
    private int maVaiTro;

    // Phương thức được gọi tự động trước khi lưu thực thể vào cơ sở dữ liệu
    @PrePersist
    public void prePersist() {
        if (maVaiTro == 0) {
            maVaiTro = 2;
        }
    }

    public NguoiDung() {
    }

    public NguoiDung(Integer maNguoiDung, String tenNguoiDung, String matKhau, String hoTen, String anh, String email, int maVaiTro) {
        this.maNguoiDung = maNguoiDung;
        this.tenNguoiDung = tenNguoiDung;
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.anh = anh;
        this.email = email;
        this.maVaiTro = maVaiTro;
    }

    public Integer getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(Integer maNguoiDung) {
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

    public int getMaVaiTro() {
        return maVaiTro;
    }

    public void setMaVaiTro(int maVaiTro) {
        this.maVaiTro = maVaiTro;
    }
}
