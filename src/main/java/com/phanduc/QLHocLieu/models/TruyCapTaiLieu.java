package com.phanduc.QLHocLieu.models;
import javax.persistence.*;

import java.util.Date;
@Entity
@Table(name = "truycaptailieu")
public class TruyCapTaiLieu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maTruyCapTaiLieu;
    private Integer maTaiLieu;
    private Integer maNguoiDung;
    private Date ngayTruyCap;
    private int soLanTruyCap;

    public TruyCapTaiLieu() {
    }

    public TruyCapTaiLieu(Integer maTruyCapTaiLieu, Integer maTaiLieu, Integer maNguoiDung, Date ngayTruyCap, int soLanTruyCap) {
        this.maTruyCapTaiLieu = maTruyCapTaiLieu;
        this.maTaiLieu = maTaiLieu;
        this.maNguoiDung = maNguoiDung;
        this.ngayTruyCap = ngayTruyCap;
        this.soLanTruyCap = soLanTruyCap;
    }

    public Integer getMaTruyCapTaiLieu() {
        return maTruyCapTaiLieu;
    }

    public void setMaTruyCapTaiLieu(Integer maTruyCapTaiLieu) {
        this.maTruyCapTaiLieu = maTruyCapTaiLieu;
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
