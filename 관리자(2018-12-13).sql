 -- 여기는 관리자 화면입니다.
 CREATE USER myuser IDENTIFIED BY 1234; -- 사용자 생성
-- 아직 tablespace를 생성하기 전에
-- 사용자를 먼저 등록하다 보니
-- DEFAULT TABLESPACE를 지정하지 않았다.
-- 이럴경우 DEFAULT TABLESPACE는 SYSTEM 설정 값으로 지정되는데,
-- 이것은 실무에서 매우 위험한 방법이다.

 CREATE USER myuser IDENTIFIED BY 1234
 DEFAULT TABLESPACE ....;
 
 GRANT DBA TO myuser; --권한부여
 
 CREATE TABLESPACE mytbl
 DATAFILE 'd:/bizwork/ordata/mytbl.dbf'
 SIZE 100M
 AUTOEXTEND ON NEXT 1M;
 
 -- myuser 사용자에게 TABLESPACE를 적용하지 않았다.
 -- 이제 새로운 tablespace를 생성했으므로
 -- myuser에게 defaulft tablespace를 지정하겠다.
 ALTER USER myuser DEFAULT TABLESPACE myTBL;
 
 
 
 