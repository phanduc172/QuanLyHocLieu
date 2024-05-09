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