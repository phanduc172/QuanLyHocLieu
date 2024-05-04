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
}
