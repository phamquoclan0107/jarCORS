package com.stu.attendance.service;

import com.stu.attendance.entity.*;
import com.stu.attendance.repository.DiemDanhSinhVienRepository;
import com.stu.attendance.repository.NguoiThamGiaRepository;
import com.stu.attendance.repository.SessionRepository;
import com.stu.attendance.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class NguoiThamGiaService {
    private final NguoiThamGiaRepository nguoiThamGiaRepository;
    private final UserRepository userRepository;
    private final SessionRepository sessionRepository;
    private final DiemDanhSinhVienRepository diemDanhSinhVienRepository;

    @Transactional
    public Map<String, Object> addStudentWithResponse(String userId, String maThamGia){
        Map<String, Object> response = new HashMap<>();

        try {
            // Kiểm tra sinh viên có tồn tại không
            Optional<NguoiDung> nguoiDungOpt = userRepository.findByMaNguoiDung(userId);
            if (!nguoiDungOpt.isPresent()) {
                response.put("success", false);
                response.put("message", "Không tìm thấy sinh viên với mã: " + userId);
                response.put("userId", userId);
                response.put("maThamGia", maThamGia);
                return response;
            }

            // Kiểm tra buổi học có tồn tại không
            BuoiHoc buoiHoc = sessionRepository.findByMaThamGia(maThamGia);
            if (buoiHoc == null) {
                response.put("success", false);
                response.put("message", "Không tìm thấy buổi học với mã tham gia: " + maThamGia);
                response.put("userId", userId);
                response.put("maThamGia", maThamGia);
                return response;
            }

            NguoiDung nguoiDung = nguoiDungOpt.get();

            // Kiểm tra sinh viên đã tham gia buổi học này chưa (sử dụng exists thay vì Optional)
            boolean alreadyParticipated = nguoiThamGiaRepository
                    .existsByNguoiDung_MaNguoiDungAndBuoiHoc_MaBuoiHoc(userId, buoiHoc.getMaBuoiHoc());

            if (alreadyParticipated) {
                response.put("success", false);
                response.put("message", "Bạn đã tham gia lớp này rồi");
                response.put("userId", userId);
                response.put("maThamGia", maThamGia);
                response.put("sessionId", buoiHoc.getMaBuoiHoc());
                return response;
            }

            // Tạo bản ghi tham gia mới
            NguoiThamGia nguoiThamGia = new NguoiThamGia();
            nguoiThamGia.setNguoiDung(nguoiDung);
            nguoiThamGia.setBuoiHoc(buoiHoc);
            nguoiThamGiaRepository.save(nguoiThamGia);



            response.put("success", true);
            response.put("message", "Tham gia thành công");
            response.put("userId", userId);
            response.put("maThamGia", maThamGia);
            response.put("sessionId", buoiHoc.getMaBuoiHoc());
            response.put("studentName", nguoiDung.getTenNguoiDung());

        } catch (Exception e) {
            log.error("Lỗi khi thêm sinh viên vào buổi học: {}", e.getMessage(), e);
            response.put("success", false);
            response.put("message", "Đã xảy ra lỗi: " + e.getMessage());
            response.put("userId", userId);
            response.put("maThamGia", maThamGia);
        }

        return response;
    }
}
