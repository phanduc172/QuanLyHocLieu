//package com.phanduc.QLHocLieu.controllers;
//
//import com.phanduc.QLHocLieu.services.StorageService;
//import org.springframework.core.io.Resource;
//import org.springframework.stereotype.Service;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.util.stream.Stream;
//
//@Service("uploadFileService")
//public class UploadFileController implements StorageService {
//    private final Path locationDocument = Paths.get("src/main/upload/documents");
//
//    @Override
//    public void init() {
//        try {
//            Files.createDirectories(locationDocument);
//        } catch (IOException e) {
//            throw new RuntimeException("Không thể khởi tạo thư mục lưu trữ", e);
//        }
//    }
//
//    @Override
//    public String store(MultipartFile file) {
//        try {
//            if (file.isEmpty()) {
//                throw new IllegalArgumentException("Không thể lưu trữ tệp trống");
//            }
//            String fileName = generateFileName(file);
//            Files.copy(file.getInputStream(), this.locationDocument.resolve(fileName));
//            return fileName;
//        } catch (IOException e) {
//            throw new RuntimeException("Lỗi khi lưu trữ tệp", e);
//        }
//    }
//
//    @Override
//    public Stream<Path> loadAll() {
//        return null;
//    }
//
//    @Override
//    public Path load(String filename) {
//        return locationDocument.resolve(filename);
//    }
//
//    @Override
//    public Resource loadAsResource(String filename) {
//        return null;
//    }
//
//    @Override
//    public void deleteAll() {
//
//    }
//
//    private String generateFileName(MultipartFile file) {
//        return file.getOriginalFilename();
//    }
//
//}
