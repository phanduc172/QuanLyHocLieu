<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="/css/style.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<style>
    @media (max-width: 1168px) {
        .hide-below-1168 {
            display: none !important;
        }
    }
</style>

<body>
<div class="preloader">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <header class="topbar" data-navbarbg="skin6">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark">
            <div class="navbar-header" data-logobg="skin6">
                <a class="navbar-brand" href="/dashboard">
                    <!-- <b class="logo-icon">
                        <img src="../assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                    </b> -->
                    <span class="logo-text ms-3">
                            <img src="../assets/images/PD.png" alt="homepage" class="dark-logo" style="width: 100px;"/>
                        </span>
                </a>
            </div>
            <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                <ul class="navbar-nav me-auto mt-md-0 ">
                    <li class="nav-item hidden-sm-down">
                        <form class="app-search ps-3">
                            <input type="text" class="form-control" placeholder="Search for..."> <a
                                class="srh-btn"><i class="ti-search"></i></a>
                        </form>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle waves-effect waves-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="../assets/images/avt.png" alt="user" class="profile-pic me-2">Phan Đức
                        </a>
                        <ul class="dropdown-menu show" aria-labelledby="navbarDropdown"></ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <aside class="left-sidebar" data-sidebarbg="skin6">
        <div class="scroll-sidebar">
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/dashboard" aria-expanded="false">
                            <i class="me-3 fas fa-tachometer-alt" aria-hidden="true"></i>
                            <span class="hide-menu">Tổng quan</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="pages-profile.html" aria-expanded="false">
                            <i class="me-3 fas fa-user" aria-hidden="true"></i>
                            <span class="hide-menu">Hồ sơ người dùng</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="#" aria-expanded="false">
                            <i class="me-3 fas fa-check-circle" aria-hidden="true"></i>
                            <span class="hide-menu">Phê duyệt Tài liệu</span>
                        </a>
                    </li>
                    <ul>
                        <!-- Mục Quản lý -->
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark collapsed" data-bs-toggle="collapse" href="#manageItems" aria-expanded="false" aria-controls="manageItems">
                                <i class="me-3 fas fa-cogs" aria-hidden="true"></i>
                                <span class="hide-menu">Quản lý</span>
                                <i class="fas fa-chevron-down ms-auto d-lg-block d-none hide-below-1168"></i>
                            </a>
                            <!-- Danh sách con -->
                            <div class="collapse" id="manageItems">
                                <ul class="list-unstyled">
                                    <li class="sidebar-item ms-3">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/manager/tailieu">
                                            <i class="fas fa-file-alt me-3" aria-hidden="true"></i>
                                            <span class="hide-menu">Tài liệu</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item ms-3">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/manager/danhmuc">
                                            <i class="fas fa-folder me-3" aria-hidden="true"></i>
                                            <span class="hide-menu">Danh mục</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item ms-3">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/manager/khoachuyennganh" aria-expanded="false">
                                            <i class="me-3 fas fa-university" aria-hidden="true"></i>
                                            <span class="hide-menu">Khoa</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item ms-3">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/manager/khoachuyennganh" aria-expanded="false">
                                            <i class="me-3 fas fa-graduation-cap" aria-hidden="true"></i>
                                            <span class="hide-menu">Chuyên ngành</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item ms-3">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/manager/user/list" aria-expanded="false">
                                            <i class="me-3 fas fa-users" aria-hidden="true"></i>
                                            <span class="hide-menu">Người dùng</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item ms-3">
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="table-basic.html" aria-expanded="false">
                                            <i class="me-3 fas fa-comments" aria-hidden="true"></i>
                                            <span class="hide-menu">Bình luận & Đánh giá</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="table-basic.html" aria-expanded="false">
                            <i class="me-3 fas fa-chart-bar" aria-hidden="true"></i>
                            <span class="hide-menu">Thống kê báo cáo</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="table-basic.html" aria-expanded="false">
                            <i class="me-3 fas fa-bell" aria-hidden="true"></i>
                            <span class="hide-menu">Thông báo và tương tác</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="table-basic.html" aria-expanded="false">
                            <i class="me-3 fas fa-download" aria-hidden="true"></i>
                            <span class="hide-menu">Truy cập Tài liệu</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="pages-error-404.html" aria-expanded="false">
                            <i class="me-3 fas fa-exclamation-circle" aria-hidden="true"></i>
                            <span class="hide-menu">Lỗi 404</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-md-6 col-8 align-self-center">
                    <h3 class="page-title mb-0 p-0">Phê duyệt Tài liệu</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/dashboard/">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Tài liệu chờ duyệt</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Thể loại</h4>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th scope="col">Mã Tài Liệu</th>
                                        <th scope="col">Tiêu Đề</th>
                                        <th scope="col">Mô Tả</th>
                                        <th scope="col">Người Đăng</th>
                                        <th scope="col">Ngày Đăng</th>
                                        <th scope="col">Danh Mục</th>
                                        <th scope="col">Chuyên Ngành</th>
                                        <th scope="col">Trạng Thái</th>
                                        <th scope="col" class="text-center">Hành Động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="tailieu" items="${listTaiLieu}" varStatus="loop">
                                        <tr>
                                            <td>${tailieu.maTaiLieu}</td>
                                            <td class="truncate-text-admin">${tailieu.tieuDe}</td>
                                            <td class="truncate-text-admin">${tailieu.moTa}</td>
                                            <td>${tenNguoiDung[loop.index]}</td>
                                            <td>${tailieu.ngayTaiLen}</td>
                                            <td>${tenDanhMuc[loop.index]}</td>
                                            <td>${tenChuyenNganh[loop.index]}</td>
                                            <td>${tenTrangThai[loop.index]}</td>
                                            <td class="text-center">
                                                <button class="btn btn-sm btn-outline-info me-2" style="width: 30px;height: 30px">
                                                    <i class="fas fa-info"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- Phân trang -->
                                <div class="d-flex justify-content-center">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <c:if test="${currentPage > 0}">
                                                <li class="page-item">
                                                    <a class="page-link" href="?page=${currentPage - 1}&size=${size}" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                    <a class="page-link" href="?page=${i}&size=${size}">${i + 1}</a>
                                                </li>
                                            </c:forEach>
                                            <c:if test="${currentPage < totalPages - 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="?page=${currentPage + 1}&size=${size}" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer text-center">
            Copyright © 2024. Designed by Phan Đức
        </footer>
    </div>
</div>


<script src="/assets/plugins/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="/assets/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script src="js/app-style-switcher.js"></script> -->
<script src="/js/custom.js"></script>
<!--This page JavaScript -->
</body>

</html>