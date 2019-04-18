-- mybts ���� ȭ�� 

DELETE TBL_BOARD;

SELECT * FROM tbl_board;

-- �Խ��� ����Ʈ ����

SELECT b_date,b_time,b_subject FROM tbl_board ORDER BY b_date DESC,b_time DESC; -- ������������

-- ����Ŭ������ ������ ������ŭ�� �����͸� ���� �� �� ���ٸ� Ű���峪 ��ɵ��� �����Ƿ�
-- ROWNUM�̶�� Ű����� Į���� �����, ROWNUM ������ �����͸� �߶� SELECT�� �����Ѵ�.
-- ���� �����͸� ORDER BY�� ������ ���� ��� 
-- ROWNUM�� �����ϰ� �ο��Ǿ� ���ϴ� �����͸� ������ �� ����.
SELECT ROWNUM, b_userid, b_date, b_time, b_subject
FROM tbl_board
WHERE ROWNUM BETWEEN 1 AND 10
ORDER BY b_date DESc, b_time DESC;

-- ���� ���� ISSUER�� �־ ����Ŭ������ �ణ�� �ļ��� SUB QUERY�� ����Ѵ�.
-- 1. ��ü �����͸� ���ϴ� Į������ ������ ����
-- 2. ���ĵ� �����͸� ������ ���̺�� ��´�
-- 3. �� ���̺�κ��� select�� �����ϸ鼭
-- 4. ROWNUM Į���� �����Ͽ�
-- 5. ������ �����Ѵ�.


-- ���������� ����ؼ� ����
SELECT ROWNUM, M.b_userid, M.b_date, M.b_time, M.b_subject 
FROM 
    (SELECT id, b_userid, b_date,b_time,b_subject 
    FROM tbl_board 
    ORDER BY b_date DESC,b_time DESC) M
WHERE ROWNUM BETWEEN 1 AND 10;

-- ���������� �ۼ��Ͽ� ������ ������ ���� ���� ū ������
-- ��ü�����͸� �����ϴ� �������� �ӵ����� �߻�
-- �����̳��� ���� ������ ���ؼ� INDEX��� ���� Ȱ���� ����.

CREATE INDEX idx_board ON tbl_board(b_date,b_time); -- ����Į�� INDEX
CREATE INDEX idx_board_subject ON tbl_board(b_subject); -- ����Į�� INDEX

-- INDEX ���̺��� Į���߿� ����ϰ� SELECT ����, ORDER BY ���ǿ� ���Ǵ� 
-- Į���� INDEX��� ������ �������ش�.
-- �⺻ ���̺�� ������ �˻�Į���� ���� ������ ���ڵ� �ּҸ��� ���� 
-- ������ �ý��� ���̺��̴�.
-- INDEX�� �׻� �˻� Į���� �������� ������ �Ǿ� �ִ�.
-- �׷��� �ε����� �Ǿ� �ִ� Į���� �������� �˻��� �ϸ�
-- �׷��� ���� Į���� �˻��� �� ���� ��û�� �ӵ� ����� �����ش�.
-- ��,
-- INSERT, UPDATE, DELETE�� �̷�������� ���� table�� INDEX�� ���ÿ� �����Ͽ����ϰ�
-- INDEX�� �����۾����� �����ؾ� �ϱ⶧���� ����� �ӵ����ϰ� �߻��� �� �ִ�.

-- PRIMARY KEY�� �ڵ����� �⺻ INDEX�� �����ȴ�.
-- PK : NOT NULL, UNIQUE, INDEX�� �⺻ ����


CREATE TABLE tbl_bbs_files(
    ID          NUMBER  PRIMARY KEY,
    PARENT_ID   NUMBER  NOT NULL,
    FILE_NAME   NVARCHAR2(125),
    SAVE_FILE_NAME  NVARCHAR2(125)
);


-- tbl_board�� tbl_bbs_files�� ����Ű ����
--ALTER TABLE tbl_bbs_files
--ADD CONSTRAINT fk_bbs_files FOREIGN KEY (PARENT_ID)
--REFERENCES tbl_board(id)

-- tbl_bbs_files�� �����ߴµ� ������ ����ϱ� ����
-- tbl_board�� 1���� ������ ������ Į���� �߰�
ALTER TABLE tbl_board ADD b_image nVARCHAR2(125);

DESC tbl_board;

SELECT * FROM tbl_board
ORDER BY b_date DESC, b_time DESC;




