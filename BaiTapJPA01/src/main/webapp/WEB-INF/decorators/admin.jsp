<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>
    <sitemesh:write property="title"/>
</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/admin.css">

<sitemesh:write property="head"/>

</head>

<body>

<%-- ===============================
     XỬ LÝ AVATAR
     =============================== --%>

<c:choose>

    <c:when test="${not empty sessionScope.avatar}">

        <c:url
            value="/image"
            var="avatarUrl">

            <c:param
                name="fname"
                value="${sessionScope.avatar}" />

        </c:url>

    </c:when>

    <c:otherwise>

        <c:url
            value="/assets/images/avatar.jpg"
            var="avatarUrl" />

    </c:otherwise>

</c:choose>


<div class="admin-wrapper">

    <!-- ================= SIDEBAR ================= -->

    <aside class="sidebar">

        <div class="brand">
            Dashboard
        </div>

        <div class="admin-box">

            <img
                src="${avatarUrl}"
                class="avatar-img"
                alt="Avatar">

            <div class="admin-text">

                <c:choose>

                    <c:when test="${sessionScope.roleid == 1}">
                        Bạn là Admin
                    </c:when>

                    <c:otherwise>
                        Người dùng
                    </c:otherwise>

                </c:choose>

            </div>

        </div>


        <div class="menu">

            <a href="${pageContext.request.contextPath}/home">
                Dashboard
            </a>

            <a class="active"
               href="${pageContext.request.contextPath}/profile">
                Thông tin cá nhân
            </a>

            <a href="${pageContext.request.contextPath}/admin/category/list">
                Quản lý danh mục
            </a>

            <a href="${pageContext.request.contextPath}/admin/product/list">
                Quản lý sản phẩm
            </a>

            <a href="${pageContext.request.contextPath}/product">
                Trang sản phẩm
            </a>

        </div>

    </aside>


    <!-- ================= MAIN ================= -->

    <div class="main">

        <!-- TOPBAR -->

        <div class="topbar">

            <div class="topbar-user">

                <img
                    src="${avatarUrl}"
                    class="topbar-avatar"
                    alt="Avatar">

                <div class="welcome">

                    Xin chào

                    <strong>
                        ${sessionScope.fullname}
                    </strong>

                </div>

            </div>

            <a
                class="logout-btn"
                href="${pageContext.request.contextPath}/logout">

                Đăng xuất

            </a>

        </div>


        <!-- ================= NỘI DUNG TRANG ================= -->

        <main class="content">

            <sitemesh:write property="body"/>

        </main>

    </div>

</div>

</body>

</html>