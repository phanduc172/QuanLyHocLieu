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

    @Query(value = "SELECT Ngay, LoaiHoatDong, COUNT(LoaiHoatDong) AS SoLuong " +
            "FROM hoatdongganday " +
            "WHERE MONTH(ngay) = MONTH(CURRENT_DATE()) AND YEAR(ngay) = YEAR(CURRENT_DATE()) " +
            "GROUP BY Ngay, LoaiHoatDong ORDER BY Ngay ASC", nativeQuery = true)
    List<Object[]> statisticActivityCurrent();
}
