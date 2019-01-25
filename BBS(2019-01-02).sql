-- ����� BBS ����� ȭ���Դϴ�.

SELECT * FROM TBL_BBS_MAIN;

INSERT INTO TBL_BBS_MAIN 
VALUES(SEQ_BBS_MAIN.NEXTVAL,
    '2019-01-02',
    'ȫ�浿',
    '���س� ����',
    '���� �� ���� ��������');
    
-- DCL�����߿� COMMIT�� ROLLBACK������ �ִµ� ���� ������ ������ INSERT������ �����͸� �߰� �ߴµ�
-- ������ �޸𸮻� �����Ͱ� �����ϰ�, ���������� ������ DB���� ������ �ȵ� �����̴�.
-- �׷��� ���� ȭ���� �ƴ� �ٸ� ��(JAVA ��)���� DB�� �����ؼ� �����͸� ��ȸ�ϸ� �����Ͱ� ������ �ʴ´�.

-- COMMIT����
-- ���� �޸𸮿� �ִ� �����͸� ������ DB�� �����ϵ��� �ϴ� ����
COMMIT;

-- ROLLBACK ����
-- �����͸� INSERT, UPDATE, DELETE�� ������ ������ �ش�Ǵ� ������ ����ϰ��� �� �� ����ϴ� ����

-- SQLDeveloper�� JAVA�� ���ÿ� �����ؼ� �׽�Ʈ�� �� ���� SQL���� �����͸� �߰�, ����, ���� �� �Ŀ��� COMMIT�� ���ش�.

DESC tbl_bbs_main;