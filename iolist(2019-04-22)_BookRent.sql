-- iolist ���� �뿩 ����

DELETE FROM tbl_book;

SELECT COUNT(*) FROM tbl_book;

-- ���Ƿ� �����͸� ����Ʈ �� �� ���ο� �����͸� ���ÿ��� �Է��Ϸ��� �ϸ�
-- SEQ�� ������ ���� �� �ִ�. �׷��� ������ SEQ�� �����ϰ� �ٸ� ��Ģ���� ����
DROP SEQUENCE SEQ_BOOK;

CREATE SEQUENCE SEQ_BOOK
START WITH 300
INCREMENT BY 1;

COMMIT;

SELECT * FROM tbl_user;
