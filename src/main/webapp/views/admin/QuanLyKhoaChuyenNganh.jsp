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
                <a class="navbar-brand" href="index.html">
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
                            <input type="text" class="form-control" placeholder="Tìm kiếm...">
                            <a class="srh-btn"><i class="ti-search"></i></a>
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
                                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/manager/comment" aria-expanded="false">
                                            <i class="me-3 fas fa-comments" aria-hidden="true"></i>
                                            <span class="hide-menu">Bình luận & Đánh giá</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/dashboard/error" aria-expanded="false">
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
                    <h3 class="page-title mb-0 p-0">Quản lý Khoa | Chuyên ngành</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/dashboard/">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Danh sách Khoa | Chuyên ngành</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="card-title m-0">Khoa</h4>
                                <button type="button" class="btn btn-info text-white" data-bs-toggle="modal" data-bs-target="#themKhoa">Thêm Khoa</button>
                            </div>
                            <%--Model Thêm Khoa--%>
                            <div class="modal fade" id="themKhoa" tabindex="-1" aria-labelledby="themKhoaModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header bg-info text-white">
                                            <h5 class="modal-title" id="themKhoaModalLabel">Thêm Khoa</h5>
                                        </div>
                                        <div class="modal-body">
                                            <form id="themKhoaForm" action="/manager/khoa/addkhoa" method="post">
                                                <div class="mb-3">
                                                    <label for="tenKhoa" class="form-label">Tên khoa:</label>
                                                    <input type="text" class="form-control" id="tenKhoa" name="tenKhoa">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" form="themKhoaForm" class="btn btn-info text-white">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table user-table no-wrap">
                                    <thead>
                                    <tr class="text-center">
                                        <th class="border-top-0 fs-5 w-25">ID</th>
                                        <th class="border-top-0 fs-5">Khoa</th>
                                        <th class="border-top-0 fs-5">Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="khoa" items="${listKhoa}">
                                        <tr>
                                            <td class="text-center">${khoa.maKhoa}</td>
                                            <td>${khoa.tenKhoa}</td>
                                            <td class="text-center">
                                                <button class="btn btn-sm btn-outline-info me-2" style="width: 30px; height: 30px" data-bs-toggle="modal" data-bs-target="#capNhatKhoaModal" data-ma-khoa="${khoa.maKhoa}" data-ten-khoa="${khoa.tenKhoa}">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button id="btnXoa" class="btn btn-sm btn-outline-danger me-2" data-id="${khoa.maKhoa}" style="width: 30px; height: 30px" data-bs-toggle="modal" data-bs-target="#xoaKhoaModal">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- Modal Xác nhận xóa Khoa-->
                            <div class="modal fade" id="xoaKhoaModal" tabindex="-1" aria-labelledby="xoaKhoaModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="xoaKhoaModalLabel">Xóa Khoa</h5>
                                        </div>
                                        <div class="modal-body">
                                            Bạn có chắc chắn muốn xóa khoa này không?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
                                            <button type="button" class="btn btn-sm btn-danger text-white" id="btnXacNhanXoa">Xác nhận</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="capNhatKhoaModal" tabindex="-1" aria-labelledby="capNhatKhoaModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="capNhatKhoaModalLabel">Cập Nhật Khoa</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="formCapNhatKhoa" action="/manager/khoa/update" method="POST">
                                                <input type="hidden" id="maKhoa" name="maKhoa">
                                                <div class="mb-3">
                                                    <label for="tenKhoa" class="form-label">Tên Khoa:</label>
                                                    <input type="text" class="form-control" id="updateTenKhoa" name="tenKhoa">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
                                            <button type="submit" form="formCapNhatKhoa" class="btn btn-info text-white">Cập nhật</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center">
                                    <c:if test="${totalPagesKhoa > 1}">
                                        <c:if test="${currentPageKhoa > 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="?khoaPage=${currentPageKhoa - 1}&chuyenNganhPage=${currentPageChuyenNganh}&size=${size}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:forEach var="page" begin="0" end="${totalPagesKhoa - 1}">
                                            <li class="page-item">
                                                <c:if test="${currentPageKhoa eq page}">
                                                    <span class="page-link">${page + 1}</span>
                                                </c:if>
                                                <c:if test="${currentPageKhoa ne page}">
                                                    <a class="page-link" href="?khoaPage=${page}&chuyenNganhPage=${currentPageChuyenNganh}&size=${size}">${page + 1}</a>
                                                </c:if>
                                            </li>
                                        </c:forEach>

                                        <c:if test="${currentPageKhoa < totalPagesKhoa - 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="?khoaPage=${currentPageKhoa + 1}&chuyenNganhPage=${currentPageChuyenNganh}&size=${size}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="card-title m-0">Chuyên ngành</h4>
                                <button type="button" class="btn btn-info text-white" data-bs-toggle="modal" data-bs-target="#themChuyenNganh">Thêm Chuyên ngành</button>
                            </div>
                            <div class="table-responsive">
                                <table class="table user-table no-wrap">
                                    <thead>
                                    <tr class="text-center">
                                        <th class="border-top-0 w-25 fs-5">ID</th>
                                        <th class="border-top-0 fs-5">Chuyên ngành</th>
                                        <th class="border-top-0 fs-5">Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="chuyennganh" items="${listChuyenNganh}">
                                        <tr>
                                            <td>${chuyennganh.maChuyenNganh}</td>
                                            <td>${chuyennganh.tenChuyenNganh}</td>
                                            <td>
                                                <button type="button" class="btn btn-sm btn-outline-info me-2" style="width: 30px; height: 30px" data-bs-toggle="modal" data-bs-target="#capNhatChuyenNganhModal" data-ma-chuyen-nganh="${chuyennganh.maChuyenNganh}" data-ten-chuyen-nganh="${chuyennganh.tenChuyenNganh}">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-sm btn-outline-danger me-2 btn-xoa-chuyen-nganh" data-maChuyenNganh="${chuyennganh.maChuyenNganh}" style="width: 30px; height: 30px" data-bs-toggle="modal" data-bs-target="#xoaChuyenNganhModal">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty listChuyenNganh}">
                                        <tr>
                                            <td colspan="3" class="text-center">Không có dữ liệu.</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <!-- Modal Xóa Chuyên Ngành -->
                            <div class="modal fade" id="xoaChuyenNganhModal" tabindex="-1" aria-labelledby="xoaChuyenNganhModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="xoaChuyenNganhModalLabel">Xóa Chuyên ngành</h5>
                                        </div>
                                        <div class="modal-body">
                                            Bạn có chắc chắn muốn xóa chuyên ngành này không?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
                                            <button type="button" class="btn btn-sm btn-danger text-white" id="btnXacNhanXoaChuyenNganh">Xác nhận</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--Modal Thêm Chuyên ngành--%>
                            <div class="modal fade" id="themChuyenNganh" tabindex="-1" aria-labelledby="themChuyenNganhModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header bg-info text-white">
                                            <h5 class="modal-title" id="themChuyenNganhModalLabel">Thêm Chuyên ngành</h5>
                                        </div>
                                        <div class="modal-body">
                                            <form id="themChuyenNganhForm" action="/manager/chuyennganh/addchuyennganh" method="post">
                                                <div class="mb-3">
                                                    <label for="maChuyenNganh" class="form-label">Mã chuyên ngành:</label>
                                                    <input type="text" class="form-control" id="maChuyenNganh" name="maChuyenNganh">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="tenChuyenNganh" class="form-label">Tên chuyên ngành:</label>
                                                    <input type="text" class="form-control" id="tenChuyenNganh" name="tenChuyenNganh">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="maKhoa" class="form-label">Khoa:</label>
                                                    <select class="form-select" id="maKhoaCN" name="selectedMaKhoa" required>
                                                        <option value="" selected disabled>-- Chọn Khoa --</option>
                                                        <c:forEach items="${listKhoa}" var="khoa">
                                                            <option value="${khoa.maKhoa}">${khoa.tenKhoa}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <input type="hidden" id="selectedMaKhoa" name="selectedMaKhoa">
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" form="themChuyenNganhForm" class="btn btn-info text-white">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- Modal Cập Nhật Chuyên Ngành --%>
                            <div class="modal fade" id="capNhatChuyenNganhModal" tabindex="-1" aria-labelledby="capNhatChuyenNganhModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header bg-info text-white">
                                            <h5 class="modal-title" id="capNhatChuyenNganhModalLabel">Cập Nhật Chuyên Ngành</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="capNhatChuyenNganhForm" action="/manager/chuyennganh/update" method="post">
                                                <div class="mb-3">
                                                    <label for="updateMaChuyenNganh" class="form-label">Mã chuyên ngành:</label>
                                                    <input type="text" class="form-control" id="updateMaChuyenNganh" name="maChuyenNganh" readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="updateTenChuyenNganh" class="form-label">Tên chuyên ngành:</label>
                                                    <input type="text" class="form-control" id="updateTenChuyenNganh" name="tenChuyenNganh" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="updateMaKhoa" class="form-label">Khoa:</label>
                                                    <select class="form-select" id="updateMaKhoa" name="selectedMaKhoa" required>
                                                        <option value="" selected disabled>-- Chọn Khoa --</option>
                                                        <c:forEach items="${listKhoa}" var="khoa">
                                                            <option value="${khoa.maKhoa}">${khoa.tenKhoa}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" form="capNhatChuyenNganhForm" class="btn btn-info text-white">Cập Nhật</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center">
                                    <c:if test="${totalPagesChuyenNganh > 1}">
                                        <c:if test="${currentPageChuyenNganh > 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="?khoaPage=${currentPageKhoa}&chuyenNganhPage=${currentPageChuyenNganh - 1}&size=${size}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach var="page" begin="0" end="${totalPagesChuyenNganh - 1}">
                                            <li class="page-item">
                                                <c:if test="${currentPageChuyenNganh eq page}">
                                                    <span class="page-link">${page + 1}</span>
                                                </c:if>
                                                <c:if test="${currentPageChuyenNganh ne page}">
                                                    <a class="page-link" href="?khoaPage=${currentPageKhoa}&chuyenNganhPage=${page}&size=${size}">${page + 1}</a>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${currentPageChuyenNganh < totalPagesChuyenNganh - 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="?khoaPage=${currentPageKhoa}&chuyenNganhPage=${currentPageChuyenNganh + 1}&size=${size}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:if>
                                </ul>
                            </nav>
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
    <script src="/js/admin.js"></script>

    <script>
        $(document).ready(function() {
            $('#maKhoaCN').change(function() {
                var selectedMaKhoa = $(this).val();
                $('#selectedMaKhoa').val(selectedMaKhoa);
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $('#xoaKhoaModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var maKhoa = button.data('id');
                var confirmBtn = $(this).find('.modal-footer .btn-danger');
                confirmBtn.click(function () {
                    $.ajax({
                        type: "DELETE",
                        url: "/manager/khoa/delete/" + maKhoa,
                        success: function (response) {
                            $('#xoaKhoaModal').modal('hide');
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            console.log(error);
                        }
                    });
                });
            });
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let maChuyenNganhToDelete;

            // Lắng nghe sự kiện click trên tất cả các nút xóa
            document.querySelectorAll(".btn-xoa-chuyen-nganh").forEach(button => {
                button.addEventListener("click", function() {
                    maChuyenNganhToDelete = this.getAttribute("data-maChuyenNganh");
                });
            });

            // Lắng nghe sự kiện click trên nút "Xác nhận" trong modal
            document.getElementById("btnXacNhanXoaChuyenNganh").addEventListener("click", function() {
                console.log(maChuyenNganhToDelete);
                // Gửi yêu cầu xóa chuyên ngành đến server
                fetch("/manager/chuyennganh/delete/" + maChuyenNganhToDelete, {
                    method: "DELETE"
                })
                    .then(function(response) {
                        if (response.ok) {
                            window.location.reload();
                        } else {
                            alert("Đã xảy ra lỗi khi xóa chuyên ngành.");
                        }
                    })
                    .catch(function(error) {
                        console.error("Lỗi:", error);
                    });
            });
        });
    </script>



</body>

</html>