package com.phanduc.QLHocLieu.models;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "hoatdongganday")
public class HoatDongGanDay {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer maHoatDong;
    private Integer maNguoiDung;
    private String loaiHoatDong;
    private String moTaHoatDong;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ngay", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private Date ngay;

    public HoatDongGanDay() {
    }

    public HoatDongGanDay(Integer maHoatDong, Integer maNguoiDung, String loaiHoatDong, String moTaHoatDong) {
        this.maHoatDong = maHoatDong;
        this.maNguoiDung = maNguoiDung;
        this.loaiHoatDong = loaiHoatDong;
        this.moTaHoatDong = moTaHoatDong;
    }

    public Integer getMaHoatDong() {
        return maHoatDong;
    }

    public void setMaHoatDong(Integer maHoatDong) {
        this.maHoatDong = maHoatDong;
    }

    public Integer getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(Integer maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public String getLoaiHoatDong() {
        return loaiHoatDong;
    }

    public void setLoaiHoatDong(String loaiHoatDong) {
        this.loaiHoatDong = loaiHoatDong;
    }

    public String getMoTaHoatDong() {
        return moTaHoatDong;
    }

    public void setMoTaHoatDong(String moTaHoatDong) {
        this.moTaHoatDong = moTaHoatDong;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }
}
