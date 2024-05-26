package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.dto.DanhGiaDto;
import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.*;
import com.phanduc.QLHocLieu.services.StorageService;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;
import java.sql.Timestamp;
import java.util.List;
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
    HoatDongGanDayRepository hoatDongGanDayRepository;

    public TaiLieuController(NguoiDungRepository nguoiDungRepository, HoatDongGanDayRepository hoatDongGanDayRepository) {
        this.nguoiDungRepository = nguoiDungRepository;
        this.hoatDongGanDayRepository = hoatDongGanDayRepository;
    }
    @Autowired
    @Qualifier("uploadFileService")
    private StorageService storageService;
    private boolean checkMessageLogin = false;
    @GetMapping("/")
    public String home() {
        return "redirect:/trangchu";
    }

    @GetMapping("/introduction")
    public String introduction(ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        modelMap.addAttribute("nguoiDung", nguoiDung);
        addCommonAttributesIsEmpty(modelMap);
        return "GioiThieu";
    }

    @GetMapping("/contact")
    public String conTact(ModelMap modelMap,HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        modelMap.addAttribute("nguoiDung", nguoiDung);
        addCommonAttributesIsEmpty(modelMap);
        return "LienHe";
    }

    @GetMapping("/trangchu")
    public String getAll(@RequestParam(defaultValue = "0") int page, ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        if (checkMessageLogin) {
            modelMap.addAttribute("messageLogin", "Bạn cần đăng nhập để truy cập đầy đủ tính năng.");
            checkMessageLogin = false;
        }
        // Tạo đối tượng Pageable để yêu cầu trang hiện tại và kích thước trang
        Pageable pageable = PageRequest.of(page, 8);
        Page<TaiLieu> taiLieusPage = taiLieuRepository.findByMaTrangThai(1,pageable);

        List<TaiLieu> top10TaiLieus = taiLieuRepository.findTop10BySLTaiXuong();
        modelMap.addAttribute("top10TaiLieus", top10TaiLieus);
        List<DanhGiaDto> top10DanhGia = taiLieuRepository.findTop10DanhGia();
        modelMap.addAttribute("top10DanhGia", top10DanhGia);
        modelMap.addAttribute("titleHome","Danh sách tài liệu");
        modelMap.addAttribute("taiLieus", taiLieusPage.getContent());
        modelMap.addAttribute("nguoiDung", nguoiDung);
        modelMap.addAttribute("currentPage", page);
        modelMap.addAttribute("totalPages", taiLieusPage.getTotalPages());
        addCommonAttributes(modelMap);
        // Thêm mật khẩu hiện tại nếu người dùng đăng nhập
        if(nguoiDung != null) {
            modelMap.addAttribute("currentPasswordHidden", nguoiDung.getMatKhau());
        }

        return "TrangChu";
    }

    @GetMapping("/danhmuc/{maDanhMuc}")
    public String getTaiLieuByMaDanhMuc(@PathVariable("maDanhMuc") int maDanhMuc, @RequestParam(defaultValue = "0") int page, ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        List<TaiLieu> allTaiLieus = taiLieuRepository.findByMaDanhMuc(maDanhMuc);
        int pageSize = 8;
        int startIndex = page * pageSize;
        int endIndex = Math.min(startIndex + pageSize, allTaiLieus.size());
        List<TaiLieu> taiLieus = allTaiLieus.subList(startIndex, endIndex);
        modelMap.addAttribute("titleHome","Tài liệu Thể loại");
        // Kiểm tra nếu không có tài liệu nào thuộc danh mục
        if (allTaiLieus == null || allTaiLieus.isEmpty()) {
            System.out.println("Không tìm thấy tài liệu với mã danh mục: " + maDanhMuc);
            modelMap.addAttribute("message", "Không có tài liệu thuộc thể loại");
            // Truyền dữ liệu vào model và trả về trang chủ
            modelMap.addAttribute("nguoiDung", nguoiDung);
            addCommonAttributesIsEmpty(modelMap);
            return "TrangChu";
        }
        modelMap.addAttribute("nguoiDung", nguoiDung);
        modelMap.addAttribute("taiLieus", taiLieus);
        modelMap.addAttribute("currentPage", page);
        modelMap.addAttribute("totalPages", (int) Math.ceil((double) allTaiLieus.size() / pageSize));
        addCommonAttributes(modelMap);

        // Thêm mật khẩu hiện tại nếu người dùng đăng nhập
        if (nguoiDung != null) {
            modelMap.addAttribute("currentPasswordHidden", nguoiDung.getMatKhau());
        }
        return "TrangChu";
    }

        @GetMapping("/document/{maTaiLieu}")
        public String getDocumentById(@PathVariable("maTaiLieu") Integer maTaiLieu, ModelMap modelMap, HttpSession session) {
            NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
            if (!CheckLogin.isLoggedIn(session)) {
                checkMessageLogin = true;
                return "redirect:/trangchu";
            }
            Optional<TaiLieu> optionalTaiLieu = taiLieuRepository.findByMaTaiLieu(maTaiLieu);
            if (!optionalTaiLieu.isPresent()) {
                return "redirect:/trangchu";
            }
            TaiLieu taiLieu = optionalTaiLieu.get();
            String nguoiTaiLen = taiLieuRepository.findHoTenByMaNguoiDung(taiLieu.getTaiLenBoi());
            String docImage = taiLieuRepository.findAnhByMaNguoiDung(taiLieu.getTaiLenBoi());
            String urlDoc = taiLieu.getDuongDanTep();
            taiLieu.setSoLuotTruyCap(taiLieu.getSoLuotTruyCap() + 1);
            taiLieuRepository.save(taiLieu);
            //Lấy thông tin người bình luận qua maNguoiDung
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
    //        List<TaiLieu> taiLieusByUploader = taiLieuRepository.findByTaiLenBoi(taiLieu.getTaiLenBoi());
            List<TaiLieu> taiLieusByUploader = taiLieuRepository.findByMaTrangThaiAndTaiLenBoi(1, taiLieu.getTaiLenBoi());
            List<String> danhSachTieuDe = taiLieusByUploader.stream()
                    .map(TaiLieu::getTieuDe)
                    .collect(Collectors.toList());
            addCommonAttributes(modelMap);
            modelMap.addAttribute("nguoiDung", nguoiDung);
            modelMap.addAttribute("nguoiTaiLen", nguoiTaiLen);
            modelMap.addAttribute("taiLieu", taiLieu);
            modelMap.addAttribute("docImage", docImage);
            modelMap.addAttribute("urlDoc", urlDoc);
            modelMap.addAttribute("binhLuans", binhLuans);
            modelMap.addAttribute("hoTenNguoiBinhLuans", hoTenNguoiBinhLuans);
            modelMap.addAttribute("anhNguoiBinhLuans", anhNguoiBinhLuans);
            modelMap.addAttribute("giaTriDanhGias", giaTriDanhGias);
            modelMap.addAttribute("danhSachTieuDe", danhSachTieuDe);
            modelMap.addAttribute("taiLieusByUploader", taiLieusByUploader);
            for (String tieuDe : danhSachTieuDe) {
                System.out.println(tieuDe);
            }
            String filepath = "../QuanLyHocLieu/src/main/"+taiLieu.getDuongDanTep();

            return viewFile(filepath, modelMap);
        }

    @PostMapping("/document/download/{maTaiLieu}")
    public ResponseEntity<?> increaseDownloadCount(@PathVariable("maTaiLieu") Integer maTaiLieu) {
        Optional<TaiLieu> optionalTaiLieu = taiLieuRepository.findByMaTaiLieu(maTaiLieu);
        if (!optionalTaiLieu.isPresent()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy tài liệu");
        }
        TaiLieu taiLieu = optionalTaiLieu.get();
        taiLieu.setSoLuotTaiXuong(taiLieu.getSoLuotTaiXuong() + 1);
        taiLieuRepository.save(taiLieu);
        return ResponseEntity.ok("Đã tăng số lượt tải xuống");
    }

    @PostMapping("/search/{keyword}")
    public String timKiemTaiLieu(@RequestParam("keyword") String keyword, @RequestParam(defaultValue = "0") int page, ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        keyword = keyword.trim().toLowerCase();
        List<TaiLieu> taiLieus = taiLieuRepository.findByTieuDeContaining(keyword);
        int pageSize = 8;
        int startIndex = page * pageSize;
        int endIndex = Math.min(startIndex + pageSize, taiLieus.size());
        List<TaiLieu> taiLieusOnPage = taiLieus.subList(startIndex, endIndex);
        if (taiLieusOnPage.isEmpty()) {
            modelMap.addAttribute("message", "Không tìm thấy tài liệu với từ khóa: " + keyword);
        }
        modelMap.addAttribute("titleHome","Kết quả với từ khóa: " + keyword);
        modelMap.addAttribute("nguoiDung", nguoiDung);
        modelMap.addAttribute("taiLieus", taiLieusOnPage);
        modelMap.addAttribute("currentPage", page);
        modelMap.addAttribute("totalPages", (int) Math.ceil((double) taiLieus.size() / pageSize));
        addCommonAttributes(modelMap);
        return "TrangChu";
    }

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
        danhGiaRepository.save(danhGia);
        binhLuanRepository.save(binhLuan);
        System.out.println("Đánh giá và bình luận tài liệu thành công");
        return "redirect:/document/" + maTaiLieu;
    }

    @GetMapping("/getDetailDocument/{id}")
    @ResponseBody
    public Map<String, Object> showDocumentDetails(@PathVariable("id") Integer maTaiLieu) {
        Optional<TaiLieu> optionalTaiLieu = taiLieuRepository.findByMaTaiLieu(maTaiLieu);
        Map<String, Object> response = new HashMap<>();
        if (optionalTaiLieu.isPresent()) {
            TaiLieu deTailTaiLieu = optionalTaiLieu.get();
            String maChuyenNganh = deTailTaiLieu.getMaChuyenNganh();
            ChuyenNganh chuyenNganh = chuyenNganhRepository.findChuyenNganhByMaChuyenNganh(maChuyenNganh);
            Integer maKhoa = chuyenNganh.getMaKhoa();
            Khoa khoa = khoaRepository.getById(maKhoa);
            DanhMuc danhMuc = danhMucRepository.getById(deTailTaiLieu.getMaDanhMuc());
            response.put("deTailTaiLieu", deTailTaiLieu);
            response.put("tenDanhMuc", danhMuc.getTenDanhMuc());
            response.put("tenKhoa", khoa.getTenKhoa());
            response.put("tenChuyenNganh", chuyenNganh.getTenChuyenNganh());
            return response;
        } else {
            return null;
        }
    }

    //Thực hiện tải lên tài liệu
    @GetMapping("/uploadfile")
    public String uploadDocument(ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        modelMap.addAttribute("nguoiDung", nguoiDung);

        List<DanhMuc> listDanhMuc = danhMucRepository.findAll();
        modelMap.addAttribute("listDanhMuc", listDanhMuc);

        List<Khoa> listKhoa = khoaRepository.findAll();
        modelMap.addAttribute("listKhoa", listKhoa);
        addCommonAttributes(modelMap);

        return "TaiLenTaiLieu";
    }
    @PostMapping("/uploadfile")
    public String handleFileUpload(@RequestParam("file") MultipartFile file,
                                   @RequestParam("title") String title,
                                   @RequestParam("description") String description,
                                   @RequestParam("faculty") String faculty,
                                   @RequestParam("category") Integer category,
                                   @RequestParam("major") String major,
                                   HttpSession session, ModelMap modelMap) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        if (!CheckLogin.isLoggedIn(session)) {
            modelMap.addAttribute("messageLogin", "Bạn cần đăng nhập để truy cập tính năng này.");
            return "redirect:/trangchu";
        }
        if (!file.isEmpty()) {
            try {
                String fileName = storageService.store(file);
                Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
                String prefixedFilePath = "/upload/documents/" + fileName;

                BufferedImage firstPageImage;
                String originalFilename = file.getOriginalFilename().toLowerCase();
                if (originalFilename.endsWith(".pdf")) {
                    firstPageImage = extractFirstPageImageFromPDF(file);
                } else if (originalFilename.endsWith(".docx")) {
                    firstPageImage = extractFirstPageImageFromDOCX(file);
                } else if (originalFilename.endsWith(".doc")) {
                    firstPageImage = extractFirstPageImageFromDOC(file);
                } else {
                    throw new UnsupportedFileTypeException("Loại tệp không được hỗ trợ");
                }

                String thumbnailFilePath = saveThumbnailImage(firstPageImage);
                TaiLieu taiLieu = new TaiLieu();
                taiLieu.setTieuDe(title);
                taiLieu.setMoTa(description);
                taiLieu.setDuongDanTep(prefixedFilePath);
                taiLieu.setAnhTaiLieu(thumbnailFilePath);
                taiLieu.setTaiLenBoi(nguoiDung.getMaNguoiDung());
                taiLieu.setNgayTaiLen(currentTimestamp);
                taiLieu.setSoLuotTaiXuong(0);
                taiLieu.setMaDanhMuc(category);
                taiLieu.setMaChuyenNganh(major);
                taiLieu.setSoLuotTruyCap(0);
                taiLieu.setMaTrangThai(2);
                taiLieuRepository.save(taiLieu);
                HoatDongGanDay hoatDong = new HoatDongGanDay();
                hoatDong.setMaNguoiDung(nguoiDung.getMaNguoiDung());
                hoatDong.setLoaiHoatDong("Tải lên");
                hoatDong.setMoTaHoatDong("Tải lên tài liệu: " + taiLieu.getTieuDe());
                hoatDong.setNgay(new Date());
                hoatDongGanDayRepository.save(hoatDong);
                return "redirect:/userinfo/"+nguoiDung.getMaNguoiDung();
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Tài liệu tải lên không thành công");
                return "redirect:/uploadfile";
            }
        } else {
            System.out.println("Không có tài liệu được chọn");
            return "redirect:/uploadfile";
        }
    }

    public BufferedImage extractFirstPageImageFromPDF(MultipartFile file) throws IOException {
        try (PDDocument document = PDDocument.load(file.getInputStream())) {
            PDFRenderer renderer = new PDFRenderer(document);
            return renderer.renderImageWithDPI(0, 300, ImageType.RGB);
        }
    }

    public BufferedImage extractFirstPageImageFromDOCX(MultipartFile file) throws IOException {
        try (XWPFDocument document = new XWPFDocument(file.getInputStream())) {
            List<XWPFParagraph> paragraphs = document.getParagraphs();
            StringBuilder firstPageText = new StringBuilder();
            for (XWPFParagraph paragraph : paragraphs) {
                for (XWPFRun run : paragraph.getRuns()) {
                    firstPageText.append(run.toString());
                }
                firstPageText.append("\n");
            }
            return createImageFromText(firstPageText.toString());
        }
    }

    public BufferedImage extractFirstPageImageFromDOC(MultipartFile file) throws IOException {
        try (HWPFDocument document = new HWPFDocument(file.getInputStream())) {
            WordExtractor extractor = new WordExtractor(document);
            String firstPageText = extractor.getText().split("\f")[0];
            return createImageFromText(firstPageText);
        }
    }

    private BufferedImage createImageFromText(String text) {
        BufferedImage image = new BufferedImage(800, 600, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = image.createGraphics();
        g2d.setPaint(Color.WHITE);
        g2d.fillRect(0, 0, image.getWidth(), image.getHeight());
        g2d.setPaint(Color.BLACK);
        g2d.setFont(new Font("Serif", Font.PLAIN, 24));
        g2d.drawString(text, 10, 50);
        g2d.dispose();
        return image;
    }

    public String saveThumbnailImage(BufferedImage image) throws IOException {
        String uploadDir = "src/main/upload/images/";
        String fileName = "thumbnail_" + System.currentTimeMillis() + ".jpg";
        String filePath = uploadDir + fileName;
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File output = new File(filePath);
        ImageIO.write(image, "jpg", output);
        String relativePath = "/upload/images/" + fileName;
        System.out.println("Đường dẫn lưu ảnh: " + output.getAbsolutePath());

        return relativePath;
    }

    private static class UnsupportedFileTypeException extends Exception {
        public UnsupportedFileTypeException(String message) {
            super(message);
        }
    }

    @GetMapping("/viewfile")
    public String viewFile(@RequestParam("filepath") String filepath, ModelMap modelMap) {
        File file = new File(filepath);
        String fileContent = "";
        try {
            if (filepath.endsWith(".doc")) {
                fileContent = extractTextFromDOC(file);
            } else if (filepath.endsWith(".docx")) {
                fileContent = extractTextFromDOCX(file);
            }
            modelMap.addAttribute("fileContent", fileContent);
            return "ChiTietTaiLieu";
        } catch (IOException e) {
            e.printStackTrace();
            modelMap.addAttribute("errorMessage", "Không thể đọc tệp");
            return "error";
        }
    }


    private String extractTextFromDOC(File file) throws IOException {
        try (HWPFDocument document = new HWPFDocument(new FileInputStream(file))) {
            WordExtractor extractor = new WordExtractor(document);
            return extractor.getText();
        }
    }

    private String extractTextFromDOCX(File file) throws IOException {
        try (XWPFDocument document = new XWPFDocument(new FileInputStream(file))) {
            StringBuilder text = new StringBuilder();
            for (XWPFParagraph paragraph : document.getParagraphs()) {
                for (XWPFRun run : paragraph.getRuns()) {
                    text.append(run.toString());
                }
                text.append("\n");
            }
            return text.toString();
        }
    }

    //..............................

    @PostMapping("/document/updatedocument")
    public String updateDocument(@RequestParam("editTitle") String title,
                                 @RequestParam("editDescription") String description,
                                 @RequestParam("category") Integer category,
                                 @RequestParam("major") String major,
                                 @RequestParam("maTaiLieu") Integer maTaiLieu,
                                 ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        List<DanhMuc> listDanhMuc = danhMucRepository.findAll();
        modelMap.addAttribute("listDanhMuc", listDanhMuc);
        try {
            Optional<TaiLieu> optionalTaiLieu = taiLieuRepository.findByMaTaiLieu(maTaiLieu);
            if (optionalTaiLieu.isPresent()) {
                TaiLieu taiLieu = optionalTaiLieu.get();
                taiLieu.setTieuDe(title);
                taiLieu.setMoTa(description);
                taiLieu.setMaDanhMuc(category);
                taiLieu.setMaChuyenNganh(major);
                taiLieuRepository.save(taiLieu);

                HoatDongGanDay hoatDong = new HoatDongGanDay();
                hoatDong.setMaNguoiDung(nguoiDung.getMaNguoiDung());
                hoatDong.setLoaiHoatDong("Cập nhật");
                hoatDong.setMoTaHoatDong("Vừa cập nhật tài liệu: " + taiLieu.getTieuDe());
                hoatDong.setNgay(new Date());
                hoatDongGanDayRepository.save(hoatDong);
                return "redirect:/userinfo/"+nguoiDung.getMaNguoiDung();
            } else {
                return "redirect:/error";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/error";
        }
    }

    @GetMapping("/documents/khoa/{maKhoa}")
    public String getDocumentsByKhoa(@PathVariable("maKhoa") Integer maKhoa, @RequestParam(defaultValue = "0") int page, ModelMap modelMap, HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        Pageable pageable = PageRequest.of(page, 8);
        Page<TaiLieu> taiLieusPage = taiLieuRepository.findByMaKhoa(maKhoa, pageable);
        modelMap.addAttribute("titleHome", "Danh sách tài liệu");
        if(taiLieusPage.isEmpty() || taiLieusPage.getContent().isEmpty()) {
            modelMap.addAttribute("message", "Không tìm thấy tài liệu");
            addCommonAttributesIsEmpty(modelMap);
        } else {
            modelMap.addAttribute("nguoiDung", nguoiDung);
            modelMap.addAttribute("taiLieus", taiLieusPage.getContent());
            modelMap.addAttribute("currentPage", page);
            modelMap.addAttribute("totalPages", taiLieusPage.getTotalPages());
        }
        addCommonAttributes(modelMap);
        return "TrangChu";
    }


    @GetMapping("/documents/chuyennganh/{maChuyenNganh}")
    public String getDocumentsByChuyenNganh(@PathVariable("maChuyenNganh") String maChuyenNganh, @RequestParam(defaultValue = "0") int page, ModelMap modelMap,HttpSession session) {
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("loggedInUser");
        Pageable pageable = PageRequest.of(page, 8);
        Page<TaiLieu> taiLieus = taiLieuRepository.findByMaChuyenNganh(maChuyenNganh, pageable);
        modelMap.addAttribute("titleHome", "Danh sách tài liệu");

        if(taiLieus.isEmpty() || taiLieus.getContent().isEmpty()) {
            modelMap.addAttribute("message", "Không tìm thấy tài liệu");
            addCommonAttributesIsEmpty(modelMap);
        } else {
            addCommonAttributes(modelMap);
            modelMap.addAttribute("nguoiDung", nguoiDung);
            modelMap.addAttribute("taiLieus", taiLieus.getContent());
            modelMap.addAttribute("currentPage", page);
            modelMap.addAttribute("totalPages", taiLieus.getTotalPages());
        }
        return "TrangChu";
    }


    private void addCommonAttributes(ModelMap modelMap) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        List<Khoa> khoas = khoaRepository.findAll();
        List<ChuyenNganh> chuyenNganhs = chuyenNganhRepository.findAll();
        List<HoatDongGanDay> hoatDongGanDays = hoatDongGanDayRepository.findAll(
                PageRequest.of(0, 13, Sort.by(Sort.Direction.DESC, "maHoatDong"))
        ).getContent();
        Map<Integer, String> moTaHoatDong = new HashMap<>();
        Map<Integer, String> hoTenNguoiDung = new HashMap<>();
        Map<Integer, String> anhNguoiDung = new HashMap<>();
        for (HoatDongGanDay hoatDongGanDay : hoatDongGanDays) {
            Integer maNguoiDung = hoatDongGanDay.getMaNguoiDung();
            NguoiDung hoatDongND = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
            moTaHoatDong.put(hoatDongGanDay.getMaHoatDong(), hoatDongGanDay.getMoTaHoatDong());
            if (hoatDongND != null) {
                hoTenNguoiDung.put(hoatDongGanDay.getMaHoatDong(), hoatDongND.getHoTen());
                anhNguoiDung.put(hoatDongGanDay.getMaHoatDong(), hoatDongND.getAnh());
            } else {
                hoTenNguoiDung.put(hoatDongGanDay.getMaHoatDong(), "Tên người dùng không tồn tại");
                anhNguoiDung.put(hoatDongGanDay.getMaHoatDong(), "Ảnh người dùng không tồn tại");
            }
        }
        modelMap.addAttribute("khoas", khoas);
        modelMap.addAttribute("chuyenNganhs", chuyenNganhs);
        modelMap.addAttribute("hoatDongGanDays", hoatDongGanDays);
        modelMap.addAttribute("moTaHoatDong", moTaHoatDong);
        modelMap.addAttribute("hoTenNguoiDung", hoTenNguoiDung);
        modelMap.addAttribute("anhNguoiDung", anhNguoiDung);
        modelMap.addAttribute("danhMucs", danhMucs);
    }

    private void addCommonAttributesIsEmpty(ModelMap modelMap) {
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        List<Khoa> khoas = khoaRepository.findAll();
        List<ChuyenNganh> chuyenNganhs = chuyenNganhRepository.findAll();
        List<HoatDongGanDay> hoatDongGanDays = hoatDongGanDayRepository.findAll(
                PageRequest.of(0, 8, Sort.by(Sort.Direction.DESC, "maHoatDong"))
        ).getContent();
        Map<Integer, String> moTaHoatDong = new HashMap<>();
        Map<Integer, String> hoTenNguoiDung = new HashMap<>();
        Map<Integer, String> anhNguoiDung = new HashMap<>();
        for (HoatDongGanDay hoatDongGanDay : hoatDongGanDays) {
            Integer maNguoiDung = hoatDongGanDay.getMaNguoiDung();
            NguoiDung hoatDongND = nguoiDungRepository.getUserByMaNguoiDung(maNguoiDung);
            moTaHoatDong.put(hoatDongGanDay.getMaHoatDong(), hoatDongGanDay.getMoTaHoatDong());
            hoTenNguoiDung.put(hoatDongGanDay.getMaHoatDong(), hoatDongND.getHoTen());
            anhNguoiDung.put(hoatDongGanDay.getMaHoatDong(), hoatDongND.getAnh());
        }

        modelMap.addAttribute("khoas", khoas);
        modelMap.addAttribute("chuyenNganhs", chuyenNganhs);
        modelMap.addAttribute("hoatDongGanDays", hoatDongGanDays);
        modelMap.addAttribute("moTaHoatDong", moTaHoatDong);
        modelMap.addAttribute("hoTenNguoiDung", hoTenNguoiDung);
        modelMap.addAttribute("anhNguoiDung", anhNguoiDung);
        modelMap.addAttribute("danhMucs", danhMucs);
    }


    //Lấy chuyên ngành để hiển thị khi mà người dùng tải lên tài liệu ở UploadFile
    @GetMapping("/getChuyenNganh")
    @ResponseBody
    public List<ChuyenNganh> getMajorsByFaculty(@RequestParam("faculty") Integer facultyCode) {
        List<ChuyenNganh> listMajors = chuyenNganhRepository.findKhoaByMaKhoa(facultyCode);
        return listMajors;
    }


}

//        if (!CheckLogin.isLoggedIn(session)) {
//            modelMap.addAttribute("message", "Bạn cần đăng nhập để truy cập tính năng này.");
//            return "redirect:/trangchu";
//        }
