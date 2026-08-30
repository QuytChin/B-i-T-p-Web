<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xác thực OTP</title>
<style>
*{box-sizing:border-box} body{margin:0;font-family:Arial;background:linear-gradient(135deg,#0f172a,#2563eb);min-height:100vh;display:flex;align-items:center;justify-content:center}.box{width:440px;background:#fff;border-radius:18px;padding:38px;box-shadow:0 20px 50px rgba(0,0,0,.25)}h2{margin:0 0 10px;color:#1e3a8a}.desc{color:#6b7280;line-height:1.6}.error{padding:12px;background:#fef2f2;color:#dc2626;border-radius:9px;margin:15px 0}input{width:100%;padding:14px;border:1px solid #d1d5db;border-radius:10px;font-size:20px;text-align:center;letter-spacing:5px;margin:15px 0}button{width:100%;padding:14px;border:0;border-radius:10px;background:#2563eb;color:white;font-weight:bold;cursor:pointer}.back{text-align:center;margin-top:18px}.back a{color:#2563eb;text-decoration:none}
</style>
</head>
<body>
<div class="box">
    <h2>Kích hoạt tài khoản</h2>
    <p class="desc">Mã OTP 6 số đã được gửi tới <strong>${email}</strong>. OTP có hiệu lực trong 5 phút.</p>
    <% if (request.getAttribute("error") != null) { %><div class="error"><%= request.getAttribute("error") %></div><% } %>
    <form method="post" action="${pageContext.request.contextPath}/verify-otp">
        <input type="text" name="otp" maxlength="6" inputmode="numeric" placeholder="000000" required>
        <button type="submit">Xác nhận OTP</button>
    </form>
    <div class="back"><a href="${pageContext.request.contextPath}/register">Quay lại đăng ký</a></div>
</div>
</body>
</html>
