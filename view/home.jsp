
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<div>
    <h6>Họ tên: Vũ Hoàng Sơn</h6>
    <h6>MSSV: 102170188</h6>
    <h1>Hello, <% out.print(request.getSession().getAttribute("user"));%></h1>
    <h3>Mục đích:</h3> Trang web giúp quản lý nhân sự trong khoa
    <h3>Hướng dẫn sử dụng:</h3>
    <p>1. Staff Info: Xem thông tin các nhân viên trong khoa (Có thể sửa hoặc xóa nhân viên bằng cách chọn các icon tương ứng).</p>
    <p>2. Department Info: Xem thông tin các khoa (Có thể sửa khoa bằng cách chọn icon tương ứng).</p>
    <p>3. Add new staff: Thêm nhân viên mới.</p>
    <p>4. Add new department: Thêm khoa mới.</p>
    <p>5. Search: Tìm kiếm nhân viên hoặc khoa dựa trên từ khóa nhập vào.</p>
    <p>6. Login: Đăng nhập để sử dụng các chức năng của trang web.</p>
    <p>7. Logout: Đăng xuất khỏi trang web.</p>
</div>
</body>
</html>
