-- myBTS�� ������ ȭ��
-- �޸��� �ۼ��� ���� ���̺� ����


CREATE TABLE tbl_memo(
    id NUMBER PRIMARY KEY,
    m_auth nVARCHAR2(30) NOT NULL,
    m_date CHAR(10),
    m_subject nVARCHAR2(50),
    m_text nVARCHAR2(255) 
 
);


DROP TABlE tbl_memo;
Drop SEQUENCE seq_memo;


CREATE SEQUENCE SEQ_MEMO
START WITH 1
INCREMENT BY 1;

SELECT * FROM tbl_memo;