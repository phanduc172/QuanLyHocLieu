package com.phanduc.QLHocLieu.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import java.util.Date;
@Entity
@Table(name = "tailieu")
public class TaiLieu {
    @Id
    private String maTaiLieu;
    private String tieuDe;
    private String moTa;
    private String duongDanTep;
    private String anhTaiLieu;
    private String taiLenBoi;
    private Date ngayTaiLen;
    private int soLuotTaiXuong;
    private String maDanhMuc;
    private String maChuyenNganh;

    public TaiLieu() {
    }

    public TaiLieu(String maTaiLieu, String tieuDe, String moTa, String duongDanTep, String anhTaiLieu, String taiLenBoi, Date ngayTaiLen, int soLuotTaiXuong, String maDanhMuc, String maChuyenNganh) {
        this.maTaiLieu = maTaiLieu;
        this.tieuDe = tieuDe;
        this.moTa = moTa;
        this.duongDanTep = duongDanTep;
        this.anhTaiLieu = anhTaiLieu;
        this.taiLenBoi = taiLenBoi;
        this.ngayTaiLen = ngayTaiLen;
        this.soLuotTaiXuong = soLuotTaiXuong;
        this.maDanhMuc = maDanhMuc;
        this.maChuyenNganh = maChuyenNganh;
    }

    public String getMaTaiLieu() {
        return maTaiLieu;
    }

    public void setMaTaiLieu(String maTaiLieu) {
        this.maTaiLieu = maTaiLieu;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getDuongDanTep() {
        return duongDanTep;
    }

    public void setDuongDanTep(String duongDanTep) {
        this.duongDanTep = duongDanTep;
    }

    public String getAnhTaiLieu() {
        return anhTaiLieu;
    }

    public void setAnhTaiLieu(String anhTaiLieu) {
        this.anhTaiLieu = anhTaiLieu;
    }

    public String getTaiLenBoi() {
        return taiLenBoi;
    }

    public void setTaiLenBoi(String taiLenBoi) {
        this.taiLenBoi = taiLenBoi;
    }

    public Date getNgayTaiLen() {
        return ngayTaiLen;
    }

    public void setNgayTaiLen(Date ngayTaiLen) {
        this.ngayTaiLen = ngayTaiLen;
    }

    public int getSoLuotTaiXuong() {
        return soLuotTaiXuong;
    }

    public void setSoLuotTaiXuong(int soLuotTaiXuong) {
        this.soLuotTaiXuong = soLuotTaiXuong;
    }

    public String getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(String maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public String getMaChuyenNganh() {
        return maChuyenNganh;
    }

    public void setMaChuyenNganh(String maChuyenNganh) {
        this.maChuyenNganh = maChuyenNganh;
    }
}

