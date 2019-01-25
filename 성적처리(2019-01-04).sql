-- ����ó���� ���� gradeUser�� ������ ȭ��

SELECT * FROM tbl_student;

-- �й����� ���� �˻�
SELECT * FROM tbl_student WHERE st_num ='003';

-- �л��� �̸����� �˻�
SELECT * FROM tbl_student WHERE st_name = '��ĥ��';

-- �л��� �̸��� ���� �����Ͱ� �ִ��� Ȯ�� (= �ߺ��� �̸��� �ִ��� Ȯ��)
-- �̸� Į������ GROUP BY�� �����ؼ� ����� Ȯ���Ѵ�.
SELECT st_name, COUNT(st_name) 
FROM tbl_student
GROUP BY st_name;

SELECT * FROM tbl_student WHERE st_name = '������';

SELECT * FROM tbl_student;

-- SELECT�� ������ �� (Ư���� ���ڿ��� ���) ���� ��ü�� ���� ���ϰ�
-- �Ϻθ��� �˰� ���� ��, �κ� ���ڿ� �˻�
-- �κ� ���ڿ� �˻��� �������� SQL ��ɹ��߿� ���� ������ �������� ����
-- ���� Ư���� ��찡 �ƴϸ� ������ ������� �ʴ� ���� ����.

SELECT * FROM tbl_student WHERE st_name LIKE '��%';

-- ���� �̶�� ���ڿ��� ���۵Ǵ� ��� ������
SELECT * FROM tbl_student WHERE st_addr LIKE '����%';

-- st_name Į���� ���̶�� ���ڿ��� ���Ե� ������
SELECT * FROM tbl_student WHERE st_name LIKE '%��%';


SELECT * FROM tbl_student WHERE st_name LIKE '%��' OR st_name LIKE '%��%' OR st_name LIKE '%ö%';  -- LIKE Ű���带 ���� �����˻����� ������ ��������.


--  private String sc_num;
--	private int sc_kor;
--	private int sc_eng;
--	private int sc_math;

CREATE TABLE tbl_score(
    sc_num CHAR(5) PRIMARY KEY,
    sc_kor NUMBER(3),
    sc_eng NUMBER(3),
    sc_math NUMBER(3)
    );
