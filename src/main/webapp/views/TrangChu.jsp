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
            <a class="nav-link" href="#">Giới thiệu</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Liên hệ</a>
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
      <div class="col-2 col-md-2 d-none d-lg-block">
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
      <div class="col-sm-12 col-md-12 col-lg-10 col-xl-8" style="min-height: 85vh">
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
                          <h5 class="card-title">${tailieu.tieuDe}</h5>
                            <%-- <p class="card-text truncate-text">${tailieu.moTa}</p> --%>
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
      </div>

      <div class="col-2 d-none d-xl-block">
        <h5 class="text-center fw-bold">Hoạt động gần đây</h5>
        <ul class="list-group">
          <c:forEach var="hoatDong" items="${hoatDongGanDays}">
            <li class="list-group-item">
              <div class="d-flex align-items-center justify-content-center text-center">
                <img src="${anhNguoiDung[hoatDong.maHoatDong]}"
                     class="rounded-circle me-2" width="40" height="40" alt="Avatar">
                <div class="text-start">
                  <strong class="fs-6">${hoTenNguoiDung[hoatDong.maHoatDong]}</strong>
                  <p class="m-0" style="font-size: 14px; max-width: 200px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; white-space: normal;">${moTaHoatDong[hoatDong.maHoatDong]}</p>
                </div>
              </div>
            </li>
          </c:forEach>
        </ul>

      <%--        <ul class="list-group">--%>
<%--          <li class="list-group-item">--%>
<%--            <div class="d-flex align-items-center justify-content-center text-center">--%>
<%--              <img--%>
<%--                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"--%>
<%--                class="rounded-circle me-2" width="50" height="50" alt="Avatar">--%>
<%--              <div>--%>
<%--                <strong>Người Dùng</strong>--%>
<%--                <p>Hoạt động 1</p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--          <li class="list-group-item">--%>
<%--            <div class="d-flex align-items-center justify-content-center text-center">--%>
<%--              <img--%>
<%--                      src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"--%>
<%--                      class="rounded-circle me-2" width="50" height="50" alt="Avatar">--%>
<%--              <div>--%>
<%--                <strong>Người Dùng</strong>--%>
<%--                <p>Hoạt động 1</p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--          <li class="list-group-item">--%>
<%--            <div class="d-flex align-items-center justify-content-center text-center">--%>
<%--              <img--%>
<%--                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"--%>
<%--                class="rounded-circle me-2" width="50" height="50" alt="Avatar">--%>
<%--              <div>--%>
<%--                <strong>Người Dùng</strong>--%>
<%--                <p>Hoạt động 1</p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--          <li class="list-group-item">--%>
<%--            <div class="d-flex align-items-center justify-content-center text-center">--%>
<%--              <img--%>
<%--                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"--%>
<%--                class="rounded-circle me-2" width="50" height="50" alt="Avatar">--%>
<%--              <div>--%>
<%--                <strong>Người Dùng</strong>--%>
<%--                <p>Hoạt động 1</p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--          <li class="list-group-item">--%>
<%--            <div class="d-flex align-items-center justify-content-center text-center">--%>
<%--              <img--%>
<%--                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"--%>
<%--                class="rounded-circle me-2" width="50" height="50" alt="Avatar">--%>
<%--              <div>--%>
<%--                <strong>Người Dùng</strong>--%>
<%--                <p>Hoạt động 1</p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--          <li class="list-group-item">--%>
<%--            <div class="d-flex align-items-center justify-content-center text-center">--%>
<%--              <img--%>
<%--                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"--%>
<%--                class="rounded-circle me-2" width="50" height="50" alt="Avatar">--%>
<%--              <div>--%>
<%--                <strong>Người Dùng</strong>--%>
<%--                <p>Hoạt động 1</p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--          <li class="list-group-item">--%>
<%--            <div class="d-flex align-items-center justify-content-center text-center">--%>
<%--              <img--%>
<%--                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"--%>
<%--                class="rounded-circle me-2" width="50" height="50" alt="Avatar">--%>
<%--              <div>--%>
<%--                <strong>Người Dùng</strong>--%>
<%--                <p>Hoạt động 1</p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--          <li class="list-group-item">--%>
<%--            <div class="d-flex align-items-center justify-content-center text-center">--%>
<%--              <img--%>
<%--                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"--%>
<%--                class="rounded-circle me-2" width="50" height="50" alt="Avatar">--%>
<%--              <div>--%>
<%--                <strong>Người Dùng</strong>--%>
<%--                <p>Hoạt động 1</p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--        </ul>--%>
      </div>
    </div>
    <h4 class="text-center my-4 fw-bold">Tài liệu mới đăng</h4>
    <div class="row">
      <div class="col-3">
        <div class="bg-success p-3 mb-4 text-white fw-bold fs-6 rounded text-center">
          Chuyên ngành kinh tế
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-3">
        <div class="bg-primary p-3 mb-4 text-white fw-bold fs-6 rounded text-center">
          Công nghệ - Môi trường
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-3">
        <div class="bg-warning p-3 mb-4 text-white fw-bold fs-6 rounded text-center">
          Kinh tế - Quản lý
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-3">
        <div class="bg-danger p-3 mb-4 text-white fw-bold fs-6 rounded text-center">
          Thạc sĩ - Cao học
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-auto ms-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              class="absolute left-0 top-1 w-4 h-4">
              <rect width="24" height="24" rx="5" fill="#E2574C"></rect>
              <path fill="#fff" d="M2 6h19v12H2z"></path>
              <path
                d="M20 3.5 5.333 2C4.626 2.002 3.5 2 3 2.5c-.5.5-1.998.793-2 1.5v14.5c0 1.467 1.033.5 2.5.5L18 20.5c1.467 0 4-1.033 4-2.5l.5-11c0-1.467-1.033-3.5-2.5-3.5ZM8.667 11.333c0 1.067-.934 2-2 2H5.333V16h-2V8h3.334c1.066 0 2 .933 2 2v1.333ZM15.333 14c0 1.067-.933 2-2 2H10V8h3.333c1.067 0 2 .933 2 2v4Zm5.334-4h-2v1.333h2v2h-2V16h-2V8h4v2ZM12 10h1.333v4H12v-4Zm-6.667 0h1.334v1.333H5.333V10Z"
                fill="#E2574C"></path>
            </svg>
          </div>
          <div class="col p-0 flex items-start">
            <a href="#" class="text-start">
              Ứng dụng thị giác máy tính cho mobile robot phục vụ tổng quan phân loại mobile robot
            </a>
            <ul class="list-unstyled d-flex flex-wrap gap-1 mt-1">
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M26 19v-3.5a4.5 4.5 0 0 0-4.5-4.5h-2A1.5 1.5 0 0 1 18 9.5v-2A4.5 4.5 0 0 0 13.5 3H11m0 17h10m-10 4h5M14 3H7.5A1.5 1.5 0 0 0 6 4.5v23A1.5 1.5 0 0 0 7.5 29h17a1.5 1.5 0 0 0 1.5-1.5V15A12 12 0 0 0 14 3z">
                  </path>
                </svg>
                23
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.715 16.429a1.349 1.349 0 0 1 0-.852C4.564 10.013 9.813 6 16 6c6.184 0 11.431 4.009 13.284 9.571.093.276.093.575 0 .852C27.436 21.987 22.187 26 16 26c-6.184 0-11.431-4.009-13.284-9.571z">
                  </path>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M20 16a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
                </svg>
                0
              </li>
              <li class="p-1" style="font-size: 0.75rem;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 32" stroke-width="2"
                  stroke="currentColor" width="24" height="24" class="w-4 h-4 mr-1 inline">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 22v3a3 3 0 0 0 3 3h18a3 3 0 0 0 3-3v-3m-6-6-6 6m0 0-6-6m6 6V4"></path>
                </svg>
                0
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="me-4 mb-4" style="position:fixed;right: 0;bottom: 0;">
    <a href="#" class="btn btn-success">
      <i class="bi bi-arrow-up fs-5"></i>
    </a>
  </div>
  <footer>
    <div class="p-3 text-center bg-light text-danger fw-bold   fs-6">
      Copyright © 2024. Designed by Phan Đức
    </div>
  </footer>
  <script src="/js/password.js"></script>
  <script src="/js/main.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>