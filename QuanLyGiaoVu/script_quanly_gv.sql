CREATE DATABASE QLGV
IF OBJECT_ID('DIEUKIEN', 'U') IS NOT NULL 
  DROP TABLE DIEUKIEN;
IF OBJECT_ID('GIANGDAY', 'U') IS NOT NULL 
  DROP TABLE GIANGDAY;
IF OBJECT_ID('KETQUATHI', 'U') IS NOT NULL 
  DROP TABLE KETQUATHI;
IF OBJECT_ID('MONHOC', 'U') IS NOT NULL 
  DROP TABLE MONHOC;
IF OBJECT_ID('LOP', 'U') IS NOT NULL 
  DROP TABLE LOP; 
IF OBJECT_ID('HOCVIEN', 'U') IS NOT NULL 
  DROP TABLE HOCVIEN;
IF OBJECT_ID('GIAOVIEN', 'U') IS NOT NULL 
  DROP TABLE GIAOVIEN;
IF OBJECT_ID('KHOA', 'U') IS NOT NULL 
  DROP TABLE KHOA;  
CREATE TABLE LOP(
	MALOP char(3) primary key NOT NULL,
	TENLOP varchar(50) NULL,
	TRGLOP char(5) NULL,
	SISO smallint NULL,
	MAGVCN char(4) NULL	 
)

CREATE TABLE KHOA(
	MAKHOA varchar(4) primary key NOT NULL,
	TENKHOA varchar(40) NULL,
	NGAYTL smalldatetime NULL,
	TRGKHOA char(4) NULL,
 )
 
 

CREATE TABLE HOCVIEN(
	MAHV char(5) PRIMARY KEY NOT NULL,
	HO varchar(40) NULL,
	TEN varchar(50) NULL,
	NGAYSINH smalldatetime NULL,
	GIOITINH char(3) NULL,
	NOISINH varchar(40) NULL,
	MALOP char(3) NULL,
)

CREATE TABLE MONHOC(
	MAMH varchar(10) PRIMARY KEY NOT NULL,
	TENMH varchar(40) NULL,
	TC_LT tinyint NULL,
	TC_TH tinyint NULL,
	MAKHOA varchar(4) NULL,
 )
 
CREATE TABLE GIAOVIEN(
	MAGV char(4) PRIMARY KEY NOT NULL,
	HOTEN varchar(40) NULL,
	HOCVI varchar(50) NULL,
	HOCHAM varchar(50) NULL,
	GIOITINH varchar(3) NULL,
	NGAYSINH smalldatetime NULL,
	NGAYVAOLAM smalldatetime NULL,
	HESO numeric(4, 2) NULL,
	MUCLUONG money NULL,
	MAKHOA varchar(4) NULL,
 )
 
CREATE TABLE KETQUATHI(
	MAHV char(5) NOT NULL,
	MAMH varchar(10) NOT NULL,
	LANTHI tinyint NOT NULL,
	NGAYTHI smalldatetime NULL,
	DIEM numeric(4, 2) NULL,
	KETQUA varchar(50) NULL,
	PRIMARY KEY (MAHV, MAMH, LANTHI)
 )
 
 GO
CREATE TABLE GIANGDAY(
	MALOP char(3) NOT NULL,
	MAMH varchar(10) NOT NULL,
	MAGV char(4) NULL,
	HOCKY tinyint NULL,
	NAMHOC smallint NULL,
	TUNGAY smalldatetime NULL,
	DENNGAY smalldatetime NULL,
	PRIMARY KEY (MALOP, MAMH)
)

CREATE TABLE DIEUKIEN(
	MAMH varchar(10) NOT NULL,
	MAMH_TRUOC varchar(10) NOT NULL,
	PRIMARY KEY (MAMH, MAMH_TRUOC)
 )
 -- Tao rang buoc khoa ngoai
 
ALTER TABLE DIEUKIEN  ADD  CONSTRAINT FK_DIEUKIEN_MONHOC 
	FOREIGN KEY(MAMH)
		REFERENCES MONHOC (MAMH)

ALTER TABLE DIEUKIEN   ADD  CONSTRAINT FK_DIEUKIEN_MONHOC1 
	FOREIGN KEY(MAMH_TRUOC)
		REFERENCES MONHOC (MAMH)

ALTER TABLE GIANGDAY  ADD  CONSTRAINT FK_GIANGDAY_GIAOVIEN 
	FOREIGN KEY(MAGV)
		REFERENCES GIAOVIEN (MAGV)


ALTER TABLE GIANGDAY  ADD  CONSTRAINT FK_GIANGDAY_LOP 
	FOREIGN KEY(MALOP)
		REFERENCES LOP (MALOP)
		
ALTER TABLE GIANGDAY  WITH CHECK ADD  CONSTRAINT FK_GIANGDAY_MONHOC 
	FOREIGN KEY(MAMH)
		REFERENCES MONHOC (MAMH)
		
ALTER TABLE GIAOVIEN  WITH CHECK ADD  CONSTRAINT FK_GIAOVIEN_KHOA 
	FOREIGN KEY(MAKHOA)
		REFERENCES KHOA (MAKHOA)
ALTER TABLE KETQUATHI  WITH CHECK ADD  CONSTRAINT FK_KETQUATHI_HOCVIEN 
	FOREIGN KEY(MAHV)
		REFERENCES HOCVIEN (MAHV)
		
ALTER TABLE KETQUATHI  WITH CHECK ADD  CONSTRAINT FK_KETQUATHI_MONHOC 
	FOREIGN KEY(MAMH)
		REFERENCES MONHOC (MAMH)

ALTER TABLE MONHOC  ADD  CONSTRAINT FK_MONHOC_KHOA 
	FOREIGN KEY(MAKHOA)
		REFERENCES KHOA (MAKHOA)
go
-- them du lieu vao bang
-- bang lop
INSERT LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN) VALUES (N'K11', N'Lop 1 khoa 1', N'K1108', 11, N'GV07')
INSERT LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN) VALUES (N'K12', N'Lop 2 khoa 1', N'K1205', 12, N'GV09')
INSERT LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN) VALUES (N'K13', N'Lop 3 khoa 1', N'K1305', 12, N'GV14')

--bang khoa
INSERT KHOA (MAKHOA, TENKHOA, NGAYTL, TRGKHOA) VALUES (N'CNPM', N'Cong nghe phan mem', CAST(0x966C0000 AS SmallDateTime), N'GV04')
INSERT KHOA (MAKHOA, TENKHOA, NGAYTL, TRGKHOA) VALUES (N'HTTT', N'He thong thong tin', CAST(0x966C0000 AS SmallDateTime), N'GV02')
INSERT KHOA (MAKHOA, TENKHOA, NGAYTL, TRGKHOA) VALUES (N'KHMT', N'Khoa hoc may tinh', CAST(0x966C0000 AS SmallDateTime), N'GV01')
INSERT KHOA (MAKHOA, TENKHOA, NGAYTL, TRGKHOA) VALUES (N'KTMT', N'Ky thuat may tinh', CAST(0x97300000 AS SmallDateTime), N'Null')
INSERT KHOA (MAKHOA, TENKHOA, NGAYTL, TRGKHOA) VALUES (N'MTT', N'Mang va truyen thong', CAST(0x96F30000 AS SmallDateTime), N'GV03')
--bang HOCVIEN
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1101', N'Nguyen Van', N'A', CAST(0x7ACD0000 AS SmallDateTime), N'Nam', N'TpHCM', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1102', N'Tran Ngoc', N'Han', CAST(0x7AFB0000 AS SmallDateTime), N'Nu ', N'Kien Giang', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1103', N'Ha Duy', N'Lap', CAST(0x7B1E0000 AS SmallDateTime), N'Nam', N'Nghe An', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1104', N'Tran Ngoc', N'Linh', CAST(0x7B0B0000 AS SmallDateTime), N'Nu ', N'Tay Ninh', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1105', N'Tran Minh', N'Long', CAST(0x7AEC0000 AS SmallDateTime), N'Nam', N'TpHCM', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1106', N'Le Nhat', N'Minh', CAST(0x7ACB0000 AS SmallDateTime), N'Nam', N'TpHCM', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1107', N'Nguyen Nhu', N'Nhut', CAST(0x7ACD0000 AS SmallDateTime), N'Nam', N'Ha Noi', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1108', N'Nguyen Manh', N'Tam', CAST(0x7AEC0000 AS SmallDateTime), N'Nam', N'Kien Giang', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1109', N'Phan Thi Thanh', N'Tam', CAST(0x7ACD0000 AS SmallDateTime), N'Nu ', N'Vinh Long', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1110', N'Le Hoai', N'Thuong', CAST(0x7B2C0000 AS SmallDateTime), N'Nu ', N'Can Tho', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1111', N'Le Ha', N'Vinh', CAST(0x7C190000 AS SmallDateTime), N'Nam', N'Vinh Long', N'K11')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1201', N'Nguyen Van', N'B', CAST(0x7BE40000 AS SmallDateTime), N'Nam', N'TpHCM', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1202', N'Nguyen Thi Kim', N'Duyen', CAST(0x7AC40000 AS SmallDateTime), N'Nu ', N'TpHCM', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1203', N'Tran Thi Kim', N'Duyen', CAST(0x7BB60000 AS SmallDateTime), N'Nu ', N'TpHCM', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1204', N'Truong My', N'Hanh', CAST(0x7B3D0000 AS SmallDateTime), N'Nu ', N'Dong Nai', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1205', N'Nguyen Thanh', N'Nam', CAST(0x7B1D0000 AS SmallDateTime), N'Nam', N'TpHCM', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1206', N'Nguyen Thi Truc', N'Thanh', CAST(0x7AF10000 AS SmallDateTime), N'Nu ', N'Kien Giang', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1207', N'Tran Thi Bich', N'Thuy', CAST(0x7AD90000 AS SmallDateTime), N'Nu ', N'Nghe An', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1208', N'Huynh Thi Kim', N'Trieu', CAST(0x7B140000 AS SmallDateTime), N'Nu ', N'Tay Ninh', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1209', N'Pham Thanh', N'Trieu', CAST(0x7AE80000 AS SmallDateTime), N'Nam', N'TpHCM', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1210', N'Ngo Thanh', N'Tuan', CAST(0x7ADF0000 AS SmallDateTime), N'Nam', N'TpHCM', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1211', N'Do Thi', N'Xuan', CAST(0x7AF60000 AS SmallDateTime), N'Nu ', N'Ha Noi', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1212', N'Le Thi Phi', N'Yen', CAST(0x7AF90000 AS SmallDateTime), N'Nu ', N'TpHCM', N'K12')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1301', N'Nguyen Thi Kim', N'Cuc', CAST(0x7B520000 AS SmallDateTime), N'Nu ', N'Kien Giang', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1302', N'Truong Thi My', N'Hien', CAST(0x7AFF0000 AS SmallDateTime), N'Nu ', N'Nghe An', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1303', N'Le Duc', N'Hien', CAST(0x7B020000 AS SmallDateTime), N'Nam', N'Tay Ninh', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1304', N'Le Quang', N'Hien', CAST(0x7B1E0000 AS SmallDateTime), N'Nam', N'TpHCM', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1305', N'Le Thi', N'Huong', CAST(0x7B080000 AS SmallDateTime), N'Nu ', N'TpHCM', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1306', N'Nguyen Thai', N'Huu', CAST(0x7B0B0000 AS SmallDateTime), N'Nam', N'Ha Noi', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1307', N'Tran Minh', N'Man', CAST(0x7B460000 AS SmallDateTime), N'Nam', N'TpHCM', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1308', N'Nguyen Hieu', N'Nghia', CAST(0x7B140000 AS SmallDateTime), N'Nam', N'Kien Giang', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1309', N'Nguyen Trung', N'Nghia', CAST(0x7C310000 AS SmallDateTime), N'Nam', N'Nghe An', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1310', N'Tran Thi Hong', N'Tham', CAST(0x7B220000 AS SmallDateTime), N'Nu ', N'Tay Ninh', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1311', N'Tran Minh', N'Thuc', CAST(0x7B100000 AS SmallDateTime), N'Nam', N'TpHCM', N'K13')
INSERT HOCVIEN (MAHV, HO, TEN, NGAYSINH, GIOITINH, NOISINH, MALOP) VALUES (N'K1312', N'Nguyen Thi Kim', N'Yen', CAST(0x7BAC0000 AS SmallDateTime), N'Nu ', N'TpHCM', N'K13')


--BANG MON HOC
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'CSDL', N'Co so du lieu', 3, 1, N'HTTT')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'CTDLGT', N'Cau truc du lieu va giai thuat', 3, 1, N'KHMT')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'CTRR', N'Cau truc roi rac', 5, 0, N'KHMT')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'DHMT', N'Do hoa may tinh', 3, 1, N'KHMT')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'HDH', N'He dieu hanh', 4, 0, N'KTMT')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'KTMT', N'Kien truc may tinh', 3, 0, N'KTMT')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'LTCFW', N'Lap trinh C for win', 3, 1, N'CNPM')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'LTHDT', N'Lap trinh huong doi tuong', 3, 1, N'CNPM')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'NMCNPM', N'Nhap mon cong nghe phan mem', 3, 0, N'CNPM')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'PTTKHTTT', N'Phan tich thiet ke he thong thong tin', 4, 1, N'HTTT')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'PTTKTT', N'Phan tich thiet ke thuat toan', 3, 0, N'KHMT')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'THDC', N'Tin hoc dai cuong', 4, 1, N'KHMT')
INSERT MONHOC (MAMH, TENMH, TC_LT, TC_TH, MAKHOA) VALUES (N'TKCSDL', N'Thiet ke co so du lieu', 3, 1, N'HTTT')

--Bang Giao Vien
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV01', N'Ho Thanh Son', N'PTS', N'GS', N'Nam', CAST(0x47CF0000 AS SmallDateTime), CAST(0x946B0000 AS SmallDateTime), CAST(5.00 AS Numeric(4, 2)), 2250000.0000, N'KHMT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV02', N'Tran Tam Thanh', N'TS', N'PGS', N'Nam', CAST(0x5E1B0000 AS SmallDateTime), CAST(0x94D00000 AS SmallDateTime), CAST(4.50 AS Numeric(4, 2)), 2025000.0000, N'HTTT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV03', N'Do Nghiem Phung', N'TS', N'GS', N'Nu', CAST(0x482A0000 AS SmallDateTime), CAST(0x956B0000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), 1800000.0000, N'CNPM')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV04', N'Tran Nam Son', N'TS', N'PGS', N'Nam', CAST(0x573C0000 AS SmallDateTime), CAST(0x95DA0000 AS SmallDateTime), CAST(4.50 AS Numeric(4, 2)), 2025000.0000, N'KTMT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV05', N'Mai Thanh Danh', N'ThS', N'GV', N'Nam', CAST(0x53060000 AS SmallDateTime), CAST(0x95DA0000 AS SmallDateTime), CAST(3.00 AS Numeric(4, 2)), 1350000.0000, N'HTTT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV06', N'Tran Doan Hung', N'TS', N'GV', N'Nam', CAST(0x4BE30000 AS SmallDateTime), CAST(0x95DA0000 AS SmallDateTime), CAST(4.50 AS Numeric(4, 2)), 2025000.0000, N'KHMT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV07', N'Nguyen Minh Tien', N'ThS', N'GV', N'Nam', CAST(0x66920000 AS SmallDateTime), CAST(0x960A0000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), 1800000.0000, N'KHMT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV08', N'Le Thi Tran', N'KS', N'Null', N'Nu', CAST(0x69E80000 AS SmallDateTime), CAST(0x960A0000 AS SmallDateTime), CAST(1.69 AS Numeric(4, 2)), 760500.0000, N'KHMT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV09', N'Nguyen To Lan', N'ThS', N'GV', N'Nu', CAST(0x5F960000 AS SmallDateTime), CAST(0x960A0000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), 1800000.0000, N'HTTT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV10', N'Le Tran Anh Loan', N'KS', N'Null', N'Nu', CAST(0x677F0000 AS SmallDateTime), CAST(0x960A0000 AS SmallDateTime), CAST(1.86 AS Numeric(4, 2)), 837000.0000, N'CNPM')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV11', N'Ho Thanh Tung', N'CN', N'GV', N'Nam', CAST(0x722E0000 AS SmallDateTime), CAST(0x96550000 AS SmallDateTime), CAST(2.67 AS Numeric(4, 2)), 1201500.0000, N'MTT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV12', N'Tran Van Anh', N'CN', N'Null', N'Nu', CAST(0x73E80000 AS SmallDateTime), CAST(0x96550000 AS SmallDateTime), CAST(1.69 AS Numeric(4, 2)), 760500.0000, N'CNPM')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV13', N'Nguyen Linh Dan', N'CN', N'Null', N'Nu', CAST(0x72B20000 AS SmallDateTime), CAST(0x96550000 AS SmallDateTime), CAST(1.69 AS Numeric(4, 2)), 760500.0000, N'KTMT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV14', N'Truong Minh Chau', N'ThS', N'GV', N'Nu', NULL, CAST(0x96550000 AS SmallDateTime), CAST(3.00 AS Numeric(4, 2)), 1350000.0000, N'MTT')
INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGAYSINH, NGAYVAOLAM, HESO, MUCLUONG, MAKHOA) VALUES (N'GV15', N'Le Ha Thanh', N'ThS', N'GV', N'Nam', CAST(0x6FC40000 AS SmallDateTime), CAST(0x96550000 AS SmallDateTime), CAST(3.00 AS Numeric(4, 2)), 1350000.0000, N'KHMT')

-- KETQUATHI
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1101', N'CSDL', 1, CAST(0x98040000 AS SmallDateTime), CAST(10.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1101', N'CTDLGT', 1, CAST(0x98A50000 AS SmallDateTime), CAST(9.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1101', N'CTRR', 1, CAST(0x97C00000 AS SmallDateTime), CAST(9.50 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1101', N'THDC', 1, CAST(0x97C70000 AS SmallDateTime), CAST(9.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1102', N'CSDL', 1, CAST(0x98040000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1102', N'CSDL', 2, CAST(0x980B0000 AS SmallDateTime), CAST(4.25 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1102', N'CSDL', 3, CAST(0x98190000 AS SmallDateTime), CAST(4.50 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1102', N'CTDLGT', 1, CAST(0x98A50000 AS SmallDateTime), CAST(4.50 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1102', N'CTDLGT', 2, CAST(0x98AD0000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1102', N'CTDLGT', 3, CAST(0x98B70000 AS SmallDateTime), CAST(6.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1102', N'CTRR', 1, CAST(0x97C00000 AS SmallDateTime), CAST(7.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1102', N'THDC', 1, CAST(0x97C70000 AS SmallDateTime), CAST(5.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1103', N'CSDL', 1, CAST(0x98040000 AS SmallDateTime), CAST(3.50 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1103', N'CSDL', 2, CAST(0x980B0000 AS SmallDateTime), CAST(8.25 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1103', N'CTDLGT', 1, CAST(0x98A50000 AS SmallDateTime), CAST(7.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1103', N'CTRR', 1, CAST(0x97C00000 AS SmallDateTime), CAST(6.50 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1103', N'THDC', 1, CAST(0x98AD0000 AS SmallDateTime), CAST(8.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1104', N'CSDL', 1, CAST(0x97C00000 AS SmallDateTime), CAST(3.75 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1104', N'CTDLGT', 1, CAST(0x97C00000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1104', N'CTRR', 1, CAST(0x97C70000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1104', N'CTRR', 2, CAST(0x97C70000 AS SmallDateTime), CAST(3.50 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1104', N'CTRR', 3, CAST(0x97C70000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1104', N'THDC', 1, CAST(0x97C00000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1201', N'CSDL', 1, CAST(0x97C70000 AS SmallDateTime), CAST(6.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1201', N'CTDLGT', 1, CAST(0x97C70000 AS SmallDateTime), CAST(5.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1201', N'CTRR', 1, CAST(0x98040000 AS SmallDateTime), CAST(9.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1201', N'THDC', 1, CAST(0x98040000 AS SmallDateTime), CAST(8.50 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1202', N'CSDL', 1, CAST(0x98040000 AS SmallDateTime), CAST(8.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1202', N'CTDLGT', 1, CAST(0x97CE0000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1202', N'CTDLGT', 2, CAST(0x98A50000 AS SmallDateTime), CAST(5.00 AS Numeric(4, 2)), N'Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1202', N'CTRR', 1, CAST(0x97F00000 AS SmallDateTime), CAST(3.00 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1202', N'THDC', 1, CAST(0x98A50000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), N'Khong Dat')
INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGAYTHI, DIEM, KETQUA) VALUES (N'K1202', N'THDC', 2, CAST(0x98A50000 AS SmallDateTime), CAST(4.00 AS Numeric(4, 2)), N'Khong Dat')

--BANG GIANGDAY
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K11', N'CSDL', N'GV05', 2, 2006, CAST(0x97D30000 AS SmallDateTime), CAST(0x97FF0000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K11', N'CTDLGT', N'GV15', 3, 2006, CAST(0x98100000 AS SmallDateTime), CAST(0x98980000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K11', N'CTRR', N'GV02', 1, 2006, CAST(0x982F0000 AS SmallDateTime), CAST(0x97C40000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K11', N'DHMT', N'GV07', 1, 2007, CAST(0x98D90000 AS SmallDateTime), NULL)
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K11', N'HDH', N'GV04', 1, 2007, CAST(0x98AA0000 AS SmallDateTime), CAST(0x98D90000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K11', N'THDC', N'GV07', 1, 2006, CAST(0x973D0000 AS SmallDateTime), CAST(0x97BF0000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K12', N'CSDL', N'GV09', 2, 2006, CAST(0x97D30000 AS SmallDateTime), CAST(0x97FF0000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K12', N'CTDLGT', N'GV15', 3, 2006, CAST(0x98100000 AS SmallDateTime), CAST(0x98980000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K12', N'CTRR', N'GV02', 1, 2006, CAST(0x982F0000 AS SmallDateTime), CAST(0x97C40000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K12', N'HDH', N'GV04', 1, 2007, CAST(0x98AA0000 AS SmallDateTime), NULL)
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K12', N'THDC', N'GV06', 1, 2006, CAST(0x973D0000 AS SmallDateTime), CAST(0x97BF0000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K13', N'CSDL', N'GV05', 3, 2006, CAST(0x98100000 AS SmallDateTime), CAST(0x98980000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K13', N'CTDLGT', N'GV15', 2, 2006, CAST(0x97D30000 AS SmallDateTime), CAST(0x97FF0000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K13', N'CTRR', N'GV08', 1, 2006, CAST(0x982F0000 AS SmallDateTime), CAST(0x97C40000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K13', N'DHMT', N'GV07', 3, 2006, CAST(0x98100000 AS SmallDateTime), CAST(0x98980000 AS SmallDateTime))
INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAMHOC, TUNGAY, DENNGAY) VALUES (N'K13', N'THDC', N'GV15', 1, 2006, CAST(0x973D0000 AS SmallDateTime), CAST(0x97BF0000 AS SmallDateTime))

-- Bang DieuKien
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES (N'CSDL', N'CTDLGT')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES (N'CSDL', N'CTRR')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES (N'CTDLGT', N'THDC')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES (N'DHMT', N'THDC')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES (N'LTHDT', N'THDC')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES (N'PTTKHTTT', N'CSDL')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES (N'PTTKTT', N'CTDLGT')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES (N'PTTKTT', N'THDC')

--kiem tra du leu cua cac bang
select * from MONHOC 
select * from HOCVIEN 
select * from KHOA 
select * from GIAOVIEN 
select * from GIANGDAY 
select * from LOP 
select * from DIEUKIEN 
select * from KETQUATHI 

--In ra danh s�ch (m� h?c vi�n, h? t�n, ng�y sinh, m� l?p) l?p tru?ng c?a c�c l?p.
USE QLGV
go
SELECT hv.MAHV,hv.HO,hv.TEN,hv.MALOP, CONVERT(VARCHAR,hv.NGAYSINH,101) AS NgaySinh
FROM LOP l, HOCVIEN hv
WHERE hv.MAHV = l.TRGLOP

SELECT * FROM dbo.LOP

--In ra b?ng di?m khi thi (m� h?c vi�n, h? t�n , l?n thi, di?m s?) m�n CTRR c?a l?p �K12�, s?p x?p theo t�n, h? h?c vi�n.
SELECT kqt.MAHV,hv.HO,hv.TEN,kqt.LANTHI,kqt.DIEM
FROM dbo.HOCVIEN hv JOIN dbo.KETQUATHI kqt ON kqt.MAHV = hv.MAHV
WHERE  kqt.MAMH ='CTRR' AND hv.MALOP ='K12'
ORDER BY hv.HO,hv.TEN DESC

--In ra danh s�ch nh?ng h?c vi�n (m� h?c vi�n, h? t�n) v� nh?ng m�n h?c m� h?c vi�n d� thi l?n th? nh?t d� d?t.
--cach 1
SELECT  hv.MAHV,hv.HO,hv.TEN
FROM dbo.KETQUATHI kqt JOIN dbo.HOCVIEN hv ON hv.MAHV = kqt.MAHV
JOIN dbo.MONHOC mh ON mh.MAMH = kqt.MAMH
WHERE kqt.LANTHI=1 AND kqt.KETQUA ='Dat'
--cach 2
SELECT *
FROM dbo.HOCVIEN hv, dbo.KETQUATHI kqt, dbo.MONHOC mh
WHERE kqt.LANTHI=1 AND kqt.KETQUA ='Dat' AND hv.MAHV = kqt.MAHV AND mh.MAMH = kqt.MAMH

--In ra danh s�ch h?c vi�n (m� h?c vi�n, h? t�n) c?a l?p �K11� thi m�n CTRR kh�ng d?t (? l?n thi 1).
SELECT  hv.MAHV,hv.HO,hv.TEN, MH.TENMH
FROM dbo.KETQUATHI kqt JOIN dbo.HOCVIEN hv ON hv.MAHV = kqt.MAHV
JOIN dbo.MONHOC mh ON mh.MAMH = kqt.MAMH
WHERE kqt.LANTHI=1 AND kqt.KETQUA ='Khong Dat' AND hv.MALOP ='K11' AND mh.MAMH='CTRR'

--* Danh s�ch h?c vi�n (m� h?c vi�n, h? t�n) c?a l?p �K� thi m�n CTRR kh�ng d?t (? t?t c? c�c l?n thi).
SELECT hv.MAHV,hv.HO,hv.TEN, COUNT(kqt.LANTHI) TONG_LANTHI, SUM(CASE WHEN kqt.KETQUA = 'Khong Dat' THEN 1 ELSE 0 end) TongLanThi
FROM dbo.KETQUATHI kqt JOIN dbo.HOCVIEN hv ON hv.MAHV = kqt.MAHV
WHERE hv.MALOP LIKE 'K%' AND kqt.MAMH= 'CTRR' 
GROUP BY hv.MAHV,hv.HO,hv.TEN
HAVING COUNT(kqt.LANTHI)=SUM(CASE WHEN kqt.KETQUA='Khong Dat' THEN 1 ELSE 0 end)

--T�m t�n nh?ng m�n h?c m� gi�o vi�n c� t�n �Tran Tam Thanh� d?y trong h?c k? 1 nam 2006.
SELECT DISTINCT mh.TENMH
FROM dbo.GIANGDAY gd JOIN dbo.GIAOVIEN gv ON gv.MAGV = gd.MAGV
JOIN dbo.MONHOC mh ON mh.MAMH = gd.MAMH
WHERE gd.HOCKY = 1 AND gd.NAMHOC =2006 AND gv.HOTEN ='Tran Tam Thanh'

--T�m nh?ng m�n h?c (m� m�n h?c, t�n m�n h?c) m� gi�o vi�n ch? nhi?m l?p �K11� d?y trong h?c k? 1 nam 2006.
SELECT mh.MAMH,mh.TENMH
FROM dbo.LOP l JOIN dbo.GIANGDAY gd ON gd.MAGV = l.MAGVCN 
JOIN dbo.MONHOC mh ON mh.MAMH = gd.MAMH
WHERE l.MALOP = 'K11' AND gd.HOCKY =1 AND gd.NAMHOC =2006 AND l.MALOP=gd.MALOP

--In ra danh s�ch nh?ng m�n h?c (m� m�n h?c, t�n m�n h?c) ph?i h?c li?n tru?c m�n �Co So Du Lieu�.

--T�m h? t�n l?p tru?ng c?a c�c l?p m� gi�o vi�n c� t�n �Nguyen To Lan� d?y m�n �Co So Du Lieu�.
SELECT ( HV.HO+' '+hv.TEN) AS HoTen
FROM dbo.LOP l JOIN dbo.GIANGDAY gd ON gd.MALOP = l.MALOP
JOIN dbo.GIAOVIEN gv ON gv.MAGV = gd.MAGV
JOIN dbo.MONHOC mh ON mh.MAMH = gd.MAMH
JOIN dbo.HOCVIEN hv ON hv.MAHV = l.TRGLOP 
WHERE gv.HOTEN='Nguyen To Lan' AND mh.TENMH ='Co so du lieu'

--In ra danh s�ch nh?ng m�n h?c (m� m�n h?c, t�n m�n h?c) ph?i h?c li?n tru?c m�n �Co So Du Lieu�.
--cach 1
SELECT dk.MAMH_TRUOC, mh_truoc.TENMH
FROM dbo.MONHOC mh JOIN dbo.DIEUKIEN dk ON dk.MAMH = mh.MAMH
JOIN dbo.MONHOC mh_truoc ON dk.MAMH_TRUOC=mh_truoc.MAMH
WHERE mh.TENMH ='Co so du lieu'
--cach2
 SELECT dk.MAMH_TRUOC,mh.TENMH
 FROM dbo.DIEUKIEN dk JOIN dbo.MONHOC mh ON mh.MAMH = dk.MAMH

 --M�n �Cau Truc Roi Rac� l� m�n b?t bu?c ph?i h?c li?n tru?c nh?ng m�n h?c (m� m�n h?c, t�n m�n h?c) n�o.

 --T�m h? t�n gi�o vi�n d?y m�n CTRR cho c? hai l?p �K11� v� �K12� trong c�ng h?c k? 1 nam 2006.
 SELECT gd.MAGV,gv.HOTEN
 FROM dbo.GIANGDAY gd JOIN dbo.GIAOVIEN GV ON GV.MAGV = gd.MAGV
 WHERE gd.HOCKY =1 AND gd.NAMHOC =2006 AND gd.MALOP IN('K11','K12')
 GROUP BY gd.MAGV,gv.HOTEN
 HAVING COUNT(gd.MALOP)=2

 --T�m nh?ng h?c vi�n (m� h?c vi�n, h? t�n) thi kh�ng d?t m�n CSDL ? l?n thi th? 1 nhung chua thi l?i m�n n�y.

 --T�m gi�o vi�n (m� gi�o vi�n, h? t�n) kh�ng du?c ph�n c�ng gi?ng d?y b?t k? m�n h?c n�o.
  --cach 1
 SELECT gv.MAGV,gv.HOTEN
 FROM dbo.GIAOVIEN gv 
 WHERE gv.MAGV NOT IN (SELECT gd.MAGV  FROM dbo.GIANGDAY gd)
 --cach2
 SELECT gv.MAGV,gv.HOTEN
 FROM dbo.GIAOVIEN gv 
 WHERE NOT EXISTS (SELECT gd.MAGV  FROM dbo.GIANGDAY gd WHERE gd.MAGV = gv.MAGV)

 --T�m gi�o vi�n (m� gi�o vi�n, h? t�n) kh�ng du?c ph�n c�ng gi?ng d?y b?t k? m�n h?c n�o thu?c khoa gi�o vi�n d� ph? tr�ch.
select distinct gv.MAGV, gv.HOTEN
from GIAOVIEN gv 
	join KHOA k on gv.MAKHOA = k.MAKHOA
	join MONHOC mh on k.MAKHOA = mh.MAKHOA 
where not exists (select * from GIANGDAY gd where gd.MAGV = gv.MAGV and gd.MAMH = mh.MAMH)

 --T�m h? t�n c�c h?c vi�n thu?c l?p �K11� thi m?t m�n b?t k? qu� 3 l?n v?n �Khong dat� ho?c thi l?n th? 2 m�n CTRR du?c 5 di?m.








