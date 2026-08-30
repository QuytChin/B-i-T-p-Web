<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết ${product.name}</title>
<style>
*{box-sizing:border-box}body{margin:0;background:linear-gradient(180deg,#eef4ff,#f7f9fc 330px);font-family:Segoe UI,Arial,sans-serif;color:#111827}.nav{height:72px;background:white;border-bottom:1px solid #e5e7eb;display:flex;align-items:center;justify-content:space-between;padding:0 7%;box-shadow:0 4px 16px rgba(15,23,42,.05)}.nav a{text-decoration:none;font-weight:700;color:#1d4ed8}.nav .home{padding:10px 14px;border-radius:10px;background:#0f172a;color:white}.wrap{max-width:1080px;margin:48px auto;padding:0 20px}.detail{display:grid;grid-template-columns:1.05fr .95fr;background:white;border-radius:24px;overflow:hidden;box-shadow:0 20px 50px rgba(15,23,42,.11);border:1px solid #e7ebf1}.image{min-height:470px;background:#eef2f7}.image img{width:100%;height:100%;min-height:470px;object-fit:cover}.noimg{height:470px;display:flex;align-items:center;justify-content:center;font-size:70px;background:radial-gradient(circle,#fff,#e2e8f0)}.info{padding:48px}.info h1{color:#172554;margin:0 0 14px;font-size:34px;line-height:1.25}.price{font-size:29px;font-weight:900;color:#dc2626;margin:20px 0}.cate{display:inline-block;padding:8px 13px;border-radius:999px;background:#eff6ff;color:#1d4ed8;font-weight:700;font-size:13px}.desc-title{margin-top:26px;font-size:14px;font-weight:800;color:#334155;text-transform:uppercase;letter-spacing:.04em}.desc{margin-top:10px;line-height:1.8;color:#4b5563;white-space:pre-line}.back{display:inline-block;margin-top:30px;color:white;background:#2563eb;padding:11px 16px;border-radius:11px;text-decoration:none;font-weight:700}@media(max-width:760px){.detail{grid-template-columns:1fr}.image,.image img{min-height:330px}.info{padding:30px}}
</style>
</head>
<body>
<div class="nav"><a href="${pageContext.request.contextPath}/product">← Danh sách sản phẩm</a><a class="home" href="${pageContext.request.contextPath}/home">Trang chủ</a></div>
<div class="wrap">
    <div class="detail">
        <div class="image">
            <c:choose>
                <c:when test="${not empty product.image and fn:startsWith(product.image, 'http')}"><img src="${product.image}" alt="${product.name}"></c:when>
                <c:when test="${not empty product.image}"><c:url value="/image" var="imgUrl"><c:param name="fname" value="${product.image}"/></c:url><img src="${imgUrl}" alt="${product.name}"></c:when>
                <c:when test="${not empty product.category.icon}"><c:url value="/image" var="imgUrl"><c:param name="fname" value="${product.category.icon}"/></c:url><img src="${imgUrl}" alt="${product.name}"></c:when>
                <c:otherwise><div class="noimg">📦</div></c:otherwise>
            </c:choose>
        </div>
        <div class="info">
            <div class="cate">${product.category.name}</div>
            <h1>${product.name}</h1>
            <div class="price">${product.price} VNĐ</div>
            <div class="desc-title">Mô tả sản phẩm</div>
            <div class="desc"><c:choose><c:when test="${not empty product.description}">${product.description}</c:when><c:otherwise>Chưa có mô tả cho sản phẩm này.</c:otherwise></c:choose></div>
            <a class="back" href="${pageContext.request.contextPath}/product">← Quay lại sản phẩm</a>
        </div>
    </div>
</div>
</body>
</html>
