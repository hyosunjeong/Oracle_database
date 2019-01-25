-- ����� MYBTS�� ������ ȭ���Դϴ�.

-- ���ο� ���̺��� ����
CREATE TABLE tbl_student(
    st_num  VARCHAR2(5)  PRIMARY KEY, -- CHAR >> VARCHAR2
    st_name nVARCHAR2(20)   NOT NULL,
    st_grade    CHAR(2),
    st_tel nVARCHAR2(20)
);
-- tbl_student ���̺��� st_num Į���� VARCHAR2�� ����
ALTER TABLE tbl_student MODIFY st_num VARCHAR2(5);

CREATE TABLE tbl_score(
    id NUMBER PRIMARY KEY,
    st_num VARCHAR2(5) NOT NULL, -- CHAR >> VARCHAR2
    sc_sb_code VARCHAR2(3) NOT NULL, -- CHAR >> VARCHAR2
    sc_score NUMBER
);
-- tbl_score ���̺��� st_num Į���� VARCHAR2�� ����
ALTER TABLE tbl_score MODIFY st_num VARCHAR2(5);

-- tbl_score ���̺��� sc_sb_code Į���� VARCHAR2�� ����
ALTER TABLE tbl_score MODIFY sc_sb_code VARCHAR2(5);

DROP TABLE tbl_student;

INSERT INTO tbl_student(st_num,st_name,st_grade,st_tel) VALUES('00001','ȫ�浿','1','0010010001');
INSERT INTO tbl_student VALUES('00002','001-001-0001','1','�̸���');

-- Į������ �ٿ������ν� Į���� �°� �����Ͱ� �� �� �ֵ��� ���ش�.
INSERT INTO tbl_student(st_name,st_num,st_grade,st_tel)VALUES('������','00002','2','0020020002');

SELECT * FROM tbl_student;

-- �����͸� Ȯ���ߴ��� �̸��� �����Ͱ� �߸� �ԷµȰ��� Ȯ���ߴ�. 
-- �̸��浥���Ϳ� st_nameĮ���� �̸������� �ٲٰ�  st_tel Į���� 001-001-0001�� �ٲٷ��� �Ѵ�.
-- => ���� st_nameĮ���� ���� 001-001-0001�ε� �̸������� �ٲٰ��� �Ѵ�.
UPDATE tbl_student
SET st_name ='�̸���', st_tel = '001-001-0001'
WHERE st_num ='00002';

SELECT * FROM tbl_student;

INSERT INTO tbl_student(st_num,st_name,st_grade,st_tel)
VALUES('00004','ȫ�浿','1','001-001-0001');
SELECT * FROM tbl_student;

-- �Էµ� �����Ϳ� ȫ�浿�� 2���� �ߺ��ǿ� �ԷµǾ� �ִ�.
-- �� �� �ι�° �Էµ� ȫ�浿�� �����ϰ��� �Ѵ�.
-- 1. �ߺ��� �����Ͱ� �� �ִ��� Ȯ���� �Ѵ�.
    -- ȫ�浿 �����Ͱ� �� �ִ��� ���� Ȯ������
SELECT * FROM tbl_student WHERE st_name = 'ȫ�浿';    
-- 2. �����ϰ��� �ϴ� �������� PK�� Ȯ���Ѵ�.
-- ���⿡���� �ι�° �������� PK�� 00004���� Ȯ���ߴ�.��
DELETE FROM tbl_student WHERE st_num = '00004';

-- SELECT
-- FROM

-- INSERT
-- INTO
-- VALUES

-- UPDATE
-- SET
-- WHERE

-- DELETE
-- FROM
-- WHERE


DROP TABLE tbl_score;


CREATE TABLE tbl_score(
    id NUMBER PRIMARY KEY,
    st_num CHAR(5) NOT NULL,
    sc_sb_code CHAR(3) NOT NULL,
    sc_score NUMBER
);

--���� ���̺� ���� ����
ALTER TABLE tbl_score MODIFY st_num CHAR(5);

CREATE SEQUENCE SEQ_SCORE START WITH 1 INCREMENT BY 1;

INSERT INTO tbl_score(id,st_num,st_sb_code,st_score) VALUES (SEQ_SCORE.NEXTVAL, '00001','001',90);

SELECT * FROM tbl_score;

INSERT INTO tbl_score(id,st_num,st_sb_code,st_score) VALUES (SEQ_SCORE.NEXTVAL, '00001','001',90);
INSERT INTO tbl_score(id,st_num,st_sb_code,st_score) VALUES (SEQ_SCORE.NEXTVAL, '00001','001',90);
INSERT INTO tbl_score(id,st_num,st_sb_code,st_score) VALUES (SEQ_SCORE.NEXTVAL, '00001','001',90);
commit;