-- ����� myMem����� ȭ���Դϴ�.

CREATE TABLE tbl_iolist(
    id	NUMBER  PRIMARY KEY,
    io_date	CHAR(10)	NOT NULL,	
    io_coname	nVARCHAR2(30)	NOT NULL,
    io_dname	nVARCHAR2(50)	NOT NULL,	
    io_ceo	nVARCHAR2(30),		
    io_inout	nVARCHAR2(5),		
    io_quan	NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER		
);

SELECT * FROM tbl_iolist;

SELECT COUNT(*) FROM tbl_iolist;

-- ���԰� ������ �����ؼ� ������ �հ踦 Ȯ��
SELECT COUNT(*), SUM (io_total)  FROM tbl_iolist
WHERE io_inout = '����';

SELECT COUNT(*), SUM (io_total)  FROM tbl_iolist
WHERE io_inout = '����';

-- ���԰� ������ �����ϰ� �ѹ��� Ȯ��
SELECT io_inout, COUNT(*), SUM(io_total) 
FROM tbl_iolist
GROUP BY io_inout;

-- ���ں��� �����Ͽ� ���԰� ������ ����ȭ ���հ� �ݾ��� Ȯ��
SELECT io_date, io_inout, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;



-- ���ڿ� �Լ� ���
SELECT 'KOREA' FROM DUAL; -- DUAL�� �����ֱ⸸ �Ѵ�.
SELECT 'Republic of Korea' FROM DUAL;

-- ���ڿ��� ��/�ҹ��ڷ�  ��ȯ
SELECT UPPER('korea') FROM DUAL; -- �빮�ڷ� ��ȯ
SELECT LOWER('KOREA') FROM DUAL; -- �ҹ��ڷ� ��ȯ

-- �ܾ��� ù����(�̴ϼ�)�� �빮�ڷ� ��ȯ
SELECT INITCAP('republic of korea') FROM DUAL; -- �� �ܾ��� ù���ڸ� �빮�ڷ� ��ȯ

-- �ܾ��� ������ ��Ÿ���� �Լ�
SELECT LENGTH ('republic of korea') FROM DUAL;

-- LENGTH�Լ��� ����� �� ��Ȥ �ѱ۰����� *2�� ������ ǥ���ϴ� ��찡 �ִ�.
-- �̶� �ѱ��� ��Ȯ�� ������ �˰��� �Ҷ��� ''���ڿ� �տ� N�� �ٿ��ش�.
SELECT LENGTH (N'���ѹα�') FROM DUAL; 

-- �������� ����뷮�� Byte������ �����ش�.
SELECT LENGTHB('���ѹα�') FROM DUAL;

-- of�� Republic of Korea ���ڿ� �߿� ���° ��ġ�� �ִ��� ���� Ȯ��
SELECT INSTR ('Republic of Korea','of') FROM DUAL;

-- ���� ���ڿ��� 4°�ڸ����� 3���� 
-- ����Ŭ�� ù���� ��ġ�� 0�� �ƴ� 1���� �����Ѵ�.
SELECT SUBSTR ('Republic of Korea', 4,3) FROM DUAL;

-- ǥ�� SQL���� ���ʺ��� 3��° ��ġ�� ����
-- SELECT LEFT('Republic',3) FROM DUAL;
-- SELECT MID ('Republic',3,2) FROM DUAL; -- 3��°���� 2����

-- KOREA���ڿ��� �����Ͽ� �� 20���� ���ڿ��� �����ϵ�
-- ����� *�� ä����
SELECT LPAD('KOREA',20,'*') FROM DUAL;

-- ���� 1�� ���ڿ��� �ٲٰ� �� 5���� ���ڿ��� �����ϵ�
-- ����� 0���� ä����
-- �ڸ����� �����ϰ� ����� �ϴ� ��쿡 ���
SELECT LPAD(1,5,'0') FROM DUAL; --��ĭ�� ����
SELECT RPAD(1,5,'0') FROM DUAL; --��ĭ ������

-- INSERT test(t_num) VALUE(LPAD(1,3,'0'));

-- ������ �����ϴ� �Լ�
SELECT LTRIM('  KOREA ���ѹα�  ') FROM DUAL;
SELECT RTRIM('  KOREA ���ѹα�  ') FROM DUAL;

SELECT TRIM('   KOREA   ') FROM DUAL;

-- TRIM �Լ��� Ư���� ���
-- 'aaabbbKoreannnaaa'���ڿ��� �յڿ� ���� a���ڵ��� ��� �����϶�
SELECT TRIM( 'a' FROM 'aaabbbKoreannnaaa') FROM DUAL;

-- ���ں��� �ŷ����п� ���� ������ �հ踦 Ȯ��
SELECT io_date, io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

-- ���ں��� �ŷ����п� ���� ������ �հ踦 Ȯ��
-- ��, 2018-03-01 ~ 2018-03-31 ������ data�� ����
SELECT io_date, io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_date, io_inout
ORDER BY io_date;

-- ���� �Ǵ� �⵵���� �հ踦 ����ؼ� ��������� ����Ѵ�.
CREATE VIEW �������
AS
SELECT SUBSTR(io_date,1,7) AS ����, 
        io_inout ,   COUNT(io_total) AS ����, SUM(io_total) AS �հ�
FROM tbl_iolist
GROUP BY SUBSTR(io_date,1,7), io_inout
ORDER BY SUBSTR(io_date,1,7);

SELECT * FROM �������;

SELECT * FROM �������
WHERE ���� BETWEEN '2018-03' AND '2018-06';


-- �ŷ�ó���� �����Ͽ� ����, ���� ������ �հ踦 Ȯ�� 
-- ��, �ŷ�ó���� ����
SELECT io_dname, io_inout, COUNT(*),SUM(io_total)
FROM tbl_iolist
GROUP BY io_dname, io_inout
ORDER BY io_dname;

-- ��ǰ���� �����ϰ�, ������ �����Ͽ� ����, ���� ������ �հ踦 Ȯ��
-- ��, ��ǰ���� ����
-- (ERP �󿡼� �����̶�� �ϸ� ��-�� �� ���Ե� ���� ���Ѵ�.)
SELECT io_coname, SUBSTR(io_date,1,7), COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_coname,  SUBSTR(io_date,1,7)
ORDER BY io_coname;

-- ��ǰ �߿��� ��Ű���� ���� ���� ����Ʈ Ȯ��
SELECT * FROM tbl_ioList
WHERE io_coname = ' �� Ű ��';

-- ��ǰ �߿��� ��Ű���� ���� ���� ���� ������ �հ� Ȯ��
SELECT io_coname, SUBSTR(io_date,1,7), COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_coname = ' �� Ű ��'
GROUP BY io_coname, SUBSTR(io_date,1,7)
ORDER BY io_coname;



