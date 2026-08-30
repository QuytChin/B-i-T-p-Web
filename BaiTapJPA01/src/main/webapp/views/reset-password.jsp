<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt lại mật khẩu</title>
<style>
*{box-sizing:border-box} body{margin:0;font-family:Arial;background:linear-gradient(135deg,#0f172a,#2563eb);min-height:100vh;display:flex;align-items:center;justify-content:center}.box{width:460px;background:white;border-radius:18px;padding:38px;box-shadow:0 20px 50px rgba(0,0,0,.25)}h2{color:#1e3a8a;margin-top:0}.desc{color:#6b7280;line-height:1.6}.error{padding:12px;background:#fef2f2;color:#dc2626;border-radius:9px;margin:15px 0}label{display:block;font-weight:bold;color:#374151;margin-top:14px}input{width:100%;padding:13px;border:1px solid #d1d5db;border-radius:10px;margin-top:7px}button{width:100%;padding:14px;border:0;border-radius:10px;background:#2563eb;color:#fff;font-weight:bold;margin-top:22px}
</style>
</head>
<body>
<div class="box">
    <h2>Đặt lại mật khẩu</h2>
    <p class="desc">OTP đã gửi tới <strong>${email}</strong>. Nhập OTP cùng mật khẩu mới.</p>
    <% if (request.getAttribute("error") != null) { %><div class="error"><%= request.getAttribute("error") %></div><% } %>
    <form method="post" action="${pageContext.request.contextPath}/reset-password">
        <label>Mã OTP</label><input type="text" name="otp" maxlength="6" required>
        <label>Mật khẩu mới</label><input type="password" name="password" required>
        <label>Xác nhận mật khẩu</label><input type="password" name="confirmPassword" required>
        <button type="submit">Đổi mật khẩu</button>
    </form>
</div>
</body>
</html>
