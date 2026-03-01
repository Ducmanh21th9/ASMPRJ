<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Sản phẩm - Nông Sản Việt</title>
  <%
  String regionTitle = (String) request.getAttribute("regionTitle");
  String regionIntro  = (String) request.getAttribute("regionIntro");
  if (regionTitle != null && regionIntro != null) {
%>
  <div style="margin:14px 0 18px; background:#fff; border:1px solid #eee; border-radius:14px; padding:16px 18px;">
    <h3 style="margin:0 0 8px; color:#2c5f2d;"><%=regionTitle%></h3>
    <p style="margin:0; color:#555; line-height:1.6;"><%=regionIntro%></p>
  </div>
<%
  }
%>
  <style>
    body{font-family:Arial;background:#f6f7fb;margin:0}
    .wrap{max-width:1200px;margin:22px auto;padding:0 16px}
    .top{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:14px}
    a{color:#2c5f2d;text-decoration:none;font-weight:bold}
    .muted{color:#666;margin:6px 0 0}
    .grid{
      display:grid;
      grid-template-columns:repeat(4, 1fr);
      gap:16px;
      margin-top:16px;
    }
    .card{
      background:#fff;
      border:1px solid #eee;
      border-radius:14px;
      overflow:hidden;
      box-shadow:0 10px 24px rgba(0,0,0,0.06);
      display:flex;
      flex-direction:column;
      min-height: 360px;
    }
    .img{
      height: 170px;
      background:#e9ecef;
    }
    .img img{
      width:100%;
      height:100%;
      object-fit:cover;
      display:block;
    }
    .info{
      padding:14px 14px 16px;
      display:flex;
      flex-direction:column;
      gap:8px;
      flex:1;
    }
    .tag{
      display:inline-block;
      padding:4px 10px;
      border-radius:999px;
      font-size:12px;
      background:#eef6ee;
      color:#2c5f2d;
      width:max-content;
      line-height:1.2;
    }
    .name{
      margin:0;
      font-size:16px;
      line-height:1.25;
      min-height:40px; /* giữ đều chiều cao tên */
    }
    .meta{
      margin:0;
      color:#666;
      line-height:1.45;
      min-height:42px; /* giữ đều meta */
      font-size:13px;
    }
    .price{
      margin-top:auto;
      font-weight:800;
      color:#2c5f2d;
      font-size:18px;
    }
    .row{
      display:flex;
      justify-content:space-between;
      gap:10px;
      color:#444;
      font-size:13px;
    }
    .btn{
      margin-top:10px;
      display:inline-block;
      text-align:center;
      padding:10px 12px;
      border-radius:10px;
      border:1px solid #dfe3ea;
      background:#fff;
      color:#2c5f2d;
      font-weight:700;
    }
    .btn:hover{background:#f3f7f3}
    @media (max-width:1100px){
      .grid{grid-template-columns:repeat(3,1fr);}
    }
    @media (max-width:820px){
      .grid{grid-template-columns:repeat(2,1fr);}
    }
    @media (max-width:520px){
      .grid{grid-template-columns:1fr;}
    }
  </style>
</head>
<body>
  <div class="wrap">
    <div class="top">
      <div>
        <h2 style="margin:0">Tất cả sản phẩm</h2>
        <div class="muted">Danh sách sản phẩm đang có trên hệ thống</div>
      </div>
      <a href="<%=request.getContextPath()%>/home">← Về trang chủ</a>
    </div>

    <%
      List<Product> products = (List<Product>) request.getAttribute("products");
      if (products == null || products.isEmpty()) {
    %>
      <p class="muted">Chưa có dữ liệu. Hãy chạy file SQL và kiểm tra DBUtil/Products.</p>
    <%
      } else {
    %>
      <div class="muted">Tổng: <b><%=products.size()%></b> sản phẩm</div>

      <div class="grid">
        <%
          for (Product p : products) {
        %>
          <div class="card">
            <div class="img">
              <img src="<%= (p.getImageUrl()==null || p.getImageUrl().isBlank())
                              ? (request.getContextPath()+"/images/products/default.jpg")
                              : p.getImageUrl() %>"
                   alt="<%=p.getName()%>">
            </div>

            <div class="info">
              <span class="tag">NÔNG SẢN</span>
              <h3 class="name"><%=p.getName()%></h3>

              <p class="meta">
                Thu hoạch: <b><%=p.getFormattedHarvestDate()%></b><br/>
                Tồn kho: <b><%=p.getFormattedQuantityKg()%></b>
              </p>

              <div class="price"><%=p.getFormattedPricePerKg()%></div>

              <a class="btn" href="<%=request.getContextPath()%>/login">Mua ngay</a>
            </div>
          </div>
        <%
          }
        %>
      </div>
    <%
      }
    %>
  </div>
</body>
</html>