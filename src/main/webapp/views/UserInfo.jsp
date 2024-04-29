<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý học liệu - Trường Đại học Khoa học Huế</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-<your-integrity-hash>" crossorigin="anonymous" />
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
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Danh mục
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Khoa</a></li>
              <li><hr class="dropdown-divider"></li>
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
                          <form method="post" action="/login">
                            <fieldset>
                              <div class="form-group mb-3">
                                <input class="form-control" placeholder="Nhập tên người dùng" name="tenNguoiDung" type="text" required/>
                              </div>
                              <div class="form-group mb-3">
                                <input class="form-control" placeholder="Nhập mật khẩu" name="matKhau" type="password" value="" required/>
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
                                <input class="form-control" placeholder="Nhập mật khẩu" type="password" name="matKhau" value="" required/>
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
                      <form method="post" action="/changepassword">
                        <div class="mb-3">
                          <label for="currentPassword" class="form-label">Mật khẩu hiện tại</label>
                          <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                        </div>
                        <div class="mb-3">
                          <label for="newPassword" class="form-label">Mật khẩu mới</label>
                          <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        </div>
                        <div class="mb-3">
                          <label for="confirmNewPassword" class="form-label">Xác nhận mật khẩu mới</label>
                          <input type="password" name="confirmNewPassword" class="form-control" id="confirmNewPassword" required>
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

<div class="container main min-vh-100">
  <div class="row">
    <div class="col-lg-4 d-lg-block">
      <div class="card">
        <div class="card-body text-center">
          <div class="position-relative">
            <img id="userAvatar" src="${nguoiDung.anh}" alt="User Avatar" class="rounded-circle mb-3" data-bs-toggle="modal" data-bs-target="#changeAvatarModal">
          </div>
          <h5 class="card-title"><c:out value="${nguoiDung.hoTen}" /></h5>
          <p class="card-text text-start ms-4">Tên người dùng: <c:out value="${nguoiDung.tenNguoiDung}" /></p>
          <p class="card-text text-start ms-4">Mật khẩu: <c:out value="${nguoiDung.matKhau}" /></p>
          <p class="card-text text-start ms-4">Email: <c:out value="${nguoiDung.email}" /></p>
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editProfileModal">
            <i class="fas fa-edit"></i> Chỉnh sửa thông tin cá nhân
          </button>
        </div>
      </div>

      <!-- Modal đổi ảnh đại diện -->
      <div class="modal fade" id="changeAvatarModal" tabindex="-1" aria-labelledby="changeAvatarModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header px-3 py-2">
              <h5 class="modal-title" id="changeAvatarModalLabel">Đổi ảnh đại diện</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body m-0 p-3">
              <form class="m-0 p-0" id="changeAvatarForm" action="/userinfo/update-avatar" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                  <label for="avatarFile" class="form-label">Chọn ảnh mới:</label>
                  <input type="file" class="form-control" name="file" id="avatarFile" accept="image/*">
                </div>
                <div id="previewImageContainer" class="text-center mb-2" style="display: none;">
                  <img id="previewImage" src="#" alt="Preview Image" class="img-thumbnail">
                </div>
                <div class="modal-footer p-0">
                  <button type="button" class="btn btn-secondary mt-2" data-bs-dismiss="modal">Đóng</button>
                  <button type="submit" class="btn btn-primary mt-2">Lưu thay đổi</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <script>
        // Lắng nghe sự kiện khi người dùng chọn một tệp hình ảnh mới
        $('#avatarFile').change(function() {
          // Kiểm tra xem người dùng đã chọn một tệp hình ảnh chưa
          if (this.files && this.files[0]) {
            var reader = new FileReader();

            // Đặt hành động khi đọc xong tệp hình ảnh
            reader.onload = function(e) {
              // Hiển thị hình ảnh đã đọc trong thẻ <img> để xem trước ảnh
              $('#previewImage').attr('src', e.target.result);
              // Hiển thị phần xem trước ảnh
              $('#previewImageContainer').show();
            }

            // Đọc tệp hình ảnh được chọn
            reader.readAsDataURL(this.files[0]);
          }
        });
      </script>

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
              <form method="post" action="/userinfo/update">
                <!-- Các trường thông tin cá nhân cần chỉnh sửa -->
                <div class="mb-3">
                  <label for="fullName" class="form-label">Họ và tên:</label>
                  <input type="text" class="form-control" id="fullName" name="hoTen" data-fullname="${nguoiDung.hoTen} " required>
                </div>
                <div class="mb-3">
                  <label for="username" class="form-label">Tên người dùng:</label>
                  <input type="text" class="form-control" id="username" name="tenNguoiDung" data-username="${nguoiDung.tenNguoiDung} " required>
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email:</label>
                  <input type="email" class="form-control" id="email" name="email" data-email="${nguoiDung.email}" required>
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
        <ul class="list-unstyled d-flex flex-wrap justify-content-around m-0">
          <li class="px-5 py-2 docHover"><a href="#" class="text-decoration-none">Đã duyệt <span class="text">(${totalDoc})</span></a></li>
          <li class="px-5 py-2 docHover"><a href="#" class="text-decoration-none">Chờ duyệt(2)</a></li>
          <li class="px-5 py-2 docHover"><a href="#" class="text-decoration-none">Từ chối(0)</a></li>
<%--          <li class="px-5 py-2 docHover"><a href="#" class="text-decoration-none">Bị trùng(0)</a></li>--%>
        </ul>
      </div>

      <div class="card mt-3">
        <div class="card-header">
          Danh sách tài liệu đã tải lên
        </div>
        <ul class="list-group list-group-flush">
          <c:forEach var="taiLieu" items="${taiLieus}" varStatus="loop">
            <input type="hidden" name="maTaiLieu" value="${taiLieu.maTaiLieu}">
            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
              <a href="/document/${taiLieu.maTaiLieu}" class="text-decoration-none">
                <div class="d-flex align-items-center">
                  <span class="fs-6">${loop.index + 1}. ${taiLieu.tieuDe}</span>
                </div>
              </a>
              <div>
                <button class="btn btn-sm btn-outline-danger me-2 buttonDetail" title="Details" style="width: 30px;height: 30px;"
                        data-bs-toggle="modal" data-bs-target="#detailsDocumentModal" data-document-id="${taiLieu.maTaiLieu}">
                  <i class="fas fa-info"></i>
                </button>
                <button class="btn btn-sm btn-outline-primary me-2" title="Sửa" style="width: 30px;height: 30px;"
                        data-bs-toggle="modal" data-bs-target="#editDocumentModal"
                        data-document-id="${taiLieu.maTaiLieu}" data-document-title="${taiLieu.tieuDe}" data-document-description="${taiLieu.moTa}">
                  <i class="fas fa-edit"></i>
                </button>
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>

      <!-- Modal xem chi tiết tài liệu theo mã tài liệu -->
      <div class="modal fade" id="detailsDocumentModal" tabindex="-1" aria-labelledby="detailsDocumentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
          <div class="modal-content">
            <div class="modal-header text-white px-3 py-2 bg-custom-blue ">
              <span class="fas fa-info"></span>
              <h5 class="modal-title ms-2" id="detailsDocumentModalLabel">Chi tiết tài liệu</h5>
              <button type="button" class="btn-close text-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
<%--              <div class="mb-2">--%>
<%--                <label for="detailMaTaiLieu" class="form-label">Mã tài liệu:</label>--%>
<%--                <input type="text" class="form-control" id="detailMaTaiLieu" value="${taiLieu.maTaiLieu}" readonly>--%>
<%--              </div>--%>
              <div class="mb-2">
                <label for="detailTitle" class="form-label">Tiêu đề:</label>
                <input type="text" class="form-control" id="detailTitle" value="${taiLieu.tieuDe}" readonly>
              </div>
              <div class="mb-2">
                <label for="detailDescription" class="form-label">Mô tả:</label>
                <textarea class="form-control" id="detailDescription" readonly>${taiLieu.moTa}</textarea>
              </div>
              <div class="mb-2">
                <label for="detailCategory" class="form-label">Mã danh mục:</label>
                <input type="text" class="form-control" id="detailCategory" value="" readonly>
                ${taiLieu.maDanhMuc}
              </div>
              <div class="mb-2">
                <label for="detailFaculty" class="form-label">Mã chuyên ngành:</label>
                <input type="text" class="form-control" id="detailFaculty" value="" readonly>
                ${taiLieu.maChuyenNganh}
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal chỉnh sửa tài liệu -->
      <div class="modal fade" id="editDocumentModal" tabindex="-1" aria-labelledby="editDocumentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content modelUser">
            <div class="modal-header px-3 py-2 text-white bg-custom-blue">
              <i class="bi bi-pencil-fill"></i>
              <h5 class="modal-title ms-2" id="editDocumentModalLabel">Chỉnh sửa tài liệu</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <!-- Form chỉnh sửa tài liệu -->
              <form id="editDocumentForm" action="/document/updatedocument" method="post">
                <input type="hidden" name="maTaiLieu" id="maTaiLieu" value="${taiLieu.maTaiLieu}">
                <div class="mb-2">
                  <label for="editTitle" class="form-label">Tiêu đề:</label>
                  <input type="text" class="form-control" id="editTitle" name="editTitle" required>
                </div>
                <div class="mb-2">
                  <label for="editDescription" class="form-label">Mô tả:</label>
                  <textarea class="form-control" id="editDescription" name="editDescription" rows="3"></textarea>
                </div>
                <div class="mb-2">
                  <label for="category" class="form-label">Thể loại:</label>
                  <select class="form-control" id="category" name="category" required>
                    <option value="0">Chọn Thể loại</option>
                    <c:forEach items="${listDanhMuc}" var="danhmuc">
                      <option value="${danhmuc.maDanhMuc}">${danhmuc.tenDanhMuc}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="mb-2">
                  <label for="faculty" class="form-label">Khoa:</label>
                  <select class="form-control" id="faculty" name="faculty" required>
                    <c:forEach items="${listKhoa}" var="khoa">
                      <option value="${khoa.maKhoa}">${khoa.tenKhoa}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="mb-2">
                  <label for="major" class="form-label">Chuyên ngành:</label>
                  <select class="form-control" id="major" name="major" required>
                    <option value="0">-None-</option>
                  </select>
                </div>
                <button type="submit" class="btn btn-primary mt-2">Lưu thay đổi</button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal Delete Document -->
      <div class="modal fade" id="deleteDocumentModal" tabindex="-1" aria-labelledby="deleteDocumentModalLabel" aria-hidden="true">
        <div class="modal-dialog ">
          <div class="modal-content modelUser">
            <div class="modal-header">
              <h5 class="modal-title" id="deleteDocumentModalLabel">Xác nhận xóa tài liệu</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              Bạn có chắc chắn muốn xóa tài liệu này không?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
              <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Xóa</button>
            </div>
          </div>
        </div>
      </div>

      <script src="">
        $('#editDocumentModal').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget);
          var maTaiLieu = button.data('matailieu');
          var modal = $(this);
          modal.find('.modal-body #maTaiLieu').val(maTaiLieu);
        });
      </script>

      <%--Form chỉnh sửa--%>
      <script>
        document.querySelectorAll('.btn-outline-primary').forEach(function(button) {
          button.addEventListener('click', function() {
            var maTaiLieu = this.dataset.documentId;
            var documentTitle = this.dataset.documentTitle;
            var documentDescription = this.dataset.documentDescription;
            var facultyId = this.dataset.facultyId;
            var majorId = this.dataset.majorId;

            // Điền thông tin vào các trường trong form chỉnh sửa tài liệu
            document.getElementById('maTaiLieu').value = maTaiLieu;
            document.getElementById('editTitle').value = documentTitle;
            document.getElementById('editDescription').value = documentDescription;

            // Hiển thị khoa và chuyên ngành tương ứng trong form
            document.getElementById('faculty').value = facultyId;
            document.getElementById('major').value = majorId;
          });
        });
      </script>

        <%--Form chi tiết--%>
      <script !src="">
        $(document).ready(function() {
          // Đặt sự kiện click cho tất cả các nút "Details" có class là btn-outline-danger
          $('.buttonDetail').click(function() {

            var maTaiLieu = $(this).data('document-id');

            // Gán giá trị mã tài liệu cho trường input trong modal
            $('#detailMaTaiLieu').val(maTaiLieu);

            // Hiển thị modal
            $('#detailsDocumentModal').modal('show');
            // Gửi yêu cầu AJAX
            $.ajax({
              type: 'GET',
              url: '/getDetailDocument/' + maTaiLieu,
              success: function(response) {
                // Cập nhật giá trị cho các trường input trong modal
                $('#detailTitle').val(response.tieuDe);
                $('#detailDescription').val(response.moTa);
                $('#detailCategory').val(response.maDanhMuc); // Sửa lại tên trường dữ liệu
                $('#detailFaculty').val(response.maChuyenNganh); // Sửa lại tên trường dữ liệu

                // Hiển thị modal
                $('#detailsDocumentModal').modal('show');
              },
              error: function(xhr, status, error) {
                console.error(xhr.responseText);
                alert('Đã xảy ra lỗi khi tải thông tin chi tiết tài liệu.');
              }
            });

          });
        });
      </script>


    </div>
  </div>
</div>

<footer>
  <div class="p-3 text-center bg-light text-danger fw-bold fs-6 mt-5">
    Copyright © 2024. Designed by Phan Đức
  </div>
</footer>

<script !src="">
  window.onload = function() {
    if (window.history.replaceState) {
      window.history.replaceState(null, null, window.location.href);
    }
  };
</script>

<script src="/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
