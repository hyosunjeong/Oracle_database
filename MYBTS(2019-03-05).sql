-- mybats 접속화면
DESC tbl_memo;

DESC tbl_member;

-- tbl_memo 데이터 삭제
DELETE tbl_memo;

-- SEQ 삭제 후 재생성
DROP SEQUENCE SEQ_MEMO;
CREATE SEQUENCE SEQ_MEMO
START WITH 1 INCREMENT BY 1;