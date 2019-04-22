-- iolist 도서 대여 정보

DELETE FROM tbl_book;

SELECT COUNT(*) FROM tbl_book;

-- 임의로 데이터를 임포트 한 후 새로운 데이터를 어플에서 입력하려고 하면
-- SEQ가 문제가 생길 수 있다. 그래서 기존의 SEQ를 삭제하고 다른 규칙으로 생성
DROP SEQUENCE SEQ_BOOK;

CREATE SEQUENCE SEQ_BOOK
START WITH 300
INCREMENT BY 1;

COMMIT;

SELECT * FROM tbl_user;
