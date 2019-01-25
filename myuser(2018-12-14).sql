-- ����� myuser�� ������ ȭ���Դϴ�.
-- ���Ը������(����)���Ͽ��� DataBase�� �����͸� �ű�� 
-- DB��Ģ�� �µ��� �����ϴ� ����

CREATE TABLE tbl_iolist(
    id	NUMBER	PRIMARY KEY,
    io_date	CHAR(10)	NOT NULL,	
    io_cname	nVARCHAR2(50)	NOT NULL,
    io_dname	nVARCHAR2(30)	NOT NULL,	
    ie_dceo	nVARCHAR2(10),		
    io_inout	nVARCHAR2(5),		
    io_quan	NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER		
);

SELECT * FROM tbl_iolist;

SELECT COUNT(*) FROM tbl_iolist;

DELETE FROM tbl_iolist;


SELECT * FROM tbl_iolist
WHERE io_inout = '����' and  io_date >= '2018-02-01' and io_date<='2018-02-28';

-- ��¥ ������ �����ϱ�
SELECT * FROM tbl_iolist
WHERE io_inout = '����' and io_date>='2018-02-01' and io_date<= '2018-02-28'
ORDER BY io_date;


-- ����Լ��� �̿��ؼ� ������ �հ踦 ���ϱ�
SELECT COUNT(*) AS ����, SUM(io_total ) AS �հ�
FROM tbl_iolist;

-- ����Լ��� �̿��ؼ� ������ �հ踦 ���ϴµ�
-- �����հ�� �����հ踦 ���� ����ϰ� �ʹ�.
-- 1. ���԰� ������ �����ϴ� Į��: io_inout
SELECT io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout;
-- �����ϰ��� �ϴ� �÷��� �� �տ� ���ְ�
-- �׷���̷� �����ش�

-- ����Լ��� �̿��ؼ� ������ �հ踦 ���
-- ���� : ��¥���� ������ �ο��ؼ� ������ �հ� ���
-- 1. ��¥�� �����ϴ� Į�� : io_date
SELECT io_date ,COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;


-- ���� : ��¥���� ����, �ٽ� ���� ����� �����Ͽ� ������ �հ踦 ���
-- 1. ��¥�� �����ϴ� Į�� : io_date
-- 2. ���԰� ������ �����ϴ� Į�� : io_inout
SELECT io_date, io_inout, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;


-- ���а� ��¥ ������ �ٲپ
SELECT io_inout, io_date, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout, io_date
ORDER BY io_inout;

-- ���� : ��¥ ������ 2018-03-01 ~ 2018-03-31�� ����
SELECT io_inout, io_date, COUNT(*),SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' and '2018-03-31'
GROUP BY io_inout, io_date
ORDER BY io_inout;

-- �հ� �ݾ��� 50���� �̻��� �׸� ������
SELECT io_inout, io_date, COUNT(*),SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' and '2018-03-31'

GROUP BY io_inout, io_date
HAVING SUM(io_total) >= 500000
ORDER BY io_inout;
-- ��� �Լ��� ����ϴ� ��� 
-- ��� �Լ� ����� ���� �����ϴ� List�� �����ϰ� ������
-- (�ʿ��� ������ ���� ���������)
-- WHERE�� ������ �ο��ϸ� �ȵȴ�.
-- �̶��� HAVING�̶�� ���� ����Ѵ�.


SELECT io_inout, io_date, COUNT(*),SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout, io_date
HAVING SUM(io_total) >= 500000 and io_date BETWEEN '2018-03-01' and '2018-03-31'
ORDER BY io_inout; 
-- HAVING���� ��� ��踦 ����� �� �������� ������ �ϱ� ������
-- ��� �����Ϳ� COUNT�� SUM�� ����ϰ�
-- ��μ� ��¥ ������ �����Ѵ�.
-- ���� DB SELECT���� �־��� �ð� �ҿ䰡 �ȴ�.



