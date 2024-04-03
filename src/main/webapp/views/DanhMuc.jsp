<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách Danh mục</title>
</head>
<body>
    <h1> Name : ${name}</h1>
    <h1>Danh sách Danh mục</h1>
    <table border="1">
        <tr>
            <th>Mã danh mục</th>
            <th>Tên danh mục</th>
        </tr>

        <c:forEach var="danhmuc" items="${danhmucs}">
            <tr>
                <td>${danhmuc.getMaDanhMuc()}</td>
                <td>${danhmuc.tenDanhMuc}</td>
            <tr/>
        </c:forEach>
    </table>
</body>
</html>
