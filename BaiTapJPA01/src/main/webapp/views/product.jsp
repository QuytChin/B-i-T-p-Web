<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang sản phẩm</title>
<style>
*{box-sizing:border-box}
:root{--navy:#0f172a;--blue:#1d4ed8;--blue2:#2563eb;--ink:#111827;--muted:#64748b;--bg:#f6f8fc;--line:#e5e7eb;--red:#dc2626}
body{margin:0;font-family:Inter,Segoe UI,Arial,sans-serif;background:linear-gradient(180deg,#eef4ff 0,#f7f9fc 280px,#f7f9fc 100%);color:var(--ink)}
a{text-decoration:none;color:inherit}
.topnav{height:76px;display:flex;align-items:center;justify-content:flex-end;padding:0 7%;background:rgba(255,255,255,.93);backdrop-filter:blur(12px);border-bottom:1px solid rgba(226,232,240,.9);position:sticky;top:0;z-index:20;box-shadow:0 4px 18px rgba(15,23,42,.05)}
.topnav-links{display:flex;gap:10px}.topnav-links a{padding:10px 16px;border-radius:11px;font-weight:700;color:#334155;transition:.2s}.topnav-links a:hover{background:#eaf1ff;color:var(--blue)}.topnav-links .admin-link{background:var(--navy);color:white}.topnav-links .admin-link:hover{background:#1e293b;color:white}
.hero{max-width:1240px;margin:0 auto;padding:54px 24px 32px}.hero-box{position:relative;overflow:hidden;border-radius:28px;padding:38px 42px;background:linear-gradient(135deg,#0f172a 0%,#1e3a8a 58%,#2563eb 100%);color:white;box-shadow:0 24px 50px rgba(30,58,138,.18)}
.hero-box:after{content:"";position:absolute;width:310px;height:310px;border-radius:50%;right:-75px;top:-120px;background:rgba(255,255,255,.10)}
.hero-kicker{display:inline-flex;align-items:center;gap:8px;padding:7px 12px;border-radius:999px;background:rgba(255,255,255,.12);font-size:13px;font-weight:700;margin-bottom:14px}.hero h1{font-size:38px;line-height:1.15;margin:0 0 10px}.hero p{margin:0;color:#dbeafe;font-size:16px;max-width:650px;line-height:1.7}.hero-stats{display:flex;gap:14px;margin-top:24px;flex-wrap:wrap}.stat{padding:11px 15px;border-radius:13px;background:rgba(255,255,255,.11);font-size:14px}.stat strong{font-size:18px;margin-right:4px}
.wrap{max-width:1240px;margin:0 auto;padding:0 24px 55px}.section-head{display:flex;align-items:end;justify-content:space-between;gap:16px;margin:8px 0 22px}.section-title{font-size:27px;font-weight:800;color:#172554}.section-note{font-size:14px;color:var(--muted)}
.grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:24px}.product-card{background:white;border:1px solid #e7ebf1;border-radius:22px;overflow:hidden;box-shadow:0 12px 32px rgba(15,23,42,.07);transition:transform .22s ease,box-shadow .22s ease,border-color .22s ease}.product-card:hover{transform:translateY(-6px);box-shadow:0 22px 44px rgba(15,23,42,.13);border-color:#cbdafe}.media{height:245px;background:linear-gradient(135deg,#eef2f7,#e2e8f0);position:relative;overflow:hidden}.media img{width:100%;height:100%;object-fit:cover;display:block;transition:transform .35s ease}.product-card:hover .media img{transform:scale(1.035)}.media-placeholder{width:100%;height:100%;display:flex;align-items:center;justify-content:center;font-size:64px;background:radial-gradient(circle at 50% 35%,#fff,#e7edf7 70%)}.badge{position:absolute;left:14px;top:14px;padding:7px 11px;border-radius:999px;background:rgba(15,23,42,.82);color:white;font-size:12px;font-weight:700;backdrop-filter:blur(6px)}
.card-body{padding:19px 20px 20px}.name{font-size:20px;font-weight:800;line-height:1.35;color:#111827;min-height:54px}.price{font-size:20px;font-weight:900;color:var(--red);margin-top:8px}.card-bottom{display:flex;align-items:center;justify-content:space-between;gap:10px;margin-top:16px;padding-top:15px;border-top:1px solid #eef2f7}.category{color:#64748b;font-size:13px}.detail-link{font-size:13px;font-weight:800;color:var(--blue);padding:8px 11px;border-radius:9px;background:#eff6ff}.product-card:hover .detail-link{background:var(--blue2);color:white}
.empty{grid-column:1/-1;background:white;border:1px dashed #cbd5e1;border-radius:18px;padding:50px;text-align:center;color:#64748b}.pagination{display:flex;justify-content:center;gap:9px;margin-top:34px}.pagination a{min-width:42px;height:42px;display:flex;align-items:center;justify-content:center;border-radius:11px;background:white;color:#1e3a8a;border:1px solid #dbeafe;font-weight:700;box-shadow:0 4px 12px rgba(15,23,42,.05)}.pagination a:hover{border-color:#93c5fd}.pagination a.active{background:linear-gradient(135deg,#2563eb,#1d4ed8);color:white;border-color:transparent}
@media(max-width:900px){.grid{grid-template-columns:repeat(2,1fr)}.hero h1{font-size:32px}}
@media(max-width:620px){.topnav{padding:0 18px}.topnav-links a{padding:9px 11px}.hero{padding:30px 16px 24px}.hero-box{padding:28px 24px}.hero h1{font-size:27px}.wrap{padding:0 16px 40px}.grid{grid-template-columns:1fr}.section-head{align-items:flex-start;flex-direction:column}.media{height:230px}}
</style>
</head>
<body>
<div class="topnav">
    <div class="topnav-links">
        <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
        <a class="admin-link" href="${pageContext.request.contextPath}/admin/product/list">Quản trị</a>
    </div>
</div>

<section class="hero">
    <div class="hero-box">
        <div class="hero-kicker">✦ Sản phẩm nổi bật</div>
        <h1>Khám phá sản phẩm</h1>
        <p>Danh sách sản phẩm được sắp xếp từ mới nhất, hiển thị rõ danh mục và thông tin để bạn xem nhanh từng sản phẩm.</p>
        <div class="hero-stats">
            <div class="stat"><strong>${totalProducts}</strong> sản phẩm</div>
            <div class="stat"><strong>6</strong> sản phẩm / trang</div>
            <div class="stat"><strong>${currentPage}</strong> / ${totalPages > 0 ? totalPages : 1} trang</div>
        </div>
    </div>
</section>

<main class="wrap">
    <div class="section-head">
        <div class="section-title">Tất cả sản phẩm</div>
        <div class="section-note">Bấm vào sản phẩm để xem thông tin chi tiết</div>
    </div>

    <div class="grid">
        <c:choose>
            <c:when test="${not empty products}">
                <c:forEach items="${products}" var="p">
                    <a class="product-card" href="${pageContext.request.contextPath}/product/detail?id=${p.id}">
                        <div class="media">
                            <span class="badge">${p.category.name}</span>
                            <c:choose>
                                <c:when test="${not empty p.image and fn:startsWith(p.image, 'http')}">
                                    <img src="${p.image}" alt="${p.name}">
                                </c:when>
                                <c:when test="${not empty p.image}">
                                    <c:url value="/image" var="imgUrl"><c:param name="fname" value="${p.image}"/></c:url>
                                    <img src="${imgUrl}" alt="${p.name}">
                                </c:when>
                                <c:when test="${not empty p.category.icon}">
                                    <c:url value="/image" var="imgUrl"><c:param name="fname" value="${p.category.icon}"/></c:url>
                                    <img src="${imgUrl}" alt="${p.name}">
                                </c:when>
                                <c:otherwise>
                                    <div class="media-placeholder">📦</div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <div class="name">${p.name}</div>
                            <div class="price">${p.price} VNĐ</div>
                            <div class="card-bottom">
                                <div class="category">Danh mục: ${p.category.name}</div>
                                <div class="detail-link">Xem chi tiết →</div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="empty">Chưa có sản phẩm để hiển thị.</div>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${totalPages > 1}">
        <div class="pagination">
            <c:forEach begin="1" end="${totalPages}" var="i">
                <a class="${i == currentPage ? 'active' : ''}" href="${pageContext.request.contextPath}/product?page=${i}">${i}</a>
            </c:forEach>
        </div>
    </c:if>
</main>
</body>
</html>
