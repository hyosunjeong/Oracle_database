-- 여기는 myIOUser 화면입니다.

CREATE TABLE tbl_iolist(
    io_id	    NUMBER		PRIMARY KEY,
    io_date	    CHAR(10)	NOT NULL,	
    io_pname	nVARCHAR2(50)	NOT NULL,	
    io_dname	nVARCHAR2(50)	NOT NULL,	
    io_dceo	    nVARCHAR2(50),		
    io_inout	CHAR(7)	NOT NULL,	
    io_quan	    NUMBER,	
    io_price	NUMBER,	
    io_total	NUMBER		
);

DROP TABLE tbl_iolist;

SELECT count(*) FROM tbl_iolist;

-- 거래처명, 대표자명을 GROUP으로 하여 리스트 조회
SELECT io_dname, io_dceo FROM tbl_iolist GROUP BY io_dname, io_dceo;

-- tbl_dept 테이블 생성
CREATE TABLE tbl_dept(
    d_code	CHAR(5)		PRIMARY KEY,
    d_name	nVARCHAR2(50)	NOT NULL,	
    d_ceo	nVARCHAR2(50)		
);

SELECT * FROM tbl_dept;

DESC tbl_dept;

-- NOT NULL 조건 삭제
ALTER TABLE tbl_dept MODIFY d_name null;
-- NOT NULL 조건 추가
ALTER TABLE tbl_dept MODIFY d_name NOT NULL;

-- EQ JOIN
SELECT I.io_dname, D.d_name, I.io_dceo, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dname = D.d_name AND I.io_dceo = D.d_ceo;

-- 데이터가 정확히 만들어졌는가 검증하기 위해서 LEFT JOIN을 사용해서 실행한다.
SELECT I.io_dname, D.d_name, I.io_dceo, D.d_ceo
FROM tbl_iolist I -- 먼저 보여줄 테이블
    LEFT JOIN tbl_dept D
        ON I.io_dname = D.d_name AND I.io_dceo = D.d_ceo;
        
-- 위 SQL문으로 확인한 LIST는 모든 상품매입매출 목록이 나타나서 잘못된 데이터가 있는지 확인하기 어렵다.
-- 만약 위의 SQL문을 실행했을때 iolist에는 데이터가 있는데
    -- dept에는 데이터가 없을 경우에 d.d_name과 d.d_ceo는 null값으로 나타날 것이다.
-- 이 성질을 이용해서 d.d_name 이나 d.d_ceo가 null인 것만 찾아보면 더 쉽게 확인이 가능하다.  
SELECT I.io_dname, D.d_name, I.io_dceo, D.d_ceo
FROM tbl_iolist I -- 먼저 보여줄 테이블
    LEFT JOIN tbl_dept D
        ON I.io_dname = D.d_name AND I.io_dceo = D.d_ceo
WHERE D.d_name IS NULL OR D.d_ceo IS NULL;        
-- 위의 SQL을 실행했을때 리스트가 하나도 없어야 정상적으로 거래처정보 TABLE이 완성된 것이다.


SELECT io_dname FROM tbl_iolist WHERE io_dname IS NULL; -- 거래처명이 누락된 항목이 있는가
SELECT io_dname FROM tbl_iolist WHERE io_dname IS NOT NULL; -- 거래처명이 있는 항목이 있는가


SELECT io_price FROM tbl_iolist WHERE io_price = 0; -- 숫자칼럼이 0인 것은 0이라는 값을 INSERT, UPDATE 실행 한 것
SELECT io_price FROM tbl_iolist WHERE io_price IS NULL; -- 숫자칼럼이 NULL인 것은 처음부터 아예 값을 INSERT하지 않은 것

-- 거래처정보테이블을 SUB QUERY로 조회하여 거래처명, 대표자명을 포함한 조회 SQL작성
-- I.거래처명, I.대표자명, D.거래처코드
SELECT I.io_dname, I.io_dceo,
    (SELECT D.d_code FROM tbl_dept D WHERE D.d_name = I.io_dname and D.d_ceo = I.io_dceo) dceo
FROM tbl_iolist I;


-- 매입매출테이블에 거래처코드를 저장할 칼럼 추가
ALTER TABLE tbl_iolist ADD io_dcode CHAR(5);


-- 거래처정보 테이블에서 상품매입매출 테이블에 있는 거래처명과 대표자명이 일치하는 데이터를 찾아서 그 데이터의 거래처코드를 
-- 상품매입매출 테이블의 거래처코드에 UPDATE
UPDATE tbl_iolist I
SET io_dcode = (SELECT D.d_code FROM tbl_dept D WHERE I.io_dname = D.d_name AND I.io_dceo = D.d_ceo);

SELECT io_dcode, io_dname, io_dceo FROM tbl_iolist; -- update 되었는지 확인