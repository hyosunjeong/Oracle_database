-- ����� myMem���� ������ ȭ���Դϴ�.

-- GROUP BY�� �̿��ؼ� � Table �����ͷκ��� �ߺ����� ���� List�� �����ϱ�
    -- SELECT�� ���������� ���� ���� ���� LIST�� �ټ� ��Ÿ���µ�
    -- �׵��� ��ǥ�� 1������ �����ϰ� ������ 
-- GROUP BY���� ����ؼ� SQL�� �ۼ��Ѵ�.
SELECT Io_inout FROM tbl_iolist;
SELECT io_inout FROM tbl_iolist GROUP BY io_inout;

-- �ߺ����� ���� ��ǰ ����Ʈ�� �����ϴ� SQL
SELECT io_coname FROM tbl_iolist GROUP BY io_coname;

SELECT d_name FROM tbl_dept; --�ŷ�ó�������� �ŷ�ó���� �������

-- �ŷ�ó���� �ߺ��� ���� ��� ����Ʈ�� �����޶� 
SELECT d_name FROM tbl_dept GROUP BY d_name; -- => �ŷ�ó�̸��� ��� �ߺ��� ������ �ϳ��� �������
SELECT d_name, d_ceo FROM tbl_dept GROUP BY d_name, d_ceo;

SELECT io_coname, count(io_coname) FROM tbl_iolist GROUP BY io_coname;
SELECT d_name,d_ceo, count(d_name) FROM tbl_dept GROUP BY d_name, d_ceo;