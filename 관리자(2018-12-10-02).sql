-- ����� ������ ȭ���Դϴ�

DROP USER user2 CASCADE;

-- ����� ����
CREATE USER user2 IDENTIFIED BY 1234
DEFAULT TABLESPACE myTs;


-- ���� ���� �ο�
GRANT CREATE SESSION TO user2;

-- TABLESPACE ������ �ο�
GRANT RESOURCE TO user2;

-- TABLE�� ������ �� �ִ� ������ �ο�
GRANT CREATE TABLE TO user2;

-- ���� ����� TABLESPACE�� �ٽ� ����
-- �⺻ ����� ������ �����ϸ�
-- ����ڴ� default tablespace�� SYSTEM(����Ŭ �⺻) tablespace�� �����Ѵ�.
-- �� SYSTEM ts�� DBA������ ���� ����ڸ� ������ �����ؼ�
-- �⺻������ CREATE TABLE���� ���� �����δ�
-- TABLE�� �����ϱⰡ ��ƴ�.
-- �׷��� ������ ����ڿ� TABLESPACE�� �����ϰ�
-- �̹� ������ ����ڸ� ���� ���� TABLESPACE�� �������ִ� ���� ����.
-- ��Ģ�� TS�� ���� �����ϰ�, ����ڸ� �����ؼ� 
--  DEFAULT TABLESPACE�� ������ �ϴ� ���� ������
-- ����ڸ� ���� ����ϰ� �Ǹ� ���߿� �ٽ� ������ �ؼ�
-- ����� TS�� ������ �� �ִ�.

-- DCL��ɾ�� CREATE DROP�� �Բ� ����� �� �ִ�
-- ALTER ����� �̿��ؼ� ������ �����Ѵ�.
ALTER USER user2 DEFAULT TABLESPACE myts;

-- �������
ALTER USER user2 IDENTIFIED BY 1111;