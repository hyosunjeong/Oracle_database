-- 여기는 BBS 사용자 화면입니다.

SELECT * FROM TBL_BBS_MAIN;

INSERT INTO TBL_BBS_MAIN 
VALUES(SEQ_BBS_MAIN.NEXTVAL,
    '2019-01-02',
    '홍길동',
    '기해년 새해',
    '새해 복 많이 받으세요');
    
-- DCL명령중에 COMMIT과 ROLLBACK명령이 있는데 현재 위에서 실행한 INSERT문으로 데이터를 추가 했는데
-- 아직은 메모리상에 데이터가 존재하고, 실제적으로 물리적 DB에는 저장이 안된 상태이다.
-- 그래서 현재 화면이 아닌 다른 곳(JAVA 등)에서 DB에 연결해서 데이터를 조회하면 데이터가 보이지 않는다.

-- COMMIT명령
-- 현재 메모리에 있는 데이터를 물리적 DB에 저장하도록 하는 명령
COMMIT;

-- ROLLBACK 명령
-- 데이터를 INSERT, UPDATE, DELETE를 수행한 다음에 해당되는 명령을 취소하고자 할 때 사용하는 명령

-- SQLDeveloper와 JAVA를 동시에 연동해서 테스트를 할 때는 SQL에서 데이터를 추가, 변경, 삭제 한 후에는 COMMIT을 해준다.

DESC tbl_bbs_main;