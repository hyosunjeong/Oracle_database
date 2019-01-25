-- 이 화면은 bbsUSER 화면입니다.

-- 게시판 프로젝트 1에서 사용할 메인 table을 생성
CREATE TABLE tbl_bbs_main(
    b_id NUMBER PRIMARY KEY, -- ID키
    b_date CHAR(10) not null, -- 작성일자
    b_auth nVARCHAR2(20) NOT NULL, -- 작성자
    b_subject nVARCHAR2(5) NOT NULL, -- 제목
    b_text nVARCHAR2(255) NOT NULL -- 내용
);

-- tbl_bbs_main에서 사용할 SEQ를 생성
CREATE SEQUENCE SEQ_BBS_MAIN
START WITH 1
INCREMENT BY 1;

INSERT INTO tbl_bbs_main
VALUES(SEQ_BBS_MAIN.NEXTVAL,'2018-12-28','홍길동','게시판시작','오늘은 자바를 이용해서 게시판을 만든다.');

INSERT INTO tbl_bbs_main
VALUES(SEQ_BBS_MAIN.NEXTVAL,'2018-12-28','이몽룡','게시판시작','오늘은 자바를 이용해서 게시판을 만든다.');

INSERT INTO tbl_bbs_main
VALUES(SEQ_BBS_MAIN.NEXTVAL,'2018-12-28','성춘향','게시판시작','오늘은 자바를 이용해서 게시판을 만든다.');

INSERT INTO tbl_bbs_main
VALUES(SEQ_BBS_MAIN.NEXTVAL,'2018-12-28','홍길동','게시판시작','오늘은 자바를 이용해서 게시판을 만든다.');

INSERT INTO tbl_bbs_main
VALUES(SEQ_BBS_MAIN.NEXTVAL,'2018-12-28','장보고','게시판시작','오늘은 자바를 이용해서 게시판을 만든다.');

COMMIT;
