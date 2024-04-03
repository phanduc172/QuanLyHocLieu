<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Quản lý học liệu - Trường Đại học Khoa học Huế</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <header>
    <nav class="navbar navbar-expand-lg bg-light fixed-top" style="z-index: 1080">
      <div class="container">
        <a class="navbar-brand" href="#">
          <img class="me-2" src="PD.png" alt="logo" style="height: 40px;">
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

          <div class="input-group ms-auto" style="width: 400px">
            <input type="text" class="form-control" placeholder="Tìm kiếm tài liệu, giáo trình,..." />
            <button class="btn btn-outline-secondary" type="button" id="button-addon2">
              <i class="bi bi-search"></i>
            </button>
          </div>
          <div class="ms-auto">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-light border" data-bs-toggle="modal" data-bs-target="#exampleModal">
              <i class="bi bi-person-circle"></i> Thành viên
            </button>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="loginRegisterModalLabel"
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
                        <form method="post" action="">
                          <fieldset>
                            <div class="form-group mb-3">
                              <input class="form-control" placeholder="Nhập tên người dùng" name="username"
                                type="text" />
                            </div>
                            <div class="form-group mb-3">
                              <input class="form-control" placeholder="Nhập mật khẩu" name="password" type="password"
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
        </div>
      </div>
    </nav>
  </header>
  <div class="container-fluid main" >
    <div class="row">
      <div class="col-2">
        <h5 class="text-center">Thể loại</h5>
        <ul class="list-group">
          <li class="list-group-item">Thể loại 1</li>
          <li class="list-group-item">Thể loại 1</li>
          <li class="list-group-item">Thể loại 1</li>
          <li class="list-group-item">Thể loại 1</li>
          <li class="list-group-item">Thể loại 1</li>
          <li class="list-group-item">Thể loại 1</li>
          <li class="list-group-item">Thể loại 1</li>
        </ul>
      </div>
      <div class="col-8">
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
              <img src="https://via.placeholder.com/100" class="d-block w-100" alt="..."
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
        <h4 class="text-center">Tài liệu nổi bật</h4>
        <div class="row mt-3">
          <div class="col-md-4 mb-3">
            <a href="document.html">
              <div class="card">
                <img src="./images/1.jpg" class="card-img-top" alt="..." />
                <div class="card-body">
                  <h5 class="card-title">Tên tài liệu</h5>
                  <p class="card-text">Mô tả ngắn về tài liệu.</p>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-4 mb-3">
            <a href="#">
              <div class="card">
                <img src="./images/9.jpg" class="card-img-top" alt="..." />
                <div class="card-body">
                  <h5 class="card-title">Tên tài liệu</h5>
                  <p class="card-text">Mô tả ngắn về tài liệu.</p>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-4 mb-3">
            <a href="#">
              <div class="card">
                <img src="./images/2.jpg" class="card-img-top" alt="..." />
                <div class="card-body">
                  <h5 class="card-title">Tên tài liệu</h5>
                  <p class="card-text">Mô tả ngắn về tài liệu.</p>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-4 mb-3">
            <a href="#">
              <div class="card">
                <img src="./images/3.jpg" class="card-img-top" alt="..." />
                <div class="card-body">
                  <h5 class="card-title">Tên tài liệu</h5>
                  <p class="card-text">Mô tả ngắn về tài liệu.</p>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-4 mb-3">
            <a href="#">
              <div class="card">
                <img src="./images/4.jpg" class="card-img-top" alt="..." />
                <div class="card-body">
                  <h5 class="card-title">Tên tài liệu</h5>
                  <p class="card-text">Mô tả ngắn về tài liệu.</p>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-4 mb-3">
            <a href="#">
              <div class="card">
                <img src="./images/5.jpg" class="card-img-top" alt="..." />
                <div class="card-body">
                  <h5 class="card-title">Tên tài liệu</h5>
                  <p class="card-text">Mô tả ngắn về tài liệu.</p>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-4 mb-3">
            <a href="#">
              <div class="card">
                <img src="./images/9.jpg" class="card-img-top" alt="..." />
                <div class="card-body">
                  <h5 class="card-title">Tên tài liệu</h5>
                  <p class="card-text">Mô tả ngắn về tài liệu.</p>
                </div>
              </div>
            </a>
          </div>


        </div>
      </div>
      <div class="col-2">
        <h5 class="text-center">Hoạt động gần đây</h5>
        <ul class="list-group">
          <li class="list-group-item">
            <div class="d-flex align-items-center justify-content-center text-center">
              <img
                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                class="rounded-circle me-2" width="50" height="50" alt="Avatar">
              <div>
                <strong>Người Dùng</strong>
                <p>Hoạt động 1</p>
              </div>
            </div>
          </li>
          <li class="list-group-item">
            <div class="d-flex align-items-center justify-content-center text-center">
              <img
                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                class="rounded-circle me-2" width="50" height="50" alt="Avatar">
              <div>
                <strong>Người Dùng</strong>
                <p>Hoạt động 1</p>
              </div>
            </div>
          </li>
          <li class="list-group-item">
            <div class="d-flex align-items-center justify-content-center text-center">
              <img
                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                class="rounded-circle me-2" width="50" height="50" alt="Avatar">
              <div>
                <strong>Người Dùng</strong>
                <p>Hoạt động 1</p>
              </div>
            </div>
          </li>
          <li class="list-group-item">
            <div class="d-flex align-items-center justify-content-center text-center">
              <img
                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                class="rounded-circle me-2" width="50" height="50" alt="Avatar">
              <div>
                <strong>Người Dùng</strong>
                <p>Hoạt động 1</p>
              </div>
            </div>
          </li>
          <li class="list-group-item">
            <div class="d-flex align-items-center justify-content-center text-center">
              <img
                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                class="rounded-circle me-2" width="50" height="50" alt="Avatar">
              <div>
                <strong>Người Dùng</strong>
                <p>Hoạt động 1</p>
              </div>
            </div>
          </li>
          <li class="list-group-item">
            <div class="d-flex align-items-center justify-content-center text-center">
              <img
                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                class="rounded-circle me-2" width="50" height="50" alt="Avatar">
              <div>
                <strong>Người Dùng</strong>
                <p>Hoạt động 1</p>
              </div>
            </div>
          </li>
          <li class="list-group-item">
            <div class="d-flex align-items-center justify-content-center text-center">
              <img
                src="https://images.unsplash.com/photo-1599898534595-953006e0ba6b?q=80&w=1929&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                class="rounded-circle me-2" width="50" height="50" alt="Avatar">
              <div>
                <strong>Người Dùng</strong>
                <p>Hoạt động 1</p>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <h4 class="text-center mb-3">Tài liệu mới đăng</h4>
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

  <footer>
    <div class="p-3 text-center bg-light text-danger fw-bold   fs-6">
      Copyright © 2024. Designed by Phan Đức
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>