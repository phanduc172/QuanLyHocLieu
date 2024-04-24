package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.models.DanhGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
public interface DanhGiaRepository extends JpaRepository<DanhGia, Integer> {

}

