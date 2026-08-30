<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
<style>
*{box-sizing:border-box} body{margin:0;font-family:Arial;background:linear-gradient(135deg,#0f172a,#2563eb);min-height:100vh;display:flex;align-items:center;justify-content:center}.box{width:440px;background:white;border-radius:18px;padding:38px;box-shadow:0 20px 50px rgba(0,0,0,.25)}h2{color:#1e3a8a;margin-top:0}.desc{color:#6b7280;line-height:1.6}.error{padding:12px;background:#fef2f2;color:#dc2626;border-radius:9px;margin:15px 0}label{font-weight:bold;color:#374151}input{width:100%;padding:13px;border:1px solid #d1d5db;border-radius:10px;margin:8px 0 20px}button{width:100%;padding:14px;border:0;border-radius:10px;background:#2563eb;color:#fff;font-weight:bold}.back{text-align:center;margin-top:18px}.back a{color:#2563eb;text-decoration:none}
</style>
</head>
<body>
<div class="box">
    <h2>Quên mật khẩu</h2>
    <p class="desc">Nhập email đã đăng ký. Hệ thống sẽ gửi OTP để xác nhận đổi mật khẩu.</p>
    <% if (request.getAttribute("error") != null) { %><div class="error"><%= request.getAttribute("error") %></div><% } %>
    <form method="post" action="${pageContext.request.contextPath}/forgot-password">
        <label>Email</label>
        <input type="email" name="email" placeholder="example@gmail.com" required>
        <button type="submit">Gửi OTP</button>
    </form>
    <div class="back"><a href="${pageContext.request.contextPath}/login">Quay lại đăng nhập</a></div>
</div>
</body>
</html>
