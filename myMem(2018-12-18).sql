-- ����� myMem����ڷ� ������ ȭ���Դϴ�.

-- ����Ŭ���� $ǥ�ð� �ִ� table���� system dictionary�̶�� �Ѵ�.
-- SYS DIC��� ��Ī�ϸ� �� table�� �ý����� ������ ����ִ� �߿��� table���̴�.
-- ���� SYS DIC���� �����ڷ� ���������� Ȯ���� �� �ִ� table�ε�
-- myMem����ڿ��� DBA������ �ο��߱� ������ Ȯ���� �����ϴ�. 
SELECT * FROM v$datafile;
SELECT NAME FROM v$datafile;


SELECT * FROM dba_tablespaces;

SELECT * FROM dba_data_files;

SELECT * FROM v$controlfile;

SELECT * FROM dba_users;

SELECT * FROM DBA_TAB_PRIVS;

SELECT USERNAME, EXPIRY_DATE, DEFAULT_TABLESPACE, PROFILE, AUTHENTICATION_TYPE
FROM dba_users;

