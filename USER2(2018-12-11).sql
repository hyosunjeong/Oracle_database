--����� user2 ȭ���Դϴ�.

CREATE TABLE tbl_users(
    str_userid CHAR(12) PRIMARY KEY,
    str_name nVARCHAR2(50) NOT NULL,
    str_tel VARCHAR2(15),
    str_addr nVARCHAR2(50)
);

INSERT INTO tbl_users VALUES ('001','ȫ�浿','010-1111-1111','���ֱ�����');
INSERT INTO tbl_users VALUES ('002','�̸���','010-2222-2222','��õ������');
INSERT INTO tbl_users VALUES ('003','������','010-3333-3333','�λ걤����');
INSERT INTO tbl_users VALUES ('004','�庸��','010-4444-4444','�뱸������');
INSERT INTO tbl_users VALUES ('005','����','010-5555-5555','����������');

SELECT * FROM tbl_users;


-- ���� �ۼ��� tbl_users ���̺� str_userid�� 12�ڸ���
-- ������ �ߴµ� �Է��� �ϴ� ���� �ʹ� ���� �ڸ��� �����Ѵ�.
-- �׷��� ���� �Է����� id ������ 3���� ũ�⸦ �ٲ� ������ �Ѵ�.
-- �̹� ������ ���̺��� Į�� ������ ����
-- DDL ����� ALTER����� ����Ѵ�.
ALTER TABLE tbl_users MODIFY str_userid CHAR(6);
ALTER TABLE tbl_users MODIFY str_name nVARCHAR2(5);
-- CHAR�� �����ʹ� ���̴� �����Ϳ� �޸� ���� ũ�⸸ŭ 
-- ��������� �̹� ä���������Ƿ� ũ�⸦ ���� �� ����.
-- (n)VARCHAR2�� �����ʹ� ���̴� ������ �� ���� ���̰� �� ������ ��ŭ ũ�⸦ ���� �� �ִ�.

-- INSERT�� ������ �� ��üĮ���� �ƴ� Ư��Į���� ���� �ִ� ���
INSERT INTO tbl_users (str_userid, str_name) VALUES('006','�Ӳ���');  

-- INSERT�� ������ �� �������� ��ġ(����)�� �ٲٰ��� �Ҷ���
-- TABLE(Į������Ʈ)�� Į������Ʈ ������ �ٲٸ� �ȴ�.
-- INSERT INTO tbl_users (str_name, str_userid) VALUES('���ٸ�','007');  

INSERT INTO tbl_users (str_userid, str_name) VALUES('007','���ٸ�');  
INSERT INTO tbl_users (str_userid, str_name) VALUES('008','Ʈ����');  
INSERT INTO tbl_users (str_userid, str_name) VALUES('009','�ظ�����');  
INSERT INTO tbl_users (str_userid, str_name) VALUES('010','���۸�');  

SELECT * FROM tbl_users;
-- SELECT str_userid, str_name, str_tel, str_addr FROM tbl_users;

SELECT str_name, str_tel FROM tbl_users;

-- SELECT�� ������ �� Ư���� Į���鸸 �����ؼ� ������ �� ��
-- Į������Ʈ : Projection



SELECT * FROM tbl_users WHERE str_name = 'ȫ�浿';

SELECT * FROM tbl_users WHERE str_addr = '���ֱ�����' AND str_name = 'ȫ�浿';

-- tbl_users���̺��� id�� 003���� 006���� �����͸� ����
SELECT * FROM tbl_users WHERE str_userid >= '003' AND str_userid<='006';

SELECT * FROM tbl_users WHERE str_userid BETWEEN '003' AND '006';


SELECT * FROM tbl_users;

-- SQL�� ����Լ�
-- ���� tbl_users�� ����� ������ ������ ��ΰ�?
-- SUM, COUNT,  AVG,  MIN, MAX 
-- Į���� ���δ� �Լ�
SELECT COUNT(*) FROM tbl_users;
SELECT MIN(str_userid) FROM tbl_users;
SELECT MAX(str_userid) FROM tbl_users;

SELECT COUNT (*) AS ����,
    MIN(str_userid) AS ������,
    MAX(str_userid) AS ū��
FROM tbl_users;    

















