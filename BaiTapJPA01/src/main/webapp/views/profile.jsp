<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Thông tin cá nhân</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/assets/css/admin.css">

<style>

/* ===== PROFILE PAGE ===== */

.profile-page {
    max-width: 900px;
    margin: 0 auto;
}

.profile-heading {
    text-align: center;
    margin-bottom: 28px;
}

.profile-heading h1 {
    margin: 0 0 8px;
    font-size: 32px;
    color: #1e3a8a;
}

.profile-heading p {
    margin: 0;
    color: #6b7280;
    font-size: 15px;
}

.profile-wrapper {
    max-width: 760px;
    margin: 0 auto;

    background: white;

    padding: 38px 42px;

    border-radius: 18px;

    box-shadow:
        0 10px 30px rgba(15, 23, 42, 0.10);
}

.profile-top {
    text-align: center;

    padding-bottom: 26px;
    margin-bottom: 28px;

    border-bottom: 1px solid #e5e7eb;
}

.profile-avatar-img {
    width: 155px;
    height: 155px;

    object-fit: cover;

    border-radius: 50%;

    border: 5px solid #eff6ff;

    box-shadow:
        0 8px 24px rgba(15, 23, 42, 0.16);
}

.profile-name {
    margin-top: 16px;

    font-size: 24px;
    font-weight: bold;

    color: #111827;
}

.profile-role {
    display: inline-block;

    margin-top: 8px;

    padding: 6px 13px;

    border-radius: 20px;

    background: #eff6ff;

    color: #1e40af;

    font-size: 13px;
    font-weight: bold;
}


/* INFO GRID */

.profile-info-grid {
    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 16px;
}

.profile-item {
    padding: 18px 20px;

    background: #f8fafc;

    border: 1px solid #e5e7eb;

    border-radius: 12px;
}

.profile-label {
    margin-bottom: 6px;

    font-size: 13px;

    color: #6b7280;
}

.profile-value {
    font-size: 17px;

    font-weight: bold;

    color: #111827;
}


/* BUTTON */

.profile-actions {
    display: flex;

    justify-content: center;

    gap: 12px;

    margin-top: 28px;
}


/* MOBILE */

@media (max-width: 700px) {

    .profile-info-grid {
        grid-template-columns: 1fr;
    }

    .profile-wrapper {
        padding: 28px 20px;
    }

}

</style>

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
                src="<%= request.getContextPath() %>/assets/images/avatar.jpg"
                class="avatar-img"
                alt="Avatar">

            <div class="admin-text">
                Bạn là Admin
            </div>

        </div>


        <div class="menu">
            <a href="${pageContext.request.contextPath}/home">Dashboard</a>
            <a class="active" href="${pageContext.request.contextPath}/profile">Thông tin cá nhân</a>
            <a href="${pageContext.request.contextPath}/admin/category/list">Quản lý danh mục</a>
            <a href="${pageContext.request.contextPath}/admin/product/list">Quản lý sản phẩm</a>
            <a href="${pageContext.request.contextPath}/product">Trang sản phẩm</a>
        </div>

    </aside>


    <!-- ================= MAIN ================= -->

    <div class="main">


        <!-- TOPBAR -->

        <div class="topbar">

            <div class="topbar-user">

                <img
                    src="<%= request.getContextPath() %>/assets/images/avatar.jpg"
                    class="topbar-avatar"
                    alt="Avatar">

                <div class="welcome">

                    Xin chào

                    <strong>
                        ${sessionScope.username}
                    </strong>

                </div>

            </div>


            <a
                class="logout-btn"
                href="${pageContext.request.contextPath}/logout">

                Đăng xuất

            </a>

        </div>


        <!-- ================= CONTENT ================= -->

        <main class="content">

            <div class="profile-page">


                <!-- TITLE -->

                <div class="profile-heading">

                    <h1>
                        Thông tin cá nhân
                    </h1>

                    <p>
                        Thông tin tài khoản đang đăng nhập
                    </p>

                </div>


                <!-- PROFILE CARD -->

                <div class="profile-wrapper">


                    <!-- AVATAR -->

                    <div class="profile-top">

                        <img
                            src="<%= request.getContextPath() %>/assets/images/avatar.jpg"
                            class="profile-avatar-img"
                            alt="Avatar">


                        <div class="profile-name">

                            ${sessionScope.fullname}

                        </div>


                        <div class="profile-role">

                            Administrator

                        </div>

                    </div>


                    <!-- INFORMATION -->

                    <div class="profile-info-grid">


                        <div class="profile-item">

                            <div class="profile-label">
                                Tên đăng nhập
                            </div>

                            <div class="profile-value">

                                ${sessionScope.username}

                            </div>

                        </div>


                        <div class="profile-item">

                            <div class="profile-label">
                                Họ và tên
                            </div>

                            <div class="profile-value">

                                ${sessionScope.fullname}

                            </div>

                        </div>


                        <div class="profile-item">

                            <div class="profile-label">
                                Mã số sinh viên
                            </div>

                            <div class="profile-value">

                                ${sessionScope.studentId}

                            </div>

                        </div>


                        <div class="profile-item">

                            <div class="profile-label">
                                Vai trò
                            </div>

                            <div class="profile-value">

                                Administrator

                            </div>

                        </div>


                    </div>


                    <!-- ACTION -->

                    <div class="profile-actions">

                        <a
                            class="btn btn-primary"
                            href="${pageContext.request.contextPath}/home">

                            Về Dashboard

                        </a>


                        <a
                            class="btn btn-secondary"
                            href="${pageContext.request.contextPath}/admin/category/list">

                            Quản lý danh mục

                        </a>

                    </div>


                </div>

            </div>

        </main>


    </div>

</div>

</body>

</html>
