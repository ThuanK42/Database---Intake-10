﻿CREATE DATABASE DeAnCongTy
GO
USE DeAnCongTy
 
GO   
	CREATE TABLE NHANVIEN
	(
		HONV VARCHAR(15),
		TENLOT VARCHAR(15),
		TENNV VARCHAR(15),
		MANV CHAR(9)NOT NULL,
		NGSINH DATETIME,
		DCHI VARCHAR(50),
		PHAI CHAR(3) ,
		LUONG FLOAT,
		MA_NQL CHAR(9),
		PHG INT ,
		
	)


GO

	
	CREATE TABLE PHONGBAN
	(
		TENPHG VARCHAR(15),
		MAPHG INT NOT NULL,
		TRPHG CHAR(9),
		NG_NHANCHUC DATETIME ,
		
	)

GO
	
	CREATE TABLE DIADIEM_PHG
	(	
		MAPHG INT  NOT NULL,
		DIADIEM VARCHAR(15) NOT NULL,
		

	)
GO
	
	CREATE TABLE PHANCONG
	(
		MA_NVIEN CHAR(9) NOT NULL,
		SODA INT NOT NULL,
		THOIGIAN FLOAT,
		
	)

GO
	
	CREATE TABLE DEAN
	(
		TENDA VARCHAR (15) ,
		MADA INT  NOT NULL,
		DDIEM_DA VARCHAR(15),
		PHONG INT ,
	)

GO
	
	CREATE TABLE THANNHAN
(
	MA_NVIEN CHAR(9)  NOT NULL,
	TENTN VARCHAR(15) NOT NULL,
	PHAI	CHAR(3),
	NGSINH	DATETIME,
	QUANHE	VARCHAR(8),
	
)

GO
-- KHI XOA BANG BANG NAO DUOC THAM CHIEU THI PHAI XOA KHOA NGOAI THAM CHIEU DEN NO RUI MOI XOA NO
-- TU "GO" CHI QUAN TRONG DOI VOI TU "USE" CON DAU KO CAN TU GO VAN CO THE CHO CHAY TOAN BO CSDL OK
-- THEM RANG BUOC KHOA CHINH CHO CAC BANG:
ALTER TABLE NHANVIEN ADD CONSTRAINT PK_MANV PRIMARY KEY (MANV)
GO
ALTER TABLE PHONGBAN ADD CONSTRAINT PK_MAPHG PRIMARY KEY (MAPHG)
GO
ALTER TABLE DIADIEM_PHG ADD CONSTRAINT PK_MAPHG_DIADIEM PRIMARY KEY (MAPHG,DIADIEM)
GO
ALTER TABLE DEAN ADD CONSTRAINT PK_MADA PRIMARY KEY (MADA)
GO
ALTER TABLE PHANCONG ADD CONSTRAINT PK_PHANCONG_MA_NVIEN_SODA PRIMARY KEY(MA_NVIEN,SODA)
GO
ALTER TABLE THANNHAN ADD CONSTRAINT PK_MANVIEN_TENTN PRIMARY KEY(MA_NVIEN,TENTN)
GO
-- THEM RANG BUOC KHOA NGOAI CHO CAC BANG :
ALTER TABLE NHANVIEN ADD CONSTRAINT FK_NHANVIEN_PHG_PHONGBAN FOREIGN KEY (PHG)REFERENCES PHONGBAN(MAPHG)
GO
ALTER TABLE NHANVIEN ADD CONSTRAINT FK_NHANVIEN_MA_NQL_NHANVIEN FOREIGN KEY(MA_NQL) REFERENCES NHANVIEN(MANV)
GO
ALTER TABLE PHONGBAN ADD CONSTRAINT FK_PHONGBAN_TRPHG_NHANVIEN FOREIGN KEY (TRPHG)REFERENCES NHANVIEN(MANV)
GO
ALTER TABLE DIADIEM_PHG ADD CONSTRAINT FK_DIEMDIEM_PHG_MAPHG_PHONGBAN FOREIGN KEY (MAPHG)REFERENCES PHONGBAN(MAPHG)
GO
ALTER TABLE DEAN ADD CONSTRAINT FK_DEAN_PHONG_PHONGBAN FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPHG)
GO
ALTER TABLE PHANCONG ADD CONSTRAINT FK_PHANCONG_MA_NVIEN_NHANVIEN FOREIGN KEY (MA_NVIEN)REFERENCES NHANVIEN(MANV),CONSTRAINT FK_PHANCONG_SODA_DEAN FOREIGN KEY(SODA) REFERENCES DEAN(MADA)
GO
ALTER TABLE THANNHAN ADD CONSTRAINT FK_THANNHAN_MANVIEN_NHANVIEN FOREIGN KEY (MA_NVIEN)REFERENCES NHANVIEN(MANV)
GO
-- THEM RANG BUOC CHECK VAO CAC THUOC TINH CUA CAC BANG:
ALTER TABLE NHANVIEN ADD CONSTRAINT CHK_NHANVIEN_PHAI CHECK(PHAI IN('NAM','NU'))
GO
ALTER TABLE PHONGBAN ADD CONSTRAINT UNI_PHONGBAN_TENPHG UNIQUE(TENPHG)
GO
ALTER TABLE PHANCONG ADD CONSTRAINT CHK_PHANCONG_THOIGIAN CHECK (THOIGIAN IN(1,5))
ALTER TABLE PHANCONG DROP  CHK_PHANCONG_THOIGIAN
-- KIEM TRA CAU TRUC CUA BANG:
SP_HELP NHANVIEN
SP_HELP PHONGBAN
SP_HELP DIADIEM_PHG
SP_HELP PHANCONG
SP_HELP DEAN
SP_HELP THANNHAN
-- KIEM TRA CAC RANG BUOC TRONG BANG:
SP_HELPCONSTRAINT NHANVIEN
SP_HELPCONSTRAINT PHONGBAN
SP_HELPCONSTRAINT DIADIEM_PHG
SP_HELPCONSTRAINT PHANCONG
SP_HELPCONSTRAINT DEAN
SP_HELPCONSTRAINT THANNHAN
GO
ALTER TABLE PHONGBAN NOCHECK  CONSTRAINT ALL
INSERT INTO PHONGBAN VALUES ( 'Nghien cuu', 5 ,333445555,05/22/1998)
INSERT INTO PHONGBAN VALUES ('Dieu Hang',4,987987987,1995/01/01)
INSERT INTO PHONGBAN VALUES ('Quan Li',1,888665555,19/06/1981)
ALTER TABLE PHONGBAN NOCHECK CONSTRAINT ALL
GO
INSERT INTO NHANVIEN VALUES ('Nguyen','Thanh','Tung',333445555,'12/08/1955','638 Nguyen Van Cu, Q5, TP HCM','Nam',4000,888665555,5)
INSERT INTO NHANVIEN VALUES ('Bui','Ngoc','Hang',999887777,19/07/1968,'638 Nguyen Van Cu,Q5, TP HCM','Nu',25000,987654321,4)
INSERT INTO NHANVIEN VALUES ('Le','Quynh','Nhu',987654321,'06/20/1951','291 Ho Van Hue, QPN, TP HCM','Nu',43000,888665555,4)
INSERT INTO NHANVIEN VALUES ('Nguyen','Manh','Hung',666884444,'06/20/1951','957 Ba Ria, Vung Tau','Nam',38000,333445555,5)
INSERT INTO NHANVIEN VALUES ('Tran','Thanh','Tam',453453453,'07/31/1972','543 Mai Thi Luu,Q1,TP HCM','Nam',38000,333445555,5) 
INSERT INTO NHANVIEN VALUES ('Tran','Hong','Quang',987987987,03/09/1969,'980 Le Hong Phong,Q10,TPHCM','Nam',25000,333445555,4)
INSERT INTO NHANVIEN VALUES ('Pham','Van','Vinh',888665555,11/10/1937,'450 Trung Vuong,Ha Noi','Nam',55000, NULL,1)
INSERT INTO NHANVIEN VALUES ('Dinh',' Ba', 'Tien', 123456789,' 01/09/1965','731 Tran Hung Dao Q1 TP HCM' , 'Nam', 30000,333445555,5)
ALTER TABLE NHANVIEN CHECK CONSTRAINT ALL
ALTER TABLE PHONGBAN CHECK CONSTRAINT ALL



-- THEM DU LIEU VAO BANG DIADIEM_PHG: 
INSERT INTO DIADIEM_PHG VALUES(1,'TP HCM')
INSERT INTO DIADIEM_PHG VALUES(4,'HA NOI')
INSERT INTO DIADIEM_PHG VALUES(5,'VUNG TAU')
INSERT INTO DIADIEM_PHG VALUES(5,'NHA TRANG')
INSERT INTO DIADIEM_PHG VALUES(5,'TP HCM')
-- THEM DU LIEU VAO BANG NHANVIEN:

INSERT INTO NHANVIEN (HONV ,TENLOT ,TENNV , MANV , NGSINH , DCHI , PHAI ,LUONG , PHG)VALUES ('Nguyen','Thanh','Tung',333445555,'12/08/1955','638 Nguyen Van Cu, Q5, TP HCM','Nam',40000,5)
INSERT INTO NHANVIEN (HONV ,TENLOT ,TENNV , MANV , NGSINH , DCHI , PHAI ,LUONG , PHG)VALUES ('Bui','Ngoc','Hang',999887777,19/07/1968,'638 Nguyen Van Cu,Q5, TP HCM','Nu',25000,4)
INSERT INTO NHANVIEN (HONV ,TENLOT ,TENNV , MANV , NGSINH , DCHI , PHAI ,LUONG , PHG)VALUES ('Le','Quynh','Nhu',987654321,'06/20/1951','291 Ho Van Hue, QPN, TP HCM','Nu',43000,4)
INSERT INTO NHANVIEN (HONV ,TENLOT ,TENNV , MANV , NGSINH , DCHI , PHAI ,LUONG , PHG)VALUES ('Nguyen','Manh','Hung',666884444,'06/20/1951','957 Ba Ria, Vung Tau','Nam',38000,5)
INSERT INTO NHANVIEN (HONV ,TENLOT ,TENNV , MANV , NGSINH , DCHI , PHAI ,LUONG , PHG)VALUES ('Tran','Thanh','Tam',453453453,'07/31/1972','543 Mai Thi Luu,Q1,TP HCM','Nam',25000,5) 
INSERT INTO NHANVIEN (HONV ,TENLOT ,TENNV , MANV , NGSINH , DCHI , PHAI ,LUONG , PHG)VALUES ('Tran','Hong','Quang',987987987,03/09/1969,'980 Le Hong Phong,Q10,TP HCM','Nam',25000,4)
INSERT INTO NHANVIEN (HONV ,TENLOT ,TENNV , MANV , NGSINH , DCHI , PHAI ,LUONG , PHG)VALUES ('Pham','Van','Vinh',888665555,11/10/1937,'450 Trung Vuong,Ha Noi','Nam',55000,1)
INSERT INTO NHANVIEN (HONV ,TENLOT ,TENNV , MANV , NGSINH , DCHI , PHAI ,LUONG , PHG)VALUES ('Dinh',' Ba', 'Tien', 123456789,' 01/09/1965','731 Tran Hung Dao Q1 TP HCM' , 'Nam', 30000,5)

-- THEM DU LIEU VAO BANG THAN NHAN:
INSERT INTO THANNHAN VALUES(333445555,'Trinh','Nu',04/05/1986,'Con gai')
INSERT INTO THANNHAN VALUES(333445555,'Khang','Nam',10/25/1983,'Con trai')
INSERT INTO THANNHAN VALUES(333445555,'Phuong','Nu',05/03/1958,'Vo chong')
INSERT INTO THANNHAN VALUES(987654321,'Minh','Nam',02/28/1942,'Vo chong')
INSERT INTO THANNHAN VALUES(123456789,'Tien','Nam',01/01/1988,'Con trai')
INSERT INTO THANNHAN VALUES(123456789,'Chau','Nu',12/30/1988,'Con gai')
INSERT INTO THANNHAN VALUES(123456789,'Phuong','Nu',05/05/1967,'Vo chong')
-- THEM DU LIEU VAO BANG DEAN: 

INSERT INTO DEAN VALUES ('San pham X',1,'VUNG TAU',5)
INSERT INTO DEAN VALUES ('San pham Y',2,'Nha Trang',5)
INSERT INTO DEAN VALUES ('San pham Z',3,'TP HCM',5)
INSERT INTO DEAN VALUES ('Tin Hoc Hoa',10,'HA NOI',4)
INSERT INTO DEAN VALUES ('Cap Quang',20,'TP HCM',1)
INSERT INTO DEAN VALUES ('Dao Tao',30,'HA NOI',4)
-- THAM DU LIEU VAO BANG PHANCONG:

INSERT INTO PHANCONG VALUES (123456789,1,32.5)
INSERT INTO PHANCONG VALUES (123456789,2,7.5)
INSERT INTO PHANCONG VALUES (666884444,3,40.0)
INSERT INTO PHANCONG VALUES (453453453,1,20.0)
INSERT INTO PHANCONG VALUES (453453453,2,20.0)
INSERT INTO PHANCONG VALUES (333445555,2,10.0)
INSERT INTO PHANCONG VALUES (333445555,3,10.1)
INSERT INTO PHANCONG VALUES (333445555,10,10.0)
INSERT INTO PHANCONG VALUES (333445555,20,10.0)
INSERT INTO PHANCONG VALUES (999887777,30,30.0)
INSERT INTO PHANCONG VALUES (999887777,10,10.0)
INSERT INTO PHANCONG VALUES (987987987,10,35.0)
INSERT INTO PHANCONG VALUES (987987987,30,5.0)
INSERT INTO PHANCONG VALUES (987654321,30,20.0)
INSERT INTO PHANCONG VALUES (987654321,20,15.0)
INSERT INTO PHANCONG VALUES (888665555,20,NULL)
--UPDATE BANG NHANVIEN:

UPDATE NHANVIEN SET MA_NQL ='333445555' WHERE MANV = 123456789
UPDATE NHANVIEN SET MA_NQL =888665555 	WHERE MANV = 333445555
UPDATE NHANVIEN SET MA_NQL = 987654321 WHERE MANV =999887777
UPDATE NHANVIEN SET MA_NQL = 888665555 WHERE MANV = 987654321
UPDATE NHANVIEN SET MA_NQL = 333445555 WHERE MANV=666884444
UPDATE NHANVIEN SET MA_NQL = 333445555 WHERE MANV = 453453453
UPDATE NHANVIEN SET MA_NQL = 987654321 WHERE MANV=987987987
--UPDATE BANG PHONGBAN:
UPDATE PHONGBAN SET TRPHG=333445555 WHERE MAPHG=5
UPDATE PHONGBAN SET TRPHG=987987987 WHERE MAPHG=4
UPDATE PHONGBAN SET TRPHG=888665555 WHERE MAPHG=1

-- Week 2
--1. Tìm các nhân viên làm việc ở phòng số 4 
SELECT *
FROM dbo.NHANVIEN nv 
WHERE nv.PHG = 4

--Tìm các nhân viên có mức lương trên 30000 
SELECT *
FROM dbo.NHANVIEN NV
WHERE NV.LUONG >30000



--14.Tim ten nhung nu nhan vien va ten nguoi than cua ho
SELECT CONCAT(NV.HONV,' ',NV.TENLOT,' ',NV.TENNV) TEN_NV
FROM dbo.NHANVIEN NV JOIN dbo.THANNHAN TN ON TN.MA_NVIEN = NV.MANV
WHERE NV.PHAI = 'Nu'

--15.Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó 
SELECT CONCAT(NV.HONV,' ',NV.TENLOT,' ',NV.TENNV) TEN_NV,
CONCAT(NQL.HONV,' ',NQL.TENLOT,' ',NQL.TENNV) TEN_NQL
FROM dbo.NHANVIEN NV LEFT JOIN dbo.NHANVIEN NQL ON NQL.MANV = NV.MA_NQL

--16.Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó. 
SELECT CONCAT(NV.HONV,' ',NV.TENLOT,' ',NV.TENNV) TEN_NV,
CONCAT(NQL.HONV,' ',NQL.TENLOT,' ',NQL.TENNV) TEN_NQL,
CONCAT(TRP.HONV,' ',TRP.TENLOT,' ',TRP.TENNV) TEN_TRP
FROM dbo.NHANVIEN NV LEFT JOIN  dbo.NHANVIEN NQL ON NQL.MA_NQL = NV.MANV
JOIN dbo.PHONGBAN PB ON NV.PHG=PB.MAPHG
JOIN dbo.NHANVIEN TRP ON TRP.MANV=PB.TRPHG

--17. Tên những nhân viên phòng số 5 có tham gia vào đề án "San pham X" và nhân viên này do "Nguyen Thanh Tung" quản lý trực tiếp.
SELECT CONCAT(NV.HONV,' ',NV.TENLOT,' ',NV.TENNV) TEN_NV
FROM dbo.NHANVIEN NV JOIN dbo.PHANCONG PC ON PC.MA_NVIEN = NV.MANV
 JOIN dbo.DEAN DA ON DA.MADA = PC.SODA
 JOIN dbo.NHANVIEN NQL ON NQL.MANV=NV.MA_NQL
WHERE NV.PHG = 5 AND DA.TENDA='San Pham X' AND CONCAT( NQL.HONV,' ',NQL.TENLOT,' ',NQL.TENNV) ='Nguyen Thanh Tung' ;

--18. Cho biết tên các đề án mà nhân viên Đinh Bá Tiến đã tham gia. 
SELECT DA.TENDA
FROM dbo.DEAN DA JOIN dbo.PHANCONG PC ON PC.SODA = DA.MADA
JOIN dbo.NHANVIEN NV ON NV.MANV = PC.MA_NVIEN
WHERE CONCAT(RTRIM(LTRIM(NV.HONV)),' ',RTRIM(LTRIM(NV.TENLOT)),' ',RTRIM(LTRIM(NV.TENNV))) ='Dinh Ba Tien'

--LIKE gan dung, = chinh xac cao hon
-- rtrim, ltrim cat chuoi

-- Cho biết số lượng đề án của công ty 
SELECT COUNT(*) SLDeAn
FROM dbo.DEAN

--Cho biết số lượng đề án do phòng ‘Nghiên Cứu’ chủ trì 
 SELECT COUNT(*) SLDeAn
FROM dbo.DEAN DA JOIN dbo.PHONGBAN PB ON PB.MAPHG = DA.PHONG
WHERE PB.TENPHG=N'Nghien Cuu' -- tim nvarchar 

--Cho biết lương trung bình của các nữ nhân viên 
SELECT AVG(nv.LUONG) LUONG_TB
FROM dbo.NHANVIEN nv
WHERE nv.PHAI = 'Nu'

--Cho biết số thân nhân của nhân viên ‘Đinh Bá Tiến’ 

--Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó
SELECT DA.TENDA,SUM(PC.THOIGIAN) GIO
FROM dbo.DEAN DA JOIN dbo.PHANCONG PC ON PC.SODA = DA.MADA
GROUP BY DA.TENDA 

--Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó 
SELECT DA.TENDA,COUNT(PC.MA_NVIEN) SL_DA
FROM dbo.DEAN DA JOIN dbo.PHANCONG PC ON PC.SODA = DA.MADA
GROUP BY DA.TENDA 

--Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó
SELECT NV.HONV,'',NV.TENLOT,' ',NV.TENNV, COUNT (NV.MANV) SL_TN
FROM dbo.NHANVIEN NV JOIN dbo.PHANCONG PC ON PC.MA_NVIEN = NV.MANV
GROUP BY NV.HONV,NV.TENLOT,NV.TENNV

--Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia. 
SELECT NV.HONV,'',NV.TENLOT,' ',NV.TENNV, COUNT (PC.SODA) SL_DA
FROM dbo.NHANVIEN NV JOIN dbo.PHANCONG PC ON PC.MA_NVIEN = NV.MANV
GROUP BY NV.HONV,NV.TENLOT,NV.TENNV

--Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì 

--Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì 

--Với mỗi phòng ban có mức lương trung bình lớn hơn 40,000, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
SELECT PB.TENPHG,COUNT(DA.MADA)
FROM dbo.PHONGBAN PB JOIN dbo.NHANVIEN NV ON NV.PHG = PB.MAPHG JOIN dbo.DEAN DA ON DA.PHONG = PB.MAPHG
GROUP BY PB.TENPHG
HAVING AVG(NV.LUONG)>40000

--Cho biết số đề án diễn ra tại từng địa điểm 
SELECT DA.DDIEM_DA,COUNT(*) SL_DA
FROM dbo.DEAN DA
GROUP BY DA.DDIEM_DA

--Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là ‘Dinh’ hoặc
-- có người trưởng phòng chủ trì đề án với họ (HONV) là ‘Dinh’
SELECT *
FROM dbo.DEAN DA 
WHERE DA.MADA IN (
					SELECT PC.SODA
					FROM dbo.NHANVIEN NV JOIN dbo.PHANCONG PC ON PC.MA_NVIEN = NV.MANV
					WHERE NV.HONV ='Dinh')
OR DA.MADA IN (
				SELECT da.MADA 
				FROM dbo.NHANVIEN NV, dbo.PHONGBAN PB, dbo.DEAN DA 
				WHERE NV.PHG=PB.MAPHG AND NV.MANV=PB.TRPHG AND NV.HONV ='Dinh')

-- Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân. 
SELECT nv.HONV,nv.TENLOT,nv.TENNV
FROM dbo.NHANVIEN nv, dbo.THANNHAN tn
WHERE nv.MANV = tn.MA_NVIEN
GROUP BY  nv.HONV,nv.TENLOT,nv.TENNV
HAVING COUNT(nv.MANV)>2

SELECT *
FROM dbo.NHANVIEN nv , dbo.THANNHAN tn
WHERE nv.MANV IN (
					SELECT tn.MA_NVIEN
					FROM dbo.THANNHAN tn
					GROUP BY tn.MA_NVIEN
					HAVING COUNT(tn.TENTN) >2
					)
-- Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào. 
SELECT nv.HONV,nv.TENLOT,nv.TENNV
FROM dbo.NHANVIEN nv
WHERE nv.MANV IN (SELECT 
					FROM 
					)

--Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân. 

--Tìm họ (HONV) của những trưởng phòng chưa có gia đình.

--Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nghiên cứu" 
SELECT *
FROM dbo.NHANVIEN nv
WHERE nv.LUONG > (  SELECT AVG(nv.LUONG) 
					FROM dbo.NHANVIEN nv JOIN dbo.PHONGBAN pb ON pb.MAPHG = nv.PHG 
					WHERE pb.TENPHG='Nghien cuu')

-- Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất
SELECT TOP 1 WITH TIES pb.TENPHG,concat(trp.HONV,' ',trp.TENLOT,' ',trp.TENNV) TEN_TRP, COUNT(nv.MANV) SL_NV
FROM dbo.PHONGBAN pb JOIN dbo.NHANVIEN trp ON trp.MANV = pb.TRPHG 
					JOIN dbo.NHANVIEN nv ON nv.PHG = pb.MAPHG
GROUP BY PB.TENPHG
ORDER BY SL_NV DESC
