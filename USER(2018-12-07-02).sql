-- ����� user1���� ������ ȭ���Դϴ�.
-- �̸�(o_name),
-- ��ȭ��ȣ(o_tel),
-- �ּ�(o_addr),
-- ȸ��(o_comp), 
-- �μ�(o_dept) Į���� ���� 
-- tbl_office ���̺��� �����Ͻÿ�
-- ��, id�� PK�� �����ϰ�
-- �̸��� NOT NULL�� �����Ͻÿ�

CREATE TABLE tbl_office(
    id NUMBER PRIMARY KEY,
    o_name nVARCHAR2(20) NOT NULL,
    o_tel VARCHAR2(20),
    o_addr nVARCHAR2(125),
    o_comp nVARCHAR2(50),
    o_dept nVARCHAR2(50)
 );   

DROP TABLE tbl_office;

SELECT * FROM tbl_office;