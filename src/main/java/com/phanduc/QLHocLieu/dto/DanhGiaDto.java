package com.phanduc.QLHocLieu.dto;

public class DanhGiaDto {
    private Integer maTaiLieu;
    private String tieuDe;
    private Double avgGiaTriDanhGia;

    public DanhGiaDto(Integer maTaiLieu, String tieuDe, Double avgGiaTriDanhGia) {
        this.maTaiLieu = maTaiLieu;
        this.tieuDe = tieuDe;
        this.avgGiaTriDanhGia = avgGiaTriDanhGia;
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

    public Double getAvgGiaTriDanhGia() {
        return avgGiaTriDanhGia;
    }

    public void setAvgGiaTriDanhGia(Double avgGiaTriDanhGia) {
        this.avgGiaTriDanhGia = avgGiaTriDanhGia;
    }
}
