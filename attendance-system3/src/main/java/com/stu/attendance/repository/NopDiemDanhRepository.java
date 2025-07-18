package com.stu.attendance.repository;

import com.stu.attendance.entity.*;
import com.stu.attendance.entity.NguoiDung;
import com.stu.attendance.entity.BuoiHoc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

public interface NopDiemDanhRepository extends JpaRepository<NopDiemDanh, Integer> {
}

