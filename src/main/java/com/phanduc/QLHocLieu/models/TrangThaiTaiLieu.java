package com.phanduc.QLHocLieu.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TrangThaiTaiLieu")
public class TrangThaiTaiLieu {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maTrangThai;
    private String moTaTrangThai;

    public TrangThaiTaiLieu() {}

    public Integer getMaTrangThai() {
        return maTrangThai;
    }

    public void setMaTrangThai(Integer maTrangThai) {
        this.maTrangThai = maTrangThai;
    }

    public String getMoTaTrangThai() {
        return moTaTrangThai;
    }

    public void setMoTaTrangThai(String moTaTrangThai) {
        this.moTaTrangThai = moTaTrangThai;
    }
}
