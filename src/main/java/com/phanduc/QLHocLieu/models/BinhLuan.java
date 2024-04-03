package com.phanduc.QLHocLieu.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "binhluan")
public class BinhLuan {
    @Id
    private String maBinhLuan;
    private String maTaiLieu;
    private String maNguoiDung;
    private Date ngayBinhLuan;
    private String noiDung;

    public BinhLuan() {
    }

    public BinhLuan(String maBinhLuan, String maTaiLieu, String maNguoiDung, Date ngayBinhLuan, String noiDung) {
        this.maBinhLuan = maBinhLuan;
        this.maTaiLieu = maTaiLieu;
        this.maNguoiDung = maNguoiDung;
        this.ngayBinhLuan = ngayBinhLuan;
        this.noiDung = noiDung;
    }

    public String getMaBinhLuan() {
        return maBinhLuan;
    }

    public void setMaBinhLuan(String maBinhLuan) {
        this.maBinhLuan = maBinhLuan;
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
