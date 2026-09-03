<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>


<!DOCTYPE html>

<html>

<head>

<title>Thông tin cá nhân</title>


<style>

.profile-page {
    max-width: 850px;
    margin: 0 auto;
}


.profile-title {
    margin-bottom: 25px;
}

.profile-title h1 {
    margin: 0;
    color: #1e3a8a;
    font-size: 30px;
}


.profile-card {

    background: #ffffff;

    padding: 32px;

    border-radius: 18px;

    box-shadow:
        0 8px 30px
        rgba(15, 23, 42, 0.10);
}


.profile-avatar-box {

    text-align: center;

    margin-bottom: 30px;
}


.profile-avatar {

    width: 150px;
    height: 150px;

    object-fit: cover;

    border-radius: 50%;

    border: 5px solid #eff6ff;

    box-shadow:
        0 6px 20px
        rgba(0, 0, 0, 0.15);
}


.upload-image {

    display: block;

    margin: 15px auto 0;

    max-width: 300px;
}


.form-grid {

    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 20px;
}


.form-group {

    display: flex;
    flex-direction: column;

    gap: 7px;
}


.form-group.full {

    grid-column:
        1 / -1;
}


.form-group label {

    font-size: 14px;

    font-weight: bold;

    color: #374151;
}


.form-control {

    padding: 12px 14px;

    border:

        1px solid #d1d5db;

    border-radius: 9px;

    font-size: 15px;

    outline: none;
}


.form-control:focus {

    border-color: #2563eb;

    box-shadow:
        0 0 0 3px
        rgba(37, 99, 235, .10);
}


.form-control[readonly] {

    background: #f3f4f6;

    color: #6b7280;
}


.profile-message {

    padding: 12px 16px;

    margin-bottom: 20px;

    border-radius: 9px;

    background: #dcfce7;

    color: #166534;

    font-weight: 600;
}


.actions {

    margin-top: 28px;

    display: flex;

    justify-content: flex-end;

    gap: 12px;
}


.btn-save {

    padding: 12px 22px;

    border: none;

    border-radius: 9px;

    background: #2563eb;

    color: white;

    font-weight: bold;

    cursor: pointer;
}


.btn-save:hover {

    background: #1d4ed8;
}


@media(max-width: 700px) {

    .form-grid {

        grid-template-columns: 1fr;
    }

}

</style>

</head>


<body>


<c:choose>

    <c:when test="${not empty user.avatar}">

        <c:url
            value="/image"
            var="profileAvatar">

            <c:param
                name="fname"
                value="${user.avatar}" />

        </c:url>

    </c:when>


    <c:otherwise>

        <c:url
            value="/assets/images/avatar.jpg"
            var="profileAvatar" />

    </c:otherwise>

</c:choose>



<div class="profile-page">


    <div class="profile-title">

        <h1>
            Thông tin cá nhân
        </h1>

    </div>


    <div class="profile-card">


        <c:if test="${not empty message}">

            <div class="profile-message">

                ${message}

            </div>

        </c:if>


        <form
            action="${pageContext.request.contextPath}/profile"
            method="post"
            enctype="multipart/form-data">


            <!-- ================= AVATAR ================= -->

            <div class="profile-avatar-box">


                <img
                    id="avatarPreview"
                    src="${profileAvatar}"
                    class="profile-avatar"
                    alt="Avatar">


                <input
                    type="file"
                    name="images"
                    accept="image/*"
                    class="upload-image"
                    onchange="previewAvatar(this)">

            </div>



            <!-- ================= FORM ================= -->

            <div class="form-grid">


                <!-- USERNAME -->

                <div class="form-group">

                    <label>
                        Tên đăng nhập
                    </label>

                    <input
                        class="form-control"
                        type="text"
                        value="${user.username}"
                        readonly>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label>
                        Email
                    </label>

                    <input
                        class="form-control"
                        type="text"
                        value="${user.email}"
                        readonly>

                </div>


                <!-- FULLNAME -->

                <div class="form-group">

                    <label>
                        Họ và tên
                    </label>

                    <input
                        class="form-control"
                        type="text"
                        name="fullname"
                        value="${user.fullname}"
                        required>

                </div>


                <!-- PHONE -->

                <div class="form-group">

                    <label>
                        Số điện thoại
                    </label>

                    <input
                        class="form-control"
                        type="text"
                        name="phone"
                        value="${user.phone}">

                </div>


                <!-- STUDENT ID -->

                <div class="form-group full">

                    <label>
                        Mã số sinh viên
                    </label>

                    <input
                        class="form-control"
                        type="text"
                        value="${user.studentId}"
                        readonly>

                </div>

            </div>



            <!-- ================= BUTTON ================= -->

            <div class="actions">

                <button
                    type="submit"
                    class="btn-save">

                    Cập nhật thông tin

                </button>

            </div>

        </form>


    </div>

</div>



<script>

function previewAvatar(input) {

    if (input.files
            && input.files[0]) {

        const reader =
            new FileReader();

        reader.onload =
            function(e) {

                document
                    .getElementById(
                        "avatarPreview")
                    .src =
                        e.target.result;
            };

        reader.readAsDataURL(
            input.files[0]);
    }
}

</script>


</body>

</html>