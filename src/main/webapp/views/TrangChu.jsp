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

<style>
  .sidebar-fixed {
    position: fixed;
    top: 0;
    bottom: 0;
    height: 100%;
    overflow-y: auto;
    padding-top: 56px; /* Điều chỉnh nếu cần thiết để tạo khoảng cách từ đầu trang */
    z-index: 1000; /* Đảm bảo sidebar luôn hiển thị trên nội dung chính */
  }

</style>


<body>
  <c:if test="${not empty messageRegister}">
    <script>
      alert("${messageRegister}");
    </script>
  </c:if>

  <c:if test="${not empty messageRegisterSuccess}">
    <script>
      alert("${messageRegisterSuccess}");
    </script>
  </c:if>

  <%@ include file="ui/modal_login.jsp" %>
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
  <div class="container-fluid main" >
    <div class="row">
      <div class="col-2 col-md-2 d-none d-lg-block bg-light sidebar-fixed mt-4">
        <h5 class="text-center fw-bold">Thể loại</h5>
        <c:forEach var="danhmuc" items="${danhMucs}">
          <ul class="list-group">
              <a class="text-decoration-none" href="/danhmuc/${danhmuc.maDanhMuc}">
                  <li class="list-group-item mt-2 ">
                    ${danhmuc.tenDanhMuc}
                  </li>
              </a>
          </ul>
        </c:forEach>
      </div>
      <div class="col-sm-12 col-md-12 col-lg-10 offset-lg-2 col-xl-8 offset-xl-2" style="min-height: 85vh">
        <!-- Display the login message if present -->
        <c:if test="${not empty messageLogin}">
          <div class="alert alert-danger">
              ${messageLogin}
          </div>
        </c:if>
        <div id="carouselMain" class="carousel slide mb-3" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="0" class="active"
              aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="1"
              aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="2"
              aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item">
              <img src="https://media.store123doc.com/images/event/event_upload_dissertation.jpg" class="d-block w-100" alt="..."
                style="height: 350px;">
            </div>
            <div class="carousel-item active">
              <img src="https://media.store123doc.com/images/web_2/cunghocvuidesktop-min2.jpg" class="d-block w-100" alt="..."
                style="height: 350px;">
            </div>
            <div class="carousel-item">
              <img src="https://media.store123doc.com/images/event/event_upload_dissertation.jpg" class="d-block w-100" alt="..."
                style="height: 350px;">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselMain"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselMain"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
        <h4 class="text-center my-4 fw-bold">${titleHome}</h4>
        <div class="row mt-2">
          <c:choose>
            <c:when test="${empty taiLieus}">
              <div class="">
                <br><br><br>
                <h4 class="text-center text-danger mt-3" style="font-weight: bold;">${message}</h4>
              </div>
            </c:when>
            <c:otherwise>
              <c:forEach var="tailieu" items="${taiLieus}">
                <div class="col-6 col-sm-6 col-md-4 col-xl-4 col-lg-4 col-xxl-3 mb-3">
                  <div class="d-flex justify-content-center">
                    <a class="text-decoration-none" href="/document/${tailieu.maTaiLieu}">
                      <div class="card p-1 docHover" style="width: 210px;height: 350px;">
                        <img src="${tailieu.anhTaiLieu}" class="card-img-top" alt="..." />
                        <div class="card-body">
                          <h5 class="card-title truncate-mota">${tailieu.tieuDe}</h5>
<%--                           <p class="card-text truncate-text">${tailieu.moTa}</p>--%>
                        </div>
                      </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </div>
        <%--Đoạn mã thực hiện phân trang--%>
        <c:if test="${not empty taiLieus}">
          <div class="d-flex justify-content-center mt-4">
            <nav aria-label="Page navigation">
              <ul class="pagination">
                <li class="page-item <c:if test="${currentPage == 0}">disabled</c:if>">
                  <c:choose>
                    <c:when test="${currentPage > 0}">
                      <a class="page-link" href="?page=${currentPage - 1}" tabindex="-1" aria-disabled="true"><i class="bi bi-chevron-double-left"></i></a>
                    </c:when>
                    <c:otherwise>
                      <span class="page-link"><i class="bi bi-chevron-double-left"></i></span>
                    </c:otherwise>
                  </c:choose>
                </li>
                <c:if test="${totalPages > 0}">
                  <c:forEach begin="0" end="${totalPages - 1}" var="pageNumber">
                    <li class="page-item <c:if test="${pageNumber == currentPage}">active</c:if>">
                      <a class="page-link" href="?page=${pageNumber}">${pageNumber + 1}</a>
                    </li>
                  </c:forEach>
                </c:if>
                <li class="page-item <c:if test="${currentPage == totalPages - 1}">disabled</c:if>">
                  <c:choose>
                    <c:when test="${currentPage < totalPages - 1}">
                      <a class="page-link" href="?page=${currentPage + 1}" tabindex="-1" aria-disabled="true"><i class="bi bi-chevron-double-right"></i></a>
                    </c:when>
                    <c:otherwise>
                      <span class="page-link"><i class="bi bi-chevron-double-right"></i></span>
                    </c:otherwise>
                  </c:choose>
                </li>
              </ul>
            </nav>
          </div>
        </c:if>
        <div class="row">
          <div class="col-lg-6">
            <h4 class="text-center my-4 fw-bold">Lượt tải xuống nhiều</h4>
            <div class="card">
              <ul class="list-group list-group-flush">
                <c:forEach var="tailieutop" items="${top10TaiLieus}">
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    <a class="text-decoration-none" href="/document/${tailieutop.maTaiLieu}">
                      <h6 class="card-title text-primary truncate-mota"><i class="bi bi-file-text text-dark"></i>
                          ${tailieutop.tieuDe}</h6>
                    </a>
                    <span class="badge bg-light-info text-dark rounded-pill"><i class="bi bi-download me-2"></i>${tailieutop.soLuotTaiXuong}</span>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <div class="col-lg-6">
            <h4 class="text-center my-4 fw-bold">Lượt tải xuống nhiều</h4>
            <div class="card">
              <div class="card">
                <ul class="list-group list-group-flush">
                  <c:forEach var="tailieudg" items="${top10DanhGia}">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                      <a class="text-decoration-none" href="/document/${tailieudg.maTaiLieu}">
                        <h6 class="card-title text-primary truncate-mota"><i class="bi bi-file-text text-dark"></i>
                            ${tailieudg.tieuDe}</h6>
                      </a>
                      <span class="badge rounded-pill text-dark"><i class="bi bi-star-fill me-2" style="color: gold"></i>${tailieudg.avgGiaTriDanhGia}</span>
                    </li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-2 d-none d-xl-block">
        <h5 class="text-center fw-bold">Hoạt động gần đây</h5>
        <ul class="list-group">
          <c:forEach var="hoatDong" items="${hoatDongGanDays}">
            <li class="list-group-item">
              <div class="d-flex align-items-center justify-content-center text-center">
                <img src="${anhNguoiDung[hoatDong.maHoatDong]}"
                     class="rounded-circle me-2 userAvatar" alt="Avatar">
                <div class="text-start">
                  <strong class="fs-6">${hoTenNguoiDung[hoatDong.maHoatDong]}</strong>
                  <p class="m-0" style="font-size: 14px; max-width: 200px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; white-space: normal;">${moTaHoatDong[hoatDong.maHoatDong]}</p>
                </div>
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>

  <div class="me-4 mb-4" style="position:fixed;right: 0;bottom: 0;">
    <a href="#" class="btn btn-success">
      <i class="bi bi-arrow-up fs-5"></i>
    </a>
  </div>
  <footer>
    <div class="p-3 text-center bg-light text-danger fw-bold fs-6 mt-4">
      Copyright © 2024. Designed by Phan Đức
    </div>
  </footer>

  <script src="/js/password.js"></script>
  <script src="/js/main.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>