package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.dto.DanhGiaDto;
import com.phanduc.QLHocLieu.dto.TotalDocumentUser;
import com.phanduc.QLHocLieu.models.TaiLieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;


public interface TaiLieuRepository extends JpaRepository<TaiLieu,String> {
    TaiLieu findTaiLieuByMaTaiLieu(Integer maTaiLieu);
    List<TaiLieu> findByMaDanhMuc(Integer maDanhMuc);
//    List<TaiLieu> findByMaTrangThai(Integer maTrangThai);
    Page<TaiLieu> findByMaTrangThai(Integer maTrangThai, Pageable pageable);
    List<TaiLieu> findByTaiLenBoi(Integer taiLenBoi);
    Optional<TaiLieu> findByMaTaiLieu(Integer maTaiLieu);
    List<TaiLieu> findByTieuDeContaining(String keyword);
    List<TaiLieu> findByMaTrangThaiAndTaiLenBoi(Integer maTrangThai, Integer maNguoiDung);
    @Query("SELECT nd.anh FROM NguoiDung nd WHERE nd.maNguoiDung = :maNguoiDung")
    String findAnhByMaNguoiDung(@Param("maNguoiDung") Integer maNguoiDung);
    @Query("SELECT nd.hoTen FROM NguoiDung nd WHERE nd.maNguoiDung = :maNguoiDung")
    String findHoTenByMaNguoiDung(@Param("maNguoiDung") Integer maNguoiDung);
    Page<TaiLieu> findByMaChuyenNganh(String maChuyenNganh, Pageable pageable);
    @Query(value = "SELECT * FROM tailieu " +
            "INNER JOIN chuyennganh ON tailieu.MaChuyenNganh = chuyennganh.MaChuyenNganh " +
            "INNER JOIN khoa ON chuyennganh.MaKhoa = khoa.MaKhoa " +
            "WHERE chuyennganh.MaKhoa = ?1", nativeQuery = true)
    Page<TaiLieu> findByMaKhoa(Integer maKhoa, Pageable pageable);

    @Query(value = "SELECT DATE(ngayTaiLen) AS ngay, COUNT(*) AS soLuongTaiLieu " +
            "FROM TaiLieu " +
            "GROUP BY DATE(ngayTaiLen) " +
            "ORDER BY DATE(ngayTaiLen) ASC", nativeQuery = true)
    List<Object[]> findDailyUploadStats();


    @Query(value = "SELECT COUNT(*) AS TongTaiLieu FROM qlhoclieu.tailieu", nativeQuery = true)
    Integer countTotalTaiLieu();

    @Query("SELECT nd.hoTen, tl.tieuDe, dg.giaTriDanhGia, bl.noiDung, bl.ngayBinhLuan " +
            "FROM NguoiDung nd " +
            "JOIN TaiLieu tl ON nd.maNguoiDung = tl.taiLenBoi " +
            "JOIN DanhGia dg ON tl.maTaiLieu = dg.maTaiLieu " +
            "JOIN BinhLuan bl ON bl.maTaiLieu = dg.maTaiLieu " +
            "ORDER BY bl.ngayBinhLuan desc "
    )
    List<Object[]> getBinhluanDanhGia();
    @Query("SELECT nd.hoTen, tl.tieuDe, dg.giaTriDanhGia, bl.noiDung, bl.ngayBinhLuan " +
            "FROM NguoiDung nd " +
            "JOIN TaiLieu tl ON nd.maNguoiDung = tl.taiLenBoi " +
            "JOIN DanhGia dg ON tl.maTaiLieu = dg.maTaiLieu " +
            "JOIN BinhLuan bl ON bl.maTaiLieu = dg.maTaiLieu " +
            "ORDER BY bl.ngayBinhLuan desc "
    )
    Page<Object[]> getBinhluanDanhGiaPage(Pageable pageable);

    @Query("SELECT new com.phanduc.QLHocLieu.dto.TotalDocumentUser(nd.hoTen, nd.anh, COUNT(tl.maTaiLieu)) " +
            "FROM NguoiDung nd " +
            "LEFT JOIN TaiLieu tl ON nd.maNguoiDung = tl.taiLenBoi " +
            "GROUP BY nd.maNguoiDung " +
            "ORDER BY COUNT(tl.maTaiLieu) DESC ")
    Page<TotalDocumentUser> getSoLuongTaiLieuByNguoiDung(Pageable pageable);

    @Transactional
    @Modifying
    @Query("DELETE FROM TaiLieu t WHERE t.maTaiLieu = ?1")
    void deleteByMaTaiLieu(Integer maTaiLieu);

    @Query(value = "SELECT * FROM tailieu ORDER BY SLTaiXuong DESC LIMIT 10", nativeQuery = true)
    List<TaiLieu> findTop10BySLTaiXuong();

    @Query("SELECT NEW com.phanduc.QLHocLieu.dto.DanhGiaDto(tl.maTaiLieu, tl.tieuDe, AVG(dg.giaTriDanhGia)) " +
            "FROM TaiLieu tl " +
            "JOIN DanhGia dg " +
            "ON tl.maTaiLieu = dg.maTaiLieu " +
            "GROUP BY tl.maTaiLieu,tl.tieuDe " +
            "ORDER BY AVG(dg.giaTriDanhGia) DESC")
    List<DanhGiaDto> findTop10DanhGia();

}
