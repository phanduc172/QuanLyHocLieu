//Hiển thị thông tin chi tiết người dùng lên form  chỉnh sửa người dùng ở admin
document.querySelectorAll('.btn-outline-warning').forEach(function(button) {
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