-- mybts����ȭ��

-- tbl_member table�� ������ ����
DELETE FROM tbl_member;
commit;


-- aaa ��� ����� ������ tbl_member�� ������
-- ������� null�̴�
SELECT * FROM tbl_member WHERE m_userid='aaa';

SELECT * FROM tbl_member;