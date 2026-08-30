<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm danh mục</title>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

<div class="admin-wrapper">

    <aside class="sidebar">
        <div class="brand">Dashboard</div>

        <div class="admin-box">
            <img
			    src="${pageContext.request.contextPath}/assets/images/avatar.jpg"
			    class="avatar-img"
			    alt="Avatar">
            <div class="admin-text">Bạn là Admin</div>
        </div>

        <div class="menu">
            <a href="${pageContext.request.contextPath}/home">Dashboard</a>
            <a href="${pageContext.request.contextPath}/profile">Thông tin cá nhân</a>
            <a class="active" href="${pageContext.request.contextPath}/admin/category/list">Quản lý danh mục</a>
            <div class="submenu">
                <a class="active" href="${pageContext.request.contextPath}/admin/category/add">+ Thêm danh mục mới</a>
                <a  href="${pageContext.request.contextPath}/admin/category/list">+ Danh sách danh mục</a>
            </div>
            <a href="${pageContext.request.contextPath}/admin/product/list">Quản lý sản phẩm</a>
            <a href="${pageContext.request.contextPath}/product">Trang sản phẩm</a>
        </div>
    </aside>

    <div class="main">
        <div class="topbar">

		    <div class="topbar-user">
		
		        <img
		            src="${pageContext.request.contextPath}/assets/images/avatar.jpg"
		            class="topbar-avatar"
		            alt="Avatar">
		
		        <div class="welcome">
		            Xin chào
		            <strong>${sessionScope.username}</strong>
		        </div>
		
		    </div>
	
		    <a class="logout-btn"
		       href="${pageContext.request.contextPath}/logout">
		
		        Đăng xuất
		
		    </a>
		
		</div>

        <div class="content">
            <div class="page-title">Thêm danh mục</div>
            <div class="page-desc">
                Tạo mới danh mục sản phẩm
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="card-title">Thông tin danh mục</div>
                </div>

                <form
                    action="${pageContext.request.contextPath}/admin/category/add"
                    method="post"
                    enctype="multipart/form-data">

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="name">Tên danh mục</label>
                            <input
                                type="text"
                                id="name"
                                name="name"
                                placeholder="Nhập tên danh mục"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="icon">Hình ảnh</label>
                            <input
                                type="file"
                                id="icon"
                                name="icon"
                                accept="image/*">
                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">
                            Thêm danh mục
                        </button>

                        <a class="btn btn-secondary"
                           href="${pageContext.request.contextPath}/admin/category/list">
                            Quay lại
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
