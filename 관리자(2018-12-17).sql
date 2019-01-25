-- ����� ������ ȭ���Դϴ�.

-- TABLESPACE�� �ϳ� �����Ѵ�
-- tableSpace��: myTBL1
-- dataFile : d:/bizwork/ordata/mytbl_1.dbf
-- �ʱ� ũ�� : 100MByte
-- �ڵ�Ȯ�� 1M��
CREATE TABLESPACE myTBL1
DATAFILE 'D:/bizwork/ordata/mytbl_1.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M;

CREATE USER myMem IDENTIFIED BY 1234
DEFAULT TABLESPACE myTBL1;

GRANT DBA to myMem;
