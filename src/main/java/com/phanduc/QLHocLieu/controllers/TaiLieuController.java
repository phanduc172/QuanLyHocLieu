package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.*;
import com.phanduc.QLHocLieu.services.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import java.sql.Timestamp;
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
        NguoiDung loggedInUser = (NguoiDung) session.getAttribute("loggedInUser");
        if(loggedInUser!=null) {
            String currentPasswordHidden = loggedInUser.getMatKhau();
            System.out.println(currentPasswordHidden);
            modelMap.addAttribute("currentPasswordHidden", loggedInUser.getMatKhau());
        }
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

        //Lấy ra danh sách tiêu đề tải lên bởi cùng người đăng tài liệu
        List<TaiLieu> taiLieusByUploader = taiLieuRepository.findByTaiLenBoi(taiLieu.getTaiLenBoi());
        List<String> danhSachTieuDe = taiLieusByUploader.stream()
                .map(TaiLieu::getTieuDe)
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
        model.addAttribute("danhSachTieuDe", danhSachTieuDe);

        for (String tieuDe : danhSachTieuDe) {
            System.out.println(tieuDe);
        }

        return "ChiTietTaiLieu";
    }

//    @PostMapping("/document/addcomment")
//    public String addDocument(@RequestParam("maTaiLieu") Integer maTaiLieu,
//                              @RequestParam("comment") String comment,
//                              HttpSession session) {
//        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
//        if (nguoiDung == null) {
//            return "redirect:/trangchu";
//        }
//        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
//        BinhLuan binhLuan = new BinhLuan();
//        binhLuan.setMaTaiLieu(maTaiLieu);
//        binhLuan.setMaNguoiDung(nguoiDung.getMaNguoiDung());
//        binhLuan.setNgayBinhLuan(currentTimestamp);
//        binhLuan.setNoiDung(comment);
//        binhLuanRepository.save(binhLuan);
//        System.out.println("Đánh giá tài liệu thành công");
//        return "redirect:/document/" + maTaiLieu;
//    }

    @PostMapping("/document/addcomment")
    public String addDocument(@RequestParam("maTaiLieu") Integer maTaiLieu,
                              @RequestParam("comment") String comment,
                              @RequestParam("rating") Integer rating,
                              HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        if (nguoiDung == null) {
            return "redirect:/trangchu";
        }
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        BinhLuan binhLuan = new BinhLuan();
        DanhGia danhGia = new DanhGia();
        binhLuan.setMaTaiLieu(maTaiLieu);
        binhLuan.setMaNguoiDung(nguoiDung.getMaNguoiDung());
        binhLuan.setNgayBinhLuan(currentTimestamp);
        binhLuan.setNoiDung(comment);
        danhGia.setMaTaiLieu(maTaiLieu);
        danhGia.setMaNguoiDung(nguoiDung.getMaNguoiDung());
        danhGia.setGiaTriDanhGia(rating);
        danhGiaRepository.save(danhGia); // Lưu đối tượng danhGia vào cơ sở dữ liệu
        binhLuanRepository.save(binhLuan);
        System.out.println("Đánh giá tài liệu thành công");
        return "redirect:/document/" + maTaiLieu;
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

    @PostMapping("/document/{maTaiLieu}/rate")
    public String rateDocument(@PathVariable("maTaiLieu") Integer maTaiLieu, @RequestParam("rating") int rating) {
        DanhGia danhGia = new DanhGia();
        danhGia.setMaTaiLieu(maTaiLieu);
        danhGia.setGiaTriDanhGia(rating);
        danhGiaRepository.save(danhGia);

        // Redirect hoặc trả về một trang cụ thể, ví dụ: trang chi tiết tài liệu
        return "redirect:/document/" + maTaiLieu;
    }

}

//        if (!CheckLogin.isLoggedIn(session)) {
//            modelMap.addAttribute("message", "Bạn cần đăng nhập để truy cập tính năng này.");
//            return "redirect:/trangchu";
//        }
