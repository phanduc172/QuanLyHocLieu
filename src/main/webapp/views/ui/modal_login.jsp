<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${sessionScope.loggedInUser != null}">
        <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content border border-3 rounded-circle" style="width: 300px; height: 300px;">
                    <div class="modal-body d-flex justify-content-center align-items-center p-0">
                        <div class="text-success text-center p-0 mb-4">
                            <i class="bi bi-check-circle icon-login"></i>
                            <h2 class="text-center mt-2 fw-bold">Đăng nhập <br> thành công!</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="modal fade" id="failureModal" tabindex="-1" aria-labelledby="failureModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content border border-3 rounded-circle" style="width: 300px; height: 300px;">
                    <div class="modal-body d-flex justify-content-center align-items-center p-0">
                        <div class="text-danger text-center p-0 mb-4">
                            <i class="bi bi-exclamation-circle icon-login"></i>
                            <h2 class="text-center mt-2 fw-bold">Đăng nhập <br> thất bại!</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<script>
    $(document).ready(function() {
        var statusLogin = new URLSearchParams(window.location.search).get("statusLogin");
        if (statusLogin === "true") {
            $('#successModal').modal('show');
        } else if (statusLogin === "false") {
            $('#failureModal').modal('show');
        }
        setTimeout(function() {
            $('#successModal, #failureModal').modal('hide');
        }, 800);
    });
</script>