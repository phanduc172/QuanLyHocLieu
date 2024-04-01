package com.phanduc.QLHocLieu.models;
import jakarta.persistence.*;

import java.util.Date;
@Entity
@Table(name = "truycaptailieu")
public class TruyCapTaiLieu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String maTruyCapTaiLieu;
    private String maTaiLieu;
    private String maNguoiDung;
    private Date ngayTruyCap;
    private int soLanTruyCap;

    public TruyCapTaiLieu() {
    }

    public TruyCapTaiLieu(String maTruyCapTaiLieu, String maTaiLieu, String maNguoiDung, Date ngayTruyCap, int soLanTruyCap) {
        this.maTruyCapTaiLieu = maTruyCapTaiLieu;
        this.maTaiLieu = maTaiLieu;
        this.maNguoiDung = maNguoiDung;
        this.ngayTruyCap = ngayTruyCap;
        this.soLanTruyCap = soLanTruyCap;
    }

    public String getMaTruyCapTaiLieu() {
        return maTruyCapTaiLieu;
    }

    public void setMaTruyCapTaiLieu(String maTruyCapTaiLieu) {
        this.maTruyCapTaiLieu = maTruyCapTaiLieu;
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

    public Date getNgayTruyCap() {
        return ngayTruyCap;
    }

    public void setNgayTruyCap(Date ngayTruyCap) {
        this.ngayTruyCap = ngayTruyCap;
    }

    public int getSoLanTruyCap() {
        return soLanTruyCap;
    }

    public void setSoLanTruyCap(int soLanTruyCap) {
        this.soLanTruyCap = soLanTruyCap;
    }
}
