-- mybts����ȭ��

DESC tbl_memo;

 SELECT * FROM tbl_memo;
 
 DROP SEQUENCE SEQ_MEMO;
 
 CREATE SEQUENCE SEQ_MEMO
 START WITH 1
 INCREMENT BY 1;
 
 -- ���� ���ε带 ���� ���������� ���� �� ���̺�
 CREATE TABLE tbl_files(
    id           NUMBER PRIMARY KEY,
    parent_id    NUMBER NOT NULL, 
    file_name    nVARCHAR2(125),
    save_file_name nVARCHAR2(125)
);
 
 CREATE SEQUENCE SEQ_FILE
 START WITH 1
 INCREMENT BY 1;
 
 -- tbl_files ���̺�� tbl_memo ���̺��� ���� Relation
 -- memo_files��� �̸����� FOREIGN KEY�� �����϶�
 ALTER TABLE tbl_files -- KEY �̸�
 ADD FOREIGN KEY (parent_id) -- Į���̸�
 REFERENCES tbl_memo(id) -- �������
 ON DELETE CASCADE;-- ��������
 
 ALTER TABLE tbl_files
 DROP CONSTRAINT memo_files;