-- mybts ����

DESC tbl_member;

DROP TABLE tbl_hobby;
DROP TABLE tbl_member;

CREATE TABLE tbl_member(
    M_USERID    VARCHAR2(30)  PRIMARY KEY,
    M_PASSWORD  NVARCHAR2(125) NOT NULL,
    M_NAME      NVARCHAR2(125) NOT NULL, 
    M_TEL       NVARCHAR2(20),  
    M_CITY      NVARCHAR2(20),  
    M_ADDR      NVARCHAR2(125), 
    M_PHOTO     nVARCHAR2(125),--���������� �̸�
    M_PHOTO_PATH nVARCHAR2(255) -- ����� ��� + �̸�
);

-- ȸ������ ���� id ����ϱ�

select * from tbl_member;