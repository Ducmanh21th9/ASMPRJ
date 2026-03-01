<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%
  User u = (User) session.getAttribute("authUser");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <style>
    body{font-family:Arial;background:#f6f7fb;margin:0}
    .wrap{max-width:1100px;margin:24px auto;padding:0 16px}
    .top{display:flex;justify-content:space-between;align-items:center;background:#fff;border:1px solid #eee;border-radius:14px;padding:16px 18px}
    .grid{display:grid;grid-template-columns:repeat(3,1fr);gap:14px;margin-top:14px}
    .card{background:#fff;border:1px solid #eee;border-radius:14px;padding:16px}
    .card h3{margin:0 0 10px}
    .muted{color:#666}
    a.btn{display:inline-block;padding:10px 12px;border-radius:10px;border:1px solid #ddd;text-decoration:none;color:#2c5f2d;font-weight:bold}
    .danger{color:#b00}
    @media (max-width:900px){ .grid{grid-template-columns:1fr} }
  </style>
</head>
<body>
  <div class="wrap">
    <div class="top">
      <div>
        <h2 style="margin:0">ADMIN DASHBOARD</h2>
        <div class="muted">
          Xin chào: <b><%= (u!=null?u.getFullName():"") %></b> |
          Vai trò: <b><%= (u!=null?u.getRole():"") %></b>
        </div>
      </div>
      <div>
        <a class="btn" href="<%=request.getContextPath()%>/home">Về trang bán hàng</a>
        <a class="btn danger" href="<%=request.getContextPath()%>/logout">Đăng xuất</a>
      </div>
    </div>

    <div class="grid">
      <div class="card">
        <h3>Quản lý sản phẩm</h3>
        <p class="muted">Thêm / sửa / xóa sản phẩm, cập nhật số lượng tồn kho.</p>
        <!-- TODO: bạn sẽ tạo servlet /admin/products -->
        <a class="btn" href="<%=request.getContextPath()%>/admin/products">Vào quản lý sản phẩm</a>
      </div>

      <div class="card">
        <h3>Quản lý thành viên</h3>
        <p class="muted">Xem danh sách thành viên, tìm kiếm, khóa/mở tài khoản (nếu cần).</p>
        <!-- TODO: bạn sẽ tạo servlet /admin/members -->
        <a class="btn" href="<%=request.getContextPath()%>/admin/members">Vào quản lý thành viên</a>
      </div>

      <div class="card">
        <h3>Quản lý đơn hàng</h3>
        <p class="muted">Xem đơn hàng, trạng thái xử lý, lịch sử mua hàng.</p>
        <!-- TODO: bạn sẽ tạo servlet /admin/orders -->
        <a class="btn" href="<%=request.getContextPath()%>/admin/orders">Vào quản lý đơn hàng</a>
      </div>
    </div>
  </div>
</body>
</html>