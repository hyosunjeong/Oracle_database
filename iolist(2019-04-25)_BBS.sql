-- iolist ����ȭ��

-- tbl_bbs : BBS �Խ��� �����͸� ���� TABLE��
-- tbl_comment :����� ������ ���̺� ����
-- tbl_bbs�� tbl_comment�� 1:N�� ���� ����
-- CONTRAT(FK)�� ����

CREATE TABLE tbl_bbs(
    id NUMBER PRIMARY KEY,
    b_auth nVARCHAR2(125) NOT NULL,
    b_date VARCHAR2(10),
    b_time VARCHAR2(10),
    b_subject nVARCHAR2(125),
    b_text nVARCHAR2(1000)
);


CREATE SEQUENCE SEQ_BBS
START WITH 1
INCREMENT BY 1;

CREATE TABLE tbl_comment(
    id NUMBER PRIMARY KEY,
    b_id NUMBER NOT NULL, -- tbl_bbs�� �����ϴ� FK ������ ��
    c_auth nVARCHAR2(125) NOT NULL,
    c_date VARCHAR2(10),
    c_time VARCHAR2(10),
    c_text nVARCHAR2(1000)
);

CREATE SEQUENCE SEQ_COMMENT
START WITH 1
INCREMENT BY 1;

