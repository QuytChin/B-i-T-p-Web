<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Kết quả upload</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
<style>.result-card{max-width:680px;margin:40px auto;text-align:center}.result-icon{font-size:58px}.result-card h2{margin:12px 0;color:#172554}.result-card p{color:#475569;margin:15px 0 25px;line-height:1.6}.result-actions{display:flex;justify-content:center;gap:12px;flex-wrap:wrap}</style>
</head>
<body>
<div class="admin-wrapper">
    <aside class="sidebar">
        <div class="brand">Dashboard</div>
        <div class="admin-box"><img src="${pageContext.request.contextPath}/assets/images/avatar.jpg" class="avatar-img" alt="Avatar"><div class="admin-text">Bạn là Admin</div></div>
        <div class="menu">
            <a href="${pageContext.request.contextPath}/home">Dashboard</a>
            <a href="${pageContext.request.contextPath}/profile">Thông tin cá nhân</a>
            <a href="${pageContext.request.contextPath}/admin/category/list">Quản lý danh mục</a>
            <a href="${pageContext.request.contextPath}/admin/product/list">Quản lý sản phẩm</a>
            <a href="${pageContext.request.contextPath}/product">Trang sản phẩm</a>
        </div>
    </aside>
    <div class="main">
        <div class="topbar"><div class="topbar-user"><img src="${pageContext.request.contextPath}/assets/images/avatar.jpg" class="topbar-avatar"><div class="welcome">Xin chào <strong>${sessionScope.username}</strong></div></div><a class="logout-btn" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></div>
        <main class="content">
            <div class="card result-card"><div class="result-icon">✅</div><h2>Kết quả Multipart Upload</h2><p>${message}</p><div class="result-actions"><a class="btn btn-primary" href="${pageContext.request.contextPath}/upload">Upload file khác</a><a class="btn btn-secondary" href="${pageContext.request.contextPath}/home">Về Dashboard</a></div></div>
        </main>
    </div>
</div>
</body>
</html>
