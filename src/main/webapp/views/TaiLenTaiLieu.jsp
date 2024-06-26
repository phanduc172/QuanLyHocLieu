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

    <div class="container main ">
        <h4 class="fw-bold text-center text-danger p-3">Nơi chia sẻ tài liệu học tập của sinh viên trường Đại học Khoa học - Đại học Huế</h4>
        <form action="/uploadfile" method="post" enctype="multipart/form-data" id="uploadForm">
            <div class="mb-2">
                <label for="file" class="form-label">Chọn tệp:</label>
                <input type="file" class="form-control" id="file" name="file" required>
            </div>
            <div class="mb-2">
                <label for="title" class="form-label">Tiêu đề:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="mb-2">
                <label for="description" class="form-label">Mô tả:</label>
                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
            </div>
            <div class="mb-2">
                <label for="category" class="form-label">Thể loại:</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="" selected disabled>-- Chọn Thể loại --</option>
                    <c:forEach items="${listDanhMuc}" var="danhmuc">
                        <option value="${danhmuc.maDanhMuc}">${danhmuc.tenDanhMuc}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-2">
                <label for="faculty" class="form-label">Khoa:</label>
                <select class="form-control" id="faculty" name="faculty" required>
                    <option value="" selected disabled>-- Chọn Khoa --</option>
                    <c:forEach items="${listKhoa}" var="khoa">
                        <option value="${khoa.maKhoa}">${khoa.tenKhoa}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-2">
                <label for="major" class="form-label">Chuyên ngành:</label>
                <select class="form-control" id="major" name="major" required>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Đăng tài liệu</button>
        </form>
    </div>
    <footer class="mt-3">
        <div class="p-3 text-center bg-light text-danger fw-bold   fs-6">
            Copyright © 2024. Designed by Phan Đức
        </div>
    </footer>

    <script src="/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>