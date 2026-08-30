<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa danh mục</title>
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
                <a  href="${pageContext.request.contextPath}/admin/category/add">+ Thêm danh mục mới</a>
                <a class="active" href="${pageContext.request.contextPath}/admin/category/list">+ Danh sách danh mục</a>
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
            <div class="page-title">Sửa danh mục</div>
            <div class="page-desc">
                Cập nhật thông tin danh mục hiện có
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="card-title">Thông tin chỉnh sửa</div>
                </div>

                <form
                    action="${pageContext.request.contextPath}/admin/category/edit"
                    method="post"
                    enctype="multipart/form-data">

                    <input
                        type="hidden"
                        name="id"
                        value="${category.id}">

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="name">Tên danh mục</label>
                            <input
                                type="text"
                                id="name"
                                name="name"
                                value="${category.name}"
                                required>
                        </div>

                        <c:if test="${not empty category.icon}">
                            <div class="form-group">
                                <label>Hình ảnh hiện tại</label>

                                <div class="preview-box">
                                    <c:url value="/image" var="imgUrl">
                                        <c:param name="fname" value="${category.icon}" />
                                    </c:url>

                                    <img src="${imgUrl}" alt="Ảnh hiện tại">
                                </div>
                            </div>
                        </c:if>

                        <div class="form-group">
                            <label for="icon">Chọn ảnh mới</label>
                            <input
                                type="file"
                                id="icon"
                                name="icon"
                                accept="image/*">
                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">
                            Lưu thay đổi
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
