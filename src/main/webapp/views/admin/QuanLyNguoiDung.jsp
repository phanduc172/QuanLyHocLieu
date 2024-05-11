<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/images/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <!-- Custom CSS -->
    <link href="/css/style.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
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
                <a class="navbar-brand" href="/dashboard/">
                    <span class="logo-text ms-3">
                            <img src="/assets/images/PD.png" alt="homepage" class="dark-logo" style="width: 100px;"/>
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
                            <img src="/assets/images/avt.png" alt="user" class="profile-pic me-2">Phan Đức
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
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="AdminProfile.jsp" aria-expanded="false">
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
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../Error404.jsp" aria-expanded="false">
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
                    <h3 class="page-title mb-0 p-0">Quản lý người dùng</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/dashboard">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Danh sách người dùng</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <!-- column -->
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Danh sách người dùng</h4>
                            <div class="table-responsive">
                                <table class="table user-table no-wrap" >
                                    <thead>
                                        <tr>
                                            <th class="border-top-0">ID</th>
                                            <th class="border-top-0">Tên tài khoản</th>
                                            <th class="border-top-0">Họ tên</th>
                                            <th class="border-top-0">Email</th>
                                            <th class="border-top-0 text-center">Mật khẩu</th>
                                            <th class="border-top-0 text-center">ID vai trò</th>
                                            <th class="border-top-0 text-center">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="ndung" items="${nguoiDung}">
                                        <tr>
                                            <td>${ndung.maNguoiDung}</td>
                                            <td>${ndung.tenNguoiDung}</td>
                                            <td>${ndung.hoTen}</td>
                                            <td>${ndung.email}</td>
                                            <td class="text-center">
                                                <span class="password-hidden d-none">${ndung.matKhau}</span>
                                                <button class="btn btn-sm btn-outline-secondary show-password-btn" style="width: 30px;height: 30px">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </td>
                                            <td class="text-center">${ndung.maVaiTro}</td>
                                            <td class="text-center">
                                                <button class="btn btn-sm btn-outline-info me-2" style="width: 30px;height: 30px">
                                                    <i class="fas fa-info"></i>
                                                </button>
                                                <button type="button" data-bs-toggle="modal" data-bs-target="#modalUpdateUser" class="btnEditUser btn btn-sm btn-outline-warning me-2"
                                                        data-userid="${ndung.maNguoiDung}"
                                                        data-username="${ndung.tenNguoiDung}"
                                                        data-fullname="${ndung.hoTen}"
                                                        data-email="${ndung.email}"
                                                        data-password="${ndung.matKhau}"
                                                        data-roleid="${ndung.maVaiTro}"
                                                        style="width: 30px;height: 30px">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button type="button" data-bs-toggle="modal" data-bs-target="#modalDeleteUser" class="btn btn-sm btn-outline-danger me-2" data-userid="${ndung.maNguoiDung}" style="width: 30px; height: 30px">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="d-flex justify-content-center mt-4">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                                            <a class="page-link" href="/manager/user/list?page=${currentPage - 1}&size=${size}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach begin="0" end="${totalPages - 1}" var="pageNum">
                                            <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="/manager/user/list?page=${pageNum}&size=${size}">${pageNum + 1}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                                            <a class="page-link" href="/manager/user/list?page=${currentPage + 1}&size=${size}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>

                            <%--Model Cập nhật người dùng--%>
                            <div class="modal fade" id="modalUpdateUser" tabindex="-1" aria-labelledby="modalUpdateUserLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content p-2 border border-2" style="border-radius: 25px">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="modalUpdateUserLabel">Cập nhật thông tin người dùng</h5>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Form cập nhật thông tin người dùng -->
                                            <form id="updateUserForm" action="/manager/update" method="post">
                                                <input type="hidden" id="updateUserId" name="maNguoiDung">
                                                <div class="mb-3">
                                                    <label for="updateUsername" class="form-label">Tên tài khoản</label>
                                                    <input type="text" class="form-control" id="updateUsername" name="updateUsername" placeholder="Nhập tên tài khoản">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="updateFullName" class="form-label">Họ và tên</label>
                                                    <input type="text" class="form-control" id="updateFullName" name="updateFullName" placeholder="Nhập họ và tên">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="updateEmail" class="form-label">Email</label>
                                                    <input type="email" class="form-control" id="updateEmail" name="updateEmail" placeholder="Nhập email">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="updatePassword" class="form-label">Mật khẩu</label>
                                                    <input type="text" class="form-control" id="updatePassword" name="updatePassword" placeholder="Nhập mật khẩu">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="updateRoleId" class="form-label">ID vai trò</label>
                                                    <input type="text" class="form-control" id="updateRoleId" name="updateRoleId" placeholder="Nhập ID vai trò">
                                                </div>
                                                <div class="text-end">
                                                    <button type="button" class="btn btn-outline-secondary me-2" data-bs-dismiss="modal">Đóng</button>
                                                    <button type="submit" class="btn btn-info text-white">Cập nhật</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--Modal Xác nhận xóa người dùng--%>
                            <div class="modal fade" id="modalDeleteUser" tabindex="-1" aria-labelledby="modalDeleteUserLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận xóa</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <!-- Modal Body -->
                                        <div class="modal-body">
                                            Bạn có chắc chắn muốn xóa không?
                                        </div>
                                        <!-- Modal Footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy</button>
                                            <button type="button" id="confirmDeleteButton" class="btn btn-danger text-white">Xác nhận</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Hiển thị modal thông báo khi cập nhật thành công -->
                            <div class="modal fade" id="updateSuccessModal" tabindex="-1" aria-labelledby="updateSuccessModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content border">
                                        <div class="modal-header bg-custom-blue text-white">
                                            <h5 class="modal-title" id="updateSuccessModalLabel">Chỉnh sửa thành công</h5>
                                        </div>
                                        <div class="modal-body">
                                            <div class="fs-5">
                                                Thông tin người dùng đã được cập nhật thành công.
                                            </div>
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

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const showPasswordBtns = document.querySelectorAll('.show-password-btn');
                showPasswordBtns.forEach(function(btn) {
                    btn.addEventListener('click', function() {
                        const passwordSpan = this.parentNode.querySelector('.password-hidden');
                        passwordSpan.classList.toggle('d-none');
                    });
                });
            });
        </script>



        <script>
            document.addEventListener("DOMContentLoaded", function() {
                const urlParams = new URLSearchParams(window.location.search);
                const updateSuccess = urlParams.get('updateSuccess');
                if (updateSuccess === 'true') {
                    var myModal = new bootstrap.Modal(document.getElementById('updateSuccessModal'));
                    myModal.show();
                    // Tắt modal sau 3 giây
                    setTimeout(function() {
                        myModal.hide();
                    }, 2000);
                }
            });
        </script>



        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var deleteButtons = document.querySelectorAll("[data-bs-target='#modalDeleteUser']");
                deleteButtons.forEach(function(button) {
                    button.addEventListener("click", function() {
                        var userId = button.getAttribute("data-userid");
                        var confirmDeleteButton = document.getElementById("confirmDeleteButton");
                        confirmDeleteButton.setAttribute("data-userid", userId);
                    });
                });
                var confirmDeleteButton = document.getElementById("confirmDeleteButton");
                confirmDeleteButton.addEventListener("click", function() {
                    var userId = confirmDeleteButton.getAttribute("data-userid");
                    fetch("/dashboard/delete/" + userId, {
                        method: "DELETE"
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Xóa người dùng không thành công");
                            }
                            console.log("Xóa người dùng thành công");
                            var modal = document.getElementById("modalDeleteUser");
                            var modalInstance = bootstrap.Modal.getInstance(modal);
                            modalInstance.hide();
                            window.location.reload();
                        })
                        .catch(error => {
                            console.error("Lỗi khi xóa người dùng:", error);
                            window.location.reload();
                        });
                });
            });
        </script>
    </div>
</div>
<script src="/js/admin.js"></script>
<script src="/assets/plugins/jquery/dist/jquery.min.js"></script>
<script src="/assets/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/custom.js"></script>

</body>

</html>