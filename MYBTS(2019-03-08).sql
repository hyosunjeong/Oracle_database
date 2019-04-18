-- mybtsȭ��

CREATE TABLE tbl_user(
    userid CHAR(5) PRIMARY KEY,
    username nVARCHAR2(20),
    tel nVARCHAR2(20)
);

CREATE TABLE tbl_hobby(
    id NUMBER PRIMARY KEY,
    userid CHAR(5),
    hobby nVARCHAR2(20)
);

-- tbl user�� tbl hobby�� ����
-- tbl_user���� userid�� �ߺ����� ������ 
-- tbl_user������ 1���� �����ϴ� ���̴�.

-- tbl_hobby table���� userid�� �������� �����Ͱ� ���� �� ������
-- userid Į���� �������� tbl_user�� 1:���� ���踦 ���´�.

-- tbl_user�� tbl_hobby�� 1:���� ���踦 FK�� �����Ѵ�

-- FK�� ������ ���� ��(��)�� ��ġ�� �ִ� table�� �������� ALTER�� �����Ѵ�
ALTER TABLE tbl_hobby ADD FOREIGN KEY(userid) -- ���� ��ġ
REFERENCES tbl_user(userid)                   -- 1�� ��ġ
ON DELETE CASCADE;                            -- ��������

-- FK�� ����
-- USER�� userid�� ������ HOBBY���� 0�� �̻��� userid�� ���� �� �ִ�.
-- USER�� userid�� ������ HOBBY���� ���� ���� �� ����. �־�� �ȵȴ�. 
--      USER�� ���� userid�� HOBBY�� �߰��Ϸ��� �ϸ� ������ �߻��Ѵ�.
-- ���� HOBBY�� �ִ� userid�� USER���� �����Ϸ��� �õ��ϸ�
-- FK�� ���ǿ� ����Ǿ� ���� �� �� ����.
-- ��� 1: ���� HOBBY�� �ִ� userid�� ��� �����ϰ� USER�� �ִ� userid ����
-- ��� 2: FK�� ON DELETE CASCADE�� ���� �� �д�.

