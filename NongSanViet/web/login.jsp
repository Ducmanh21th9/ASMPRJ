<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <style>
    body{font-family:Arial;background:#f5f5f5;margin:0}
    .box{max-width:420px;margin:60px auto;background:#fff;padding:24px;border-radius:12px}
    input{width:100%;padding:10px;margin:8px 0;border:1px solid #ddd;border-radius:8px}
    button{width:100%;padding:10px;border:0;border-radius:8px;cursor:pointer;background:#2c5f2d;color:#fff}
    .err{color:#c00;margin:8px 0}
    a{color:#2c5f2d;text-decoration:none}
  </style>
</head>
<body>
<div class="box">
  <h2>Đăng nhập</h2>

  <%
    String err = (String) request.getAttribute("error");
    if (err != null) {
  %>
    <div class="err"><%= err %></div>
  <%
    }
  %>

  <form method="post" action="<%=request.getContextPath()%>/login">
    <label>Tài khoản hoặc Email</label>
    <input name="username" required />

    <label>Mật khẩu</label>
    <input type="password" name="password" required />

    <button type="submit">Đăng nhập</button>
  </form>

  <p style="margin-top:12px;">
    <a href="<%=request.getContextPath()%>/home">← Về trang chủ</a>
  </p>
</div>
</body>
</html>
