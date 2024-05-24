package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.models.HoatDongGanDay;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoatDongGanDayRepository extends JpaRepository<HoatDongGanDay, Integer> {
    List<HoatDongGanDay> findAll(Sort sort);

    @Query(value = "SELECT DATE(Ngay) AS Ngay, LoaiHoatDong, COUNT(*) AS TongSoLuong " +
            "FROM hoatdongganday " +
            "WHERE MONTH(Ngay) = MONTH(CURRENT_DATE()) AND YEAR(Ngay) = YEAR(CURRENT_DATE()) " +
            "GROUP BY DATE(Ngay), LoaiHoatDong " +
            "ORDER BY DATE(Ngay) ASC; ", nativeQuery = true)
    List<Object[]> statisticActivityCurrent();
}
