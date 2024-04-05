package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.models.TaiLieu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaiLieuRepository extends JpaRepository<TaiLieu,String> {
    List<TaiLieu> findByMaDanhMuc(String maDanhMuc);
    List<TaiLieu> findByTaiLenBoi(String taiLenBoi);
}
