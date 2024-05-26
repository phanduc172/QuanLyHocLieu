<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Login</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="/css/style.min.css" rel="stylesheet">
</head>

<style>
    .bg-loginadmin {
        background-image: url('/assets/images/dhkh.jpg');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .bg-transparent {
        background-color: rgba(255, 255, 255, 0.5) !important;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3) !important;;
        border-radius: 10px !important;;
        border: 5px solid rgba(0, 0, 0, 0.1) !important;;
    }
</style>

<body>
    <div class="bg-loginadmin bg-light p-5" style="min-height: 100vh">
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-12 col-md-11 col-lg-8 col-xl-7 col-xxl-6">
                    <div class="bg-transparent  p-4 p-md-5 rounded shadow-sm">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-5 text-center">
                                    <h2 class="text-black">Đăng nhập hệ thống Quản lý tài liệu sinh viên Trường Đại học Khoa học - Đại học Huế</h2>
                                </div>
                            </div>
                        </div>
                        <c:if test="${not empty loginFalse}">
                            <div class="alert alert-danger" role="alert">
                                <c:out value="${loginFalse}" />
                            </div>
                        </c:if>
                        <form action="/admin/login" method="post" class="">
                            <div class="row gy-3 gy-md-4">
                                <div class="col-12">
                                    <label for="tenNguoiDung" class="form-label fs-5">Tài khoản <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="tenNguoiDung" id="tenNguoiDung" placeholder="Nhập tên tài khoản" required>
                                </div>
                                <div class="col-12">
                                    <label for="matKhau" class="form-label fs-5">Mật khẩu <span class="text-danger">*</span></label>
                                    <input type="password" class="form-control" name="matKhau" id="matKhau" value="" placeholder="Nhập mật khẩu" required>
                                </div>
                                <div class="col-12">
                                    <div class="d-grid">
                                        <button class="btn btn-lg btn-info text-white" type="submit">Đăng nhập</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="/assets/plugins/jquery/dist/jquery.min.js"></script>
    <script src="/assets/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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
