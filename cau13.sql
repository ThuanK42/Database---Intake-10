use DeAnCongTy
--13. Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng
--phòng của phòng ban chủ trì đề án đó.

select da.TENDA, pb.TENPHG,(nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) TEN_TRPH, CONVERT(varchar,pb.NG_NHANCHUC,103) 
from DEAN da, PHONGBAN pb, NHANVIEN nv
where  da.PHONG = pb.MAPHG
and pb.TRPHG = nv.MANV
and da.DDIEM_DA = 'Ha Noi';

select Da.TENDA, pb.TENPHG, CONCAT(nv.HONV,' ',nv.TENLOT,' ',nv.TENNV), CONVERT(varchar,pb.NG_NHANCHUC,103)  
from DEAN da join PHONGBAN pb on da.PHONG = pb.MAPHG
			join NHANVIEN nv on pb.TRPHG = nv.MANV
where da.DDIEM_DA = 'Ha Noi'; 

--14 Tìm tên những nữ nhân viên và tên người thân của họ
SELECT CONCAT(NV.HONV,'',NV.TENLOT,'',NV.TENNV) TEN_NVIEN, TN.TENTN
FROM NHANVIEN NV JOIN THANNHAN TN ON NV.MANV = TN.MA_NVIEN
WHERE  NV.PHAI = 'Nu';

--15. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
SELECT CONCAT(NV.HONV,'',NV.TENLOT,'',NV.TENNV) TEN_NVIEN, CONCAT(NQL.HONV,'',NQL.TENLOT,'',NQL.TENNV) TEN_NVIEN
FROM NHANVIEN NV LEFT JOIN NHANVIEN NQL ON NV.MA_NQL=NQL.MANV

--16. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó.
SELECT DISTINCT CONCAT(NV.HONV,' ',NV.TENLOT,' ',NV.TENNV) TEN_NVIEN, CONCAT(TRP.HONV,' ',TRP.TENLOT,'',TRP.TENNV) TEN_TRP ,CONCAT(NQL.HONV,'',NQL.TENLOT,'',NQL.TENNV) TEN_NQL
FROM NHANVIEN NV LEFT JOIN NHANVIEN NQL ON NV.MA_NQL = NQL.MANV
JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
JOIN NHANVIEN TRP ON TRP.MANV = PB.TRPHG

--17. Tên những nhân viên phòng số 5 có tham gia vào đề án "San pham X" và nhân viên này do "Nguyen Thanh Tung" quản lý trực tiếp.
SELECT  CONCAT(NV.HONV,' ',NV.TENLOT,' ',NV.TENNV) TEN_NVIEN 
FROM NHANVIEN NV JOIN PHANCONG PC ON NV.MANV = PC.MA_NVIEN
				JOIN DEAN DA ON PC.SODA = DA.MADA 
				JOIN NHANVIEN NQL ON NV.MA_NQL = NQL.MANV
WHERE NV.PHG = 5 AND DA.TENDA ='San Pham X'
				AND CONCAT(NQL.HONV,' ',NQL.TENLOT,' ',NQL.TENNV) = 'Nguyen Thanh Tung'

--18. Cho biết tên các đề án mà nhân viên Đinh Bá Tiến đã tham gia.
SELECT DA.TENDA
FROM DEAN DA
	JOIN PHANCONG PC ON DA.MADA = PC.SODA
	JOIN NHANVIEN NV ON PC.MA_NVIEN = NV.MANV
WHERE LTRIM(RTRIM(NV.HONV))+ ' ' + LTRIM(RTRIM(NV.TENLOT)) + ' ' +  LTRIM(RTRIM(NV.TENNV)) = 'Dinh Ba Tien'

-- 19. Cho biết số lượng đề án của công ty
SELECT COUNT(*) SL
FROM DEAN
--20. Cho biết số lượng đề án do phòng ‘Nghiên Cứu’ chủ trì
SELECT COUNT(*) SL
FROM DEAN DA JOIN PHONGBAN PB ON DA.PHONG = PB.MAPHG
WHERE PB.TENPHG = N'Nghien Cuu'
--21. Cho biết lương trung bình của các nữ nhân viên
SELECT AVG(LUONG) AS LUONG_TB
FROM NHANVIEN 
WHERE PHAI = 'Nu'
--22. Cho biết số thân nhân của nhân viên ‘Đinh Bá Tiến’
SELECT * 
FROM NHANVIEN NV JOIN THANNHAN TN ON NV.MANV = TN.MA_NVIEN
--23. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
SELECT DA.TENDA, SUM(PC.THOIGIAN) GIO
FROM DEAN  DA
	JOIN PHANCONG PC ON DA.MADA = PC.SODA
GROUP BY DA.TENDA
--24. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó
SELECT DA.TENDA, COUNT(PC.MA_NVIEN) SL_DA
FROM DEAN  DA
	JOIN PHANCONG PC ON DA.MADA = PC.SODA
GROUP BY DA.TENDA
--25. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
SELECT NV.HONV, NV.TENLOT, NV.TENNV, COUNT(NV.MANV) SLTN
FROM NHANVIEN NV
	JOIN PHANCONG PC ON NV.MANV = PC.MA_NVIEN
GROUP BY NV.HONV, NV.TENLOT, NV.TENNV
--26. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
--27. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
-- 29. Với mỗi phòng ban có mức lương trung bình lớn hơn 40,000, cho biết tên phòng ban và số lượng  án mà phòng ban đó chủ trì.
SELECT PB.TENPHG, COUNT(DA.MADA) SL_DA
FROM PHONGBAN PB
	JOIN NHANVIEN NV ON PB.MAPHG = NV.PHG
	JOIN DEAN DA ON PB.MAPHG = DA.PHONG
GROUP BY PB.TENPHG
HAVING AVG(NV.LUONG)>4000

--30. Cho biết số đề án diễn ra tại từng địa điểm
SELECT DA.DDIEM_DA, COUNT(*) SLDA
FROM DEAN DA
GROUP BY DA.DDIEM_DA

-- 34. Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là ‘Dinh’ hoặc , có người
--trưởng phòng chủ trì đề án với họ (HONV) là ‘Dinh’.
SELECT DA.MADA
FROM DEAN DA
WHERE MADA IN (
SELECT PC.SODA
FROM NHANVIEN NV, PHANCONG PC
WHERE NV.HONV = 'Dinh'
) OR DA.MADA IN (
SELECT *
FROM NHANVIEN NV, PHONGBAN PB, DEAN DA
WHERE NV.PHG = PB.MAPHG
AND NV.MANV = PB.TRPHG
AND NV.HONV = 'Dinh'
)

--35. Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân.
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV,THANNHAN TN
WHERE NV.MANV = TN.MA_NVIEN
GROUP BY NV.HONV, NV.TENLOT, NV.TENNV
HAVING COUNT(NV.MANV) > 2


SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV
WHERE NV.MANV IN (SELECT TN.MA_NVIEN
					FROM THANNHAN TN
					GROUP BY TN.MA_NVIEN
					HAVING COUNT(TN.TENTN) > 2)

--37. Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân.
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.MANV = PB.TRPHG
AND NV.MANV NOT IN (SELECT TN.MA_NVIEN FROM THANNHAN TN)

SELECT AVG(NV.LUONG)
FROM NHANVIEN NV, PHONGBAN PB
WHERE VN.PHG = PB.MAPHG

--40 Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
SELECT TOP 1 WITH TIES PB.TENPHG, (TRP.HONV+' '+TRP.TENLOT+' '+TRP.TENNV) TENNV, COUNT(NV.MANV) SL_NV
FROM PHONGBAN PB JOIN NHANVIEN TRP ON PB.TRPHG = TRP.MANV
				JOIN NHANVIEN NV ON PB.MAPHG = NV.PHG
GROUP BY PB.TENPHG, (TRP.HONV+' '+TRP.TENLOT+' '+TRP.TENNV)
ORDER BY SL_NV DESC