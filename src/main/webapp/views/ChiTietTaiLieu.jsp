<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


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

    <div class="container-fluid main">
        <div class="row">
            <div class="col-12 col-lg-9 ">
                <h5 class="text-center">${taiLieu.tieuDe}</h5>
                <div class="card">
                    <div class="row g-0">
                        <div class="col-5 d-flex align-items-center">
                            <div class="ms-3">
                                <img src="${docImage}" class="img-fluid rounded-start me-3" alt="Avatar" style="max-width: 50px">
                            </div>
                            <div>
                                <p class="card-text m-0">Tải lên: ${nguoiTaiLen}</p>
                                <a href="#" class="btn btn-outline-danger btn-sm mt-1 cursor-pointer">Báo cáo tài liệu</a>
                            </div>
                        </div>

                        <div class="col-7 d-flex align-items-center">
                            <div class="document-stats">
                                <span class="eye-icon"><i class="bi bi-eye fs-5 me-2"></i>${taiLieu.getSoLuotTruyCap()}</span>
                                <span class="ms-5 download-count"><i class="bi bi-download fs-5 me-2"></i>${ taiLieu.getSoLuotTaiXuong()}</span>
                            </div>
                            <div class="card-body d-flex justify-content-end align-items-center">
                                <h6 class="card-title mb-0 me-3 p-2 border border-2 rounded text-secondary">
                                    Yêu thích
                                </h6>
                                <a href="${urlDoc}" id="downloadBtn" class="btn btn-warning p-2 text-white" data-id="${maTaiLieu}">Tải xuống</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="container" style="max-width: none;">
                            <div class="row justify-content-center">
                                <div class="col-12">
                                    <div class="pdf-container">
                                        <c:choose>
                                            <c:when test="${fn:endsWith(taiLieu.duongDanTep, '.pdf')}">
                                                <embed src="${taiLieu.duongDanTep}" type="application/pdf">
                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="w-100" style="height: 500px" c:if="${fn:endsWith(taiLieu.duongDanTep, '.docx')}">${fileContent}</textarea>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mt-4 ps-4">
                    <h5>Xếp hạng và đánh giá</h5>
                    <div class="rating-stars ms-1" id="rating-stars">
                        <span class="bi bi-star fs-3 " data-rating="1" title="Rất tệ"></span>
                        <span class="bi bi-star fs-3 mx-1" data-rating="2" title="Không tốt"></span>
                        <span class="bi bi-star fs-3 mx-1" data-rating="3" title="Bình thường"></span>
                        <span class="bi bi-star fs-3 mx-1" data-rating="4" title="Tốt"></span>
                        <span class="bi bi-star fs-3 mx-1" data-rating="5" title="Rất tốt"></span>
                    </div>

                    <form class="d-none" id="comment-form" action="/document/addcomment" method="post">
                        <input type="hidden" id="rating-input" name="rating">
                        <input type="hidden" name="maTaiLieu" value="${taiLieu.getMaTaiLieu()}">
                        <div class="my-2">
                            <textarea class="form-control border border-secondary rounded" name="comment" id="comment" rows="3" placeholder="Viết bình luận..."></textarea>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-outline-secondary px-3 text-dark rounded-pill me-2">Hủy</button>
                            <button type="submit" class="btn btn-success px-5 rounded-pill" onclick="setRating()">Gửi</button>
                        </div>
                    </form>
                </div>
                <div class="mt-4 ps-4">
                    <h5>Bình luận của người khác</h5>
                    <div class="comments mt-3">
                        <c:forEach var="binhLuan" items="${binhLuans}" varStatus="loop">
                            <div class="d-flex my-2">
                                <img src="${anhNguoiBinhLuans[loop.index]}" alt="Avatar" class="avatar me-3 rounded-pill" style="width: 50px; height: 50px; object-fit: contain;">
                                <div class="w-100">
                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                        <h6 class="fw-bold mb-1">${hoTenNguoiBinhLuans[loop.index]}</h6>
                                        <%@ include file="ui/format_time.jsp" %>
                                    </div>

                                    <div class="d-flex align-items-center mb-1">
                                        <div class="rating-stars">
                                            <c:forEach var="i" begin="1" end="5">
                                                <svg height="30px" width="30px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="-5.39 -5.39 64.65 64.65" xml:space="preserve" fill="#FFD700" stroke="#FFD700" transform="matrix(1, 0, 0, 1, 0, 0)">
                                                    <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                                                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC" stroke-width="0.430936"></g>
                                                    <g id="SVGRepo_iconCarrier">
                                                        <polygon class="${i > giaTriDanhGias[loop.index] ? 'star-hidden' : ''}" style="fill:#FFD700; stroke:#FFD700;" points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "></polygon>
                                                    </g>
                                                </svg>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <p>${binhLuan.noiDung}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
            <div class="col-3 d-none d-lg-block">
                <h5 class="text-center">Tài liệu Người dùng</h5>
                <ul class="list-group">
                    <c:forEach var="taiLieu" items="${taiLieusByUploader}" varStatus="loop">
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
                            <a href="/document/${taiLieu.maTaiLieu}" class="text-start truncate-text flex items-start p-0">
                                    ${taiLieu.tieuDe}
                            </a>
                        </li>
                    </c:forEach>
                </ul>

            </div>
        </div>
    </div>

    <footer>
        <div class="p-3 text-center bg-light text-danger fw-bold fs-6 mt-5">
            Copyright © 2024. Designed by Phan Đức
        </div>
    </footer>
    <script src="/js/reviewcomment.js"></script>
    <script src="/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('downloadBtn').addEventListener('click', function(event) {
            event.preventDefault(); // Prevent the default action of the link

            // Get the document ID from the data attribute
            const maTaiLieu = this.getAttribute('data-id');
            const urlDoc = this.getAttribute('href');

            // Send an AJAX request to increment the download count
            fetch(`/document/download/${maTaiLieu}`, {
                method: 'POST'
            })
                .then(response => {
                    if (response.ok) {
                        // If the increment is successful, proceed with the download
                        window.location.href = urlDoc;
                    } else {
                        console.error('Failed to increment download count');
                    }
                })
                .catch(error => console.error('Error:', error));
        });
    </script>


</body>

</html>