<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý học liệu - Trường Đại học Khoa học Huế</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-<your-integrity-hash>" crossorigin="anonymous" />
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/reponsive.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<style>
    .feature-list .list-group-item {
        margin-bottom: 10px;
        padding: 15px;
        border-radius: 10px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .star-icon {
        color: gold;
    }
</style>


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
                        <a class="nav-link active" aria-current="page" href="/trangchu">Trang chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="" role="button" data-bs-toggle="" aria-expanded="false">
                            Danh mục
                        </a>
                        <ul class="dropdown-menu p-0">
                            <li class="nav-item dropend p-0">
                                <a class="nav-link dropdown-toggle px-3 py-2" href="" role="button" data-bs-toggle="" aria-expanded="false">
                                    Khoa
                                </a>
                                <ul class="dropdown-menu p-0" style="max-height: 200px; overflow-y: auto;">
                                    <c:forEach var="khoa" items="${khoas}" varStatus="loop">
                                        <li class="py-1">
                                            <a class="dropdown-item" href="/documents/khoa/${khoa.maKhoa}" value="${khoa.maKhoa}">${khoa.tenKhoa}</a>
                                        </li>
                                        <hr class="dropdown-divider m-0">
                                        <c:if test="${loop.index == 7}">
                                            <hr class="dropdown-divider m-0">
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                            <hr class="dropdown-divider m-0">
                            <li class="nav-item dropend">
                                <a class="nav-link dropdown-toggle px-3 py-2" href="" role="button" data-bs-toggle="" aria-expanded="false">
                                    Ngành học
                                </a>
                                <ul class="dropdown-menu p-0" style="max-height: 200px; overflow-y: auto;">
                                    <c:forEach var="chuyennganh" items="${chuyenNganhs}" varStatus="loop">
                                        <li class="py-1">
                                            <a class="dropdown-item" href="/documents/chuyennganh/${chuyennganh.maChuyenNganh}" value="${chuyennganh.maChuyenNganh}">${chuyennganh.tenChuyenNganh}</a>
                                        </li>
                                        <hr class="dropdown-divider m-0">
                                        <c:if test="${loop.index == 7}">
                                            <hr class="dropdown-divider m-0">
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/introduction">Giới thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/contact">Liên hệ</a>
                    </li>
                </ul>

                <form action="/search/{keyword}" method="post" class="input-group ms-auto" style="width:350px" >
                    <input id="searchInput" name="keyword" type="text" class="form-control" placeholder="Tìm kiếm tài liệu, giáo trình,..." />
                    <button class="btn btn-outline-secondary" type="submit" id="searchButton">
                        <i class="bi bi-search"></i>
                    </button>
                </form>

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
                                                    <div class="mb-3">
                                                        <a href="/login/oauth2/authorization/google" class="btn btn-google py-2 w-100">
                                                            <i class="bi bi-google me-2"></i> Đăng nhập bằng Google
                                                        </a>
                                                    </div>
                                                    <div class="divider">or</div>
                                                    <form method="post" action="/login">
                                                        <fieldset>
                                                            <div class="form-group mb-3">
                                                                <input class="form-control" placeholder="Nhập tên người dùng" name="tenNguoiDung" type="text" required/>
                                                            </div>
                                                            <div class="form-group mb-3">
                                                                <div class="input-group">
                                                                    <input class="form-control" placeholder="Nhập mật khẩu" name="matKhau" id="passwordInput" type="password" value="" required/>
                                                                    <button type="button" class="btn btn-sm btn-secondary toggle-password" onclick="togglePasswordVisibility('loginForm')">
                                                                        <i class="bi bi-eye"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                            <button class="btn btn-md btn btn-secondary btn-block" type="submit" id="loginButton">Đăng nhập</button>
                                                        </fieldset>
                                                    </form>
                                                </div>
                                                <div id="registerForm" class="tab-pane fade">
                                                    <form method="post" action="/register">
                                                        <fieldset>
                                                            <div class="form-group mb-3">
                                                                <input class="form-control" placeholder="Nhập họ tên" name="hoTen" type="text" required/>
                                                            </div>
                                                            <div class="form-group mb-3">
                                                                <input class="form-control" placeholder="Nhập tên đăng nhập" name="tenNguoiDung" type="text" required/>
                                                            </div>
                                                            <div class="form-group mb-3">
                                                                <div class="input-group">
                                                                    <input class="form-control" placeholder="Nhập mật khẩu" type="password" name="matKhau" value="" required/>
                                                                    <button type="button" class="btn btn-sm btn-secondary toggle-password" onclick="togglePasswordVisibility('registerForm')">
                                                                        <i class="bi bi-eye"></i>
                                                                    </button>
                                                                </div>
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
                            <a href="/uploadfile" class="border px-3 py-2 rounded-pill maudo docHover text-decoration-none">
                                <span class="fw-bold text-white">Tải lên</span>
                                <i class="bi bi-cloud-upload text-white ms-2" style="width: 20px; height: 20px"></i>
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
                                            <form method="post" action="/changepassword" id="changePasswordForm">
                                                <div class="mb-3">
                                                    <label for="currentPassword" class="form-label">Mật khẩu hiện tại</label>
                                                    <input type="password" class="form-control" id="currentPassword" name="currentPassword">
                                                    <input type="hidden" id="currentPasswordHidden" value="${currentPasswordHidden}" />
                                                    <div id="currentPasswordError" class="text-danger"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="newPassword" class="form-label">Mật khẩu mới</label>
                                                    <input type="password" class="form-control" id="newPassword" name="newPassword">
                                                    <div id="newPasswordError" class="text-danger"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="confirmNewPassword" class="form-label">Xác nhận mật khẩu mới</label>
                                                    <input type="password" name="confirmNewPassword" class="form-control" id="confirmNewPassword">
                                                    <div id="confirmNewPasswordError" class="text-danger"></div>
                                                </div>
                                                <button type="submit" class="btn btn-success">Đổi mật khẩu</button>
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

<div class="container main min-vh-100">
    <div class="row justify-content-center mt-5">
        <div class="col-lg-8 text-center">
            <h2 class="text-danger">Hệ thống Quản lý và chia sẻ Tài liệu học tập của sinh viên Trường Đại học Khoa học - Đại học Huế</h2>
        </div>
    </div>
    <section>
        <div class="card p-3 my-3">
            <h5 class="text-primary ms-3">Tính năng của người dùng</h5>
            <ol class="list-group list-group-numbered feature-list">
                <li class="list-group-item"><strong>Tìm kiếm tài liệu:</strong> Sinh viên có thể tìm kiếm tài liệu nhanh chóng.</li>
                <li class="list-group-item"><strong>Tải lên tài liệu:</strong> Sinh viên có thể tải lên bài tập, báo cáo và các tài liệu khác.</li>
                <li class="list-group-item"><strong>Tải xuống tài liệu:</strong> Người dùng có thể tải xuống tài liệu được chia sẻ bởi người khác.</li>
                <li class="list-group-item"><strong>Đánh giá tài liệu:</strong> Đánh giá các giá trị từ 1 <i class="bi bi-star-fill star-icon"></i> đến 5 <i class="bi bi-star-fill star-icon"></i> về tài liệu có hữu ích với bạn.</li>
                <li class="list-group-item"><strong>Bình luận:</strong> Để lại bình luận trên tài liệu để cung cấp phản hồi hoặc đặt câu hỏi.</li>
            </ol>
        </div>
    </section>

    <div class="row">
        <div class="col-md-6">
            <div class="card p-3 my-3">
                <h5 class="text-primary ms-3">Cách thức để truy cập tài liệu</h5>
                <ol class="list-group list-group-numbered access-steps">
                    <li class="list-group-item">Người dùng truy cập vào Trang chủ.</li>
                    <li class="list-group-item">Chọn tài liệu phù hợp ở Trang chủ hoặc Tìm kiếm tài liệu bằng từ khóa.</li>
                    <li class="list-group-item">Hệ thống hiển thị danh sách tài liệu phù hợp hoặc Không tìm thấy tài liệu.</li>
                    <li class="list-group-item">Chọn vào xem Chi tiết tài liệu.</li>
                    <li class="list-group-item">Bạn chưa đăng nhập hệ thống quay về Trang chủ.</li>
                    <li class="list-group-item">Bạn đã đăng nhập thành công vào hệ thống.</li>
                    <li class="list-group-item">Hiển thị danh sách tài liệu phù hợp với bạn.</li>
                    <li class="list-group-item">Người dùng đọc tài liệu, và tải xuống tài liệu nếu cần thiết.</li>
                    <li class="list-group-item">Người dùng xem những đánh giá và nội dung bình luận của người khác.</li>
                    <li class="list-group-item">Tham gia thảo luận bằng cách để lại bình luận trên tài liệu.</li>
                </ol>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card p-3 my-3">
                <h5 class="text-primary ms-3">Cách thức để chia sẻ tài liệu lên hệ thống</h5>
                <ol class="list-group list-group-numbered access-steps">
                    <li class="list-group-item">Đăng nhập vào tài khoản của bạn.</li>
                    <li class="list-group-item">Nếu bạn chưa có tài khoản thì vui lòng đăng ký tài khoản.</li>
                    <li class="list-group-item">Tại bất cứ màn hình nào người dùng có thể bấm nút "Tải lên tài liệu".</li>
                    <li class="list-group-item">Hệ thống hiển thị giao diện tải lên tài liệu.</li>
                    <li class="list-group-item">Người dùng thực hiện chọn tệp và nội dung tài liệu.</li>
                    <li class="list-group-item">Hệ thống thực hiện xử lý tài liệu tải lên ở trạng thái chờ duyệt.</li>
                    <li class="list-group-item">Tham gia thảo luận bằng cách để lại bình luận trên tài liệu.</li>
                </ol>
            </div>
        </div>

    </div>
</div>

<footer>
    <div class="p-3 text-center bg-light text-danger fw-bold fs-6 mt-5">
        Copyright © 2024. Designed by Phan Đức
    </div>
</footer>

<script src="/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
