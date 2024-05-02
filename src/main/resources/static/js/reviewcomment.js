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
        document.getElementById('rating-input').value = rating;
        // Hiển thị form bình luận
        commentForm.classList.remove('d-none');
        console.log('Người dùng đã chọn xếp hạng: ' + rating);
    });
});
//Kiểm tra người dùng chọn vào số sao là bao nhiêu và ẩn hiện form comment

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
// Xử lý sự kiện click cho nút "Hủy"