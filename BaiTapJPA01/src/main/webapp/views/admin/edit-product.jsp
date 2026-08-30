<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa sản phẩm</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="admin-wrapper">
    <aside class="sidebar">
        <div class="brand">Dashboard</div>
        <div class="admin-box"><img src="${pageContext.request.contextPath}/assets/images/avatar.jpg" class="avatar-img"><div class="admin-text">Bạn là Admin</div></div>
        <div class="menu">
            <a href="${pageContext.request.contextPath}/home">Dashboard</a>
            <a href="${pageContext.request.contextPath}/profile">Thông tin cá nhân</a>
            <a href="${pageContext.request.contextPath}/admin/category/list">Quản lý danh mục</a>
            <a class="active" href="${pageContext.request.contextPath}/admin/product/list">Quản lý sản phẩm</a>
            <a href="${pageContext.request.contextPath}/product">Trang sản phẩm</a>
        </div>
    </aside>
    <div class="main">
        <div class="topbar"><div class="topbar-user"><img src="${pageContext.request.contextPath}/assets/images/avatar.jpg" class="topbar-avatar"><div class="welcome">Xin chào <strong>${sessionScope.username}</strong></div></div><a class="logout-btn" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></div>
        <div class="content">
            <div class="page-title">Sửa sản phẩm</div>
            <c:if test="${not empty error}"><div style="padding:12px;background:#fef2f2;color:#dc2626;border-radius:10px;margin-bottom:15px">${error}</div></c:if>
            <div class="card">
                <form action="${pageContext.request.contextPath}/admin/product/edit" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${product.id}">
                    <div class="form-grid">
                        <div class="form-group"><label>Tên sản phẩm</label><input type="text" name="name" value="${product.name}" required></div>
                        <div class="form-group"><label>Giá</label><input type="number" name="price" min="0" step="0.01" value="${product.price}" required></div>
                        <div class="form-group"><label>Danh mục</label><select name="categoryId" required><c:forEach items="${categories}" var="cate"><option value="${cate.id}" ${cate.id == product.category.id ? 'selected' : ''}>${cate.name}</option></c:forEach></select></div>
                        <div class="form-group"><label>Chọn ảnh mới</label><input type="file" name="image" accept="image/*"></div>
                        <c:if test="${not empty product.image}"><div class="form-group"><label>Ảnh hiện tại</label><div class="preview-box"><c:choose><c:when test="${fn:startsWith(product.image, 'http')}"><img src="${product.image}" alt="Ảnh sản phẩm"></c:when><c:otherwise><c:url value="/image" var="imgUrl"><c:param name="fname" value="${product.image}"/></c:url><img src="${imgUrl}" alt="Ảnh sản phẩm"></c:otherwise></c:choose></div></div></c:if>
                        <div class="form-group full-width"><label>Mô tả</label><textarea name="description" rows="6">${product.description}</textarea></div>
                    </div>
                    <div class="form-actions"><button class="btn btn-primary" type="submit">Lưu thay đổi</button><a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/product/list">Quay lại</a></div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
