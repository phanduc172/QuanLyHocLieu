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
//   Random màu item
  document.addEventListener("DOMContentLoaded", function() {
    var items = document.getElementsByClassName("item");
    var colors = ['bg-danger','bg-warning','bg-success', 'bg-primary']; // Mảng các lớp màu Bootstrap
    for (var i = 0; i < items.length; i++) {
      items[i].classList.add(colors[i % colors.length]); // Sử dụng toán tử % để lặp lại mảng màu nếu số lượng màu ít hơn số lượng item
    }
  });

// Điền thông tin cá nhân vào input của modal chỉnh sửa
$(document).ready(function () {
    // Khi modal chỉnh sửa thông tin cá nhân được hiển thị
    $('#editProfileModal').on('show.bs.modal', function (event) {
        // Điền thông tin cá nhân vào các input tương ứng trong modal
        var fullName = 'Phan Đức';
        var username = 'nguyenvana';
        var email = 'nguyenvana@example.com';

        $('#fullName').val(fullName);
        $('#username').val(username);
        $('#email').val(email);
    });
});

  