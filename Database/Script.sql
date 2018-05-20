﻿CREATE DATABASE QUAN_LI_NHA_SACH
GO
USE QUAN_LI_NHA_SACH

SET DATEFORMAT DMY
 GO
CREATE TABLE KHACHHANG( 
MAKH CHAR(5) NOT NULL,
TENKH NVARCHAR(50) NOT NULL,
DIACHI NVARCHAR(100) NOT NULL,
SODIENTHOAI CHAR(11),
EMAIL NVARCHAR(100),
TIENNO MONEY NOT NULL,
DIEMTICHLUY INT NOT NULL
PRIMARY KEY (MAKH))

GO

CREATE TABLE HOADON( 
SOHD INT NOT NULL IDENTITY,
MAKH CHAR(5) NOT NULL,
NGAYHD DATETIME NOT NULL,
TONGTIEN MONEY NOT NULL,
PRIMARY KEY (SOHD))

GO

CREATE TABLE LOAISACH(
MALOAISACH CHAR(5) NOT NULL,
TENLOAISACH NVARCHAR(30) NOT NULL,
CHUDE NVARCHAR(30) 
PRIMARY KEY (MALOAISACH))

GO

CREATE TABLE SACH(
MASACH CHAR(5) NOT NULL,
TENSACH NVARCHAR(50) NOT NULL,
MALOAISACH CHAR(5) NOT NULL,
TACGIA NVARCHAR(50) NOT NULL,
MANXB CHAR(5) NOT NULL,
SOLUONGHIENTAI INT NOT NULL,
HINHANH IMAGE,
GIANHAP MONEY NOT NULL,
GIABAN MONEY NOT NULL,
NOIDUNG NVARCHAR(100)
PRIMARY KEY (MASACH))

GO


CREATE TABLE CTHOADON( 
SOHD INT NOT NULL,
MASACH CHAR(5) NOT NULL,
SOLUONG INT NOT NULL,
THANHTIEN MONEY NOT NULL 
PRIMARY KEY (SOHD, MASACH))

DROP TABLE dbo.CTHOADON
GO
CREATE TABLE TAIKHOAN(
MATK INT NOT NULL IDENTITY(1, 1),
TENTK NVARCHAR(30) NOT NULL,
MATKHAU CHAR(30) NOT NULL,
TENHIENTHI NVARCHAR(50) NOT NULL,
HINHANH IMAGE,
LOAITK INT NOT NULL,
PRIMARY KEY (MATK))


GO

CREATE TABLE BAOCAOTHANG(
SOBAOCAO INT NOT NULL IDENTITY(1, 1),
MANV INT NOT NULL,
TONGDOANHTHU MONEY NOT NULL,
NGAYBAOCAO DATETIME NOT NULL,
GHICHU NVARCHAR(100)
PRIMARY KEY (SOBAOCAO))

GO
CREATE TABLE CTBAOCAO(
SOBAOCAO INT NOT NULL,
MASACH INT NOT NULL,
SOLUONGBAN INT NOT NULL,
GIABAN MONEY NOT NULL,
DOANHTHU MONEY
PRIMARY KEY (SOBAOCAO, MASACH))
GO
-- BỎ MANV
CREATE TABLE PHIEUNHAPSACH(
MAPHIEUNHAP INT NOT NULL IDENTITY,
TONGCHI MONEY,  --Tổng tiền của phiếu nhập sách
NGAYNHAP DATETIME NOT NULL
PRIMARY KEY (MAPHIEUNHAP))
GO
--THÊM THANHTIEN
CREATE TABLE CTPHIEUNHAP(
MAPHIEUNHAP INT NOT NULL,
MASACH CHAR(5) NOT NULL,
SOLUONG INT NOT NULL,
DONGIA MONEY NOT NULL,
THANHTIEN MONEY --DONGIA*PHIEUNHAP
PRIMARY KEY (MAPHIEUNHAP, MASACH))

GO
--BỎ NOTNULL Ở DIACHI
CREATE TABLE NHAXUATBAN(
MANXB CHAR(5) NOT NULL,
TENNXB NVARCHAR(30) NOT NULL,
DIACHI NVARCHAR(50)
PRIMARY KEY (MANXB))
GO



GO
ALTER TABLE HOADON ADD CONSTRAINT F_K_HD_KH FOREIGN KEY (MAKH) REFERENCES KHACHHANG (MAKH)
GO

GO
ALTER TABLE SACH ADD CONSTRAINT F_K_SACH_LAOISACH FOREIGN KEY (MALOAISACH) REFERENCES LOAISACH (MALOAISACH)

GO
ALTER TABLE SACH ADD CONSTRAINT F_K_SACH_NXB FOREIGN KEY (MANXB) REFERENCES NHAXUATBAN (MANXB)
GO
ALTER TABLE CTHOADON ADD CONSTRAINT F_K_CTHD_HD FOREIGN KEY (SOHD) REFERENCES HOADON (SOHD)
GO
ALTER TABLE CTHOADON ADD CONSTRAINT F_K_CTHD_SACH FOREIGN KEY (MASACH) REFERENCES SACH (MASACH)

ALTER TABLE CTPHIEUNHAP ADD CONSTRAINT F_K_CTPN_PNS FOREIGN KEY (MAPHIEUNHAP) REFERENCES PHIEUNHAPSACH (MAPHIEUNHAP)
GO
ALTER TABLE CTPHIEUNHAP ADD CONSTRAINT F_K_CTPN_SACH FOREIGN KEY (MASACH) REFERENCES SACH 
 GO


 INSERT  dbo.TAIKHOAN
 (
     TENTK,
     MATKHAU,
     TENHIENTHI,
     HINHANH,
     LOAITK
 )
 VALUES
 (   N'Syaoran',  -- TENTK - nvarchar(30)
     'sakuraclone',   -- MATKHAU - char(30)
     N'Syaoran Clone',  -- TENHIENTHI - nvarchar(50)
     NULL, -- HINHANH - image
     0     -- LOAITK - int
 )
 SELECT * FROM dbo.PHIEUNHAPSACH
 INSERT dbo.PHIEUNHAPSACH
 (
     TONGCHI,
     NGAYNHAP
 )
 VALUES
 (   50000,     -- TONGCHI - money
     GETDATE() -- NGAYNHAP - datetime
 )

INSERT dbo.CTPHIEUNHAP
(
	MAPHIEUNHAP,
    MASACH,
    SOLUONG,
    DONGIA,
    THANHTIEN
)
VALUES
(   2,
	'S02',   -- MASACH - char(5)
    2,    -- SOLUONG - int
    15000, -- DONGIA - money
    30000  -- THANHTIEN - money
)
SELECT * FROM dbo.PHIEUNHAPSACH
DELETE dbo.CTPHIEUNHAP
--DANH SÁCH CÁC TRIGGER:

INSERT dbo.CTPHIEUNHAP
(
    MAPHIEUNHAP,
    MASACH,
    SOLUONG,
    DONGIA,
    THANHTIEN
)
VALUES
(   1014,    -- MAPHIEUNHAP - int
    'S02',   -- MASACH - char(5)
    5,    -- SOLUONG - int
    15000, -- DONGIA - money
    NULL  -- THANHTIEN - money
)
SELECT * FROM dbo.CTPHIEUNHAP
SELECT * FROM dbo.PHIEUNHAPSACH
DELETE dbo.CTPHIEUNHAP
DELETE dbo.PHIEUNHAPSACH
GO
ALTER TABLE dbo.PHIEUNHAPSACH ALTER COLUMN TONGCHI MONEY 

DELETE dbo.PHIEUNHAPSACH

--1 CẬP NHẬT THUỘC TÍNH THÀNH TIỀN TRONG CTPHIEUNHAP
CREATE TRIGGER UPDATE_THANHTIEN
ON dbo.CTPHIEUNHAP
FOR INSERT,UPDATE
AS
BEGIN
	UPDATE dbo.CTPHIEUNHAP SET THANHTIEN = SOLUONG*DONGIA
END 

GO

--2 CẬP NHẬT GIÁ TRỊ TỔNG CHI TRONG BẢNG PHIEUTHU

CREATE TRIGGER UPDATE_TONGCHI
ON dbo.CTPHIEUNHAP
FOR INSERT,UPDATE
AS
BEGIN
	DECLARE @MAPHIEUNHAP INT
	DECLARE @TONGTIEN MONEY

	SELECT @MAPHIEUNHAP = MAPHIEUNHAP FROM Inserted
	
	SELECT @TONGTIEN = SUM(THANHTIEN) FROM dbo.CTPHIEUNHAP WHERE MAPHIEUNHAP = @MAPHIEUNHAP
	IF(@TONGTIEN IS NULL)
		SET @TONGTIEN = 0
	UPDATE dbo.PHIEUNHAPSACH SET TONGCHI = @TONGTIEN WHERE MAPHIEUNHAP = @MAPHIEUNHAP

END 


--2. CẬP NHẬT LOẠI KHÁCH HÀNG
CREATE TRIGGER UPDATE_LOAIKHACHHANG_KH
ON dbo.KHACHHANG
FOR UPDATE
AS
IF UPDATE(DIEMTICHLUY)
BEGIN
	DECLARE @DIEMTL INT
	DECLARE @MALOAIKH CHAR(4)
	SELECT @DIEMTL = DIEMTICHLUY FROM Inserted
	SELECT @MALOAIKH = MALOAIKH FROM Inserted
	IF(@DIEMTL > 50 AND @MALOAIKH = 'T')
	BEGIN
		UPDATE dbo.KHACHHANG
		SET MALOAIKH = 'V'
	END
END



--TAO TRIGGER DIEMTICHLUY >= 0
 CREATE TRIGGER INSERT_UPDATE
 ON KHACHHANG
 FOR INSERT, UPDATE
 AS
 DECLARE @DIEMTICHLUY INT
 SELECT @DIEMTICHLUY = DIEMTICHLUY FROM inserted
 IF(@DIEMTICHLUY < 0)
 BEGIN
 PRINT'DIEM TICH LUY PHAI LON HON HOAC BANG 0'
 ROLLBACK TRAN
 END
 GO


 
 --TẠO CHECK CHO LOẠI KHÁCH HÀNG
 ALTER TABLE LOAIKH 
 ADD CONSTRAINT CKECK_TENLOAIKH CHECK (TENLOAIKH  IN ('THUONG' , 'VIP'))
 GO

 GO
 --TẠO CHECK CHO MÃ LOẠI KHÁCH HÀNG
 ALTER TABLE LOAIKH 
 ADD CONSTRAINT CKECK_MALOAIKH CHECK (MALOAIKH  IN ('T' , 'V'))
 GO

 --TẠO TRIGGER CHO HOADON: NGAYHD>= NGAYDK
 CREATE TRIGGER HD_NGAYHD_NGAYDK 
 ON HOADON
 FOR INSERT, UPDATE
 AS
 DECLARE @NGAYHD DATETIME, @MAKH INT, @NGAYDK DATETIME
 SELECT @MAKH = MAKH, @NGAYHD = NGAYHD
 FROM INSERTED 
 SELECT @NGAYDK = NGAYDK
 FROM KHACHHANG
 WHERE MAKH = @MAKH
 IF(@NGAYHD < @NGAYDK)
 BEGIN
 PRINT'NGAY HOA DON KHONG DUOC NHO HON NGAY DANG KI KHACH HANG'
 ROLLBACK TRAN
 END
 GO

 --TẠO TRIGGER CHO BANG KHACHHANG: NGAYDK <= NGAYHD
 CREATE TRIGGER KH_NGAYDK_NGAYHD
 ON KHACHHANG
 FOR UPDATE
 AS
 IF UPDATE(NGAYDK)
 BEGIN
 DECLARE @MAKH INT, @NGAYDK DATETIME
 SELECT @MAKH = MAKH, @NGAYDK = NGAYDK
 FROM INSERTED 
 IF(SELECT COUNT(*) FROM HOADON 
	WHERE @MAKH = MAKH
	AND NGAYHD < @NGAYDK) > 0
	BEGIN
	PRINT'NGAY DANG KI KHONG DUOC LON HON NGAY HOA DON'
	ROLLBACK TRAN
	END
 END
 GO
 DBCC CHECKIDENT ('NHANVIEN', RESEED, 0)
GO
--TẠO TRIGGER CHO BẢNG NHANVIEN: NGAYVL<= NGAYHD
CREATE TRIGGER NHANVIEN_NGAYVL_NGAYHD
ON NHANVIEN
FOR UPDATE
AS
IF UPDATE(NGAYVL)
BEGIN
DECLARE @MANV INT, @NGAYVL DATETIME
SELECT @MANV = MANV, @NGAYVL = NGAYVL
FROM INSERTED 
IF(SELECT COUNT(*) FROM HOADON
	WHERE @MANV = MANV
	AND @NGAYVL > NGAYHD) > 0
	BEGIN
	PRINT'NGAY NHAN VIEN VAO LAM KHONG DUOC LON HON NGAY HOA DON'
	ROLLBACK TRAN
	END
END
GO
--TẠO TRIGGER CHO BẢNG HOADON: NGAYHD >= NGAYVL
CREATE TRIGGER HD_NGAYHD_NGAYVL
ON HOADON
FOR INSERT, UPDATE
AS
DECLARE @MANV INT, @NGAYHD DATETIME, @NGAYVL DATETIME
SELECT @MANV = MANV, @NGAYHD = NGAYHD
FROM INSERTED 
SELECT @NGAYVL = NGAYVL
FROM NHANVIEN
WHERE MANV = @MANV
IF(@NGAYHD < @NGAYVL)
BEGIN
PRINT'NGAY HOA DON KHONG DUOC NHO HON NGAY VAO LAM CUA NHAN VIEN'
ROLLBACK TRAN
END
GO


--KIỂM TRA TUỔI CỦA NHÂN VIÊN
CREATE TRIGGER TUOI_NHANVIEN
ON dbo.NHANVIEN
FOR INSERT, UPDATE
AS
DECLARE @NGAYSINH DATETIME 
SELECT @NGAYSINH = NGAYSINH FROM Inserted
IF(YEAR(GETDATE()) - YEAR(@NGAYSINH) < 18)
	BEGIN
	PRINT'NHAN VIEN PHAI TU 18 TUOI TRO LEN'
	ROLLBACK TRAN
	END
GO


-- TRIGGER TỔNG TIỀN Ở HÓA ĐƠN = TỔNG GIÁ TRỊ CỦA CÁC MẶT HÀNG Ở CHI TIẾT HÓA ĐƠN
CREATE TRIGGER TIEN_HD_CTHD
ON dbo.CTHOADON
FOR INSERT, UPDATE
AS
DECLARE @SOHD INT
DECLARE @MASACH INT
DECLARE @SOLUONG  INT

SELECT @SOHD = SOHD FROM Inserted
SELECT @MASACH = MASACH FROM Inserted
UPDATE dbo.HOADON
SET TONGTIEN += @SOLUONG*(SELECT DONGIA
						 FROM dbo.SACH
						 WHERE MASACH = @MASACH)
WHERE @SOHD = SOHD
ROLLBACK TRAN
END
		--





--DANH SÁCH CÁC STORED PROCEDURE


--TÍNH TIỀN HÓA ĐƠN
CREATE PROCEDURE TINHTIEN_HD
@SOHD INT,
@MASACH INT,
@SOLUONG  INT
AS
BEGIN
UPDATE dbo.HOADON
SET TONGTIEN += @SOLUONG*(SELECT DONGIA
						 FROM dbo.SACH
						 WHERE MASACH = @MASACH)
WHERE @SOHD = SOHD
END


--THÊM NHÂN VIÊN
go

CREATE PROCEDURE THEM_NV
@TENNV NVARCHAR(30),
@GIOITINH NVARCHAR(20),
@NGAYSINH DATETIME,
@DIACHI NVARCHAR(50)
AS
BEGIN
	INSERT INTO dbo.NHANVIEN
	        (TENNV, GIOITINH, NGAYSINH, DIACHI, NGAYVL )
	VALUES  (
	          @TENNV, -- TENNV - nvarchar(30)
			  @GIOITINH, -- GIOITINH - nvarchar(20)
	          @GIOITINH, -- NGAYSINH - datetime
	          @DIACHI, -- DIACHI - nvarchar(50)
	          @NGAYVL  -- NGAYVL - datetime
	          )
END
GO
	       


--xem thông tin và lương của 1 nhân viên
CREATE PROCEDURE TIM_NHANVIEN
@MNV INT
AS
BEGIN
SELECT NV.MANV, TENNV, NGAYSINH, DIACHI, NGAYVL, L.LUONG
FROM NHANVIEN NV, CTLUONG L
WHERE NV.MANV = @MNV
END
GO

--xem tổng tiền của 1 khách hàng đã mua
CREATE FUNCTION TONGTIEN_KHACHHANG( @MAKH INT )
RETURNS MONEY
AS
BEGIN
DECLARE @LUONG MONEY
SELECT @LUONG = SUM(TONGTIEN)
FROM HOADON
WHERE @MAKH IN (SELECT MAKH
				FROM HOADON
				WHERE @MAKH = MAKH)
RETURN @LUONG
END
GO
--xem thông tin của 1 khách hàng
CREATE PROCEDURE TIM_KHACHAHNG
@MAKH INT
AS
BEGIN
	SELECT* FROM dbo.KHACHHANG
	WHERE @MAKH = MAKH
END


GO
ALTER TRIGGER TAO_LUONG
ON dbo.CTLUONG
FOR INSERT
AS
DECLARE @HESO INT
DECLARE @LUONGCOBAN INT
DECLARE @MALUONG INT
SELECT @MALUONG = MALUONG 
FROM Inserted
SELECT @HESO = HESO, @LUONGCOBAN = LUONGCOBAN 
FROM dbo.LUONG
WHERE @MALUONG = MALUONG

UPDATE CTLUONG
SET LUONG = @HESO * @LUONGCOBAN


