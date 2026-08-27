/* =========================================================
   BAI TAP 01 - CRUD MVC SU DUNG JPA / HIBERNATE
   Database: ServletCRUDMVC
   SQL Server
   ========================================================= */

-- 1. TAO DATABASE NEU CHUA CO
IF DB_ID(N'ServletCRUDMVC') IS NULL
BEGIN
    CREATE DATABASE ServletCRUDMVC;
END
GO

USE ServletCRUDMVC;
GO


/* =========================================================
   2. TAO BANG CATEGORY
   Mapping voi entity.Category
   ========================================================= */

IF OBJECT_ID(N'dbo.Category', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Category
    (
        cate_id INT IDENTITY(1,1) PRIMARY KEY,
        cate_name NVARCHAR(255) NULL,
        icons NVARCHAR(255) NULL
    );
END
GO


/* =========================================================
   3. TAO BANG USER
   Mapping voi entity.User

   Luu y:
   User la tu khoa de gay nham lan trong SQL Server,
   nen su dung [User]
   ========================================================= */

IF OBJECT_ID(N'dbo.[User]', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.[User]
    (
        id INT IDENTITY(1,1) PRIMARY KEY,

        email NVARCHAR(255) NULL,

        username NVARCHAR(255) NOT NULL,

        fullname NVARCHAR(255) NULL,

        password NVARCHAR(255) NOT NULL,

        avatar NVARCHAR(255) NULL,

        roleid INT NOT NULL DEFAULT 5,

        phone NVARCHAR(50) NULL,

        student_id NVARCHAR(50) NULL,

        createddate DATE NULL
    );
END
GO


/* =========================================================
   4. THEM DU LIEU MAU CATEGORY
   Chi them neu bang dang rong
   ========================================================= */

IF NOT EXISTS (SELECT 1 FROM dbo.Category)
BEGIN

    INSERT INTO dbo.Category
        (cate_name, icons)
    VALUES
        (N'Điện thoại', N'phone.jpg'),

        (N'Laptop', N'laptop.jpg'),

        (N'Tivi', N'tivi.jpg'),

        (N'Đồng hồ', N'watch.jpg');

END
GO


/* =========================================================
   5. THEM TAI KHOAN MAU
   Tai khoan dung de test dang nhap:

   username: admin
   password: 123456
   ========================================================= */

IF NOT EXISTS
(
    SELECT 1
    FROM dbo.[User]
    WHERE username = N'admin'
)
BEGIN

    INSERT INTO dbo.[User]
    (
        email,
        username,
        fullname,
        password,
        avatar,
        roleid,
        phone,
        student_id,
        createddate
    )
    VALUES
    (
        N'admin@gmail.com',
        N'admin',
        N'Administrator',
        N'123456',
        NULL,
        1,
        N'0900000000',
        N'ADMIN01',
        GETDATE()
    );

END
GO


/* =========================================================
   6. THEM TAI KHOAN USER MAU
   username: user
   password: 123456
   ========================================================= */

IF NOT EXISTS
(
    SELECT 1
    FROM dbo.[User]
    WHERE username = N'user'
)
BEGIN

    INSERT INTO dbo.[User]
    (
        email,
        username,
        fullname,
        password,
        avatar,
        roleid,
        phone,
        student_id,
        createddate
    )
    VALUES
    (
        N'user@gmail.com',
        N'user',
        N'Nguyen Van A',
        N'123456',
        NULL,
        5,
        N'0912345678',
        N'SV001',
        GETDATE()
    );

END
GO


/* =========================================================
   7. KIEM TRA CAC BANG
   ========================================================= */

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO


/* =========================================================
   8. KIEM TRA DU LIEU CATEGORY
   ========================================================= */

SELECT
    cate_id,
    cate_name,
    icons
FROM dbo.Category;
GO


/* =========================================================
   9. KIEM TRA DU LIEU USER
   ========================================================= */

SELECT
    id,
    email,
    username,
    fullname,
    password,
    avatar,
    roleid,
    phone,
    student_id,
    createddate
FROM dbo.[User];
GO