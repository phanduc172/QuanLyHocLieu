<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Hiển thị modal thông báo khi cập nhật thành công -->
<div class="modal fade" id="updateSuccessModal" tabindex="-1" aria-labelledby="updateSuccessModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content border">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title" id="updateSuccessModalLabel">Cập nhật thành công</h5>
            </div>
            <div class="modal-body">
                <div class="fs-5">
                    Thông tin mới đã được cập nhật thành công.
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const urlParams = new URLSearchParams(window.location.search);
        const updateSuccess = urlParams.get('updateSuccess');
        if (updateSuccess === 'true') {
            var myModal = new bootstrap.Modal(document.getElementById('updateSuccessModal'));
            myModal.show();
            // Tắt modal sau 3 giây
            setTimeout(function() {
                myModal.hide();
            }, 1500);
        }
    });
</script>