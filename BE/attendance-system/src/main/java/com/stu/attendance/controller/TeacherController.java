//package com.stu.attendance.controller;
//
//import com.stu.attendance.dto.*;
//import com.stu.attendance.entity.DiemDanh;
//import com.stu.attendance.service.DiemDanhService;
//import com.stu.attendance.service.NguoiThamGiaService;
//import com.stu.attendance.service.TeacherService;
//import jakarta.validation.Valid;
//import lombok.RequiredArgsConstructor;
//import org.springframework.format.annotation.DateTimeFormat;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.security.access.prepost.PreAuthorize;
//import org.springframework.web.bind.annotation.*;
//
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//import java.util.List;
//import java.util.Map;
//
//@RestController
//@RequestMapping("/api/teacher")
//@RequiredArgsConstructor
////@PreAuthorize("hasRole('TEACHER')")
//
//    private final TeacherService teacherService;
//    private final NguoiThamGiaService nguoiThamGiaService;
//    private final DiemDanhService diemDanhService;
//
//    @GetMapping("/classes/{classId}/students")
//    public ResponseEntity<List<Map<String, Object>>> getStudentsByClass(@PathVariable String classId) {
//        return ResponseEntity.ok(teacherService.getStudentsByClass(classId));
//    }
//
//    @PostMapping("/create-diemdanh")
//    public ResponseEntity<String> generateAttendanceCode(@RequestBody CreateDiemDanhRequest request){
//        return ResponseEntity.ok(diemDanhService.generateAttendanceCode(request));
//    }
//    @GetMapping("diem-danh-list")
//    public ResponseEntity<List<DiemDanh>> getListDiemDanh(@RequestParam Integer id){
//        return ResponseEntity.ok(diemDanhService.getDanhSach(id));
//    }
//    @GetMapping("/diemdanh-chitiet")
//    public ResponseEntity<List<SinhVienStatusDTO>> getAllStatus(@RequestParam Integer id){
//        return ResponseEntity.ok(diemDanhService.getAllStatus(id));
//    }
//    @PostMapping("/diemdanhsv")
//    public ResponseEntity<String> diemDanhThuCong(@RequestBody DiemDanhThuCongDTO request){
//        DiemDanhSinhVienRequest request1 = new DiemDanhSinhVienRequest();
//        request1.setCode(request.getCode());
//        request1.setTime(LocalDateTime.now());
//        request1.setStudentId(request.getUserId());
//        System.out.println(request.getUserId());
//        diemDanhService.diemDanh(request1);
//        return ResponseEntity.ok("Diem danh thanh cong");
//    }
//}
package com.stu.attendance.controller;

import com.stu.attendance.dto.*;
import com.stu.attendance.entity.DiemDanh;
import com.stu.attendance.service.DiemDanhService;
import com.stu.attendance.service.NguoiThamGiaService;
import com.stu.attendance.service.TeacherService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import com.stu.attendance.dto.NopDiemDanhDTO;
import org.springframework.web.multipart.MultipartFile;
import com.stu.attendance.service.NopBaiService;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;

@RestController
@RequestMapping("/api/teacher")
@RequiredArgsConstructor
//@PreAuthorize("hasRole('TEACHER')")
public class TeacherController {

    private final TeacherService teacherService;
    private final NguoiThamGiaService nguoiThamGiaService;
    private final DiemDanhService diemDanhService;
    private final NopBaiService nopBaiService;

    @GetMapping("/classes/{classId}/students")
    public ResponseEntity<List<Map<String, Object>>> getStudentsByClass(@PathVariable String classId) {
        return ResponseEntity.ok(teacherService.getStudentsByClass(classId));
    }

    @PostMapping("/create-diemdanh")
    public ResponseEntity<String> generateAttendanceCode(@RequestBody CreateDiemDanhRequest request){
        return ResponseEntity.ok(diemDanhService.generateAttendanceCode(request));
    }
    @GetMapping("diem-danh-list")
    public ResponseEntity<List<DiemDanh>> getListDiemDanh(@RequestParam Integer id){
        return ResponseEntity.ok(diemDanhService.getDanhSach(id));
    }
    @GetMapping("/diemdanh-chitiet")
    public ResponseEntity<List<SinhVienStatusDTO>> getAllStatus(@RequestParam Integer id){
        return ResponseEntity.ok(diemDanhService.getAllStatus(id));
    }
    @PostMapping("/diemdanhsv")
    public ResponseEntity<String> diemDanhThuCong(@RequestBody DiemDanhThuCongDTO request){
        DiemDanhSinhVienRequest request1 = new DiemDanhSinhVienRequest();
        request1.setCode(request.getCode());
        request1.setTime(LocalDateTime.now());
        request1.setStudentId(request.getUserId());
        System.out.println(request.getUserId());
        diemDanhService.diemDanh(request1);
        return ResponseEntity.ok("Diem danh thanh cong");
    }

////    @PostMapping(value = "/upload-nopdiemdanh", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
////    public ResponseEntity<NopDiemDanhDTO> uploadNopDiemDanh(
//            @RequestParam("maNguoiDung") String maNguoiDung,
//            @RequestParam("file") MultipartFile file) throws Exception {
//        NopDiemDanhDTO dto = teacherService.uploadNopDiemDanh(maNguoiDung, file);
//        return ResponseEntity.ok(dto);
//    }

    @GetMapping("/nopdiemdanh")
    public ResponseEntity<List<NopDiemDanhDTO>> getNopDiemDanhByNguoiDung(@RequestParam("maNguoiDung") String maNguoiDung) {
        List<NopDiemDanhDTO> list = teacherService.getNopDiemDanhByNguoiDung(maNguoiDung);
        return ResponseEntity.ok(list);
    }

    @DeleteMapping("/nopdiemdanh/{maNopDiemDanh}")
    public ResponseEntity<Void> deleteNopDiemDanh(@PathVariable Integer maNopDiemDanh) {
        teacherService.deleteNopDiemDanh(maNopDiemDanh);
        return ResponseEntity.noContent().build();
    }
    @PostMapping(value = "/upload-multiple-nopdiemdanh", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<List<NopDiemDanhDTO>> uploadMultipleNopDiemDanh(
            @RequestParam("maNguoiDung") String maNguoiDung,
            @RequestParam("files") MultipartFile[] files) throws Exception {

        // Validate input
        if (files == null || files.length == 0) {
            throw new IllegalArgumentException("Không có file nào được chọn");
        }

        // Giới hạn số lượng file (optional)
        if (files.length > 10) {
            throw new IllegalArgumentException("Không thể upload quá 10 file cùng lúc");
        }

        List<NopDiemDanhDTO> results = teacherService.uploadMultipleNopDiemDanh(maNguoiDung, files);
        return ResponseEntity.ok(results);
    }

    @GetMapping("/nopdiemdanh/giangvien-submitted")
    public ResponseEntity<List<NopDiemDanhDTO>> getAllTeacherNopDiemDanh() {
        List<NopDiemDanhDTO> list = teacherService.getAllTeacherNopDiemDanh();
        return ResponseEntity.ok(list);
    }

    @GetMapping("/nopdiemdanh/download/{maNguoiDung}/{fileName}")
    public ResponseEntity<Resource> downloadNopDiemDanhFile(
            @PathVariable String maNguoiDung,
            @PathVariable String fileName) {
        try {
            String uploadDir = "uploads/nopdiemdanh/";
            java.nio.file.Path filePath = java.nio.file.Paths.get(uploadDir + maNguoiDung + "/" + fileName);
            Resource resource = new UrlResource(filePath.toUri());

            if (resource.exists() && resource.isReadable()) {
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                        .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}