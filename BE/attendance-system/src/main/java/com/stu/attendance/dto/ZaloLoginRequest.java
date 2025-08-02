package com.stu.attendance.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ZaloLoginRequest {

    @NotBlank(message = "Zalo ID không được để trống")
    private String zaloId;

    @NotBlank(message = "Zalo access token không được để trống")
    private String zaloAccessToken;
} 