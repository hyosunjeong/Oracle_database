-- ����� ������ ȭ���Դϴ�.

-- ���ο����� user2 ����
CREATE USER user2 IDENTIFIED BY 1234;

-- ���� user2 ����ڴ� �ƹ��� ������ ���� ����

-- �������� user1���� DBA��� ���� ������ �ο��ߴ�.
-- ���� �ǹ������� DBA������ �ƹ����Գ� �Ժη� �ο����� �ʴ´�
-- ����Ŭ���� DBA������ �ְ������ sysdba ���ѿ� ���ϴ� 
-- ����� ���� �����̾ �Ժη� �ο��ϸ� ������ ����ų �� �ִ�.

-- �ְ����
    -- ����Ŭ : sysdba
    -- MySQL : root
    -- MsSQL : sa
    -- ETC : administor, root

-- user2���� �������� ������ �ο��ϴ� ����� ���� �н�
-- 1. user2���� CRUD�� ������ �� �ִ� ������ �ο� 
-- �ӽ÷� ���̺� �ϳ� ����
CREATE TABLE tbl_test(
    st_name CHAR(20),
    st_addr nVARCHAR2(125)
);

-- user2���� tbl_test ���̺��� ���� ���� �ִ� ������ �ְڴ�.
GRANT SELECT ON tbl_test TO user2;
GRANT INSERT ON tbl_test TO user2; -- INSERT(�߰�) ���� �ο�

GRANT SELECT, INSERT, UPDATE, DELETE ON tbl_test TO user2;

-- Ư������ڿ��� �ο��� ������ ��ȸ�ϴ� PL/SQL(����Ŭ SQL)
SELECT * FROM USER_TAB_PRIVS_MADE
WHERE GRANTEE = 'USER2'; -- ����� ID�� �빮�ڷ�

SHOW USER;
 

