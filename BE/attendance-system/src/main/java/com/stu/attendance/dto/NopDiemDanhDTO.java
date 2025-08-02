package com.stu.attendance.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NopDiemDanhDTO {
    private Integer maNopDiemDanh;
    private String maNguoiDung;
    private String tenFile;
    private String duongDanFile;
    private Long kichThuoc;
    private String loaiFile;
    private Date ngayNop;
}