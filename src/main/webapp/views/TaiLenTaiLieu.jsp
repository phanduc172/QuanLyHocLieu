<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý học liệu - Trường Đại học Khoa học Huế</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/reponsive.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<body>
<header>
    <nav class="navbar navbar-expand-xl bg-light fixed-top" style="z-index: 1080">
        <div class="container">
            <a class="navbar-brand" href="/trangchu">
                <img class="me-2" src="/images/PD.png" alt="logo" style="height: 40px;">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Navbar Collapse -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav fw-bold">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Trang chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Danh mục
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Khoa</a></li>
                            <li><a class="dropdown-item" href="#">Ngành học</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Giới thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên hệ</a>
                    </li>
                </ul>

                <div class="input-group ms-auto" style="width:350px">
                    <input type="text" class="form-control" placeholder="Tìm kiếm tài liệu, giáo trình,..." />
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
                <c:choose>
                    <c:when test="${empty loggedInUser}">
                        <!-- Hiển thị nút và modal cho thành viên -->
                        <div class="ms-auto">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-light border" data-bs-toggle="modal" data-bs-target="#thanhVienModal">
                                <i class="bi bi-person-circle"></i> Thành viên
                            </button>
                            <!-- Modal Thành Viên-->
                            <div class="modal fade" id="thanhVienModal" tabindex="-1" aria-labelledby="loginRegisterModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content modelUser">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="loginRegisterModalLabel">
                                                Thành viên
                                            </h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs">
                                                <li class="nav-item">
                                                    <a class="nav-link active" data-bs-toggle="tab" href="#loginForm">Đăng nhập</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-bs-toggle="tab" href="#registerForm">Đăng ký</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content mt-3">
                                                <div id="loginForm" class="tab-pane fade show active">
                                                    <form method="post" action="/login">
                                                        <fieldset>
                                                            <div class="form-group mb-3">
                                                                <input class="form-control" placeholder="Nhập tên người dùng" name="tenNguoiDung" type="text" />
                                                            </div>
                                                            <div class="form-group mb-3">
                                                                <input class="form-control" placeholder="Nhập mật khẩu" name="matKhau" type="password" value="" />
                                                            </div>
                                                            <button class="btn btn-md btn btn-secondary btn-block" type="submit" id="loginButton">Đăng nhập</button>
                                                        </fieldset>
                                                    </form>
                                                </div>
                                                <div id="registerForm" class="tab-pane fade">
                                                    <form method="post" action="">
                                                        <fieldset>
                                                            <div class="form-group mb-3">
                                                                <input class="form-control" placeholder="Nhập họ tên" name="" type="text" />
                                                            </div>
                                                            <div class="form-group mb-3">
                                                                <input class="form-control" placeholder="Nhập tên đăng nhập" name="" type="text" />
                                                            </div>
                                                            <div class="form-group mb-3">
                                                                <input class="form-control" placeholder="Nhập mật khẩu" type="password" name=""
                                                                       value="" />
                                                            </div>
                                                            <input class="btn btn-md btn btn-secondary btn-block" type="submit" value="Đăng ký" />
                                                        </fieldset>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <%--Tải lên tài liệu--%>
                        <div class="ms-auto">
                            <a href="/uploadfile" class="btn btn-light border p-2 rounded-pill">
                                <span class="fw-bold">Tải lên</span>
                                <i class="bi bi-cloud-upload ms-2"></i>
                            </a>
                        </div>
                        <%--Modals Thông tin cá nhân--%>
                        <div class="ms-auto">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn d-flex align-items-center" data-bs-toggle="modal"
                                    data-bs-target="#infoModal">
                                <img src="${nguoiDung.anh}" alt="" class="border rounded me-2" style="height: 35px;">
                                <h6 class="m-0"><c:out value="${nguoiDung.hoTen}" /></h6>
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-info">
                                    <div class="modal-content small-modal-content">
                                        <div class="modal-body p-1">
                                            <ul class="fs-6">
                                                <a href="/userinfo/${loggedInUser.maNguoiDung}">
                                                    <li class="my-3">Thông tin cá nhân</li>
                                                </a>
                                                <a href="/userinfo/${loggedInUser.maNguoiDung}">
                                                    <li class="my-3">Quản lý tài liệu</li>
                                                </a>
                                                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#changePasswordModal">Đổi mật khẩu</a>
                                                <a href="/logout" id="logoutButton">
                                                    <li class="my-3">Đăng xuất</li>
                                                </a>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <%--Modal Đổi mật khẩu--%>
                            <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="changePasswordModalLabel">Đổi mật khẩu</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Form đổi mật khẩu -->
                                            <form>
                                                <div class="mb-3">
                                                    <label for="currentPassword" class="form-label">Mật khẩu hiện tại</label>
                                                    <input type="password" class="form-control" id="currentPassword" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="newPassword" class="form-label">Mật khẩu mới</label>
                                                    <input type="password" class="form-control" id="newPassword" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="confirmNewPassword" class="form-label">Xác nhận mật khẩu mới</label>
                                                    <input type="password" class="form-control" id="confirmNewPassword" required>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</header>

    <div class="container main">
        <h5 class="fw-bold text-center p-3">Nơi chia sẻ tài liệu học tập của sinh viên trường Đại học Khoa học - Đại học Huế</h5>
        <form action="#" method="post" enctype="multipart/form-data" id="uploadForm">
            <div class="mb-3">
                <label for="title" class="form-label">Tiêu đề:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Mô tả:</label>
                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
            </div>
            <div class="mb-3">
                <label for="faculty" class="form-label">Khoa:</label>
                <select class="form-control" id="faculty" name="faculty" required>
                    <option value="">Chọn Khoa</option>
                    <option value="khoa1">Khoa 1</option>
                    <option value="khoa2">Khoa 2</option>
                    <!-- Thêm các lựa chọn cho các khoa khác -->
                </select>
            </div>
            <div class="mb-3">
                <label for="major" class="form-label">Chuyên ngành:</label>
                <select class="form-control" id="major" name="major" required>
                    <option value="">Chọn Chuyên ngành</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="file" class="form-label">Chọn tệp:</label>
                <input type="file" class="form-control" id="file" name="file" required>
            </div>
            <button type="submit" class="btn btn-primary">Đăng tài liệu</button>
        </form>
    </div>



    <footer>
        <div class="p-3 text-center bg-light text-danger fw-bold   fs-6">
            Copyright © 2024. Designed by Phan Đức
        </div>
    </footer>

    <!-- Toast Đăng nhập -->
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 1050">
        <div id="loginSuccessToast" class="toast bg-primary text-white" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <strong class="me-auto">Thông báo</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Đăng nhập thành công!
            </div>
        </div>
    </div>

    <!-- JavaScript để kích hoạt Toast -->
    <script>
        // Kiểm tra xem biến session 'loggedInUser' có tồn tại hay không
        var loggedInUser = '<%= session.getAttribute("loggedInUser") %>';
        if (loggedInUser) {
            // Nếu tồn tại, hiển thị Toast
            var loginSuccessToast = document.getElementById('loginSuccessToast');
            var toast = new bootstrap.Toast(loginSuccessToast);
            toast.show();
        }
    </script>


    <script !src="">
        // Đối tượng chứa dữ liệu giả cho các chuyên ngành theo từng khoa
        var fakeMajors = {
            "khoa1": ["Chuyên ngành 1", "Chuyên ngành 2", "Chuyên ngành 3"],
            "khoa2": ["Chuyên ngành A", "Chuyên ngành B", "Chuyên ngành C"],
            // Thêm các chuyên ngành khác tương ứng với các khoa khác
        };

        // Hàm cập nhật danh sách chuyên ngành khi người dùng chọn khoa
        function updateMajorOptions() {
            var selectedFaculty = document.getElementById("faculty").value;
            var majorSelect = document.getElementById("major");
            majorSelect.innerHTML = ""; // Xóa tất cả các lựa chọn trước đó

            var majors = fakeMajors[selectedFaculty] || [];
            majors.forEach(function(major) {
                var option = document.createElement("option");
                option.value = major;
                option.text = major;
                majorSelect.appendChild(option);
            });
        }

        // Gán sự kiện onchange cho select khoa để cập nhật danh sách chuyên ngành
        document.getElementById("faculty").onchange = updateMajorOptions;

        // Kích hoạt hàm updateMajorOptions lần đầu khi trang được tải
        updateMajorOptions();
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>