 -- ����� ������ ȭ���Դϴ�.
 CREATE USER myuser IDENTIFIED BY 1234; -- ����� ����
-- ���� tablespace�� �����ϱ� ����
-- ����ڸ� ���� ����ϴ� ����
-- DEFAULT TABLESPACE�� �������� �ʾҴ�.
-- �̷���� DEFAULT TABLESPACE�� SYSTEM ���� ������ �����Ǵµ�,
-- �̰��� �ǹ����� �ſ� ������ ����̴�.

 CREATE USER myuser IDENTIFIED BY 1234
 DEFAULT TABLESPACE ....;
 
 GRANT DBA TO myuser; --���Ѻο�
 
 CREATE TABLESPACE mytbl
 DATAFILE 'd:/bizwork/ordata/mytbl.dbf'
 SIZE 100M
 AUTOEXTEND ON NEXT 1M;
 
 -- myuser ����ڿ��� TABLESPACE�� �������� �ʾҴ�.
 -- ���� ���ο� tablespace�� ���������Ƿ�
 -- myuser���� defaulft tablespace�� �����ϰڴ�.
 ALTER USER myuser DEFAULT TABLESPACE myTBL;
 
 
 
 