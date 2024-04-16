package com.phanduc.QLHocLieu.models;

import javax.persistence.*;

import java.util.Date;

@Entity
@Table(name = "binhluan")
public class BinhLuan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maBinhLuan;
    private String maTaiLieu;
    private int maNguoiDung;
    private Date ngayBinhLuan;
    private String noiDung;

    public BinhLuan() {
    }

    public BinhLuan(Integer maBinhLuan, String maTaiLieu, Integer maNguoiDung, Date ngayBinhLuan, String noiDung) {
        this.maBinhLuan = maBinhLuan;
        this.maTaiLieu = maTaiLieu;
        this.maNguoiDung = maNguoiDung;
        this.ngayBinhLuan = ngayBinhLuan;
        this.noiDung = noiDung;
    }

    public Integer getMaBinhLuan() {
        return maBinhLuan;
    }

    public void setMaBinhLuan(Integer maBinhLuan) {
        this.maBinhLuan = maBinhLuan;
    }

    public String getMaTaiLieu() {
        return maTaiLieu;
    }

    public void setMaTaiLieu(String maTaiLieu) {
        this.maTaiLieu = maTaiLieu;
    }

    public Integer getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(Integer maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public Date getNgayBinhLuan() {
        return ngayBinhLuan;
    }

    public void setNgayBinhLuan(Date ngayBinhLuan) {
        this.ngayBinhLuan = ngayBinhLuan;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }
}
