-- 여기는 myMem사용자로 접속한 화면입니다.

-- 오라클에서 $표시가 있는 table들을 system dictionary이라고 한다.
-- SYS DIC라고 약칭하며 이 table은 시스템의 정보를 담고있는 중요한 table들이다.
-- 원래 SYS DIC들은 관리자로 접속했을때 확인할 수 있는 table인데
-- myMem사용자에게 DBA권한을 부여했기 때문에 확인이 가능하다. 
SELECT * FROM v$datafile;
SELECT NAME FROM v$datafile;


SELECT * FROM dba_tablespaces;

SELECT * FROM dba_data_files;

SELECT * FROM v$controlfile;

SELECT * FROM dba_users;

SELECT * FROM DBA_TAB_PRIVS;

SELECT USERNAME, EXPIRY_DATE, DEFAULT_TABLESPACE, PROFILE, AUTHENTICATION_TYPE
FROM dba_users;

