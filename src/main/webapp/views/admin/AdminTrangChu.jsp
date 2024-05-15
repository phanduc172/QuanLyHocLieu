<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý học liệu - Trường Đại học Khoa học Huế</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="/css/style.min.css" rel="stylesheet">
    <link href="/css/reponsive.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>\
<style>
    .hover-cell:hover {
        background-color: #f0f0f0;
        transition: background-color 0.3s;
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
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="${loggedInAdmin.anh}" alt="user" class="profile-pic me-2">${loggedInAdmin.hoTen}
                            </a>
                            <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdown">
                                <li ><a class="dropdown-item" href="/admin/logout" id="logoutBtn">Đăng xuất</a></li>
                            </ul>
                        </div>
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
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/profile/${loggedInAdmin.maNguoiDung}" aria-expanded="false">
                            <i class="me-3 fas fa-user" aria-hidden="true"></i>
                            <span class="hide-menu">Hồ sơ người dùng</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/document/approve" aria-expanded="false">
                            <i class="me-3 fas fa-check-circle" aria-hidden="true"></i>
                            <span class="hide-menu">Phê duyệt Tài liệu</span>
                        </a>
                    </li>
                    <ul>
                        <!-- Mục Quản lý -->
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link hide-below-1168" data-bs-toggle="collapse" href="#manageItems" aria-expanded="false" aria-controls="manageItems">
                                <i class="me-3 fas fa-cogs" aria-hidden="true"></i>
                                <span class="hide-menu">Quản lý</span>
                                <i class="fas fa-chevron-down ms-auto"></i>
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
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/document/approve/reject">
                                            <i class="fas fa-times-circle me-3" aria-hidden="true"></i>
                                            <span class="hide-menu">Tài liệu từ chối</span>
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
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="dashboard/error" aria-expanded="false">
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
                    <h3 class="page-title mb-0 p-0">Bảng điều khiển</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/dashboard">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Bảng điều khiển</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title text-center">Số lượng tải liệu tải lên theo ngày</h4>
                            <canvas id="myChartDocument" width="800" height="400"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title text-center">Thống kê hoạt động theo ngày</h4>
                            <canvas id="myChartActivity" width="800" height="400"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title text-center">Thống kê số lượng</h4>
                            <div class="table-responsive">
                                <table class="table user-table">
                                    <thead>
                                    <tr class="text-center">
                                        <th></th>
                                        <th class="border-top-0 fs-5">Người dùng</th>
                                        <th class="border-top-0 fs-5">Tài liệu</th>
                                        <th class="border-top-0 fs-5">Khoa</th>
                                        <th class="border-top-0 fs-5">Chuyên ngành</th>
                                        <th class="border-top-0 fs-5">Thể loại</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="text-center">
                                        <td>Tổng số:</td>
                                        <td class="border-top-0 hover-cell"><a class="px-4 text-dark" href="/manager/user/list">${totalNguoiDung}</a></td>
                                        <td class="border-top-0 hover-cell"><a class="px-4 text-dark" href="/manager/tailieu">${totalTaiLieu}</a></td>
                                        <td class="border-top-0 hover-cell"><a class="px-4 text-dark" href="/manager/khoachuyennganh">${totalKhoa}</a></td>
                                        <td class="border-top-0 hover-cell"><a class="px-4 text-dark" href="/manager/khoachuyennganh">${totalChuyenNganh}</a></td>
                                        <td class="border-top-0 hover-cell"><a class="px-4 text-dark" href="/manager/danhmuc">${totalDanhMuc}</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-md-flex">
                                <h4 class="card-title col-md-10 mb-md-0 mb-3 align-self-center">Projects of the Month</h4>
                                <div class="col-md-2 ms-auto">
                                    <select class="form-select shadow-none col-md-2 ml-auto">
                                        <option selected>January</option>
                                        <option value="1">February</option>
                                        <option value="2">March</option>
                                        <option value="3">April</option>
                                    </select>
                                </div>
                            </div>
                            <div class="table-responsive mt-5">
                                <table class="table stylish-table no-wrap">
                                    <thead>
                                    <tr>
                                        <th class="border-top-0" colspan="2">Assigned</th>
                                        <th class="border-top-0">Name</th>
                                        <th class="border-top-0">Budget</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td style="width:50px;"><span class="round">S</span></td>
                                        <td class="align-middle">
                                            <h6>Sunil Joshi</h6><small class="text-muted">Web Designer</small>
                                        </td>
                                        <td class="align-middle">Elite Admin</td>
                                        <td class="align-middle">$3.9K</td>
                                    </tr>
                                    <tr class="active">
                                        <td><span class="round"><img src="../assets/images/users/2.jpg"
                                                                     alt="user" width="50"></span></td>
                                        <td class="align-middle">
                                            <h6>Andrew</h6><small class="text-muted">Project Manager</small>
                                        </td>
                                        <td class="align-middle">Real Homes</td>
                                        <td class="align-middle">$23.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-success">B</span></td>
                                        <td class="align-middle">
                                            <h6>Bhavesh patel</h6><small class="text-muted">Developer</small>
                                        </td>
                                        <td class="align-middle">MedicalPro Theme</td>
                                        <td class="align-middle">$12.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-primary">N</span></td>
                                        <td class="align-middle">
                                            <h6>Nirav Joshi</h6><small class="text-muted">Frontend Eng</small>
                                        </td>
                                        <td class="align-middle">Elite Admin</td>
                                        <td class="align-middle">$10.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-warning">M</span></td>
                                        <td class="align-middle">
                                            <h6>Micheal Doe</h6><small class="text-muted">Content Writer</small>
                                        </td>
                                        <td class="align-middle">Helping Hands</td>
                                        <td class="align-middle">$12.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-danger">N</span></td>
                                        <td class="align-middle">
                                            <h6>Johnathan</h6><small class="text-muted">Graphic</small>
                                        </td>
                                        <td class="align-middle">Digital Agency</td>
                                        <td class="align-middle">$2.6K</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <img class="card-img-top img-responsive" src="../assets/images/big/img1.jpg" alt="Card">
                        <div class="card-body">
                            <ul class="list-inline d-flex align-items-center">
                                <li class="ps-0">20 May 2021</li>
                                <li class="ms-auto"><a href="javascript:void(0)" class="link">3 Comment</a></li>
                            </ul>
                            <h3 class="font-normal">Featured Hydroflora Pots Garden &amp; Outdoors</h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <img class="card-img-top img-responsive" src="../assets/images/big/img2.jpg" alt="Card">
                        <div class="card-body">
                            <ul class="list-inline d-flex align-items-center">
                                <li class="ps-0">20 May 2021</li>
                                <li class="ms-auto"><a href="javascript:void(0)" class="link">3 Comment</a></li>
                            </ul>
                            <h3 class="font-normal">Featured Hydroflora Pots Garden &amp; Outdoors</h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <img class="card-img-top img-responsive" src="../assets/images/big/img4.jpg" alt="Card">
                        <div class="card-body">
                            <ul class="list-inline d-flex align-items-center">
                                <li class="ps-0">20 May 2021</li>
                                <li class="ms-auto"><a href="javascript:void(0)" class="link">3 Comment</a></li>
                            </ul>
                            <h3 class="font-normal">Featured Hydroflora Pots Garden &amp; Outdoors</h3>
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
    <script src="/assets/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/custom.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="/js/chart.js"></script>


    <c:choose>
        <c:when test="${sessionScope.loggedInAdmin != null}">
            <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content border border-3 rounded-circle" style="width: 300px; height: 300px;">
                        <div class="modal-body d-flex justify-content-center align-items-center p-0">
                            <div class="text-success text-center p-0 mb-4">
                                <i class="bi bi-check-circle icon-login"></i>
                                <h2 class="text-center mt-2 fw-bold">Đăng nhập <br> thành công!</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="modal fade" id="failureModal" tabindex="-1" aria-labelledby="failureModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content border border-3 rounded-circle" style="width: 300px; height: 300px;">
                        <div class="modal-body d-flex justify-content-center align-items-center p-0">
                            <div class="text-danger text-center p-0 mb-4">
                                <i class="bi bi-exclamation-circle icon-login"  style="font-size: 45px"></i>
                                <h2 class="text-center mt-2 fw-bold">Đăng nhập thất bại!</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <script>
        $(document).ready(function() {
            var statusLogin = new URLSearchParams(window.location.search).get("statusLogin");
            if (statusLogin === "true") {
                $('#successModal').modal('show');
            } else if (statusLogin === "false") {
                $('#failureModal').modal('show');
            }
            setTimeout(function() {
                $('#successModal, #failureModal').modal('hide');
            }, 800);
        });
    </script>
</body>

</html>