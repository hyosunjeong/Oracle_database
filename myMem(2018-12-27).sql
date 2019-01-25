-- 여기는 myMem사용자 화면입니다.

DROP TABLE tbl_score;

CREATE TABLE tbl_score(
    g_id	    NUMBER		PRIMARY KEY,
    g_stname	nVARCHAR2(50)	NOT NULL,	
    g_subject	nVARCHAR2(10)	NOT NULL,	
    g_score	    NUMBER		
);

SELECT COUNT(*) FROM tbl_score;

-- SQL에서 SELECT는 for 명령과 거의 유사하다.
-- SUM 함수는 반드시 숫자형 칼럼만 매개변수로 사용할 수 있다.
-- 함수() = method()
-- 키워드 = 명령어

-- SQL에서 함수는 거의 모두가 매개변수를 반드시 필요로 한다.

SELECT SUM(g_score) FROM tbl_score; -- 전체리스트의 점수 칼럼의 총 합계를 구하라

SELECT g_stname, SUM(g_score)FROM tbl_score GROUP BY g_stname; -- 각 학생별로 성적 총점을 계산
                                                                -- 학생별로=> 학생을 구분하는 칼럼(g_stname)을 그룹으로 묶어라
SELECT g_stname, SUM(g_score)FROM tbl_score GROUP BY g_stname ORDER BY g_stname; --이름순으로 정렬  

-- 학생별로 점수를 한줄에 나열하는 SQL을 작성
-- 이름   국어  영어  수학  ...
-- 1. 학생별 = 학생이름 칼럼을 그룹으로 묶어라
SELECT g_stname FROM tbl_score GROUP BY g_stname;

-- 2. 점수를 한줄에 나열
SELECT g_stname, 국어, 영어, 수학, 과학, 역사 FROM tbl_score GROUP BY g_stname;
-- 위의 SQL에서 국어, 영어, 수학 등 점수의 칼럼은 실제로 tbl_score에 없다.
-- 때문에 어디에선가 점수를 계산해서 변수(칼럼)에 저장하는 부분이 필요하다.
-- 점수를 계산하는 코드를 오라클의 함수를 이용해서 작성한다.
SELECT g_subject, DECODE(g_subject,'국어',100,0) FROM tbl_score WHERE ROWNUM < 10;

-- DECODE 함수는 IF문과 같다. 
-- g_subject에 들어있는 값이 국어이면 100 아니면 0이라고 표시해라 
SELECT g_subject, 
    DECODE(g_subject,'국어',g_score,0) AS 국어, -- g_subject의 값이 국어이면 g_score값을 입력하고 아니면 0으로 표시 (AS 국어 =>칼럼명은 국어 )
    DECODE(g_subject,'수학',g_score,0) AS 수학,
    DECODE(g_subject,'영어',g_score,0) AS 영어,
    DECODE(g_subject,'과학',g_score,0) AS 과학,
    DECODE(g_subject,'미술',g_score,0) AS 미술,
    DECODE(g_subject,'국사',g_score,0) AS 국사    
FROM tbl_score 
WHERE ROWNUM < 20; -- 행번호20번까지만 출력해라

SELECT g_stname, 
    SUM(DECODE(g_subject,'국어',g_score,0)) AS 국어, 
    SUM(DECODE(g_subject,'수학',g_score,0)) AS 수학,
    SUM(DECODE(g_subject,'영어',g_score,0)) AS 영어,
    SUM(DECODE(g_subject,'과학',g_score,0)) AS 과학,
    SUM(DECODE(g_subject,'미술',g_score,0)) AS 미술,
    SUM(DECODE(g_subject,'국사',g_score,0)) AS 국사    
FROM tbl_score 
GROUP BY g_stname; 


CREATE VIEW 성적일람표
AS 
SELECT g_stname, 
    SUM(DECODE(g_subject,'국어',g_score,0)) AS 국어, 
    SUM(DECODE(g_subject,'수학',g_score,0)) AS 수학,
    SUM(DECODE(g_subject,'영어',g_score,0)) AS 영어,
    SUM(DECODE(g_subject,'과학',g_score,0)) AS 과학,
    SUM(DECODE(g_subject,'미술',g_score,0)) AS 미술,
    SUM(DECODE(g_subject,'국사',g_score,0)) AS 국사    
FROM tbl_score 
GROUP BY g_stname; 

SELECT * FROM 성적일람표;

SELECT *  FROM tbl_iolist where rownum < 10;


SELECT * 
FROM tbl_iolist I
    LEFT JOIN tbl_dept D    
        ON I.io_dcode = D.d_code;

-- 이 SQL은 거래처별로 단순히 거래금액을 합산한 결과이다.        
-- 거래처별로 거래금액이 얼마인가 알고싶다.
-- 거래처별로 매입금액과 매출금액이 얼마인지 알고 싶다.
SELECT I.io_dcode, D.d_name, D.d_ceo,
    SUM(DECODE(I.io_inout,'매입', I.io_price * I.io_quan,0)) 매입금액,
    SUM(DECODE(I.io_inout,'매출', I.io_price * I.io_quan,0)) 매출금액
FROM tbl_iolist I
    LEFT JOIN tbl_dept D    
        ON I.io_dcode = D.d_code
GROUP BY I.io_dcode, D.d_name, D.d_ceo;        


-- 1. 학생이름을 그룹으로 묶어 리스트를 조회
-- 2. 조회된 리스트를 엑셀 sheet에 복사
-- 3. 학번칼럼을 추가
-- 4. S0001부터 일련번호로 학번부여
-- 5. 학생정보 테이블 생성 : tbl_student
-- 6. 학생정보 import
SELECT g_stname FROM tbl_score GROUP BY g_stname; -- 1. 학생이름을 그룹으로 묶어 리스트 조회

CREATE TABLE tbl_student(
    st_num	CHAR(5)		PRIMARY KEY,
    st_name	nVARCHAR2(50)	NOT NULL	
);
SELECT COUNT(*) FROM tbl_student;

-- LEFT JOIN을 이용해서 tbl_score 테이블과 tbl_student 테이블이 학생명이 일치하는지 확인
SELECT SC.g_stname, ST.st_name
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stname = ST.st_name;


-- 1. tbl_score 테이블에 g_stnum 칼럼을 추가 (g_stnum CHAR(5))
-- 2. tbl_score 테이블의 학생이름을 tbl_student에서 찾고, 해당 학생의 학번을 tbl_score 테이블 g_stnum에 update

ALTER TABLE tbl_score add g_stnum CHAR(5); --1

UPDATE tbl_score SC
SET SC.g_stnum = ( SELECT ST.st_num FROM tbl_student ST WHERE sc.g_stname = ST.st_name); --2

-- 업데이트 후 검증 1번째 방법
SELECT SC.g_stnum, ST.st_name, SC.g_stname
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stnum = ST.st_num;
        
-- 업데이트 후 검증 2번째 방법
SELECT SC.g_stnum, ST.st_name, SC.g_stname
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stnum = ST.st_num
WHERE ST.st_name IS NULL;


-- tbl_score로부터 학생이름 칼럼 삭제
ALTER TABLE tbl_score DROP COLUMN g_stname;

-- 삭제 후 검증
SELECT SC.g_stnum, ST.st_name
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stnum = ST.st_num;
        
        
CREATE TABLE tbl_subject(
    sb_code	CHAR(5)		PRIMARY KEY,
    sb_name	nVARCHAR2(50)	NOT NULL	
);
        
INSERT INTO tbl_subject VALUES('B0001','국어');
INSERT INTO tbl_subject VALUES('B0002','영어');
INSERT INTO tbl_subject VALUES('B0003','수학');
INSERT INTO tbl_subject VALUES('B0004','과학');
INSERT INTO tbl_subject VALUES('B0005','국사');
INSERT INTO tbl_subject VALUES('B0006','미술');

select * from tbl_subject;

-- 과목명을 정규화하기 위해 과목코드 칼럼을 tbl_score에 추가
ALTER TABLE tbl_score ADD g_sbcode CHAR(5);

UPDATE tbl_score SC
SET g_sbcode = ( SELECT sb_code FROM tbl_subject SB WHERE SC.g_subject = SB.sb_name);
        
-- 업데이트 후 검증
SELECT SC.g_sbcode, SB.sb_code, SC.g_subject, SB.sb_name
FROM tbl_score SC
    LEFT JOIN tbl_subject SB
        ON SC.g_sbcode = SB.sb_code
WHERE SB.sb_name IS NULL;        

