<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Dashboard</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/assets/css/admin.css">

</head>

<body>

<div class="admin-wrapper">

    <!-- ================= SIDEBAR ================= -->

    <aside class="sidebar">

        <div class="brand">
            Dashboard
        </div>

        <div class="admin-box">

            <img
			    src="${pageContext.request.contextPath}/assets/images/avatar.jpg"
			    class="avatar-img"
			    alt="Avatar">

            <div class="admin-text">
                Bạn là Admin
            </div>

        </div>

        <div class="menu">

            <a class="active"
               href="${pageContext.request.contextPath}/home">

                Dashboard

            </a>

            <a href="${pageContext.request.contextPath}/profile">

                Thông tin cá nhân

            </a>

            <a href="${pageContext.request.contextPath}/admin/category/list">

                Quản lý danh mục

            </a>


        </div>

    </aside>


    <!-- ================= MAIN ================= -->

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

        <main class="content">

            <div class="page-title">
                Tổng quan
            </div>

            <div class="page-desc">

                Chào mừng bạn đến với hệ thống quản trị.

            </div>


            <!-- DASHBOARD CARDS -->

            <div class="dashboard-grid">


                <!-- USER -->

                <div class="dashboard-card">

                    <div class="dashboard-icon">
                        👤
                    </div>

                    <div>

                        <div class="dashboard-label">
                            Tài khoản
                        </div>

                        <div class="dashboard-value">
                            ${sessionScope.username}
                        </div>

                    </div>

                </div>


                <!-- CATEGORY -->

                <div class="dashboard-card">

                    <div class="dashboard-icon">
                        📁
                    </div>

                    <div>

                        <div class="dashboard-label">
                            Tổng danh mục
                        </div>

                        <div class="dashboard-value">
                            ${categoryCount}
                        </div>

                    </div>

                </div>


                <!-- ROLE -->

                <div class="dashboard-card">

                    <div class="dashboard-icon">
                        🛡️
                    </div>

                    <div>

                        <div class="dashboard-label">
                            Vai trò
                        </div>

                        <div class="dashboard-value">
                            Admin
                        </div>

                    </div>

                </div>

            </div>


            <!-- MAIN PANEL -->

            <div class="card dashboard-main-card">

                <div class="card-header">

                    <div>

                        <div class="card-title">
                            Quản lý hệ thống
                        </div>

                        <p class="dashboard-subtitle">
                            Chọn chức năng bạn muốn thực hiện
                        </p>

                    </div>

                </div>


                <div class="quick-actions">


                    <!-- PROFILE -->

                    <a class="quick-action"
                       href="${pageContext.request.contextPath}/profile">

                        <div class="quick-icon">
                            👤
                        </div>

                        <div>

                            <h3>
                                Thông tin cá nhân
                            </h3>

                            <p>
                                Xem thông tin tài khoản đang đăng nhập
                            </p>

                        </div>

                    </a>


                    <!-- CATEGORY LIST -->

                    <a class="quick-action"
                       href="${pageContext.request.contextPath}/admin/category/list">

                        <div class="quick-icon">
                            📂
                        </div>

                        <div>

                            <h3>
                                Quản lý danh mục
                            </h3>

                            <p>
                                Xem, sửa và xóa danh mục
                            </p>

                        </div>

                    </a>


                    <!-- ADD CATEGORY -->

                    <a class="quick-action"
                       href="${pageContext.request.contextPath}/admin/category/add">

                        <div class="quick-icon">
                            ➕
                        </div>

                        <div>

                            <h3>
                                Thêm danh mục
                            </h3>

                            <p>
                                Tạo một danh mục mới
                            </p>

                        </div>

                    </a>

                </div>

            </div>

        </main>

    </div>

</div>

</body>

</html>