<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="admin-wrapper">
    <aside class="sidebar">
        <div class="brand">Dashboard</div>
        <div class="admin-box"><img src="${pageContext.request.contextPath}/assets/images/avatar.jpg" class="avatar-img" alt="Avatar"><div class="admin-text">Bạn là Admin</div></div>
        <div class="menu">
            <a class="active" href="${pageContext.request.contextPath}/home">Dashboard</a>
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
            <div class="page-title">Tổng quan</div>

            <div class="dashboard-grid">
                <div class="dashboard-card"><div class="dashboard-icon">👤</div><div><div class="dashboard-label">Tài khoản</div><div class="dashboard-value">${sessionScope.username}</div></div></div>
                <div class="dashboard-card"><div class="dashboard-icon">📁</div><div><div class="dashboard-label">Tổng danh mục</div><div class="dashboard-value">${categoryCount}</div></div></div>
                <div class="dashboard-card"><div class="dashboard-icon">📦</div><div><div class="dashboard-label">Tổng sản phẩm</div><div class="dashboard-value">${productCount}</div></div></div>
            </div>

            <div class="card dashboard-main-card">
                <div class="card-header"><div class="card-title">Chức năng quản lý</div></div>
                <div class="quick-actions">
                    <a class="quick-action" href="${pageContext.request.contextPath}/admin/category/list"><div class="quick-icon">📂</div><div><h3>Quản lý danh mục</h3><p>Xem, thêm, sửa và xóa danh mục</p></div></a>
                    <a class="quick-action" href="${pageContext.request.contextPath}/admin/product/list"><div class="quick-icon">📦</div><div><h3>Quản lý sản phẩm</h3></div></a>
                    <a class="quick-action" href="${pageContext.request.contextPath}/product"><div class="quick-icon">🛒</div><div><h3>Danh sách sản phẩm</h3><p>Phân trang 6 sản phẩm mỗi trang</p></div></a>
                </div>
            </div>

            <div class="card" style="margin-top:24px">
                <div class="card-header"><div><div class="card-title">10 sản phẩm mới nhất</div><p class="dashboard-subtitle">Bấm vào sản phẩm để xem chi tiết</p></div><a class="btn btn-primary" href="${pageContext.request.contextPath}/product">Xem tất cả</a></div>
                <div class="product-grid-admin">
                    <c:choose>
                        <c:when test="${not empty latestProducts}">
                            <c:forEach items="${latestProducts}" var="p">
                                <a class="product-card-admin" href="${pageContext.request.contextPath}/product/detail?id=${p.id}">
                                    <c:choose>
                                        <c:when test="${not empty p.image and fn:startsWith(p.image, 'http')}"><img src="${p.image}" alt="${p.name}"></c:when>
                                        <c:when test="${not empty p.image}"><c:url value="/image" var="imgUrl"><c:param name="fname" value="${p.image}"/></c:url><img src="${imgUrl}" alt="${p.name}"></c:when>
                                        <c:when test="${not empty p.category.icon}"><c:url value="/image" var="imgUrl"><c:param name="fname" value="${p.category.icon}"/></c:url><img src="${imgUrl}" alt="${p.name}"></c:when>
                                        <c:otherwise><div class="product-placeholder">📦</div></c:otherwise>
                                    </c:choose>
                                    <div class="product-card-body"><strong>${p.name}</strong><span>${p.price} VNĐ</span><small>${p.category.name}</small></div>
                                </a>
                            </c:forEach>
                        </c:when>
                        <c:otherwise><div class="empty-text">Chưa có sản phẩm. Hãy thêm sản phẩm từ trang quản trị.</div></c:otherwise>
                    </c:choose>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
