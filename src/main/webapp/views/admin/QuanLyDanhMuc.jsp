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
</head>

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
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" data-bs-toggle="collapse" href="#manageItems" aria-expanded="false" aria-controls="manageItems">
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
                    <h3 class="page-title mb-0 p-0">Quản lý Thể loại</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/dashboard/">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Danh sách Thể loại</li>
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
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="card-title m-0">Thể loại</h4>
                                <button type="button" class="btn btn-info text-white" data-bs-toggle="modal" data-bs-target="#themDanhMucModal">Thêm danh mục</button>
                            </div>
                            <!-- Modal Thêm Danh Mục -->
                            <div class="modal fade" id="themDanhMucModal" tabindex="-1" aria-labelledby="themDanhMucModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header bg-info text-white">
                                            <h5 class="modal-title" id="themDanhMucModalLabel">Thêm Danh Mục</h5>
                                        </div>
                                        <div class="modal-body">
                                            <form id="themDanhMucForm" action="/manager/danhmuc/addcategory" method="post">
                                                <div class="mb-3">
                                                    <label for="tenDanhMuc" class="form-label">Tên danh mục:</label>
                                                    <input type="text" class="form-control" id="tenDanhMuc" name="tenDanhMuc">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" form="themDanhMucForm" class="btn btn-info text-white">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table user-table no-wrap">
                                    <thead>
                                    <tr class="text-center">
                                        <th class="border-top-0 fs-5 w-25">ID</th>
                                        <th class="border-top-0 fs-5">Thể loại</th>
                                        <th class="border-top-0 fs-5">Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="danhmuc" items="${listDanhMuc}">
                                        <tr>
                                            <td class="text-center">${danhmuc.maDanhMuc}</td>
                                            <td>${danhmuc.tenDanhMuc}</td>
                                            <td class="text-center">
                                                <button class="btn btn-sm btn-outline-info me-2 btn-edit"  data-bs-toggle="modal" data-bs-target="#capNhatDanhMucModal" style="width: 30px; height: 30px"
                                                        data-id="${danhmuc.maDanhMuc}" data-nameCategory="${danhmuc.tenDanhMuc}">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button id="btnXoa" class="btn btn-sm btn-outline-danger me-2" data-id="${danhmuc.maDanhMuc}" style="width: 30px; height: 30px" data-bs-toggle="modal" data-bs-target="#xoaDanhMucModal">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Modal Xác nhận xóa-->
                            <div class="modal fade" id="xoaDanhMucModal" tabindex="-1" aria-labelledby="xoaDanhMucModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="xoaDanhMucModalLabel">Xóa Danh Mục</h5>
                                        </div>
                                        <div class="modal-body">
                                            Bạn có chắc chắn muốn xóa danh mục này không?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btm-sm btn-outline-secondary " data-bs-dismiss="modal">Hủy</button>
                                            <button type="button" class="btn btn-md btn-danger text-white w-25">Xác nhận</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal Cập nhật Danh mục -->
                            <div class="modal fade" id="capNhatDanhMucModal" tabindex="-1" aria-labelledby="capNhatDanhMucModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content" style="border-radius: 25px">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="capNhatDanhMucModalLabel">Cập Nhật Danh Mục</h5>
                                        </div>
                                        <div class="modal-body">
                                            <form id="formCapNhatDanhMuc" action="/manager/danhmuc/update" method="POST">
                                                <input type="hidden" id="maDanhMuc" name="maDanhMuc">
                                                <div class="mb-3">
                                                    <label for="tenDanhMuc" class="form-label">Tên Danh Mục:</label>
                                                    <input type="text" class="form-control" id="updatetenDanhMuc" name="tenDanhMuc">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-md btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
                                            <button type="submit" form="formCapNhatDanhMuc" class="btn btn-md btn-info text-white" id="btnCapNhat">Cập nhật</button>
                                        </div>
                                    </div>
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

<script src="/js/admin.js"></script>
<script src="/assets/plugins/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="/assets/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script src="js/app-style-switcher.js"></script> -->
<script src="/js/custom.js"></script>
<!--This page JavaScript -->
<script>
    $(document).ready(function () {
        $('#xoaDanhMucModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var maDanhMuc = button.data('id');
            var confirmBtn = $(this).find('.modal-footer .btn-danger');
            confirmBtn.click(function () {
                $.ajax({
                    type: "DELETE",
                    url: "/manager/danhmuc/delete/" + maDanhMuc,
                    success: function (response) {
                        $('#xoaDanhMucModal').modal('hide');
                        location.reload()
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                    }
                });
            });
        });
    });
</script>
</body>

</html>