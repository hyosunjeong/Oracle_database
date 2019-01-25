-- 여기는 myBTs로 접속한 화면입니다.

-- mySQL
SHOW TABLES;

-- Oracle
SELECT * FROM DBA_TABLES;
-- myBTS가 생성한 TABLE을 보여달라
SELECT * FROM DBA_TABLES WHERE OWNER = 'MYBTS';

-- 테이블의 구조를 보고싶다. 어떻게 CREATE 되었는지 확인
DESC tbl_student;
DESC tbl_score;

-- 시퀀스를 확인
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_SEQUENCES;

-- 시퀀스 증가 시키기
SELECT SEQ_SCORE.NEXTVAL FROM DUAL;

SELECT* FROM tbl_score;


DELETE FROM tbl_score;

-- ID값은 PK로 설정된 경우 다른 TABLE과 JOIN을 할 때 Key로 사용되는 경우가 있다. 
-- 그래서 만약 데이터를 삭제하고 새로운 데이터를 추가 할 때는 기존에 사용하던 id값은 사용하지 않는다.
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','001',80 );
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','002',70 );
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','003',60 );
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','004',50 );
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','005',90 );

select * from tbl_score;



-- 만약 view를 생성하여 java와 연동하여 사용할 경우
-- 각 AS 칼럼들의 이름을 vo의 맴버변수로 선언해야 하는데
-- 한글로 작성할 경우 member변수를 한글로 작성해야한다.
-- 실무에서는 한글사용을 지양하는 관계로 가급적 영문으로 작성한다.
CREATE VIEW view_score_sum
AS
select st_num,
    SUM(DECODE(sc_sb_code,'001',sc_score,0)) AS ss_kor,
    SUM(DECODE(sc_sb_code,'002',sc_score,0)) AS ss_eng,
    SUM(DECODE(sc_sb_code,'003',sc_score,0)) AS ss_math,
    SUM(DECODE(sc_sb_code,'004',sc_score,0)) AS ss_sci,
    SUM(DECODE(sc_sb_code,'005',sc_score,0)) AS ss_music
FROM tbl_score
GROUP BY st_num;


SELECT * FROM view_score_sum;

SELECT * FROM tbl_student;
SELECT * FROM tbl_score;



