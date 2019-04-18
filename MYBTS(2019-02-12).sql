-- ����� MyBTS ���� ȭ��

CREATE TABLE tbl_member(
    id NUMBER PRIMARY KEY,
    m_userid nVARCHAR2(30) NOT NULL,
    m_password nVARCHAR2(125) NOT NULL,
    m_name nVARCHAR2(125) NOT NULL,
    m_tel nVARCHAR2(20),
    m_city nVARCHAR2(20),
    m_addr nVARCHAR2(125),
    CONSTRAINT U_userid UNIQUE (m_userid) -- ���̺��� ������ �� UNIQUE ����
);

-- ȸ���������� id Į���� Table ���Ἲ�� �����ϱ� ���� ���̰�
-- ������ ȸ�������� Ȱ���ϱ� ���ؼ��� �ַ� ����ϴ� Į���� m_userid�̴�.
-- ȸ������ table�� m_userid�� �ߺ��Ǿ�� �ȵȴ�.
-- ���� ȸ������ table�� m_suerid Į���� UNIQUE�� ������ �ش�.
ALTER TABLE tbl_member ADD UNIQUE m_userid; -- �������� ���� ����
ALTER TABLE tbl_member ADD CONSTRAINT U_userid UNIQUE (m_userid); -- U-userid �̸����� ���� ����


CREATE TABLE tbl_hobby(
    id NUMBER PRIMARY KEY,
    m_userid nVARCHAR2(30) NOT NULL,
    m_hobby nVARCHAR2(20)
);

-- ����ȭ : ������ �����ͺ��̽��� ���迡�� �ߺ��� �ּ�ȭ�ϰ� �����͸� ����ȭ�ϴ� ���μ���

-- FOREIGN KEY�� ���� (�ܷ�Ű)
-- FK�� main table (tbl_member)�� � Į���� ������ ���Ѽ�
-- ���� main table�� �����͸� �����ϸ� sub table(tbl_hobby)�� �����Ͱ� 
-- �ǹ̾��� �����ִ� ���� �����ϱ� ���� ����
ALTER TABLE tbl_hobby -- FK�� ������ table
ADD CONSTRAINT F_userid -- FK�̸�(���Ƿ� ����)
FOREIGN KEY (m_userid) --FK�� ������ Į��
REFERENCES tbl_member(m_userid) -- main table�� Į��
ON DELETE CASCADE; -- main table�� �����Ͱ� �����Ǹ� ���� �����϶�
-- FK�� �����Ϸ��� main table�� Į���� PK�� �����ǰų� UNIQUE�� �����Ǿ� �־�� �Ѵ�.

INSERT INTO tbl_member(id,m_userid,m_password,m_name) VALUES(0,'aaa','1234','ȫ�浿');

INSERT INTO tbl_hobby(id,m_userid,m_hobby) VALUES(0,'aaa','BOOK');
INSERT INTO tbl_hobby(id,m_userid,m_hobby) VALUES(1,'aaa','MUSIC');
INSERT INTO tbl_hobby(id,m_userid,m_hobby) VALUES(2,'aaa','MOVIE');

select * from tbl_member;
select * from tbl_hobby;

-- tbl_member���� aaa ����� ����
DELETE FROM tbl_member WHERE m_userid = 'aaa';
-- tbl_member���� aaa ����ڸ� �����ߴ��� tbl_hobby�� �����Ǿ���.
select * from tbl_hobby;

-- tbl_member table�� aaa ��� ����ڰ� ������
-- tbl_hobby�� aaa ������� ��̸� �߰��� �� ����.
INSERT INTO tbl_hobby(id,m_userid, m_hobby) VALUES(2,'aaa','MOVIE');


CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1;

select * from tbl_member;

delete from tbl_member;
commit;

