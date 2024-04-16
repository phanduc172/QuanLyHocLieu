package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.models.TaiLieu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TaiLieuRepository extends JpaRepository<TaiLieu,String> {
    List<TaiLieu> findByMaDanhMuc(Integer maDanhMuc);
    List<TaiLieu> findByTaiLenBoi(Integer taiLenBoi);
    Optional<TaiLieu> findByMaTaiLieu(Integer maTaiLieu);
    List<TaiLieu> findByTieuDeContaining(String keyword);
}
