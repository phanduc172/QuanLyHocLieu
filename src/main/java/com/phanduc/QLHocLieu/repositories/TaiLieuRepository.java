package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.models.TaiLieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface TaiLieuRepository extends JpaRepository<TaiLieu,String> {
    List<TaiLieu> findByMaDanhMuc(Integer maDanhMuc);
    List<TaiLieu> findByTaiLenBoi(Integer taiLenBoi);
    Optional<TaiLieu> findByMaTaiLieu(Integer maTaiLieu);
    List<TaiLieu> findByTieuDeContaining(String keyword);
    @Query("SELECT nd.anh FROM NguoiDung nd WHERE nd.maNguoiDung = :maNguoiDung")
    String findAnhByMaNguoiDung(@Param("maNguoiDung") Integer maNguoiDung);
    @Query("SELECT nd.hoTen FROM NguoiDung nd WHERE nd.maNguoiDung = :maNguoiDung")
    String findHoTenByMaNguoiDung(@Param("maNguoiDung") Integer maNguoiDung);
}
