-- ����� ������ ȭ���Դϴ�.

-- ���ο� ���̺����̽� ����
-- TS: myIOTs
-- datafile : myIOTS.dbf
CREATE TABLESPACE myIOTs
DATAFILE 'd:/bizwork/ordata/myIOTS.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M;

-- ���ο� ����� ����
CREATE USER myIOUser IDENTIFIED BY 1234
DEFAULT TABLESPACE myIOTS;

GRANT DBA to myiouser; -- ���� �ο�

-- SQLD�� ���� ���� ����
-- ���� ����ȭ�� +(���θ����)�����̸�,������̸�,��й�ȣ ���� �ϰ� �׽�Ʈ �� ���� ������



