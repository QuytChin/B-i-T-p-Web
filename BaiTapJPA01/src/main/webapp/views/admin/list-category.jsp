<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý danh mục</title>

<link rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/assets/css/admin.css">

</head>
<body>

<div class="admin-wrapper">

    <!-- SIDEBAR -->
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
            <a href="${pageContext.request.contextPath}/home">
                Dashboard
            </a>
            
            <a href="${pageContext.request.contextPath}/profile">
			    Thông tin cá nhân
			</a>

            <a class="active" href="#">
                Quản lý danh mục
            </a>

            <div class="submenu">

                <a class="active" href="${pageContext.request.contextPath}/admin/category/list">
                    + Danh sách danh mục
                </a>
            </div>
        </div>
    </aside>

    <!-- MAIN -->
    <div class="main">

        <!-- TOPBAR -->
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

        <!-- CONTENT -->
        <div class="content">
            <div class="page-title">Quản lý danh mục</div>
            <div class="page-desc">
                Nơi bạn có thể quản lý danh mục của mình
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="card-title">Danh sách danh mục</div>

                    <a class="btn btn-primary"
                       href="${pageContext.request.contextPath}/admin/category/add">
                        + Thêm danh mục mới
                    </a>
                </div>

                <div class="table-wrap">
                    <table>
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Hình ảnh</th>
                                <th>Tên danh mục</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>
                                <c:when test="${not empty cateList}">
                                    <c:forEach items="${cateList}" var="cate" varStatus="stt">
                                        <tr>
                                            <td>${stt.index + 1}</td>

                                            <td>
                                                <c:if test="${not empty cate.icon}">
                                                    <c:url value="/image" var="imgUrl">
                                                        <c:param name="fname" value="${cate.icon}" />
                                                    </c:url>

                                                    <img src="${imgUrl}" alt="Category">
                                                </c:if>
                                            </td>

                                            <td>${cate.name}</td>

                                            <td>
                                                <a class="btn btn-warning"
                                                   href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.id}">
                                                    Sửa
                                                </a>

                                                <a class="btn btn-danger"
                                                   onclick="return confirm('Bạn có chắc muốn xóa không?')"
                                                   href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.id}">
                                                    Xóa
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>

                                <c:otherwise>
                                    <tr>
                                        <td colspan="4" class="empty-text">
                                            Chưa có danh mục nào
                                        </td>
                                    </tr>
                                </c:otherwise>
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