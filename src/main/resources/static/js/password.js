    //Ẩn hiện mật khẩu khi nhập vào input
    function togglePasswordVisibility() {
        const passwordInput = document.getElementById('passwordInput');
        const eyeIcon = document.querySelector('.toggle-password i');

        if (passwordInput.type !== 'password') {
            passwordInput.type = 'password';
            eyeIcon.classList.remove('bi-eye-slash');
            eyeIcon.classList.add('bi-eye');
        } else {

            passwordInput.type = 'text';
            eyeIcon.classList.remove('bi-eye');
            eyeIcon.classList.add('bi-eye-slash');
        }
    }
    //Ẩn hiện mật khẩu khi nhập vào input

    // Kiểm tra mật khẩu hiện tại và mật khẩu mới có giống nhau không
    var currentPasswordHidden = document.getElementById('currentPasswordHidden').value;

    document.getElementById('changePasswordForm').addEventListener('submit', function(event) {
        var currentPassword = document.getElementById('currentPassword').value;
        var newPassword = document.getElementById('newPassword').value;
        var confirmNewPassword = document.getElementById('confirmNewPassword').value;

        var currentPasswordError = document.getElementById('currentPasswordError');
        var newPasswordError = document.getElementById('newPasswordError');
        var confirmNewPasswordError = document.getElementById('confirmNewPasswordError');

        currentPasswordError.textContent = "";
        newPasswordError.textContent = "";
        confirmNewPasswordError.textContent = "";

        var isValid = true;

        if (currentPassword === "") {
            currentPasswordError.textContent = "Vui lòng nhập mật khẩu hiện tại";
            isValid = false;
        }
        // Kiểm tra xác nhận mật khẩu hiện tại
            else if (currentPassword !== currentPasswordHidden) {
            currentPasswordError.textContent = "Mật khẩu hiện tại không đúng";
            isValid = false;
        }

        if (newPassword !== confirmNewPassword) {
            confirmNewPasswordError.textContent = "Mật khẩu mới không trùng khớp";
            isValid = false;
        }

        if (currentPassword === "") {
            currentPasswordError.textContent = "Vui lòng nhập mật khẩu hiện tại";
            isValid = false;
        }

        if (newPassword === "") {
            newPasswordError.textContent = "Vui lòng nhập mật khẩu mới";
            isValid = false;
        }

        if (confirmNewPassword === "") {
            confirmNewPasswordError.textContent = "Vui lòng xác nhận mật khẩu mới";
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault(); // Ngăn chặn gửi form nếu có lỗi
        return; // Dừng lại nếu có lỗi
        }
    });

    document.getElementById('currentPassword').addEventListener('focus', function() {
        document.getElementById('currentPasswordError').textContent = "";
        document.getElementById('currentPassword').value = "";
    });

    document.getElementById('newPassword').addEventListener('focus', function() {
        document.getElementById('newPasswordError').textContent = "";
        document.getElementById('newPassword').value = "";
    });

    document.getElementById('confirmNewPassword').addEventListener('focus', function() {
        document.getElementById('confirmNewPasswordError').textContent = "";
        document.getElementById('confirmNewPassword').value = "";
    });