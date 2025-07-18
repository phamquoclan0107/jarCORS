package com.stu.attendance.service;


import com.stu.attendance.repository.AttendanceRepository;
import com.stu.attendance.repository.TeacherRepository;
import com.stu.attendance.repository.UserRepository;
import com.stu.attendance.security.JwtTokenProvider;

import com.stu.attendance.util.QrCodeGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import com.stu.attendance.dto.NopDiemDanhDTO;
import com.stu.attendance.entity.NopDiemDanh;
import com.stu.attendance.entity.NguoiDung;
import com.stu.attendance.repository.NopDiemDanhRepository;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

import java.util.*;
import java.util.stream.Collectors;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.util.UUID;
import java.util.Date;

@Service
@RequiredArgsConstructor
public class TeacherService {

    private final TeacherRepository teacherRepository;
    private final QrCodeGenerator qrCodeGenerator;
    private final JwtTokenProvider jwtUtils;
    private final AttendanceRepository attendanceRepository;
    private final NopDiemDanhRepository nopDiemDanhRepository;
    private final UserRepository nguoiDungRepository;

    private final String UPLOAD_DIR = "uploads/nopdiemdanh/";


    public NopDiemDanhDTO uploadNopDiemDanh(String maNguoiDung, MultipartFile file) throws IOException {
        NguoiDung nguoiDung = nguoiDungRepository.findById(maNguoiDung).orElseThrow(() -> new RuntimeException("Không tìm thấy người dùng"));

        // Tạo thư mục upload cho người dùng
        Path uploadPath = createUploadDirectory(maNguoiDung);

        // Tạo tên file unique
        String originalFileName = file.getOriginalFilename();
        String extension = getFileExtension(originalFileName);
        String fileName = maNguoiDung + "_" + UUID.randomUUID().toString() + "." + extension;

        // Lưu file
        Path filePath = uploadPath.resolve(fileName);
        Files.copy(file.getInputStream(), filePath);

        // Tạo entity
        NopDiemDanh entity = new NopDiemDanh();
        entity.setNguoiDung(nguoiDung);
        entity.setTenFile(originalFileName);
        entity.setDuongDanFile(maNguoiDung + "/" + fileName); // lưu đường dẫn tương đối
        entity.setKichThuoc(file.getSize());
        entity.setLoaiFile(file.getContentType());
        entity.setNgayNop(new Date());
        entity = nopDiemDanhRepository.save(entity);

        // Trả về DTO
        return new NopDiemDanhDTO(
                entity.getMaNopDiemDanh(),
                nguoiDung.getMaNguoiDung(),
                entity.getTenFile(),
                entity.getDuongDanFile(),
                entity.getKichThuoc(),
                entity.getLoaiFile(),
                entity.getNgayNop()
        );
    }

    // Helper method để tạo thư mục upload
    private Path createUploadDirectory(String maNguoiDung) throws IOException {
        // Đảm bảo thư mục uploads tồn tại
        Path uploadsRoot = Paths.get("uploads");
        if (!Files.exists(uploadsRoot)) {
            Files.createDirectories(uploadsRoot);
        }

        // Đảm bảo thư mục uploads/nopdiemdanh tồn tại
        Path nopDiemDanhRoot = Paths.get(UPLOAD_DIR);
        if (!Files.exists(nopDiemDanhRoot)) {
            Files.createDirectories(nopDiemDanhRoot);
        }

        // Tạo thư mục cho từng người dùng nếu chưa có
        Path uploadPath = Paths.get(UPLOAD_DIR + maNguoiDung);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        return uploadPath;
    }

    // Helper method để lấy file extension
    private String getFileExtension(String fileName) {
        if (fileName != null && fileName.lastIndexOf(".") != -1) {
            return fileName.substring(fileName.lastIndexOf(".") + 1);
        }
        return "";
    }


    public List<NopDiemDanhDTO> getNopDiemDanhByNguoiDung(String maNguoiDung) {
        List<NopDiemDanh> list = nopDiemDanhRepository.findAll().stream()
                .filter(n -> n.getNguoiDung().getMaNguoiDung().equals(maNguoiDung))
                .collect(Collectors.toList());
        return list.stream().map(entity -> new NopDiemDanhDTO(
                entity.getMaNopDiemDanh(),
                entity.getNguoiDung().getMaNguoiDung(),
                entity.getTenFile(),
                entity.getDuongDanFile(),
                entity.getKichThuoc(),
                entity.getLoaiFile(),
                entity.getNgayNop()
        )).collect(Collectors.toList());
    }

    public void deleteNopDiemDanh(Integer maNopDiemDanh) {
        NopDiemDanh entity = nopDiemDanhRepository.findById(maNopDiemDanh)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy bản ghi nộp điểm danh"));
        // Xóa file vật lý nếu cần
        String filePath = entity.getDuongDanFile();
        if (filePath != null) {
            java.nio.file.Path path = java.nio.file.Paths.get(UPLOAD_DIR + filePath);
            try {
                if (java.nio.file.Files.exists(path)) {
                    java.nio.file.Files.delete(path);
                }
            } catch (IOException e) {
                // log lỗi nhưng không throw để không rollback DB
                System.err.println("[WARNING] Lỗi khi xóa file: " + e.getMessage());
            }
        }
        nopDiemDanhRepository.deleteById(maNopDiemDanh);
    }

    /**
     * Get students in a specific class
     */
    public List<Map<String, Object>> getStudentsByClass(String classId) {
        List<NguoiDung> students = teacherRepository.findStudentsByClass(classId);

        return students.stream().map(student -> {
            Map<String, Object> studentInfo = new HashMap<>();
            studentInfo.put("studentId", student.getMaNguoiDung());
            studentInfo.put("fullName", student.getTenNguoiDung());
            studentInfo.put("email", student.getEmail());
            studentInfo.put("phone", student.getSdt());
            return studentInfo;
        }).collect(Collectors.toList());
    }

    /**
     * Process attendance for a single student
     */

    /**
     * Helper method to map BuoiHoc entity to SessionDto
     */


    /**
     * Helper method to map DiemDanh entity to AttendanceResponse
     */

    private String getCurrentTeacherId() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        // In a real implementation, this would query a repository to get the teacher ID from username
        // For simplicity, we're assuming the username is the teacher ID
        return username;
    }
}