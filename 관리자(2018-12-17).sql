-- 여기는 관리자 화면입니다.

-- TABLESPACE를 하나 생성한다
-- tableSpace명: myTBL1
-- dataFile : d:/bizwork/ordata/mytbl_1.dbf
-- 초기 크기 : 100MByte
-- 자동확장 1M씩
CREATE TABLESPACE myTBL1
DATAFILE 'D:/bizwork/ordata/mytbl_1.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M;

CREATE USER myMem IDENTIFIED BY 1234
DEFAULT TABLESPACE myTBL1;

GRANT DBA to myMem;
