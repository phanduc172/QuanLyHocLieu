package com.phanduc.QLHocLieu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DatabaseController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/api/v1/checkConnection")
    public String checkConnection() {
        try {
            jdbcTemplate.queryForObject("SELECT 1", Integer.class);
            return "Connection to MySQL database successful!";
        } catch (Exception e) {
            return "Failed to connect to MySQL database. Error: " + e.getMessage();
        }
    }
}
