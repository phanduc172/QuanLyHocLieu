package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.models.*;
import com.phanduc.QLHocLieu.repositories.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "/manager")
public class AdminManagerController {
    @Autowired
    private KhoaRepository khoaRepository;
    @Autowired
    private ChuyenNganhRepository chuyenNganhRepository;
    @Autowired
    private DanhMucRepository danhMucRepository;
    @Autowired
    private TaiLieuRepository taiLieuRepository;
    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    //Tài liệu
    @GetMapping("/tailieu")
    //http://localhost:8080/manager/tailieu
    public String getAllTaiLieu(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            ModelMap modelMap
    ) {
        Pageable pageable = PageRequest.of(page, size);
        Page<TaiLieu> taiLieuPage = taiLieuRepository.findAll(pageable);
        List<TaiLieu> listTaiLieu = taiLieuPage.getContent();
        modelMap.addAttribute("listTaiLieu", listTaiLieu);
        modelMap.addAttribute("currentPage", taiLieuPage.getNumber());
        modelMap.addAttribute("totalPages", taiLieuPage.getTotalPages());
        modelMap.addAttribute("size", size);

        return "admin/QuanLyTaiLieu";
    }
    @GetMapping("/export/tailieu/excel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=tailieu.xlsx";
        response.setHeader(headerKey, headerValue);

        List<TaiLieu> listTaiLieu = taiLieuRepository.findAll();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Tài Liệu");

        Row headerRow = sheet.createRow(0);
        CellStyle headerCellStyle = workbook.createCellStyle();
        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerCellStyle.setFont(headerFont);

        String[] columns = {"ID", "Tiêu đề", "Mô tả", "Đường dẫn tệp", "Ảnh tài liệu", "Người tải lên", "Ngày tải lên", "Tải xuống", "Danh mục", "Chuyên ngành", "Lượt truy cập", "Trạng thái"};
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
            cell.setCellStyle(headerCellStyle);
        }

        int rowNum = 1;
        for (TaiLieu tailieu : listTaiLieu) {
            Row row = sheet.createRow(rowNum++);

            row.createCell(0).setCellValue(tailieu.getMaTaiLieu());
            row.createCell(1).setCellValue(tailieu.getTieuDe());
            row.createCell(2).setCellValue(tailieu.getMoTa());
            row.createCell(3).setCellValue(tailieu.getDuongDanTep());
            row.createCell(4).setCellValue(tailieu.getAnhTaiLieu());
            row.createCell(5).setCellValue(tailieu.getTaiLenBoi());
            row.createCell(6).setCellValue(tailieu.getNgayTaiLen().toString());
            row.createCell(7).setCellValue(tailieu.getSoLuotTaiXuong());
            row.createCell(8).setCellValue(tailieu.getMaDanhMuc());
            row.createCell(9).setCellValue(tailieu.getMaChuyenNganh());
            row.createCell(10).setCellValue(tailieu.getSoLuotTruyCap());
            row.createCell(11).setCellValue(tailieu.getMaTrangThai());
        }

        for (int i = 0; i < columns.length; i++) {
            sheet.autoSizeColumn(i);
        }

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();

        outputStream.close();
    }

    //Tài liệu
    //Khoa - Chuyên ngành
    @GetMapping("/khoachuyennganh")
    //http://localhost:8080/manager/khoachuyennganh
    public String getKhoaChuyenNganh(@RequestParam(defaultValue = "0") int khoaPage,
                                     @RequestParam(defaultValue = "0") int chuyenNganhPage,
                                     @RequestParam(defaultValue = "10") int size,
                                     ModelMap modelMap) {
        Page<Khoa> listKhoa = khoaRepository.findAll(PageRequest.of(khoaPage, size));
        Page<ChuyenNganh> listChuyenNganh = chuyenNganhRepository.findAll(PageRequest.of(chuyenNganhPage, size));
        modelMap.addAttribute("listKhoa", listKhoa.getContent());
        modelMap.addAttribute("listChuyenNganh", listChuyenNganh.getContent());
        modelMap.addAttribute("currentPageKhoa", listKhoa.getNumber());
        modelMap.addAttribute("totalPagesKhoa", listKhoa.getTotalPages());
        modelMap.addAttribute("currentPageChuyenNganh", listChuyenNganh.getNumber());
        modelMap.addAttribute("totalPagesChuyenNganh", listChuyenNganh.getTotalPages());
        modelMap.addAttribute("size", size);
        return "admin/QuanLyKhoaChuyenNganh";
    }

    @PostMapping("/khoa/addkhoa")
    //http://localhost:8080/manager/khoa/addkhoa
    public String themKhoa(@RequestParam("tenKhoa") String tenKhoa) {
        Khoa khoa = new Khoa();
        khoa.setTenKhoa(tenKhoa);
        khoaRepository.save(khoa);
        return "redirect:/manager/khoachuyennganh";
    }

    @DeleteMapping("/khoa/delete/{maKhoa}")
    //http://localhost:8080/manager/khoa/delete/{maKhoa}
    public ResponseEntity<String> deleteKhoa(@PathVariable("maKhoa") Integer maKhoa) {
        Optional<Khoa> khoa = khoaRepository.findById(maKhoa);
        if (khoa.isPresent()) {
            khoaRepository.deleteById(maKhoa);
            return new ResponseEntity<>("Xóa khoa thành công", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Khoa không tồn tại", HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/khoa/update")
    public String updateKhoa(@RequestParam("maKhoa") Integer maKhoa, @RequestParam("tenKhoa") String tenKhoa) {
        Optional<Khoa> optionalKhoa = khoaRepository.findById(maKhoa);
        if (optionalKhoa.isPresent()) {
            Khoa khoa = optionalKhoa.get();
            khoa.setTenKhoa(tenKhoa);
            khoaRepository.save(khoa);
            return "redirect:/manager/khoachuyennganh";
        } else {
            return "redirect:/manager/khoachuyennganh";
        }
    }

    @PostMapping("/chuyennganh/addchuyennganh")
    public String themChuyenNganh(@RequestParam("maChuyenNganh") String maChuyenNganh,
                                  @RequestParam("tenChuyenNganh") String tenChuyenNganh,
                                  @RequestParam("selectedMaKhoa") Integer selectedMaKhoa) {
        ChuyenNganh chuyenNganh = new ChuyenNganh();
        chuyenNganh.setMaChuyenNganh(maChuyenNganh);
        chuyenNganh.setTenChuyenNganh(tenChuyenNganh);
        Optional<Khoa> khoa = khoaRepository.findById(selectedMaKhoa);
        chuyenNganh.setMaKhoa(selectedMaKhoa);
        chuyenNganhRepository.save(chuyenNganh);
        return "redirect:/manager/khoachuyennganh";
    }

    @DeleteMapping("/chuyennganh/delete/{maChuyenNganh}")
    public ResponseEntity<String> deleteChuyenNganh(@PathVariable("maChuyenNganh") String maChuyenNganh) {
        Optional<ChuyenNganh> optionalChuyenNganh = chuyenNganhRepository.findById(maChuyenNganh);
        if (optionalChuyenNganh.isPresent()) {
            chuyenNganhRepository.deleteById(maChuyenNganh);
            return new ResponseEntity<>("Xóa chuyên ngành thành công", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Chuyên ngành không tồn tại", HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/chuyennganh/update")
    public String updateChuyenNganh(@RequestParam("maChuyenNganh") String maChuyenNganh,
                                    @RequestParam("tenChuyenNganh") String tenChuyenNganh,
                                    @RequestParam("selectedMaKhoa") Integer selectedMaKhoa) {
        Optional<ChuyenNganh> optionalChuyenNganh = chuyenNganhRepository.findById(maChuyenNganh);
        if (optionalChuyenNganh.isPresent()) {
            ChuyenNganh chuyenNganh = optionalChuyenNganh.get();
            chuyenNganh.setTenChuyenNganh(tenChuyenNganh);
            if (selectedMaKhoa != null) {
                chuyenNganh.setMaKhoa(selectedMaKhoa);
            }
            chuyenNganhRepository.save(chuyenNganh);
        }
        return "redirect:/manager/khoachuyennganh";
    }






    //Khoa - Chuyên ngành


    //Danh mục
    @GetMapping("/danhmuc")
    //http://localhost:8080/manager/danhmuc
    public String getAllDanhMuc(ModelMap modelMap) {
        List<DanhMuc> listDanhMuc = danhMucRepository.findAll();
        modelMap.addAttribute("listDanhMuc",listDanhMuc);
        return "admin/QuanLyDanhMuc";
    }

    @PostMapping("/danhmuc/addcategory")
    //http://localhost:8080/manager/danhmuc/addcategory
    public String themDanhMuc(@RequestParam("tenDanhMuc") String tenDanhMuc) {
        DanhMuc danhMuc = new DanhMuc();
        danhMuc.setTenDanhMuc(tenDanhMuc);
        danhMucRepository.save(danhMuc);
        return "redirect:/manager/danhmuc";
    }

    @DeleteMapping("/danhmuc/delete/{maDanhMuc}")
    //http://localhost:8080/manager/danhmuc/delete/
    public ResponseEntity<String> deleteCategory(@PathVariable("maDanhMuc") Integer maDanhMuc) {
        Optional<DanhMuc> danhMuc = danhMucRepository.findById(maDanhMuc);
        if (danhMuc.isPresent()) {
            danhMucRepository.deleteById(maDanhMuc);
            return new ResponseEntity<>("Xóa danh mục thành công", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Danh mục không tồn tại", HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/danhmuc/update")
    public String updateDanhMuc(@RequestParam("maDanhMuc") Integer maDanhMuc, @RequestParam("tenDanhMuc") String tenDanhMuc) {
        Optional<DanhMuc> optionalDanhMuc = danhMucRepository.findById(maDanhMuc);
        if (optionalDanhMuc.isPresent()) {
            DanhMuc danhMuc = optionalDanhMuc.get();
            danhMuc.setTenDanhMuc(tenDanhMuc);
            danhMucRepository.save(danhMuc);
            return "redirect:/manager/danhmuc";
        } else {
            return "redirect:/manager/danhmuc";
        }
    }
    //Danh mục


    // Người dùng//
    @GetMapping("/user/list")
    //http://localhost:8080/manager/user/list
    public String getAllNguoiDung(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            ModelMap modelMap) {
        Pageable pageable = PageRequest.of(page, size);
        Page<NguoiDung> nguoiDungPage = nguoiDungRepository.findAll(pageable);

        modelMap.addAttribute("nguoiDung", nguoiDungPage.getContent());
        modelMap.addAttribute("currentPage", nguoiDungPage.getNumber());
        modelMap.addAttribute("totalPages", nguoiDungPage.getTotalPages());
        modelMap.addAttribute("totalItems", nguoiDungPage.getTotalElements());
        modelMap.addAttribute("size", size);
        modelMap.addAttribute("nguoiDungPage",nguoiDungPage);

        return "admin/QuanLyNguoiDung";
    }

    @PostMapping("/update")
    public String updateUser(@RequestParam("maNguoiDung") String maNguoiDung,
                             @RequestParam("updateUsername") String username,
                             @RequestParam("updateFullName") String fullName,
                             @RequestParam("updateEmail") String email,
                             @RequestParam("updatePassword") String password,
                             @RequestParam("updateRoleId") Integer roleId,
                             @ModelAttribute("nguoiDung") NguoiDung nguoiDung
    ) {
        try {
            if (nguoiDung == null) {
                return "Không tìm thấy người dùng với mã người dùng: " + maNguoiDung;
            }
            if (username.isEmpty() || fullName.isEmpty() || email.isEmpty() || password.isEmpty() || roleId == null) {
                return "/admin/Error404";
            }
            // Cập nhật thông tin người dùng
            nguoiDung.setTenNguoiDung(username);
            nguoiDung.setHoTen(fullName);
            nguoiDung.setEmail(email);
            nguoiDung.setMatKhau(password);
            nguoiDung.setMaVaiTro(roleId);
            nguoiDungRepository.save(nguoiDung);
            return "redirect:/manager/user/list?updateSuccess=true";
        } catch (Exception e) {
            System.out.println("Đã xảy ra lỗi trong quá trình cập nhật người dùng:" + e.getMessage());
            return "redirect:/admin/Error404";
        }
    }

    @DeleteMapping("/delete/user/{maNguoiDung}")
    public ResponseEntity<String> deleteUser(@PathVariable("maNguoiDung") Integer maNguoiDung) {
        Optional<NguoiDung> optionalNguoiDung = nguoiDungRepository.findById(maNguoiDung);
        if (optionalNguoiDung.isPresent()) {
            nguoiDungRepository.deleteById(maNguoiDung);
            return new ResponseEntity<>("Xóa người dùng thành công", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Người dùng không tồn tại", HttpStatus.NOT_FOUND);
        }
    }
    // Người dùng//


    //Đánh giá và bình luận
    @GetMapping("/comment")
    //http://localhost:8080/manager/comment
    public String getAllReviewAndComment(ModelMap modelMap) {
        List<Object[]> listComment = taiLieuRepository.getBinhluanDanhGia();
        modelMap.addAttribute("listComment",listComment);
        return "admin/QuanLyDanhGiaBinhLuan";
    }

    @GetMapping("/export/comment/excel")
    @ResponseBody
    public void exportCommentToExcel(HttpServletResponse response) throws IOException {
        // Set content type and header
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=comment_report.xlsx");

        // Get data from repository
        List<Object[]> listComment = taiLieuRepository.getBinhluanDanhGia();

        // Create workbook and sheet
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("BinhLuan_DanhGia");

        // Create header row
        Row headerRow = sheet.createRow(0);
        String[] headers = {"Họ tên", "Tiêu đề", "Giá trị", "Nội dung", "Ngày"};
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
        }

        // Populate data rows
        int rowNum = 1;
        for (Object[] comment : listComment) {
            Row row = sheet.createRow(rowNum++);
            for (int i = 0; i < comment.length; i++) {
                Cell cell = row.createCell(i);
                cell.setCellValue(String.valueOf(comment[i]));
            }
        }

        // Auto-size columns
        for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i);
        }

        // Write to response stream
        workbook.write(response.getOutputStream());
        workbook.close();
    }
    //Đánh giá và bình luận

}
