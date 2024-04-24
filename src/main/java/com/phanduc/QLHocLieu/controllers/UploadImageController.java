//package com.phanduc.QLHocLieu.controllers;
//
//import com.phanduc.QLHocLieu.services.StorageService;
//import org.springframework.context.annotation.Primary;
//import org.springframework.core.io.Resource;
//import org.springframework.stereotype.Service;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.util.UUID;
//import java.util.stream.Stream;
//
//@Service("uploadImageService")
//public class UploadImageController implements StorageService {
//    private final Path locationImage = Paths.get("src/main/upload/images");
//
//    @Override
//    public void init() {
//        try {
//            Files.createDirectories(locationImage);
//        } catch (IOException e) {
//            throw new RuntimeException("Không thể khởi tạo vị trí lưu trữ", e);
//        }
//    }
//
//    @Override
//    public String store(MultipartFile file) {
//        try {
//            if (file.isEmpty()) {
//                throw new RuntimeException("Không thể lưu trữ tập tin trống");
//            }
//            String fileName = generateFileName(file);
//            Files.copy(file.getInputStream(), this.locationImage.resolve(fileName));
//            return fileName; // Trả về đường dẫn của tệp đã được lưu
//        } catch (IOException e) {
//            throw new RuntimeException("Không thể lưu trữ tập tin", e);
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
//        return null;
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
//        return UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
//    }
//}
