<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Đăng ký tài khoản</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    min-height: 100vh;

    display: flex;
    align-items: center;
    justify-content: center;

    padding: 35px;

    font-family: Arial, sans-serif;

    background:
        linear-gradient(
            135deg,
            #0f172a,
            #1e3a8a,
            #2563eb
        );
}

.register-box {
    width: 760px;

    padding: 42px;

    background: white;

    border-radius: 20px;

    box-shadow:
        0 25px 60px
        rgba(0, 0, 0, 0.25);
}

.register-title {
    text-align: center;

    margin-bottom: 8px;

    font-size: 32px;

    color: #1e3a8a;
}

.register-desc {
    text-align: center;

    margin-bottom: 30px;

    color: #6b7280;
}

.form-grid {
    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 18px;
}

.form-group label {
    display: block;

    margin-bottom: 7px;

    font-size: 14px;
    font-weight: bold;

    color: #374151;
}

.form-group input {
    width: 100%;

    padding: 13px 14px;

    border: 1px solid #d1d5db;

    border-radius: 10px;

    outline: none;

    font-size: 15px;
}

.form-group input:focus {
    border-color: #2563eb;

    box-shadow:
        0 0 0 3px
        rgba(37, 99, 235, 0.12);
}

.full-width {
    grid-column: 1 / -1;
}

.error {
    margin-bottom: 20px;

    padding: 12px 15px;

    color: #dc2626;

    background: #fef2f2;

    border: 1px solid #fecaca;

    border-radius: 10px;
}

.register-btn {
    width: 100%;

    margin-top: 25px;

    padding: 14px;

    border: none;

    border-radius: 10px;

    background:
        linear-gradient(
            135deg,
            #2563eb,
            #1e40af
        );

    color: white;

    font-size: 16px;
    font-weight: bold;

    cursor: pointer;
}

.login-link {
    margin-top: 20px;

    text-align: center;

    color: #6b7280;
}

.login-link a {
    color: #2563eb;
    font-weight: bold;
    text-decoration: none;
}

@media(max-width: 700px) {

    .form-grid {
        grid-template-columns: 1fr;
    }

    .full-width {
        grid-column: auto;
    }

}

</style>

</head>


<body>

<div class="register-box">

    <h1 class="register-title">
        Tạo tài khoản
    </h1>

    <p class="register-desc">
        Điền thông tin để đăng ký tài khoản mới
    </p>


    <% if (request.getAttribute("error") != null) { %>

        <div class="error">

            <%= request.getAttribute("error") %>

        </div>

    <% } %>


    <form
        action="${pageContext.request.contextPath}/register"
        method="post">

        <div class="form-grid">


            <div class="form-group">

                <label>
                    Tên đăng nhập *
                </label>

                <input
                    type="text"
                    name="username"
                    placeholder="Nhập tên đăng nhập"
                    required>

            </div>


            <div class="form-group">

                <label>
                    Họ và tên *
                </label>

                <input
                    type="text"
                    name="fullname"
                    placeholder="Nhập họ và tên"
                    required>

            </div>


            <div class="form-group">

                <label>
                    Email
                </label>

                <input
                    type="email"
                    name="email"
                    placeholder="example@gmail.com">

            </div>


            <div class="form-group">

                <label>
                    Số điện thoại
                </label>

                <input
                    type="text"
                    name="phone"
                    placeholder="Nhập số điện thoại">

            </div>


            <div class="form-group">

                <label>
                    Mã số sinh viên
                </label>

                <input
                    type="text"
                    name="studentId"
                    placeholder="Nhập MSSV">

            </div>


            <div></div>


            <div class="form-group">

                <label>
                    Mật khẩu *
                </label>

                <input
                    type="password"
                    name="password"
                    placeholder="Nhập mật khẩu"
                    required>

            </div>


            <div class="form-group">

                <label>
                    Xác nhận mật khẩu *
                </label>

                <input
                    type="password"
                    name="confirmPassword"
                    placeholder="Nhập lại mật khẩu"
                    required>

            </div>

        </div>


        <button
            type="submit"
            class="register-btn">

            Đăng ký tài khoản

        </button>

    </form>


    <div class="login-link">

        Đã có tài khoản?

        <a href="${pageContext.request.contextPath}/login">
            Đăng nhập
        </a>

    </div>

</div>

</body>

</html>