-- 여기는 관리자 화면입니다.
CREATE USER myuser1 IDENTIFIED BY 1111;
-- TABLESPACE를 SYSTEM TABLESPACE로 자동 지정된다
-- 실제 환경에서는 매우 위험한 방법이다.

GRANT CREATE TABLE TO myuser1;
GRANT SELECT, UPDATE, INSERT ON [table] TO myuser1;

CREATE TABLESPACE mytsA 
DATAFILE 'd:bizwork/ordata/mytsa.dbf'
SIZE 100M 
AUTOEXTEND ON NEXT 100K;

-- 사용자 등록을 실행한 후 테이블스페이스를 만들지않고
-- TABLE등을 생성하면 생성된 TABLE들은 SYSTEM TS에 생성되어
-- 나중에 테이블스페이스를 만든 후 옮기려면 많은 문제가 발생한다.
-- 따라서 사용자를 생성하고 테이블을 만들기 전에 테이블스페이스를 반드시 생성하고
-- 사용자의 DEFAULT TABLESPACE를 지정해 주어야한다.

ALTER USER myuser1 DEFAULT TABLESPACE mytsA;

CREATE TABLE EMP_TABLE(
    EMPNO CHAR(6) PRIMARY KEY,--사원번호
    EMPNAME nVARCHAR2(20) NOT NULL, -- 사원명
    EMPBIRTH CHAR(8), -- 생년원일
    DEPTNO CHAR(3) NOT NULL, -- 부서번호
    HREDATE CHAR(10) NOT NULL -- 입사일자
);

INSERT INTO EMP_TABLE VALUES('170001','홍길동','880212','001','2015-12-01');
INSERT INTO EMP_TABLE VALUES('170002','이몽룡','770215','003','2001-03-07');
INSERT INTO EMP_TABLE VALUES('170003','성춘향','820513','003','2004-11-14');
INSERT INTO EMP_TABLE VALUES('170004','장보고','941102','004','2018-05-20');
INSERT INTO EMP_TABLE VALUES('170005','임꺽정','801212','001','2008-07-25');

SELECT * FROM EMP_TABLE;

UPDATE emp_table SET hredate = '2018-03-01' WHERE empname = '장보고';
-- 위 SQL은 현재 데이터상으로는 문제가 없어보이나
-- 데이터가 많아질 경우 이름이 장보고인 사원이 중복되지 않는다는 보장이 없다.
-- 따라서 사원의 이름을 조건으로 변경을 시도하는것은 데이터무결성을 해치는 매우 위험한 방법이다.
-- 1. 업데이트를 하기전에 변경하고자하는 정보를 조회해야한다.
SELECT * FROM emp_table WHERE empname ='장보고'; -- 기타 여러 조건을 조합해서 검색
-- 2. 조회된 데이터 중에서 변경하고자 하는 데이터의 PK를 입수한다.
    -- 여기에서 조회된 PK : 170004
-- 3. 조회된 PK를 이용해서 데이터 변경을 시도한다.
UPDATE emp_table SET hredate = '2018-03-01' WHERE empno = '170004';

