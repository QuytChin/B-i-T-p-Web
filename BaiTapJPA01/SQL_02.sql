/* =========================================================
   BAI TAP 02 - JPA / HIBERNATE - SQL SERVER
   Database: ServletCRUDMVC
   Chuc nang: User, Category, Product, quan he 1-N
   File nop: SQL_02.sql
   ========================================================= */

IF DB_ID(N'ServletCRUDMVC') IS NULL
BEGIN
    CREATE DATABASE ServletCRUDMVC;
END
GO

USE ServletCRUDMVC;
GO

/* Xoa bang cu de co the chay lai script nhieu lan */
IF OBJECT_ID(N'dbo.products', N'U') IS NOT NULL
    DROP TABLE dbo.products;
GO

IF OBJECT_ID(N'dbo.Category', N'U') IS NOT NULL
    DROP TABLE dbo.Category;
GO

IF OBJECT_ID(N'dbo.[User]', N'U') IS NOT NULL
    DROP TABLE dbo.[User];
GO

/* =========================
   1. BANG CATEGORY
   ========================= */
CREATE TABLE dbo.Category
(
    cate_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    cate_name NVARCHAR(255) NOT NULL,
    icons NVARCHAR(255) NULL
);
GO

/* =========================
   2. BANG USER
   ========================= */
CREATE TABLE dbo.[User]
(
    id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    email NVARCHAR(255) NULL,
    username NVARCHAR(100) NOT NULL UNIQUE,
    fullname NVARCHAR(255) NOT NULL,
    password NVARCHAR(255) NOT NULL,
    avatar NVARCHAR(255) NULL,
    roleid INT NOT NULL CONSTRAINT DF_User_Role DEFAULT 5,
    phone VARCHAR(255) NULL,
    student_id VARCHAR(255) NULL,
    createddate DATE NOT NULL CONSTRAINT DF_User_CreatedDate DEFAULT GETDATE()
);
GO

/* =========================
   3. BANG PRODUCTS
   Category 1 --- N Product
   ========================= */
CREATE TABLE dbo.products
(
    product_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    product_name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX) NULL,
    price DECIMAL(18,2) NOT NULL,
    images NVARCHAR(500) NULL,
    createddate DATETIME2 NOT NULL CONSTRAINT DF_Product_CreatedDate DEFAULT GETDATE(),
    cate_id INT NOT NULL,

    CONSTRAINT FK_Product_Category
        FOREIGN KEY (cate_id)
        REFERENCES dbo.Category(cate_id)
);
GO

/* =========================
   4. DU LIEU CATEGORY
   ========================= */
SET IDENTITY_INSERT dbo.Category ON;
INSERT [dbo].[Category] ([cate_id], [cate_name], [icons]) VALUES (1, N'Điện thoại', N'category/1788112553246.jpg')
INSERT [dbo].[Category] ([cate_id], [cate_name], [icons]) VALUES (2, N'Laptop', N'category/1788112559165.jpg')
INSERT [dbo].[Category] ([cate_id], [cate_name], [icons]) VALUES (3, N'TV', N'category/1788112566632.jpg')
INSERT [dbo].[Category] ([cate_id], [cate_name], [icons]) VALUES (5, N'Tai nghe', N'category/1788112574715.jpg')
INSERT [dbo].[Category] ([cate_id], [cate_name], [icons]) VALUES (6, N'Xe máy', N'category/1788112581184.jpg')
SET IDENTITY_INSERT dbo.Category OFF;
GO

/* =========================
   5. DU LIEU PRODUCT MAU
   Co 12 san pham de test phan trang 6 sp/trang
   ========================= */
SET IDENTITY_INSERT dbo.products ON;
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (1, N'iPhone 15', N'Sản phẩm mẫu 01', CAST(18990000.00 AS Decimal(18, 2)), N'product/1788112399124_632202484.jpg', CAST(N'2026-08-30T23:26:11.0600000' AS DateTime2), 1)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (2, N'iPhone 15 Pro', N'Sản phẩm mẫu 02', CAST(24990000.00 AS Decimal(18, 2)), N'product/1788112390163_633126005.jpg', CAST(N'2026-08-30T23:27:11.0600000' AS DateTime2), 1)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (3, N'Samsung Galaxy S24', N'Sản phẩm mẫu 03', CAST(20990000.00 AS Decimal(18, 2)), N'product/1788112378397_634049526.jpg', CAST(N'2026-08-30T23:28:11.0600000' AS DateTime2), 1)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (4, N'OPPO Reno', N'Sản phẩm mẫu 04', CAST(10990000.00 AS Decimal(18, 2)), N'product/1788112371014_1259992780.jpg', CAST(N'2026-08-30T23:29:11.0600000' AS DateTime2), 1)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (5, N'Xiaomi 14', N'Sản phẩm mẫu 05', CAST(15990000.00 AS Decimal(18, 2)), N'product/1788112363581_1260916301.jpg', CAST(N'2026-08-30T23:30:11.0600000' AS DateTime2), 1)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (6, N'ASUS Vivobook', N'Sản phẩm mẫu 06', CAST(17990000.00 AS Decimal(18, 2)), N'product/1788112356748_1261839822.jpg', CAST(N'2026-08-30T23:31:11.0600000' AS DateTime2), 2)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (7, N'Dell Inspiron', N'Sản phẩm mẫu 07', CAST(18990000.00 AS Decimal(18, 2)), N'product/1788112349636_1262763343.jpg', CAST(N'2026-08-30T23:32:11.0600000' AS DateTime2), 2)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (8, N'HP Pavilion', N'Sản phẩm mẫu 08', CAST(16990000.00 AS Decimal(18, 2)), N'product/1788112341655_1263686864.jpg', CAST(N'2026-08-30T23:33:11.0600000' AS DateTime2), 2)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (9, N'Lenovo IdeaPad', N'Sản phẩm mẫu 09', CAST(14990000.00 AS Decimal(18, 2)), N'product/1788112330389_1264610385.jpg', CAST(N'2026-08-30T23:34:11.0600000' AS DateTime2), 2)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (10, N'MacBook Air M3', N'Sản phẩm mẫu 10', CAST(26990000.00 AS Decimal(18, 2)), N'product/1788112320091_1265533906.jpg', CAST(N'2026-08-30T23:35:11.0600000' AS DateTime2), 2)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (11, N'Acer Aspire', N'Sản phẩm mẫu 11', CAST(13990000.00 AS Decimal(18, 2)), N'product/1788112305674_575681004.png', CAST(N'2026-08-30T23:36:11.0600000' AS DateTime2), 2)
INSERT [dbo].[products] ([product_id], [product_name], [description], [price], [images], [createddate], [cate_id]) VALUES (12, N'MSI Modern', N'Sản phẩm mẫu 12', CAST(19990000.00 AS Decimal(18, 2)), N'product/1788112293933_1378220753.png', CAST(N'2026-08-30T23:37:11.0600000' AS DateTime2), 2)
SET IDENTITY_INSERT dbo.products OFF;
GO

/* =========================
   6. TAI KHOAN MAU DE GIANG VIEN TEST
   Admin: admin / 123456
   User : user  / 123456
   ========================= */
SET IDENTITY_INSERT dbo.[User] ON;

INSERT INTO dbo.[User]
    (id, email, username, fullname, password, avatar, roleid, phone, student_id, createddate)
VALUES
    (1, N'admin@gmail.com', N'admin', N'Administrator', N'123456', NULL, 1, '0900000000', 'ADMIN01', '2026-08-30'),
    (2, N'user@gmail.com', N'user', N'Nguyen Van A', N'123456', NULL, 5, '0912345678', 'USER01', '2026-08-30');

SET IDENTITY_INSERT dbo.[User] OFF;
GO

/* =========================
   7. KIEM TRA DU LIEU
   ========================= */
SELECT * FROM dbo.Category ORDER BY cate_id;
GO

SELECT
    p.product_id,
    p.product_name,
    p.price,
    p.images,
    p.createddate,
    c.cate_name
FROM dbo.products p
INNER JOIN dbo.Category c ON p.cate_id = c.cate_id
ORDER BY p.product_id;
GO

SELECT id, email, username, fullname, roleid, phone, student_id, createddate
FROM dbo.[User]
ORDER BY id;
GO
