package com.phanduc.QLHocLieu.dto;

import java.util.Date;

public class DailyUploadStatsDto {
    private Date ngay;
    private Long soLuongTaiLieu;

    public DailyUploadStatsDto(Date ngay, Long soLuongTaiLieu) {
        this.ngay = ngay;
        this.soLuongTaiLieu = soLuongTaiLieu;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }

    public Long getSoLuongTaiLieu() {
        return soLuongTaiLieu;
    }

    public void setSoLuongTaiLieu(Long soLuongTaiLieu) {
        this.soLuongTaiLieu = soLuongTaiLieu;
    }
}
