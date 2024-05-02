package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.models.ChuyenNganh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ChuyenNganhRepository extends JpaRepository<ChuyenNganh,String> {
    List<ChuyenNganh> findKhoaByMaKhoa(Integer maKhoa);

    @Query("SELECT c FROM ChuyenNganh c WHERE c.maChuyenNganh = :maChuyenNganh")
    ChuyenNganh findChuyenNganhByMaChuyenNganh(String maChuyenNganh);
}
