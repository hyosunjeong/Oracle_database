-- 여기는 myuser로 접속한 화면입니다.
-- 매입매출샘플(엑셀)파일에서 DataBase로 데이터를 옮기고 
-- DB규칙에 맞도록 적용하는 연습

CREATE TABLE tbl_iolist(
    id	NUMBER	PRIMARY KEY,
    io_date	CHAR(10)	NOT NULL,	
    io_cname	nVARCHAR2(50)	NOT NULL,
    io_dname	nVARCHAR2(30)	NOT NULL,	
    ie_dceo	nVARCHAR2(10),		
    io_inout	nVARCHAR2(5),		
    io_quan	NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER		
);

SELECT * FROM tbl_iolist;

SELECT COUNT(*) FROM tbl_iolist;

DELETE FROM tbl_iolist;


SELECT * FROM tbl_iolist
WHERE io_inout = '매출' and  io_date >= '2018-02-01' and io_date<='2018-02-28';

-- 날짜 순으로 정렬하기
SELECT * FROM tbl_iolist
WHERE io_inout = '매입' and io_date>='2018-02-01' and io_date<= '2018-02-28'
ORDER BY io_date;


-- 통계함수를 이용해서 개수와 합계를 구하기
SELECT COUNT(*) AS 개수, SUM(io_total ) AS 합계
FROM tbl_iolist;

-- 통계함수를 이용해서 개수와 합계를 구하는데
-- 매입합계와 매출합계를 따로 계산하고 싶다.
-- 1. 매입과 매출을 구분하는 칼럼: io_inout
SELECT io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout;
-- 구분하고자 하는 컬럼은 맨 앞에 써주고
-- 그룹바이로 묶어준다

-- 통계함수를 이용해서 개수와 합계를 계산
-- 조건 : 날짜별로 조건을 부여해서 개수와 합계 계산
-- 1. 날짜를 구분하는 칼럼 : io_date
SELECT io_date ,COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;


-- 조건 : 날짜별로 묶고, 다시 매입 매출로 구분하여 개수와 합계를 계산
-- 1. 날짜를 구분하는 칼럼 : io_date
-- 2. 매입과 매출을 구분하는 칼럼 : io_inout
SELECT io_date, io_inout, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;


-- 구분과 날짜 순서를 바꾸어서
SELECT io_inout, io_date, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout, io_date
ORDER BY io_inout;

-- 조건 : 날짜 범위를 2018-03-01 ~ 2018-03-31로 제한
SELECT io_inout, io_date, COUNT(*),SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' and '2018-03-31'
GROUP BY io_inout, io_date
ORDER BY io_inout;

-- 합계 금액이 50만원 이상인 항목만 보여라
SELECT io_inout, io_date, COUNT(*),SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' and '2018-03-31'

GROUP BY io_inout, io_date
HAVING SUM(io_total) >= 500000
ORDER BY io_inout;
-- 통계 함수를 사용하는 경우 
-- 통계 함수 결과에 따라 추출하는 List를 제한하고 싶을때
-- (필요한 범위의 값만 보고싶을때)
-- WHERE에 조건을 부여하면 안된다.
-- 이때는 HAVING이라는 절을 사용한다.


SELECT io_inout, io_date, COUNT(*),SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout, io_date
HAVING SUM(io_total) >= 500000 and io_date BETWEEN '2018-03-01' and '2018-03-31'
ORDER BY io_inout; 
-- HAVING절은 모든 통계를 계산한 후 조건으로 제한을 하기 때문에
-- 모든 데이터에 COUNT와 SUM을 계산하고
-- 비로소 날짜 범위를 제한한다.
-- 따라서 DB SELECT에서 최악의 시간 소요가 된다.



