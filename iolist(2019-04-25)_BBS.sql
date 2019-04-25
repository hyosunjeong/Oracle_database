-- iolist 접속화면

-- tbl_bbs : BBS 게시판 데이터를 저장 TABLE과
-- tbl_comment :댓글을 저장할 테이블 생성
-- tbl_bbs와 tbl_comment는 1:N의 관계 구성
-- CONTRAT(FK)는 생량

CREATE TABLE tbl_bbs(
    id NUMBER PRIMARY KEY,
    b_auth nVARCHAR2(125) NOT NULL,
    b_date VARCHAR2(10),
    b_time VARCHAR2(10),
    b_subject nVARCHAR2(125),
    b_text nVARCHAR2(1000)
);


CREATE SEQUENCE SEQ_BBS
START WITH 1
INCREMENT BY 1;

CREATE TABLE tbl_comment(
    id NUMBER PRIMARY KEY,
    b_id NUMBER NOT NULL, -- tbl_bbs와 연결하는 FK 역할을 함
    c_auth nVARCHAR2(125) NOT NULL,
    c_date VARCHAR2(10),
    c_time VARCHAR2(10),
    c_text nVARCHAR2(1000)
);

CREATE SEQUENCE SEQ_COMMENT
START WITH 1
INCREMENT BY 1;

