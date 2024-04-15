<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-<your-integrity-hash>" crossorigin="anonymous" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>


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
            <a class="nav-link active" aria-current="page" href="#">Trang chủ</a>
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

        <div class="input-group ms-auto" style="width:350px">
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
            <%--Tải lên tài liệu--%>
            <div class="ms-auto">
              <a href="/uploadfile" class="btn btn-light border p-2 rounded-pill">
                <span class="fw-bold">Tải lên</span>
                <i class="bi bi-cloud-upload ms-2"></i>
              </a>
            </div>
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
                        <a href="/userinfo/${loggedInUser.maNguoiDung}">
                          <li class="my-3">Quản lý tài liệu</li>
                        </a>
                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#changePasswordModal">Đổi mật khẩu</a>
                        <a href="/logout">
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
                      <form>
                        <div class="mb-3">
                          <label for="currentPassword" class="form-label">Mật khẩu hiện tại</label>
                          <input type="password" class="form-control" id="currentPassword" required>
                        </div>
                        <div class="mb-3">
                          <label for="newPassword" class="form-label">Mật khẩu mới</label>
                          <input type="password" class="form-control" id="newPassword" required>
                        </div>
                        <div class="mb-3">
                          <label for="confirmNewPassword" class="form-label">Xác nhận mật khẩu mới</label>
                          <input type="password" class="form-control" id="confirmNewPassword" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
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

<div class="container main">
  <div class="row">
    <div class="col-lg-4 d-lg-block">
      <div class="card">
        <div class="card-body text-center">
          <div class="position-relative">
            <img id="userAvatar" src="/images/avt.png" alt="User Avatar" class="rounded-circle mb-3" data-bs-toggle="modal" data-bs-target="#changeAvatarModal">
          </div>
          <h5 class="card-title"><c:out value="${nguoiDung.hoTen}" /></h5>
          <p class="card-text text-start ms-4">Tên người dùng: <c:out value="${nguoiDung.tenNguoiDung}" /></p>
          <p class="card-text text-start ms-4">Mật khẩu: <c:out value="${nguoiDung.matKhau}" /></p>
          <p class="card-text text-start ms-4">Email: <c:out value="${nguoiDung.email}" /></p>
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editProfileModal">
            Chỉnh sửa thông tin cá nhân
          </button>
        </div>
      </div>

      <!-- Modal đổi ảnh -->
      <div class="modal fade" id="changeAvatarModal" tabindex="-1" aria-labelledby="changeAvatarModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="margin-top: 100px">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="changeAvatarModalLabel">Đổi ảnh đại diện</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <!-- Nơi để người dùng chọn ảnh mới -->
              <!-- Ví dụ: -->
              <input type="file" accept="image/*">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
              <button type="button" class="btn btn-primary">Lưu thay đổi</button>
            </div>
          </div>
        </div>
      </div>


      <!-- Modal chỉnh sửa thông tin cá nhân -->
      <div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel" aria-hidden="true" style="margin-top: 80px;">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Chỉnh sửa thông tin cá nhân</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <!-- Đặt biểu mẫu chỉnh sửa thông tin cá nhân tại đây -->
              <form>
                <!-- Các trường thông tin cá nhân cần chỉnh sửa -->
                <div class="mb-3">
                  <label for="fullName" class="form-label">Họ và tên:</label>
                  <input type="text" class="form-control" id="fullName" data-fullname="${nguoiDung.hoTen}">
                </div>
                <div class="mb-3">
                  <label for="username" class="form-label">Tên người dùng:</label>
                  <input type="text" class="form-control" id="username" data-username="${nguoiDung.tenNguoiDung}">
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email:</label>
                  <input type="email" class="form-control" id="email" data-email="${nguoiDung.email}">
                </div>
                <!-- Nút lưu chỉnh sửa -->
                <button type="submit" class="btn btn-success">Lưu thay đổi</button>
              </form>
            </div>

          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 col-lg-8">
      <h5 class="mb-3">Quản lý tài liệu</h5>
      <div class="card">
        <ul class="list-unstyled d-flex flex-wrap justify-content-between p-2 mx-5 m-0">
          <li class="px-2"><a href="#" class="text-decoration-none">Đã duyệt(1)</a></li>
          <li class="px-2"><a href="#" class="text-decoration-none">Chờ duyệt(2)</a></li>
          <li class="px-2"><a href="#" class="text-decoration-none">Từ chối(0)</a></li>
          <li class="px-2"><a href="#" class="text-decoration-none">Bị trùng(0)</a></li>
        </ul>
      </div>


      <div class="card mt-3">
        <div class="card-header">
          Danh sách tài liệu đã tải lên
        </div>
        <ul class="list-group list-group-flush">
          <c:forEach var="taiLieu" items="${taiLieus}">
            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
              <div class="d-flex align-items-center">
                <span class="fs-6">${taiLieu.tieuDe}</span>
              </div>
              <div>
                <button class="btn btn-sm btn-outline-primary me-1" title="Sửa"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-outline-danger" title="Xóa"><i class="fas fa-trash-alt"></i></button>
              </div>
            </li>
          </c:forEach>
        </ul>

      </div>

    </div>
  </div>
</div>

<footer>
  <div class="p-3 text-center bg-light text-danger fw-bold fs-6 mt-5">
    Copyright © 2024. Designed by Phan Đức
  </div>
</footer>

<script src="/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
