<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ngayHienTai" value="<%= new java.util.Date() %>" />
<%-- Chuyển đổi ngày bình luận từ chuỗi thành đối tượng ngày --%>
<fmt:parseDate value="${binhLuan.ngayBinhLuan}" var="ngayBinhLuanDate" pattern="yyyy-MM-dd HH:mm:ss" />
<%-- Tính thời gian trôi qua tính từ thời điểm bình luận --%>
<c:set var="thoiGianTroQua" value="${(ngayHienTai.time - ngayBinhLuanDate.time) / (1000 * 60)}" />
<%-- Hiển thị thời gian trôi qua dưới dạng "Vừa xong", "1 giờ trước", v.v. --%>
<c:choose>
    <%-- Nếu thời gian trôi qua dưới 10 phút, hiển thị "Vừa xong" --%>
    <c:when test="${thoiGianTroQua lt 10}">
        Vừa xong
    </c:when>
    <%-- Nếu thời gian trôi qua dưới 60 phút, hiển thị số phút trước đó --%>
    <c:when test="${thoiGianTroQua lt 60}">
        ${fn:substring(thoiGianTroQua, 0, 2)} phút trước
    </c:when>
    <%-- Nếu thời gian trôi qua dưới 24 giờ, hiển thị số giờ trước đó --%>
    <c:when test="${thoiGianTroQua lt 1440}">
        ${fn:substring(thoiGianTroQua div 60, 0, 2)} giờ trước
    </c:when>
    <%-- Nếu thời gian trôi qua dưới 30 ngày, hiển thị số ngày trước đó --%>
    <c:when test="${thoiGianTroQua lt 43200}">
        ${fn:substring(thoiGianTroQua div 1440, 0, 2)} ngày trước
    </c:when>
    <%-- Trong trường hợp khác, hiển thị mặc định --%>
    <c:otherwise>
        <span>${fn:substring(binhLuan.ngayBinhLuan, 0, 10)}</span>
    </c:otherwise>
</c:choose>