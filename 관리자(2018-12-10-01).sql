-- 여기는 관리자 화면입니다.
-- 새로운 사용자 등록
-- 일단 기존 사용자 user2를 삭제
DROP USER user2 CASCADE; -- user2가 활동했던 모든 정보를 삭제

-- 다시 user2를 생성
CREATE USER user2 IDENTIFIED BY 1234
DEFAULT TABLESPACE myTs;


-- user2에게 CRUD권한을 부여
-- CRUD권한을 부여하려면 먼저 테이블이 생성 되어 있어야 한다.

-- 1. 개별적 권한 부여
GRANT SELECT ON tbl_test TO user2;
GRANT INSERT ON tbl_test TO user2;

-- 2. CRUD 일괄 권한 부여
GRANT SELECT, INSERT, UPDATE, DELETE ON tbl_test TO user2;

-- 현재 여기까지 user2를 생성하고, CRUD권한을 부여했지만
-- 아직 접속권한을 부여하지 않았다.
-- CONECT 접속권한은 DB버전에 따라 권한 정도가 매우 다르다.
-- 11gEx에서는 상당히 높은 권한이 된다.
-- 따라서 CONNECT 권한은 일반적인경우 사용하지 않고

GRANT CONNECT TO user2;

-- 접속권한을 부여하기 위해서는
-- CREATE SESSION 권한을 부여한다.
GRANT CREATE SESSION TO user2;
--REVOKE CREATE TABLE FROM user2;
GRANT CREATE TABLE TO user2;

-- user2가 사용할 TABLESPACE를 하나 생성
CREATE TABLESPACE myTs -- myTs라는 이름으로 DB저장 공간 설정
DATAFILE 'D:/bizwork/ordata/myTs.dbf' -- 실제 저장위치와 파일
SIZE 100M -- 최초 확보할 용량
AUTOEXTEND ON NEXT 1M -- 용량이 부족하면 1씩 용량증가
MAXSIZE UNLIMITED; -- 최대용량 제한 없음

-- TABLESPACE를 삭제하고, 모든 정보를 제거하라
DROP TABLESPACE myTs
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;


DEFAULT TABLESPACE 








