package com.phanduc.QLHocLieu.models;

import javax.persistence.*;

import java.util.Date;
@Entity
@Table(name = "tailieu")
public class TaiLieu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maTaiLieu;
    private String tieuDe;
    private String moTa;
    private String duongDanTep;
    private String anhTaiLieu;
    private Integer taiLenBoi;
    private Date ngayTaiLen;
    @Column(name = "SLTaiXuong")
    private int soLuotTaiXuong;
    private Integer maDanhMuc;
    private String maChuyenNganh;
    @Column(name = "SoLuotTruyCap", columnDefinition = "int default 0")
    private Integer soLuotTruyCap;
    @Column(name = "maTrangThai", columnDefinition = "int default 2")
    private Integer maTrangThai;


    public TaiLieu() {
    }

    public TaiLieu(Integer maTaiLieu, String tieuDe, String moTa, String duongDanTep, String anhTaiLieu, Integer taiLenBoi, Date ngayTaiLen, int soLuotTaiXuong, Integer maDanhMuc, String maChuyenNganh, Integer soLuotTruyCap, Integer maTrangThai) {
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
        this.soLuotTruyCap = soLuotTruyCap;
        this.maTrangThai = maTrangThai;
    }

    public Integer getMaTaiLieu() {
        return maTaiLieu;
    }

    public void setMaTaiLieu(Integer maTaiLieu) {
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

    public Integer getTaiLenBoi() {
        return taiLenBoi;
    }

    public void setTaiLenBoi(Integer taiLenBoi) {
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

    public Integer getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(Integer maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public String getMaChuyenNganh() {
        return maChuyenNganh;
    }

    public void setMaChuyenNganh(String maChuyenNganh) {
        this.maChuyenNganh = maChuyenNganh;
    }

    public Integer getSoLuotTruyCap() {
        return soLuotTruyCap;
    }

    public void setSoLuotTruyCap(Integer soLuotTruyCap) {
        this.soLuotTruyCap = soLuotTruyCap;
    }

    public Integer getMaTrangThai() {
        return maTrangThai;
    }

    public void setMaTrangThai(Integer maTrangThai) {
        this.maTrangThai = maTrangThai;
    }
}

