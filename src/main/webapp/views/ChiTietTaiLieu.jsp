<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý học liệu - Trường Đại học Khoa học Huế</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="/css/style.css">

</head>

<body>
<%--  <c:choose>--%>
<%--    <c:when test="${not empty loggedInUser}">--%>
<%--      <script>--%>
<%--        alert("Đăng nhập thành công");--%>
<%--      </script>--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
<%--      <script>--%>
<%--        alert("Đăng nhập không thành công");--%>
<%--      </script>--%>
<%--    </c:otherwise>--%>
<%--  </c:choose>--%>

<header>
    <nav class="navbar navbar-expand-lg bg-light fixed-top" style="z-index: 1080">
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

                <div class="input-group ms-auto" style="width: 400px">
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
                                    <div class="modal-content modalLogin">
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
                                                                <input class="form-control" placeholder="Nhập tên người dùng" name="tenNguoiDung"
                                                                       type="text" />
                                                            </div>
                                                            <div class="form-group mb-3">
                                                                <input class="form-control" placeholder="Nhập mật khẩu" name="matKhau" type="password"
                                                                       value="" />
                                                            </div>
                                                            <input class="btn btn-md btn btn-secondary btn-block" type="submit" value="Đăng nhập" />
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
                        <%--Modals Thông tin cá nhân--%>
                        <div class="ms-auto">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn d-flex align-items-center" data-bs-toggle="modal"
                                    data-bs-target="#infoModal">
                                <img src="/images/avt1.png" alt="" class="border rounded me-2" style="height: 35px;">
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
                                                <a href="">
                                                    <li class="my-3">Quản lý tài liệu</li>
                                                </a>
                                                <a href="">
                                                    <li class="my-3">Đổi mật khẩu</li>
                                                </a>
                                                <a href="/logout">
                                                    <li class="my-3">Đăng xuất</li>
                                                </a>
                                            </ul>
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
<div class="container-fluid main">
    <div class="row">
        <div class="col-9">
            <h5 class="text-center">${taiLieu.tieuDe}</h5>
            <div class="card">
                <div class="row g-0">
                    <div class="col-md-5 d-flex align-items-center">
                        <div class="ms-3">
                            <img src="/images/avt.png" class="img-fluid rounded-start me-3" alt="Avatar" style="max-width: 50px">
                        </div>
                        <div>
                            <p class="card-text m-0">Tải lên: ${nguoiDung.hoTen}</p>
                            <p class="card-text m-0">Báo cáo tài liệu</p>
                        </div>
                    </div>
                    <div class="col-md-7 d-flex align-items-center">
                        <div class="card-body d-flex justify-content-end align-items-center">
                            <h6 class="card-title mb-0 me-3 p-2 border border-2 rounded text-secondary">
                                Yêu thích
                            </h6>
                            <a href="#" class="btn btn-warning p-2 text-white" >Tải xuống</a>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="pdf-container">
                                <embed src="${taiLieu.duongDanTep}" type="application/pdf">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-3">
            <h5 class="text-center">Tài liệu Người dùng</h5>
            <ul class="list-group">
                <li class="row align-items-center mb-2 p-1">
                    <div class="col-auto ms-1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                             class="absolute left-0 top-1 w-4 h-4">
                            <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
                            <path fill="#fff" d="M2 6h19v12H2z"></path>
                            <path
                                    d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                                    fill="#E2574C"></path>
                        </svg>
                    </div>
                    <a href="#" class="text-start truncate-text flex items-start p-0">
                        Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan
                        phân loại mobile robot
                    </a>
                </li>
                <li class="row align-items-center mb-2 p-1">
                    <div class="col-auto ms-1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                             class="absolute left-0 top-1 w-4 h-4">
                            <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
                            <path fill="#fff" d="M2 6h19v12H2z"></path>
                            <path
                                    d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                                    fill="#E2574C"></path>
                        </svg>
                    </div>
                    <a href="#" class="text-start truncate-text flex items-start p-0">
                        Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan
                        phân loại mobile robot
                    </a>
                </li>
                <li class="row align-items-center mb-2 p-1">
                    <div class="col-auto ms-1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                             class="absolute left-0 top-1 w-4 h-4">
                            <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
                            <path fill="#fff" d="M2 6h19v12H2z"></path>
                            <path
                                    d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                                    fill="#E2574C"></path>
                        </svg>
                    </div>
                    <a href="#" class="text-start truncate-text flex items-start p-0">
                        Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan
                        phân loại mobile robot
                    </a>
                </li>
                <li class="row align-items-center mb-2 p-1">
                    <div class="col-auto ms-1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                             class="absolute left-0 top-1 w-4 h-4">
                            <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
                            <path fill="#fff" d="M2 6h19v12H2z"></path>
                            <path
                                    d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                                    fill="#E2574C"></path>
                        </svg>
                    </div>
                    <a href="#" class="text-start truncate-text flex items-start p-0">
                        Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan
                        phân loại mobile robot
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<footer>
    <div class="p-3 text-center bg-light text-danger fw-bold fs-6 mt-5">
        Copyright © 2024. Designed by Phan Đức
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>