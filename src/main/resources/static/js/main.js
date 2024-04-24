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
    // Trong JavaScript
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

    //Kiểm tra người dùng chọn vào số sao là bao nhiêu và ẩn hiện form comment
    const stars = document.querySelectorAll('.rating-stars span');
    const commentForm = document.getElementById('comment-form');
    const cancelButton = document.querySelector('#comment-form button.btn-outline-secondary');

    // Xử lý sự kiện click cho các sao xếp hạng
    stars.forEach(star => {
        star.addEventListener('click', function() {
            const rating = parseInt(this.getAttribute('data-rating'));
            // Thay đổi màu sắc của các sao dựa trên xếp hạng được chọn
            stars.forEach(s => {
                if (parseInt(s.getAttribute('data-rating')) <= rating) {
                    s.classList.remove('bi-star');
                    s.classList.add('bi-star-fill');
                } else {
                    s.classList.remove('bi-star-fill');
                    s.classList.add('bi-star');
                }
            });
            console.log('Người dùng đã chọn xếp hạng: ' + rating);
            // Hiển thị form bình luận
            commentForm.classList.remove('d-none');
        });
    });

    // Xử lý sự kiện click cho nút "Hủy"
    cancelButton.addEventListener('click', function(event) {
        // Ngăn chặn hành vi mặc định của nút "Hủy" (ví dụ: gửi form)
        event.preventDefault();
        // Ẩn form bình luận
        commentForm.classList.add('d-none');
        // Đặt lại màu sắc của các sao xếp hạng
        stars.forEach(s => {
            s.classList.remove('bi-star-fill');
            s.classList.add('bi-star');
        });
    });



  