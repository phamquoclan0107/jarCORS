package com.stu.attendance;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class AttendanceSystemForStuApplication {
	public static void main(String[] args) {
		SpringApplication.run(AttendanceSystemForStuApplication.class, args);
	}
}
