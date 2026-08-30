<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demo Multipart</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
<style>
.multipart-card{max-width:720px;margin:0 auto}.upload-zone{margin-top:12px;border:2px dashed #bfdbfe;border-radius:18px;background:#f8fbff;padding:34px;text-align:center}.upload-icon{font-size:46px;margin-bottom:12px}.upload-zone h3{font-size:21px;color:#172554;margin-bottom:7px}.upload-zone p{color:#64748b;margin-bottom:20px;line-height:1.6}.upload-zone input[type=file]{width:100%;padding:13px;background:white;border:1px solid #dbeafe;border-radius:11px;margin-bottom:18px}.upload-actions{display:flex;justify-content:center;gap:12px;flex-wrap:wrap}
</style>
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
        <div class="topbar">
            <div class="topbar-user"><img src="${pageContext.request.contextPath}/assets/images/avatar.jpg" class="topbar-avatar" alt="Avatar"><div class="welcome">Xin chào <strong>${sessionScope.username}</strong></div></div>
            <a class="logout-btn" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
        </div>

        <main class="content">
            <div class="page-title">Demo Multipart</div>
            <div class="card multipart-card">
                <div class="upload-zone">
                    <div class="upload-icon">☁️</div>
                    <h3>Upload file bằng Servlet Multipart</h3>
                    <p>Sử dụng <strong>@MultipartConfig</strong> và <strong>Part</strong> theo nội dung bài học.</p>
                    <form method="post" action="${pageContext.request.contextPath}/multiPartServlet" enctype="multipart/form-data">
                        <input type="file" name="multiPartServlet" required>
                        <div class="upload-actions">
                            <input class="btn btn-primary" type="submit" value="Upload file">
                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/home">Về Dashboard</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
