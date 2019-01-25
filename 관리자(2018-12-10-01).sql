-- ����� ������ ȭ���Դϴ�.
-- ���ο� ����� ���
-- �ϴ� ���� ����� user2�� ����
DROP USER user2 CASCADE; -- user2�� Ȱ���ߴ� ��� ������ ����

-- �ٽ� user2�� ����
CREATE USER user2 IDENTIFIED BY 1234
DEFAULT TABLESPACE myTs;


-- user2���� CRUD������ �ο�
-- CRUD������ �ο��Ϸ��� ���� ���̺��� ���� �Ǿ� �־�� �Ѵ�.

-- 1. ������ ���� �ο�
GRANT SELECT ON tbl_test TO user2;
GRANT INSERT ON tbl_test TO user2;

-- 2. CRUD �ϰ� ���� �ο�
GRANT SELECT, INSERT, UPDATE, DELETE ON tbl_test TO user2;

-- ���� ������� user2�� �����ϰ�, CRUD������ �ο�������
-- ���� ���ӱ����� �ο����� �ʾҴ�.
-- CONECT ���ӱ����� DB������ ���� ���� ������ �ſ� �ٸ���.
-- 11gEx������ ����� ���� ������ �ȴ�.
-- ���� CONNECT ������ �Ϲ����ΰ�� ������� �ʰ�

GRANT CONNECT TO user2;

-- ���ӱ����� �ο��ϱ� ���ؼ���
-- CREATE SESSION ������ �ο��Ѵ�.
GRANT CREATE SESSION TO user2;
--REVOKE CREATE TABLE FROM user2;
GRANT CREATE TABLE TO user2;

-- user2�� ����� TABLESPACE�� �ϳ� ����
CREATE TABLESPACE myTs -- myTs��� �̸����� DB���� ���� ����
DATAFILE 'D:/bizwork/ordata/myTs.dbf' -- ���� ������ġ�� ����
SIZE 100M -- ���� Ȯ���� �뷮
AUTOEXTEND ON NEXT 1M -- �뷮�� �����ϸ� 1�� �뷮����
MAXSIZE UNLIMITED; -- �ִ�뷮 ���� ����

-- TABLESPACE�� �����ϰ�, ��� ������ �����϶�
DROP TABLESPACE myTs
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;


DEFAULT TABLESPACE 








