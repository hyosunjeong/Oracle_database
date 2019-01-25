-- 여기는 관리자 화면입니다.

-- 새로운 테이블스페이스 생성
-- TS: myIOTs
-- datafile : myIOTS.dbf
CREATE TABLESPACE myIOTs
DATAFILE 'd:/bizwork/ordata/myIOTS.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M;

-- 새로운 사용자 생성
CREATE USER myIOUser IDENTIFIED BY 1234
DEFAULT TABLESPACE myIOTS;

GRANT DBA to myiouser; -- 권한 부여

-- SQLD에 접속 정보 설정
-- 왼쪽 접속화면 +(새로만들기)접속이름,사용자이름,비밀번호 설정 하고 테스트 후 접속 누르기



