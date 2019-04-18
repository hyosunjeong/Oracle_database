-- mybts접속화면

DESC tbl_memo;

 SELECT * FROM tbl_memo;
 
 DROP SEQUENCE SEQ_MEMO;
 
 CREATE SEQUENCE SEQ_MEMO
 START WITH 1
 INCREMENT BY 1;
 
 -- 파일 업로드를 위한 파일정보를 저장 할 테이블
 CREATE TABLE tbl_files(
    id           NUMBER PRIMARY KEY,
    parent_id    NUMBER NOT NULL, 
    file_name    nVARCHAR2(125),
    save_file_name nVARCHAR2(125)
);
 
 CREATE SEQUENCE SEQ_FILE
 START WITH 1
 INCREMENT BY 1;
 
 -- tbl_files 테이블과 tbl_memo 테이블을 서로 Relation
 -- memo_files라는 이름으로 FOREIGN KEY를 설정하라
 ALTER TABLE tbl_files -- KEY 이름
 ADD FOREIGN KEY (parent_id) -- 칼럼이름
 REFERENCES tbl_memo(id) -- 참조대상
 ON DELETE CASCADE;-- 삭제조건
 
 ALTER TABLE tbl_files
 DROP CONSTRAINT memo_files;