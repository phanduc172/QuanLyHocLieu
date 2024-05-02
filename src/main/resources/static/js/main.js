    //Cuon ngang các item
    $(document).ready(function() {
        $('#draggable-list').on('mousedown', function(event) {
        var startX = event.pageX - $('#draggable-list').scrollLeft();
        $(this).data('down', true).data('x', startX);
        }).on('mouseup', function(event) {
        $(this).data('down', false);
        }).on('mousemove', function(event) {
        if ($(this).data('down') == true) {
            var newX = event.pageX - $(this).data('x');
            $('#draggable-list').scrollLeft($('#draggable-list').scrollLeft() - newX);
            $(this).data('x', event.pageX);
        }
        }).on('mouseleave', function(event) {
        $(this).data('down', false);
        });
    });

    //Random màu item
      document.addEventListener("DOMContentLoaded", function() {
        var items = document.getElementsByClassName("item");
        var colors = ['bg-danger','bg-warning','bg-success', 'bg-primary'];
        for (var i = 0; i < items.length; i++) {
          items[i].classList.add(colors[i % colors.length]);
        }
      });

    // Điền thông tin cá nhân vào input của modal chỉnh sửa
    $(document).ready(function () {
        $('#editProfileModal').on('show.bs.modal', function (event) {
            var fullName = $('#fullName').data('fullname');
            var username = $('#username').data('username');
            var email = $('#email').data('email');

            $('#fullName').val(fullName);
            $('#username').val(username);
            $('#email').val(email);
        });
    });
    // Điền thông tin cá nhân vào input của modal chỉnh sửa


    // Hàm cập nhật danh sách chuyên ngành khi người dùng chọn khoa
    $(document).ready(function() {
        $('#faculty').change(function() {
            var selectedFaculty = $(this).val();
            $.ajax({
                type: 'GET',
                url: '/getChuyenNganh',
                data: {faculty: selectedFaculty},
                success: function(data) {
                    $('#major').empty();
                    $.each(data, function(index, major) {
                        $('#major').append('<option value="' + major.maChuyenNganh + '">' + major.tenChuyenNganh + '</option>');
                    });
                }
            });
        });
    });
    // Hàm cập nhật danh sách chuyên ngành khi người dùng chọn khoa

    //Hàm xem trước ảnh tải lên
    $(document).ready(function() {
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
    });
    //Hàm xem trước ảnh tải lên


    //Hiển thị thông tin chi tiết lên form chi tiết tài liệu theo mã tài liệu
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
    //Hiển thị thông tin chi tiết lên form chi tiết tài liệu theo mã tài liệu

    //Hiển thị thông tin chi tiết lên form chỉnh sửa tài liệu theo mã tài liệu
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
                    $('#detailTitle').val(response.deTailTaiLieu.tieuDe);
                    $('#detailDescription').val(response.deTailTaiLieu.moTa);
                    $('#detailCategory').val(response.tenDanhMuc);
                    $('#detailFaculty').val(response.tenKhoa);
                    $('#detailMajor').val(response.tenChuyenNganh);

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
    //Hiển thị thông tin chi tiết lên form  chỉnh sửa tài liệu theo mã tài liệu

  