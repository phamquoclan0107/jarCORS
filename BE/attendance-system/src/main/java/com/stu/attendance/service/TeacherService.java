package com.stu.attendance.service;


import com.stu.attendance.dto.NopBaiDTO;
import com.stu.attendance.entity.NopBai;
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


////    public NopDiemDanhDTO uploadNopDiemDanh(String maNguoiDung, MultipartFile file) throws IOException {
//        NguoiDung nguoiDung = nguoiDungRepository.findById(maNguoiDung).orElseThrow(() -> new RuntimeException("Không tìm thấy người dùng"));
//
//        // Tạo thư mục upload cho người dùng
//        Path uploadPath = createUploadDirectory(maNguoiDung);
//
//        // Tạo tên file unique
//        String originalFileName = file.getOriginalFilename();
//        String extension = getFileExtension(originalFileName);
//        String fileName = maNguoiDung + "_" + UUID.randomUUID().toString() + "." + extension;
//
//        // Lưu file
//        Path filePath = uploadPath.resolve(fileName);
//        Files.copy(file.getInputStream(), filePath);
//
//        // Tạo entity
//        NopDiemDanh entity = new NopDiemDanh();
//        entity.setNguoiDung(nguoiDung);
//        entity.setTenFile(originalFileName);
//        entity.setDuongDanFile(maNguoiDung + "/" + fileName); // lưu đường dẫn tương đối
//        entity.setKichThuoc(file.getSize());
//        entity.setLoaiFile(file.getContentType());
//        entity.setNgayNop(new Date());
//        entity = nopDiemDanhRepository.save(entity);
//
//        // Trả về DTO
//        return new NopDiemDanhDTO(
//                entity.getMaNopDiemDanh(),
//                nguoiDung.getMaNguoiDung(),
//                entity.getTenFile(),
//                entity.getDuongDanFile(),
//                entity.getKichThuoc(),
//                entity.getLoaiFile(),
//                entity.getNgayNop()
//        );
//    }

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
    public List<NopDiemDanhDTO> uploadMultipleNopDiemDanh(String maNguoiDung, MultipartFile[] files) throws IOException {
        // Validate input
        if (files == null || files.length == 0) {
            throw new IllegalArgumentException("Không có file nào được chọn");
        }

        NguoiDung nguoiDung = nguoiDungRepository.findById(maNguoiDung)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy người dùng"));

        // Tạo thư mục upload cho người dùng (chỉ cần tạo 1 lần)
        Path uploadPath = createUploadDirectory(maNguoiDung);

        List<NopDiemDanhDTO> results = new ArrayList<>();
        List<NopDiemDanh> entitiesToSave = new ArrayList<>();

        // Process từng file
        for (MultipartFile file : files) {
            // Skip file rỗng
            if (file.isEmpty()) {
                continue;
            }

            // Validate file (optional)
            validateFile(file);

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
            entity.setDuongDanFile(maNguoiDung + "/" + fileName);
            entity.setKichThuoc(file.getSize());
            entity.setLoaiFile(file.getContentType());
            entity.setNgayNop(new Date());

            entitiesToSave.add(entity);
        }

        // Batch save tất cả entities
        List<NopDiemDanh> savedEntities = nopDiemDanhRepository.saveAll(entitiesToSave);

        // Convert to DTOs
        for (NopDiemDanh entity : savedEntities) {
            results.add(new NopDiemDanhDTO(
                    entity.getMaNopDiemDanh(),
                    nguoiDung.getMaNguoiDung(),
                    entity.getTenFile(),
                    entity.getDuongDanFile(),
                    entity.getKichThuoc(),
                    entity.getLoaiFile(),
                    entity.getNgayNop()
            ));
        }

        return results;
    }

    // Method để validate file (optional)
    private void validateFile(MultipartFile file) {
        // Kiểm tra kích thước file (ví dụ: max 10MB per file)
        long maxFileSize = 10 * 1024 * 1024; // 10MB
        if (file.getSize() > maxFileSize) {
            throw new IllegalArgumentException("File " + file.getOriginalFilename() + " quá lớn. Kích thước tối đa: 10MB");
        }

        // Kiểm tra loại file cho phép (optional)
        String contentType = file.getContentType();
        if (contentType != null) {
            List<String> allowedTypes = Arrays.asList(
                    "image/jpeg", "image/png", "image/gif",
                    "application/pdf", "application/msword",
                    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                    "application/vnd.ms-excel",
                    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            );

            if (!allowedTypes.contains(contentType)) {
                throw new IllegalArgumentException("Loại file " + file.getOriginalFilename() + " không được hỗ trợ");
            }
        }
    }
    // Lấy danh sách tất cả giảng viên đã nộp điểm danh
    public List<NopDiemDanhDTO> getAllTeacherNopDiemDanh() {
        List<NopDiemDanh> allSubmissions = nopDiemDanhRepository.findAll();
        return allSubmissions.stream()
                .filter(nop -> {
                    NguoiDung nguoiDung = nop.getNguoiDung();
                    return nguoiDung != null && nguoiDung.getTaiKhoan() != null &&
                            "teacher".equalsIgnoreCase(String.valueOf(nguoiDung.getTaiKhoan().getRole()));
                })
                .map(nop -> new NopDiemDanhDTO(
                        nop.getMaNopDiemDanh(),
                        nop.getNguoiDung().getMaNguoiDung(),
                        nop.getTenFile(),
                        nop.getDuongDanFile(),
                        nop.getKichThuoc(),
                        nop.getLoaiFile(),
                        nop.getNgayNop()
                ))
                .collect(Collectors.toList());
    }

}