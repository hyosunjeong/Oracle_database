-- 여기는 myBTS로 접속한 화면입니다.
CREATE TABLE tbl_student(
    st_num  VARCHAR2(5)  PRIMARY KEY, -- CHAR >> VARCHAR2
    st_name nVARCHAR2(20)   NOT NULL,
    st_grade    CHAR(2),
    st_tel nVARCHAR2(20)
);


DROP TABLE tbl_score;

CREATE TABLE tbl_score(
    id NUMBER PRIMARY KEY,
    st_num VARCHAR2(5) NOT NULL, -- CHAR >> VARCHAR2
    sc_sb_code VARCHAR2(3) NOT NULL, -- CHAR >> VARCHAR2
    sc_score NUMBER
);


-- 점수테이블(tbl_score)에 데이터를 추가할 때 학번(st_num)과 과목번호(sc_sb_code)가 중복되는 현상이 발생할 수 있다.
-- 예)00001학번의 001과목이 2개 이상 중복되어 입력될 수 있다.
-- 이 중복 입력이 안되도록 테이블 설계를 다시 실행한다.
-- 제약사항(CONSTRAINT) 추가

CREATE TABLE tbl_score(
    id NUMBER PRIMARY KEY,
    st_num VARCHAR2(5) NOT NULL,
    sc_sb_code VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3),
    CONSTRAINT un_num_sb_code UNIQUE(st_num,sc_sb_code)
);

INSERT INTO tbl_score
VALUES(SEQ_SCORE.NEXTVAL,'00001','001',80);

INSERT INTO tbl_score
VALUES(SEQ_SCORE.NEXTVAL,'00001','002',80);

INSERT INTO tbl_score
VALUES(SEQ_SCORE.NEXTVAL,'00001','003',80);

-- 다수의 칼럼을 묶어서 PK로 선언
-- 별로 권장하지 않는 방법이다.
-- 실제 위의 INSERT 명령을 실행하면 id값이 계속 변경되어서
-- 실행이 되므로 아래 PRIMARY KEY 제약조건은 무의미해진다.
CREATE TABLE tbl_score(
    id NUMBER,
    st_num VARCHAR2(5) NOT NULL,
    sc_sb_code VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3),
    CONSTRAINT PK_num_sb_code PRIMARY KEY(id,st_num,sc_sb_code)
);

-- 기존에 생성되어있는 KEY를 삭제하는 방법
ALTER TABLE tbl_score
DROP CONSTRAINT un_num_sb_code;
-- 이미 생성되어 있는 key를 변경하는 방법은 없다.

ALTER TABLE tbl_score
DROP CONSTRAINT PK_num_sb_code;

-- 이미 생성된 테이블에 제약 조건을 추가하는 방법
ALTER TABLE tbl_score
ADD CONSTRAINT un_num_sb_code UNIQUE(st_num,sc_sb_code);

-- 인덱스 생성
CREATE INDEX idx_score_num ON tbl_score(st_num);

-- 인덱스 : 검색(SELECT)할 때 주로 사용하는 칼럼의 경우
-- 검색의 속도를 높이기 위해서 별도로 그 칼럼 정보만 하나의 클래스로 등록해 두는 것
-- 만약 
SELECT * FROM tbl_score WHERE st_num = '00001';
-- 이렇게 명령을 수행하면
-- DB는 먼저 idx_score_num에서 해당 칼럼을 조회하고
-- 거기에서 얻어진 정보를 바탕으로 
-- tbl_score 에서 데이터를 가져온다.

-- index를 사용하면 검색할 때는 매우 빨리 데이터를 찾을 수 있다.
-- 데이터가 많아지면 많아질수록 효과가 더 커진다.
-- 하지만 st_num값이 변경이 자주 일어나거나 초기에 많은 양의 데이터를 추가할 때는 
-- 오히려 속도가 떨어진다.

-- 실무에서는 초기에 많은 양의 데이터를 추가할 때 인덱스를 만들지 않고 사용하다가
-- 데이터 추가가 거의(모두)끝나면 인덱스를 만들어 사용한다.

-- 데이터의 변경, 추가 등이 빈번히 발생하면 index(파일)이 손상되는 경우도 발생한다.
-- 그럴때는 인덱스를 삭제하고, 다시 만들어 주어야한다.
DROP INDEX idx_score_num;








