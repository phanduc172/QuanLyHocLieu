//Hiển thị thông tin chi tiết người dùng lên form  chỉnh sửa người dùng ở admin
document.querySelectorAll('.btnEditUser').forEach(function(button) {
    button.addEventListener('click', function() {

        var userId = this.dataset.userid;
        var username = this.dataset.username;
        var fullName = this.dataset.fullname;
        var email = this.dataset.email;
        var password = this.dataset.password;
        var roleId = this.dataset.roleid;

        // Điền thông tin vào các trường trong form chỉnh sửa người dùng
        document.getElementById('updateUserId').value = userId;
        document.getElementById('updateUsername').value = username;
        document.getElementById('updateFullName').value = fullName;
        document.getElementById('updateEmail').value = email;
        document.getElementById('updatePassword').value = password;
        document.getElementById('updateRoleId').value = roleId;
        console.log(userId);
        console.log(username);
        console.log(fullName);
        console.log(email);
        console.log(password);
        console.log(roleId);
    });
});
//Hiển thị thông tin chi tiết người dùng lên form  chỉnh sửa người dùng ở admin

//Hiển thị thông tin danh mục lên form  chỉnh sửa người dùng ở admin
document.querySelectorAll('.btn-edit').forEach(function(button) {
    button.addEventListener('click', function() {
        // Lấy thông tin từ thuộc tính data của nút chỉnh sửa
        var maDanhMuc = this.dataset.id;
        var tenDanhMuc = this.dataset.namecategory;

        // Điền thông tin vào các trường trong biểu mẫu chỉnh sửa
        document.getElementById('maDanhMuc').value = maDanhMuc;
        document.getElementById('updatetenDanhMuc').value = tenDanhMuc;
    });
});

//Hiển thị thông tin danh mục lên form  chỉnh sửa người dùng ở admin

//Hiển thị thông tin khoa lên form  chỉnh sửa khoa ở admin
$(document).ready(function () {
    $('#capNhatKhoaModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var maKhoa = button.data('ma-khoa');
        var tenKhoa = button.data('ten-khoa');
        var modal = $(this);
        modal.find('#maKhoa').val(maKhoa);
        modal.find('#updateTenKhoa').val(tenKhoa);
    });
});
//Hiển thị thông tin khoa lên form  chỉnh sửa khoa ở admin


//Hiển thị thông tin chuyên ngành lên form  chỉnh sửa khoa ở admin
document.addEventListener("DOMContentLoaded", function() {
    var updateModal = document.getElementById('capNhatChuyenNganhModal');
    updateModal.addEventListener('show.bs.modal', function(event) {
        // Nút mà người dùng nhấp vào
        var button = event.relatedTarget;
        // Lấy giá trị từ thuộc tính data
        var maChuyenNganh = button.getAttribute('data-ma-chuyen-nganh');
        var tenChuyenNganh = button.getAttribute('data-ten-chuyen-nganh');

        // Cập nhật các input trong modal với các giá trị tương ứng
        var modalMaChuyenNganh = updateModal.querySelector('#updateMaChuyenNganh');
        var modalTenChuyenNganh = updateModal.querySelector('#updateTenChuyenNganh');

        modalMaChuyenNganh.value = maChuyenNganh;
        modalTenChuyenNganh.value = tenChuyenNganh;
    });
});

//Hiển thị thông tin chuyên ngành lên form  chỉnh sửa khoa ở admin
