-- ����� ������ ȭ���Դϴ�.

-- TABLE SPACE ����
-- �̸� : myBTs
-- DataFile : d:/bizwork/ordata/myBTs.dbf
-- ����ũ�� : 100MB
-- �ڵ����� : 100k

CREATE TABLESPACE myBTs
DATAFILE 'D:/bizwork/ordata/myBTs.dbf'
SIZE 100M AUTOEXTEND ON NEXT 100K;

-- ���ο� ����� ���
-- �̸� : mybts
-- ��й�ȣ : 1234
-- Default TableSpace : myBTs
-- DBA ���� �ο�

CREATE USER mybts IDENTIFIED BY 1234
DEFAULT TABLESPACE myBTs;
GRANT DBA to mybts;


