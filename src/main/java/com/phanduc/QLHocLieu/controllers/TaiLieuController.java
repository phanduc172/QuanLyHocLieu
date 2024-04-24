package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.*;
import com.phanduc.QLHocLieu.services.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping(path = "")
public class TaiLieuController {
    @Autowired
    DanhMucRepository danhMucRepository;
    @Autowired
    TaiLieuRepository taiLieuRepository;
    @Autowired
    NguoiDungRepository nguoiDungRepository;
    @Autowired
    KhoaRepository khoaRepository;
    @Autowired
    ChuyenNganhRepository chuyenNganhRepository;
    @Autowired
    BinhLuanRepository binhLuanRepository;
    @Autowired
    DanhGiaRepository danhGiaRepository;
    @Autowired
    @Qualifier("uploadFileService")
    private StorageService storageService;
    @GetMapping("/")
    public String home() {
        return "redirect:/trangchu";
    }

    @GetMapping("/trangchu")
    //http://localhost:8080/trangchu
    public String getAllTaiLieuAndDanhMuc(ModelMap modelMap, HttpSession session) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        List<TaiLieu> taiLieus = taiLieuRepository.findAll();
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        modelMap.addAttribute("danhMucs", danhMucs);
        modelMap.addAttribute("taiLieus", taiLieus);
        modelMap.addAttribute("nguoiDung", nguoiDung);
        return "TrangChu";
    }

    @GetMapping("/danhmuc/{maDanhMuc}")
    //http://localhost:8080/danhmuc/1
    public String getTaiLieuByMaDanhMuc(@PathVariable("maDanhMuc") int maDanhMuc, ModelMap modelMap, HttpSession session) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        List<TaiLieu> taiLieus = taiLieuRepository.findByMaDanhMuc(maDanhMuc);
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        modelMap.addAttribute("nguoiDung", nguoiDung);
        modelMap.addAttribute("danhMucs", danhMucs);
        if (taiLieus == null || taiLieus.isEmpty()) {
            System.out.println("Không tìm thấy tài liệu với mã danh mục: " + maDanhMuc);
            modelMap.addAttribute("message", "Không có tài liệu thuộc danh mục này");
            return "TrangChu";
        } else {
            modelMap.addAttribute("taiLieus", taiLieus);
            return "TrangChu";
        }
    }

//    @GetMapping("/document/{maTaiLieu}")
//    public String getDocumentById(@PathVariable("maTaiLieu") Integer maTaiLieu, Model model, HttpSession session) {
//        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
//        Optional<TaiLieu> optionalTaiLieu = taiLieuRepository.findByMaTaiLieu(maTaiLieu);
//
//        if (!optionalTaiLieu.isPresent()) {
//            return "redirect:/trangchu";
//        }
//
//        TaiLieu taiLieu = optionalTaiLieu.get();
//        String nguoiTaiLen = taiLieuRepository.findHoTenByMaNguoiDung(taiLieu.getTaiLenBoi());
//        String docImage = taiLieuRepository.findAnhByMaNguoiDung(taiLieu.getTaiLenBoi());
//        String urlDoc = taiLieu.getDuongDanTep();
//
//        //C1: Lấy thông tin người bình luận qua maNguoiDung
////        List<BinhLuan> binhLuans = binhLuanRepository.findByMaTaiLieu(maTaiLieu);
////        List<String> hoTenNguoiBinhLuans = new ArrayList<>();
////        List<String> anhNguoiBinhLuans = new ArrayList<>();
////
////        for (BinhLuan binhLuan : binhLuans) {
////            NguoiDung nguoiBinhLuan = nguoiDungRepository.getUserByMaNguoiDung(binhLuan.getMaNguoiDung());
////            hoTenNguoiBinhLuans.add(nguoiBinhLuan.getHoTen());
////            anhNguoiBinhLuans.add(nguoiBinhLuan.getAnh());
////        }
//
//        //C2: Lấy thông tin người bình luận qua maNguoiDung
//        List<BinhLuan> binhLuans = binhLuanRepository.findByMaTaiLieu(maTaiLieu);
//        List<String> hoTenNguoiBinhLuans = binhLuans.stream()
//                .map(binhLuan -> nguoiDungRepository.getUserByMaNguoiDung(binhLuan.getMaNguoiDung()).getHoTen())
//                .collect(Collectors.toList());
//        List<String> anhNguoiBinhLuans = binhLuans.stream()
//                .map(binhLuan -> nguoiDungRepository.getUserByMaNguoiDung(binhLuan.getMaNguoiDung()).getAnh())
//                .collect(Collectors.toList());
//
//        model.addAttribute("nguoiDung", nguoiDung);
//        model.addAttribute("nguoiTaiLen", nguoiTaiLen);
//        model.addAttribute("taiLieu", taiLieu);
//        model.addAttribute("docImage", docImage);
//        model.addAttribute("urlDoc", urlDoc);
//        model.addAttribute("binhLuans", binhLuans);
//        model.addAttribute("hoTenNguoiBinhLuans", hoTenNguoiBinhLuans);
//        model.addAttribute("anhNguoiBinhLuans", anhNguoiBinhLuans);
//
//        return "ChiTietTaiLieu";
//    }

    @GetMapping("/document/{maTaiLieu}")
    public String getDocumentById(@PathVariable("maTaiLieu") Integer maTaiLieu, Model model, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        Optional<TaiLieu> optionalTaiLieu = taiLieuRepository.findByMaTaiLieu(maTaiLieu);

        if (!optionalTaiLieu.isPresent()) {
            return "redirect:/trangchu";
        }

        TaiLieu taiLieu = optionalTaiLieu.get();
        String nguoiTaiLen = taiLieuRepository.findHoTenByMaNguoiDung(taiLieu.getTaiLenBoi());
        String docImage = taiLieuRepository.findAnhByMaNguoiDung(taiLieu.getTaiLenBoi());
        String urlDoc = taiLieu.getDuongDanTep();

        //C1: Lấy thông tin người bình luận qua maNguoiDung
//        List<BinhLuan> binhLuans = binhLuanRepository.findByMaTaiLieu(maTaiLieu);
//        List<String> hoTenNguoiBinhLuans = new ArrayList<>();
//        List<String> anhNguoiBinhLuans = new ArrayList<>();
//
//        for (BinhLuan binhLuan : binhLuans) {
//            NguoiDung nguoiBinhLuan = nguoiDungRepository.getUserByMaNguoiDung(binhLuan.getMaNguoiDung());
//            hoTenNguoiBinhLuans.add(nguoiBinhLuan.getHoTen());
//            anhNguoiBinhLuans.add(nguoiBinhLuan.getAnh());
//        }

        //C2: Lấy thông tin người bình luận qua maNguoiDung
        List<BinhLuan> binhLuans = binhLuanRepository.findByMaTaiLieu(maTaiLieu);
        List<String> hoTenNguoiBinhLuans = binhLuans.stream()
                .map(binhLuan -> nguoiDungRepository.getUserByMaNguoiDung(binhLuan.getMaNguoiDung()).getHoTen())
                .collect(Collectors.toList());
        List<String> anhNguoiBinhLuans = binhLuans.stream()
                .map(binhLuan -> nguoiDungRepository.getUserByMaNguoiDung(binhLuan.getMaNguoiDung()).getAnh())
                .collect(Collectors.toList());
        List<DanhGia> danhGias = danhGiaRepository.findByMaTaiLieu(maTaiLieu);
        List<Integer> giaTriDanhGias = danhGias.stream()
                .map(DanhGia::getGiaTriDanhGia)
                .collect(Collectors.toList());

        model.addAttribute("nguoiDung", nguoiDung);
        model.addAttribute("nguoiTaiLen", nguoiTaiLen);
        model.addAttribute("taiLieu", taiLieu);
        model.addAttribute("docImage", docImage);
        model.addAttribute("urlDoc", urlDoc);
        model.addAttribute("binhLuans", binhLuans);
        model.addAttribute("hoTenNguoiBinhLuans", hoTenNguoiBinhLuans);
        model.addAttribute("anhNguoiBinhLuans", anhNguoiBinhLuans);
        model.addAttribute("giaTriDanhGias", giaTriDanhGias);

        return "ChiTietTaiLieu";
    }


    @PostMapping("/search/{keyword}")
    public String timKiemTaiLieu(@RequestParam("keyword") String keyword, ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        modelMap.addAttribute("danhMucs", danhMucs);
        modelMap.addAttribute("nguoiDung", nguoiDung);
        keyword = keyword.trim().toLowerCase();
        List<TaiLieu> taiLieus = taiLieuRepository.findByTieuDeContaining(keyword);
        if (taiLieus == null || taiLieus.isEmpty()) {
            modelMap.addAttribute("message", "Không tìm thấy tài liệu");
            return "TrangChu";
        } else {
            modelMap.addAttribute("taiLieus", taiLieus);
            return "TrangChu";
        }

    }


    @GetMapping("/uploadfile")
    public String uploadDocument(ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        modelMap.addAttribute("nguoiDung", nguoiDung);

        List<Khoa> listKhoa = khoaRepository.findAll();
        modelMap.addAttribute("listKhoa", listKhoa);

        return "TaiLenTaiLieu";
    }

    @PostMapping("/uploadfile")
    public String handleFileUpload(@RequestParam("file") MultipartFile file,
                                   @RequestParam("title") String title,
                                   @RequestParam("description") String description,
                                   @RequestParam("faculty") String faculty,
                                   @RequestParam("major") String major,
                                   HttpSession session) {
        Integer maNguoiDung = ((NguoiDung) session.getAttribute("loggedInUser")).getMaNguoiDung();
        if (!file.isEmpty()) {
            try {
                String fileName = storageService.store(file);
                System.out.println("Tài liệu tải lên thành công");
                return "redirect:/userinfo/"+maNguoiDung;
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Tài liệu tải lên không thành công");
                return "redirect:/trangchu";
            }
        } else {
            System.out.println("Không có tài liệu được chọn");
            return "redirect:/uploadfile";
        }
    }


    //Lấy chuyên ngành để hiển thị khi mà người dùng tải lên tài liệu ở UploadFile
    @GetMapping("/getChuyenNganh")
    @ResponseBody
    public List<ChuyenNganh> getMajorsByFaculty(@RequestParam("faculty") Integer facultyCode) {
        List<ChuyenNganh> listMajors = chuyenNganhRepository.findKhoaByMaKhoa(facultyCode);
        return listMajors;
    }

//    @GetMapping("/binhluan/{id}")
//    public String getBinhLuan(@PathVariable("id") Integer maTaiLieu, ModelMap modelMap) {
//        List<BinhLuan> binhLuans = binhLuanRepository.findByMaTaiLieu(maTaiLieu);
//        List<NguoiDung> listBinhLuan = new ArrayList<>();
//
//        for (BinhLuan binhLuan : binhLuans) {
//            NguoiDung nguoiBinhLuan = nguoiDungRepository.getUserByMaNguoiDung(binhLuan.getMaNguoiDung());
//            listBinhLuan.add(nguoiBinhLuan);
//
//            // In ra console thông tin người bình luận và nội dung bình luận
//            System.out.println("Tên người bình luận: " + nguoiBinhLuan.getTenNguoiDung());
//            System.out.println("Nội dung bình luận: " + binhLuan.getNoiDung());
//        }
//
//        modelMap.addAttribute("binhLuans", binhLuans);
//        modelMap.addAttribute("nguoiBinhLuans", listBinhLuan);
//
//        return "ChiTietTaiLieu";
//    }

    @GetMapping("/danhgia/{maTaiLieu}")
    public ResponseEntity<?> getBinhLuan(@PathVariable("maTaiLieu") Integer maTaiLieu) {
        List<DanhGia> danhGias = danhGiaRepository.findByMaTaiLieu(maTaiLieu);
        List<NguoiDung> listDanhGia = new ArrayList<>();

        for (DanhGia danhGia : danhGias) {
            NguoiDung nguoiDanhGia = nguoiDungRepository.getUserByMaNguoiDung(danhGia.getMaNguoiDung());
            listDanhGia.add(nguoiDanhGia);
        }

        // Tạo một đối tượng Map chứa các danh sách binhLuans và nguoiBinhLuans
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("danhGias", danhGias);
        responseData.put("listDanhGia", listDanhGia);

        // Trả về ResponseEntity chứa đối tượng Map với định dạng JSON và status là OK
        return ResponseEntity.ok(responseData);
    }


}

//        if (!CheckLogin.isLoggedIn(session)) {
//            modelMap.addAttribute("message", "Bạn cần đăng nhập để truy cập tính năng này.");
//            return "redirect:/trangchu";
//        }
