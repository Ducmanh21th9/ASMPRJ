<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%
  User u = (User) session.getAttribute("authUser");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Member Home</title>
  <style>
    body{font-family:Arial;margin:20px}
    .box{max-width:700px;margin:auto;border:1px solid #ddd;padding:18px;border-radius:12px}
    a{color:#2c5f2d;text-decoration:none;font-weight:bold}
  </style>
</head>
<body>
  <div class="box">
    <h2>TRANG THÀNH VIÊN</h2>

    <p>Xin chào: <b><%= (u!=null?u.getFullName():"") %></b></p>
    <p>Vai trò: <b><%= (u!=null?u.getRole():"") %></b></p>

    <p>
      <a href="<%=request.getContextPath()%>/logout">Đăng xuất</a>
    </p>
  </div>
</body>
</html>