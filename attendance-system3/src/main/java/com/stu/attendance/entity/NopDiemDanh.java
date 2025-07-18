package com.stu.attendance.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Table(name = "nop_diem_danh")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NopDiemDanh {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma_nop_diem_danh")
    private Integer maNopDiemDanh;

    @ManyToOne
    @JoinColumn(name = "ma_nguoi_dung", referencedColumnName = "ma_nguoi_dung", nullable = false)
    private NguoiDung nguoiDung;

    @Column(name = "ten_file", nullable = false)
    private String tenFile;

    @Column(name = "duong_dan_file", nullable = false)
    private String duongDanFile;

    @Column(name = "kich_thuoc")
    private Long kichThuoc;

    @Column(name = "loai_file")
    private String loaiFile;

    @Column(name = "ngay_nop", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayNop;
}