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
</head>
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
                                <h4 class="card-title col-md-10 mb-md-0 mb-3 align-self-center">Tổng số tài liệu của người dùng</h4>
                            </div>
                            <div class="table-responsive mt-2">
                                <table class="table stylish-table no-wrap" id="userDataTable">
                                    <thead>
                                    <tr>
                                        <th class="border-top-0 w-25">Ảnh</th>
                                        <th class="border-top-0 w-50">Họ tên</th>
                                        <th class="border-top-0 w-25 text-center">Số lượng tài liệu</th>
                                    </tr>
                                    </thead>
                                    <tbody id="userDataBody">
                                    </tbody>
                                </table>
                            </div>
                            <div class="text-center mt-3">
                                <span id="pagination"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
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

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var currentPage = 0;
        var pageSize = 5; // Số lượng phần tử trên mỗi trang
        var totalPages = 0;

        function fetchData(page, size) {
            // Thực hiện yêu cầu API để lấy dữ liệu từ server
            fetch('http://localhost:8080/dashboard/api/soluongtailieu?page=' + page + '&size=' + size)
                .then(response => response.json())
                .then(data => {
                    // Sau khi nhận được dữ liệu, cập nhật bảng và phân trang
                    populateTable(data.content);
                    updatePagination(data.pageable.pageNumber, data.totalPages);
                })
                .catch(error => console.error('Error fetching data:', error));
        }

        function populateTable(data) {
            var tableBody = document.getElementById("userDataBody");
            tableBody.innerHTML = "";
            data.forEach(function(user) {
                var row = document.createElement("tr");
                row.innerHTML = "<td><span class='round'><img src='" + user.anh + "' alt='user' width='50'></span></td>" +
                    "<td class='align-middle'>" + user.hoTen + "</td>" +
                    "<td class='align-middle text-center'>" + user.soLuongTaiLieu + "</td>";
                tableBody.appendChild(row);
            });
        }

        function updatePagination(currentPage, totalPages) {
            var pagination = document.getElementById("pagination");
            pagination.innerHTML = "";

            // Thêm nút "Trang trước"
            var prevButton = createPaginationButton("<<", currentPage > 0, currentPage - 1);
            pagination.appendChild(prevButton);

            // Thêm các nút trang
            for (var i = 0; i < totalPages; i++) {
                var pageButton = createPaginationButton(i + 1, i !== currentPage, i);
                pagination.appendChild(pageButton);
            }

            // Thêm nút "Trang tiếp theo"
            var nextButton = createPaginationButton(">>", currentPage < totalPages - 1, currentPage + 1);
            pagination.appendChild(nextButton);
        }

        function createPaginationButton(label, isEnabled, page, isActive) {
            var button = document.createElement("button");
            button.classList.add("btn", "ms-2");
            if (isActive) {
                    button.classList.add("btn-outline-info", "text-white");
            } else {
                button.classList.add("btn-info","btn-info","text-white");
            }
            button.textContent = label;
            button.disabled = !isEnabled;

            button.addEventListener("click", function() {
                if (isEnabled) {
                    currentPage = page;
                    fetchData(currentPage, pageSize);
                }
            });

            return button;
        }


        // Gọi hàm fetchData() khi trang web được tải lần đầu
        fetchData(currentPage, pageSize);
    });


</script>





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