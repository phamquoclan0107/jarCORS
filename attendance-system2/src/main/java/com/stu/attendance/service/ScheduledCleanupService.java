package com.stu.attendance.service;

import com.stu.attendance.entity.BuoiHoc;
import com.stu.attendance.repository.SessionRepository;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.logging.Logger;

@Service
public class ScheduledCleanupService {
    private final SessionRepository sessionRepository;
    private static final Logger logger = Logger.getLogger(ScheduledCleanupService.class.getName());

    public ScheduledCleanupService(SessionRepository sessionRepository) {
        this.sessionRepository = sessionRepository;
    }

    // Chạy vào 2h sáng ngày 6 tháng 6 hàng năm
    @Scheduled(cron = "0 0 2 6 6 *")
    @Transactional
    public void deleteAllSessionsOnJune6th() {
        System.out.println("[DEBUG] Đã vào hàm deleteAllSessionsOnJune6th()");
        logger.info("Đã tự động xóa toàn bộ ");
        List<BuoiHoc> allSessions = sessionRepository.findAll();
        int count = allSessions.size();
        sessionRepository.deleteAll(allSessions);
        logger.info("Đã tự động xóa toàn bộ " + count + " buổi học vào ngày 6/6.");
    }
} 