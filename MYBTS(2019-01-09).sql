-- 여기는 MYBTS로 접속한 화면입니다.

-- 새로운 테이블을 생성
CREATE TABLE tbl_student(
    st_num  VARCHAR2(5)  PRIMARY KEY, -- CHAR >> VARCHAR2
    st_name nVARCHAR2(20)   NOT NULL,
    st_grade    CHAR(2),
    st_tel nVARCHAR2(20)
);
-- tbl_student 테이블의 st_num 칼럼을 VARCHAR2로 변경
ALTER TABLE tbl_student MODIFY st_num VARCHAR2(5);

CREATE TABLE tbl_score(
    id NUMBER PRIMARY KEY,
    st_num VARCHAR2(5) NOT NULL, -- CHAR >> VARCHAR2
    sc_sb_code VARCHAR2(3) NOT NULL, -- CHAR >> VARCHAR2
    sc_score NUMBER
);
-- tbl_score 테이블의 st_num 칼럼을 VARCHAR2로 변경
ALTER TABLE tbl_score MODIFY st_num VARCHAR2(5);

-- tbl_score 테이블의 sc_sb_code 칼럼을 VARCHAR2로 변경
ALTER TABLE tbl_score MODIFY sc_sb_code VARCHAR2(5);

DROP TABLE tbl_student;

INSERT INTO tbl_student(st_num,st_name,st_grade,st_tel) VALUES('00001','홍길동','1','0010010001');
INSERT INTO tbl_student VALUES('00002','001-001-0001','1','이몽룡');

-- 칼럼명을 붙여줌으로써 칼럼명에 맞게 데이터가 들어갈 수 있도록 해준다.
INSERT INTO tbl_student(st_name,st_num,st_grade,st_tel)VALUES('성춘향','00002','2','0020020002');

SELECT * FROM tbl_student;

-- 데이터를 확인했더니 이몽룡 데이터가 잘못 입력된것을 확인했다. 
-- 이몽룡데이터에 st_name칼럼을 이몽룡으로 바꾸고  st_tel 칼럼을 001-001-0001로 바꾸려고 한다.
-- => 현재 st_name칼럼의 값이 001-001-0001인데 이몽룡으로 바꾸고자 한다.
UPDATE tbl_student
SET st_name ='이몽룡', st_tel = '001-001-0001'
WHERE st_num ='00002';

SELECT * FROM tbl_student;

INSERT INTO tbl_student(st_num,st_name,st_grade,st_tel)
VALUES('00004','홍길동','1','001-001-0001');
SELECT * FROM tbl_student;

-- 입력된 데이터에 홍길동이 2개가 중복되에 입력되어 있다.
-- 이 때 두번째 입력된 홍길동을 삭제하고자 한다.
-- 1. 중복된 데이터가 또 있는지 확인을 한다.
    -- 홍길동 데이터가 또 있는지 먼저 확인하자
SELECT * FROM tbl_student WHERE st_name = '홍길동';    
-- 2. 삭제하고자 하는 데이터의 PK를 확인한다.
-- 여기에서는 두번째 데이터의 PK가 00004임을 확인했다.ㅣ
DELETE FROM tbl_student WHERE st_num = '00004';

-- SELECT
-- FROM

-- INSERT
-- INTO
-- VALUES

-- UPDATE
-- SET
-- WHERE

-- DELETE
-- FROM
-- WHERE


DROP TABLE tbl_score;


CREATE TABLE tbl_score(
    id NUMBER PRIMARY KEY,
    st_num CHAR(5) NOT NULL,
    sc_sb_code CHAR(3) NOT NULL,
    sc_score NUMBER
);

--기존 테이블 구조 변경
ALTER TABLE tbl_score MODIFY st_num CHAR(5);

CREATE SEQUENCE SEQ_SCORE START WITH 1 INCREMENT BY 1;

INSERT INTO tbl_score(id,st_num,st_sb_code,st_score) VALUES (SEQ_SCORE.NEXTVAL, '00001','001',90);

SELECT * FROM tbl_score;

INSERT INTO tbl_score(id,st_num,st_sb_code,st_score) VALUES (SEQ_SCORE.NEXTVAL, '00001','001',90);
INSERT INTO tbl_score(id,st_num,st_sb_code,st_score) VALUES (SEQ_SCORE.NEXTVAL, '00001','001',90);
INSERT INTO tbl_score(id,st_num,st_sb_code,st_score) VALUES (SEQ_SCORE.NEXTVAL, '00001','001',90);
commit;