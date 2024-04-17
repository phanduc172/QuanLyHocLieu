package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.models.ChuyenNganh;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ChuyenNganhRepository extends JpaRepository<ChuyenNganh,String> {
    List<ChuyenNganh> findKhoaByMaKhoa(Integer maKhoa);
}
