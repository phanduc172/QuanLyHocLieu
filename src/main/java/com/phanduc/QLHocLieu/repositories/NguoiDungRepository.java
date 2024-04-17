package com.phanduc.QLHocLieu.repositories;

import com.phanduc.QLHocLieu.models.NguoiDung;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NguoiDungRepository extends JpaRepository<NguoiDung, String> {
    NguoiDung findByTenNguoiDungAndMatKhau(String tenNguoiDung, String matKhau);
    NguoiDung getUserByMaNguoiDung(Integer maNguoiDung);
    NguoiDung findByTenNguoiDung(String tenNguoiDung);

    default void printUser(String tenNguoiDung, String matKhau) {
        NguoiDung nguoiDung = findByTenNguoiDungAndMatKhau(tenNguoiDung, matKhau);
        if (nguoiDung != null) {
            System.out.println("Tên người dùng: " + nguoiDung.getTenNguoiDung());
            System.out.println("Mật khẩu: " + nguoiDung.getMatKhau());
            // In thêm các thông tin khác của người dùng nếu cần
        } else {
            System.out.println("Không tìm thấy người dùng với tên đăng nhập và mật khẩu đã cho.");
        }
    }
}
