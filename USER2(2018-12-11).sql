--여기는 user2 화면입니다.

CREATE TABLE tbl_users(
    str_userid CHAR(12) PRIMARY KEY,
    str_name nVARCHAR2(50) NOT NULL,
    str_tel VARCHAR2(15),
    str_addr nVARCHAR2(50)
);

INSERT INTO tbl_users VALUES ('001','홍길동','010-1111-1111','광주광역시');
INSERT INTO tbl_users VALUES ('002','이몽룡','010-2222-2222','인천광역시');
INSERT INTO tbl_users VALUES ('003','성춘향','010-3333-3333','부산광역시');
INSERT INTO tbl_users VALUES ('004','장보고','010-4444-4444','대구광역시');
INSERT INTO tbl_users VALUES ('005','장길산','010-5555-5555','대전광역시');

SELECT * FROM tbl_users;


-- 현재 작성된 tbl_users 테이블에 str_userid를 12자리로
-- 설정을 했는데 입력을 하다 보니 너무 많이 자리를 차지한다.
-- 그래서 현재 입력중인 id 개수인 3개로 크기를 바꿔 보려고 한다.
-- 이미 생성된 테이블의 칼럼 형식을 변경
-- DDL 명령중 ALTER명령을 사용한다.
ALTER TABLE tbl_users MODIFY str_userid CHAR(6);
ALTER TABLE tbl_users MODIFY str_name nVARCHAR2(5);
-- CHAR형 데이터는 보이는 데이터와 달리 실제 크기만큼 
-- 공백등으로 이미 채워져있으므로 크기를 줄일 수 없다.
-- (n)VARCHAR2형 데이터는 보이는 데이터 중 가장 길이가 긴 데이터 만큼 크기를 줄일 수 있다.

-- INSERT를 실행할 때 전체칼럼이 아닌 특정칼럼만 값이 있는 경우
INSERT INTO tbl_users (str_userid, str_name) VALUES('006','임꺽정');  

-- INSERT를 실행할 때 데이터의 위치(순서)를 바꾸고자 할때는
-- TABLE(칼럼리스트)의 칼럼리스트 순서를 바꾸면 된다.
-- INSERT INTO tbl_users (str_name, str_userid) VALUES('오바마','007');  

INSERT INTO tbl_users (str_userid, str_name) VALUES('007','오바마');  
INSERT INTO tbl_users (str_userid, str_name) VALUES('008','트럼프');  
INSERT INTO tbl_users (str_userid, str_name) VALUES('009','해리포터');  
INSERT INTO tbl_users (str_userid, str_name) VALUES('010','슈퍼맨');  

SELECT * FROM tbl_users;
-- SELECT str_userid, str_name, str_tel, str_addr FROM tbl_users;

SELECT str_name, str_tel FROM tbl_users;

-- SELECT를 실행할 때 특정한 칼럼들만 나열해서 보고자 할 때
-- 칼럼리스트 : Projection



SELECT * FROM tbl_users WHERE str_name = '홍길동';

SELECT * FROM tbl_users WHERE str_addr = '광주광역시' AND str_name = '홍길동';

-- tbl_users테이블에서 id가 003부터 006까지 데이터만 추출
SELECT * FROM tbl_users WHERE str_userid >= '003' AND str_userid<='006';

SELECT * FROM tbl_users WHERE str_userid BETWEEN '003' AND '006';


SELECT * FROM tbl_users;

-- SQL의 통계함수
-- 현재 tbl_users에 저장된 데이터 개수가 몇개인가?
-- SUM, COUNT,  AVG,  MIN, MAX 
-- 칼럼을 감싸는 함수
SELECT COUNT(*) FROM tbl_users;
SELECT MIN(str_userid) FROM tbl_users;
SELECT MAX(str_userid) FROM tbl_users;

SELECT COUNT (*) AS 개수,
    MIN(str_userid) AS 작은값,
    MAX(str_userid) AS 큰값
FROM tbl_users;    

















