-- ����� myMem���� ������ ȭ���Դϴ�.

-- ���� ���̺� ����
DROP TABLE tbl_iolist;
DROP TABLE tbl_dept;

-- ������ ���Ը��� ������ ����Ŭ�� import
-- ���Ը��� DB�κ��� ��2����ȭ�� �����ؼ� �ŷ�ó ������ �и��Ѵ�.
DROP TABLE io_list;
CREATE TABLE tbl_iolist(
    io_id	    NUMBER		PRIMARY KEY,
    io_date	    CHAR(10)	NOT NULL,	
    io_cname	nVARCHAR2(50)	NOT NULL,	
    io_dname	nVARCHAR2(50)	NOT NULL,	
    io_dceo	    nVARCHAR2(50),		
    io_inout	nVARCHAR2(5)	NOT NULL,	
    io_quan	    NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER		
);

-- ������ import Ȯ��
SELECT COUNT(*) FROM tbl_iolist;

-- ���Ը����� �����ؼ� import Ȯ��
SELECT io_inout, COUNT(*) FROM tbl_iolist
GROUP BY io_inout;

-- ���Ը��� �������� �ŷ�ó������ �ٸ� table�� �и��ؼ� ��2����ȭ ������ �����Ѵ�.
-- 1. ���Ը��� �������� �ŷ�ó������ �����Ѵ�.
    -- ��. �ŷ�ó��� ��ǥ���� �׷����� ���� ����Ʈ�� �����Ѵ�.
SELECT io_dname, io_dceo
FROM tbl_iolist
GROUP BY io_dname, io_dceo
ORDER BY io_dname;

    -- ��. �������� ������ �ŷ�ó������ import�ϱ� ���ؼ� talbe�� �����Ѵ�.
CREATE TABLE tbl_dept(
d_code	CHAR(6)		    PRIMARY KEY,
d_name	nVARCHAR2(50)	NOT NULL,	
d_ceo	nVARCHAR2(50)		
);
    -- ��. �����κ��� �ŷ�ó������ import�� �� Ȯ���Ѵ�.
SELECT COUNT(*) FROM tbl_dept;    

-- 2. tbl_iolist�� tbl_dept�� ������ Į���� �߰��ϰ�
-- tbl_dept�κ��� �����۾��� �����Ѵ�.
    -- ��. Į���߰�
ALTER TABLE tbl_iolist ADD io_dcode CHAR(6);
    -- ��. �߰��� Į�� Ȯ��
    DESC tbl_iolist;

-- SUB QUERY
-- DML ���ο� �ٸ� SELECT���� �ִ� SQL�� ���Ѵ�.
SELECT io_dname, io_dceo, io_dcode FROM tbl_iolist;

-- ���� SQL�� SUB Query�� �߰��ؼ� dept ���̺�� ���� io_dcode�� ��ȸ�Ѵ�.
SELECT io_dname, io_dceo,
    (SELECT d_code FROM tbl_dept D
         WHERE D.d_name = tbl_iolist.io_dname AND
               D.d_ceo = tbl_iolist.io_dceo) AS DCODE
FROM tbl_iolist;

-- SUB QUERY�� ����ؼ� tbl_dept�� ���� tbl_iolist�� �ŷ�ó�ڵ带 update�ϴ� �ڵ��̴�. 
UPDATE tbl_iolist I
SET io_dcode
    =(SELECT d_code FROM tbl_dept D
        WHERE D.d_name = I.io_dname AND
              D.d_ceo = I.io_dceo);
              
SELECT io_dcode, io_dname, io_dceo FROM tbl_iolist;

-- tbl_iolist�� io_dname�� io_dceo Į���� �����Ѵ�.
ALTER TABLE tbl_iolist DROP COLUMN io_dname;
ALTER TABLE tbl_iolist DROP COLUMN io_dceo;
DESC tbl_iolist;

-- iolist�� dept ���̺��� join �ؼ� ��ȸ�ϴ� SQL
SELECT I.io_date, I.io_cname, I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code;
-- �� JOIN�� EQ JOIN�̶�� �ϸ�,
-- tbl_iolist���̺��� tbl_dept ���̺� ���� io_dcode�� ���� �������� �ʴ´ٴ� ������ ������ ������ ����� �����ش�.
-- ���� ��Ȳ������ tbl_dept�� ���� �ڵ尡 tbl_iolist�� ������ �� �ִ�.

-- �׽�Ʈ �����͸� ����� ���ؼ� ������ ������ io_dcode�� ���� �� �����̴�.
SELECT * FROM tbl_iolist WHERE io_dcode = 'D00100';

UPDATE tbl_iolist SET io_dcode = 'D00500' WHERE io_id = 306;

SELECT I.io_id, I.io_date, I.io_cname, I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code AND io_id BETWEEN 300 AND 310
ORDER BY I.io_id;


-- JOIN���� ���� ���·� ���Ը��� ���о��� �հ�κ� ���
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_id BETWEEN 300 AND 310;

-- EQ JOINT���� ���Ը��� ���о��� �հ�κ� ���
-- ���� �հ� �ݾװ� ������ ���̰� ����.
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code AND io_id BETWEEN 300 AND 310; 

-- LEFT JOIN���� ���Ը��� ���о��� �հ�ݾ��� ���
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist I
    LEFT JOIN tbl_dept D 
        ON I.io_dcode = D.d_code
WHERE io_id BETWEEN 300 AND 310;


-- LEFT JOIN�� 
    -- ���� table�� �����ʹ� ��� �����ְ� 
    -- ���� table�� KEY(io_dcode)�� ��ġ�ϴ� �����Ͱ� 
    -- ������ table�� ������ �����ְ�, ������ null�� ǥ���϶�
-- ������ table�� ��ġ�ϴ� �����Ͱ� ��� ���� �������� �Ϻΰ� �����Ǿ�
    -- ��谡 �߸��Ǵ� ������ Ȯ���ϴ� ����̸�
    -- ���� ��Ȳ���� ����� ������ join�̴�.
SELECT I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code
WHERE I.io_id BETWEEN 300 AND 310;        


-- iolist�κ��� �ŷ�ó������ �и�
    -- 1. �ŷ�ó������ GROUPING�Ͽ� ���� ����Ʈ ��ȸ
    -- 2. ������ ����
    -- 3. code�� �ο�
    -- 4. table ����
    -- 5. import
    -- 6. iolist�� dcode Į�� ����
    -- 7. �ŷ�ó���� ���̺��� iolist�� dcodeĮ���� UPDATE
    
-- ��ǰ����

SELECT io_cname FROM tbl_iolist GROUP BY io_cname;


    

