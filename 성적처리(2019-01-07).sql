-- ����� gradeUser�� ������ ȭ���Դϴ�.

SELECT * FROM tbl_student;

-- 20�� �л��� ������ ��ȸ
SELECT * FROM tbl_student Where st_num ='00020';

SELECT * FROM tbl_student WHere st_num = 20; --���ڸ� ��� ���� ��� �˻� �ǰ� ���ڰ� ��������� �˻��� �ȵȴ�.

SELECT * FROM tbl_student WHERE st_name LIKE '%ȫ%';

SELECT * FROM tbl_student WHERE st_num = 00010;