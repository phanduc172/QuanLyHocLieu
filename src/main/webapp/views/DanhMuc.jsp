<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách Danh mục</title>
</head>
<body>
    <h1>Danh sách Danh mục</h1>
    <table border="1">
        <tr>
            <th>Mã danh mục</th>
            <th>Tên danh mục</th>
        </tr>
        <c:forEach var="danhmuc" items="${danhmucs}">
            <tr>
                <td>${danhmuc.getMaDanhMuc()}</td>
                <td>${danhmuc.getTenDanhMuc()}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
