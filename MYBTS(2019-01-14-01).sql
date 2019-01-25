-- 여기는 myBTS접속 화면입니다.
DROP TABLE tbl_score;

-- FOREIGN KEY 설정
-- 만약 tbl_score 테이블에 데이터를 입력하는데
-- tbl_student테이블에 st_num와 일치하지 않는 값을
-- 입력하면 오류가 발생해서 잘못 입력되는 데이터가 없도록 설정 하는 것
-- => 참조 무결성 보장
CREATE TABLE tbl_score(
    id NUMBER PRIMARY KEY,
    st_num VARCHAR2(5) NOT NULL,
    sc_sb_code VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3),
    CONSTRAINT FK_st_num FOREIGN KEY(st_num)
    REFERENCES tbl_student(st_num)
);

-- 초기에 대량의 데이터를 입력하려고 하는데 FK가 설정되어 있으면
-- tbl_student 데이터가 모두 완성되기 전까지
-- tbl_score 데이터를 추가할 수 없게 된다.
-- 따라서 초기에는 일단 FK를 제거 또는 만들지 않고
-- 데이터를 입력하고 데이터가 거의 완성되면 FK를 설정하는 것이 좋다.
ALTER TABLE tbl_score
DROP CONSTRAINT FK_ST_NUM;

ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num FOREIGN KEY(st_num)
REFERENCES tbl_student(st_num);

-- 만약 데이터를 모두 입력한 후 FK를 선언(추가)하는데 오류가 발생하면 tbl_score에 잘못된 st_num가 존재한다는 것이다.
-- 이럴때는 JOIN을 통해서 데이터를 확인해야 한다.
SELECT SC.st_num, ST.st_num, ST.st_name
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.st_num = ST.st_num
WHERE ST.st_num = '';


SELECT * FROM tbl_student;

INSERT INTO tbl_score VALUES(SEQ_SCORE.NEXTVAL,'00001','001',100);

-- 점수 데이터를 추가하려고 하는데
-- tbl_student에는 없는 001 학번을 추가하려고 하니 오류가 발생한다.
INSERT INTO tbl_score VALUES(SEQ_SCORE.NEXTVAL,'001','001',100);


INSERT INTO tbl_score VALUES(SEQ_SCORE.NEXTVAL,'00002','001',90);

SELECT SC.st_num, ST.st_name, SC.sc_sb_code, sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.st_num = ST.st_num;

SELECT * FROM tbl_student;
DELETE FROM tbl_student WHERE st_num = '00003';
-- 학번 00003은 아직 tbl_score에 입력된 데이터가 없어서 tbl_student에서 삭제가 가능하지만
-- 학번 00002는 이미 tbl_score에 입력된 데이터가 있기 때문에
-- tbl_student에서 삭제가 불가능하다.
DELETE FROM tbl_student WHERE st_num = '00002';

-- 결국 이 두 테이블은 st_num를 기준으로
-- JOIN 등을 실행 했을 때
-- 참조 관계가 명확해져서 완전 JOIN을 실행해도 문제가 없게 되었다.

ALTER TABLE tbl_score
DROP CONSTRAINT FK_st_num;

-- 만약 tbl_student 테이블의 데이터를 삭제하는데
-- tbl_score에 st_num 가 일치하는데 데이터들이 있으면
-- 같이(모두)삭제해라
ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num
FOREIGN KEY(st_num)
REFERENCES tbl_student(st_num)
ON DELETE CASCADE;


-- tbl_student의 데이터를 삭제하는데 
-- tbl_score에 st_num가 일치하는 데이터가 있으면 
-- st_num을 null로 바꾸어라
ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num
FOREIGN KEY(st_num)
REFERENCES tbl_student(st_num)
ON DELETE SET NULL; --처음 테이블을 만들 때 NOT NULL로 했기 때문에 의미없는 코드이다.




SELECT * FROM tbl_score;
DELETE FROM tbl_student WHERE st_num = '00002';





