-- ����� myIOUser ȭ���Դϴ�.

CREATE TABLE tbl_iolist(
    io_id	    NUMBER		PRIMARY KEY,
    io_date	    CHAR(10)	NOT NULL,	
    io_pname	nVARCHAR2(50)	NOT NULL,	
    io_dname	nVARCHAR2(50)	NOT NULL,	
    io_dceo	    nVARCHAR2(50),		
    io_inout	CHAR(7)	NOT NULL,	
    io_quan	    NUMBER,	
    io_price	NUMBER,	
    io_total	NUMBER		
);

DROP TABLE tbl_iolist;

SELECT count(*) FROM tbl_iolist;

-- �ŷ�ó��, ��ǥ�ڸ��� GROUP���� �Ͽ� ����Ʈ ��ȸ
SELECT io_dname, io_dceo FROM tbl_iolist GROUP BY io_dname, io_dceo;

-- tbl_dept ���̺� ����
CREATE TABLE tbl_dept(
    d_code	CHAR(5)		PRIMARY KEY,
    d_name	nVARCHAR2(50)	NOT NULL,	
    d_ceo	nVARCHAR2(50)		
);

SELECT * FROM tbl_dept;

DESC tbl_dept;

-- NOT NULL ���� ����
ALTER TABLE tbl_dept MODIFY d_name null;
-- NOT NULL ���� �߰�
ALTER TABLE tbl_dept MODIFY d_name NOT NULL;

-- EQ JOIN
SELECT I.io_dname, D.d_name, I.io_dceo, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dname = D.d_name AND I.io_dceo = D.d_ceo;

-- �����Ͱ� ��Ȯ�� ��������°� �����ϱ� ���ؼ� LEFT JOIN�� ����ؼ� �����Ѵ�.
SELECT I.io_dname, D.d_name, I.io_dceo, D.d_ceo
FROM tbl_iolist I -- ���� ������ ���̺�
    LEFT JOIN tbl_dept D
        ON I.io_dname = D.d_name AND I.io_dceo = D.d_ceo;
        
-- �� SQL������ Ȯ���� LIST�� ��� ��ǰ���Ը��� ����� ��Ÿ���� �߸��� �����Ͱ� �ִ��� Ȯ���ϱ� ��ƴ�.
-- ���� ���� SQL���� ���������� iolist���� �����Ͱ� �ִµ�
    -- dept���� �����Ͱ� ���� ��쿡 d.d_name�� d.d_ceo�� null������ ��Ÿ�� ���̴�.
-- �� ������ �̿��ؼ� d.d_name �̳� d.d_ceo�� null�� �͸� ã�ƺ��� �� ���� Ȯ���� �����ϴ�.  
SELECT I.io_dname, D.d_name, I.io_dceo, D.d_ceo
FROM tbl_iolist I -- ���� ������ ���̺�
    LEFT JOIN tbl_dept D
        ON I.io_dname = D.d_name AND I.io_dceo = D.d_ceo
WHERE D.d_name IS NULL OR D.d_ceo IS NULL;        
-- ���� SQL�� ���������� ����Ʈ�� �ϳ��� ����� ���������� �ŷ�ó���� TABLE�� �ϼ��� ���̴�.


SELECT io_dname FROM tbl_iolist WHERE io_dname IS NULL; -- �ŷ�ó���� ������ �׸��� �ִ°�
SELECT io_dname FROM tbl_iolist WHERE io_dname IS NOT NULL; -- �ŷ�ó���� �ִ� �׸��� �ִ°�


SELECT io_price FROM tbl_iolist WHERE io_price = 0; -- ����Į���� 0�� ���� 0�̶�� ���� INSERT, UPDATE ���� �� ��
SELECT io_price FROM tbl_iolist WHERE io_price IS NULL; -- ����Į���� NULL�� ���� ó������ �ƿ� ���� INSERT���� ���� ��

-- �ŷ�ó�������̺��� SUB QUERY�� ��ȸ�Ͽ� �ŷ�ó��, ��ǥ�ڸ��� ������ ��ȸ SQL�ۼ�
-- I.�ŷ�ó��, I.��ǥ�ڸ�, D.�ŷ�ó�ڵ�
SELECT I.io_dname, I.io_dceo,
    (SELECT D.d_code FROM tbl_dept D WHERE D.d_name = I.io_dname and D.d_ceo = I.io_dceo) dceo
FROM tbl_iolist I;


-- ���Ը������̺� �ŷ�ó�ڵ带 ������ Į�� �߰�
ALTER TABLE tbl_iolist ADD io_dcode CHAR(5);


-- �ŷ�ó���� ���̺��� ��ǰ���Ը��� ���̺� �ִ� �ŷ�ó��� ��ǥ�ڸ��� ��ġ�ϴ� �����͸� ã�Ƽ� �� �������� �ŷ�ó�ڵ带 
-- ��ǰ���Ը��� ���̺��� �ŷ�ó�ڵ忡 UPDATE
UPDATE tbl_iolist I
SET io_dcode = (SELECT D.d_code FROM tbl_dept D WHERE I.io_dname = D.d_name AND I.io_dceo = D.d_ceo);

SELECT io_dcode, io_dname, io_dceo FROM tbl_iolist; -- update �Ǿ����� Ȯ��