package com.stu.attendance.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NguoiThamGiaDTO {
    private boolean success;
    private String message;
    private String userId;
    private String maThamGia;
}
