package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.models.BinhLuan;
import com.phanduc.QLHocLieu.models.DanhGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BinhLuanRepository extends JpaRepository<BinhLuan,Integer> {
    List<BinhLuan> findByMaTaiLieu(Integer maTaiLieu);
}
