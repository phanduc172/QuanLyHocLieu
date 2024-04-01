package com.phanduc.QLHocLieu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class QuanLyHocLieuApplication {

	public static void main(String[] args) {
		SpringApplication.run(QuanLyHocLieuApplication.class, args);
	}
	@GetMapping("/api/v1/hello")
	public String hello() {
		return "Hello, World!";
	}

}
