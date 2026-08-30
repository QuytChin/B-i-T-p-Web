<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sản phẩm</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
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
            <a class="active" href="${pageContext.request.contextPath}/admin/product/list">Quản lý sản phẩm</a>
            <div class="submenu">
                <a href="${pageContext.request.contextPath}/admin/product/add">+ Thêm sản phẩm</a>
                <a class="active" href="${pageContext.request.contextPath}/admin/product/list">+ Danh sách sản phẩm</a>
            </div>
            <a href="${pageContext.request.contextPath}/product">Trang sản phẩm</a>
        </div>
    </aside>
    <div class="main">
        <div class="topbar"><div class="topbar-user"><img src="${pageContext.request.contextPath}/assets/images/avatar.jpg" class="topbar-avatar" alt="Avatar"><div class="welcome">Xin chào <strong>${sessionScope.username}</strong></div></div><a class="logout-btn" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></div>
        <div class="content">
            <div class="page-title">Quản lý sản phẩm</div>
            <div class="card">
                <div class="card-header"><div class="card-title">Danh sách sản phẩm</div><a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/add">+ Thêm sản phẩm mới</a></div>
                <div class="table-wrap">
                    <table>
                        <thead><tr><th>STT</th><th>Ảnh</th><th>Tên sản phẩm</th><th>Giá</th><th>Danh mục</th><th>Ngày tạo</th><th>Hành động</th></tr></thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty productList}">
                                <c:forEach items="${productList}" var="product" varStatus="stt">
                                    <tr>
                                        <td>${stt.index + 1}</td>
                                        <td><c:choose><c:when test="${not empty product.image and fn:startsWith(product.image, 'http')}"><img src="${product.image}" alt="Product"></c:when><c:when test="${not empty product.image}"><c:url value="/image" var="imgUrl"><c:param name="fname" value="${product.image}"/></c:url><img src="${imgUrl}" alt="Product"></c:when><c:when test="${not empty product.category.icon}"><c:url value="/image" var="imgUrl"><c:param name="fname" value="${product.category.icon}"/></c:url><img src="${imgUrl}" alt="Product"></c:when><c:otherwise><span class="table-image-placeholder">📦</span></c:otherwise></c:choose></td>
                                        <td>${product.name}</td>
                                        <td>${product.price}</td>
                                        <td>${product.category.name}</td>
                                        <td>${product.createdDate}</td>
                                        <td>
                                            <a class="btn btn-warning" href="${pageContext.request.contextPath}/admin/product/edit?id=${product.id}">Sửa</a>
                                            <a class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')" href="${pageContext.request.contextPath}/admin/product/delete?id=${product.id}">Xóa</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise><tr><td colspan="7" class="empty-text">Chưa có sản phẩm nào</td></tr></c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
