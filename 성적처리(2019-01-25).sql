-- gradeUser�� ������ ����ó�� ȭ���Դϴ�.

SELECT * FROM tbl_student;

DESC tbl_score;
DROP TABLE tbl_score;

-- ID	�й�	����	����
CREATE TABLE tbl_score(
    sc_id NUMBER PRIMARY KEY,
    sc_st_num VARCHAR2(5) NOT NULL,
    sc_subject VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3)
);

-- ��ü ������ ����
SELECT * FROM tbl_score;

-- ����Ʈ �Ŀ��� �������� ������ Ȯ��
SELECT COUNT(*) FROM tbl_score;

-- �������̺� ����
-- �����ȣ, �����, ��米��
CREATE TABLE tbl_subject(
    su_num VARCHAR2(3) PRIMARY KEY,
    su_name nVARCHAR2(20) NOT NULL,
    su_pro nVARCHAR2(30)
);
-- ��� Į���� �����Ͱ� ���� ��� ����ϴ� ���
-- VALUES���� ������ ����Ʈ�� ���̺� ������ �� ������ �ۼ�
INSERT INTO tbl_subject VALUES('001','����','ȫ�浿');

-- �Ϻ� Į������ �����Ͱ� ���� ��� ����ϴ� ���
-- VALUES���� ���̺�� ������ ������ Į���� ��ġ�ϴ� �����͸� ������� �ۼ�
INSERT INTO tbl_subject(su_num, su_name) VALUES ('002','����');

-- ���̺��� ������ ����� Į�� ������ �𸣰ų�
-- ��Ȯ�� Į���� ��ġ�ǵ��� �����͸� �ۼ��ϴ� ���
INSERT INTO tbl_subject(su_name, su_num, su_pro) VALUES('����','003','������');

INSERT INTO tbl_subject(su_num, su_name) VALUES('004','����');

INSERT INTO tbl_subject(su_num, su_name) VALUES('005','����');

INSERT INTO tbl_subject(su_num, su_name) VALUES('006','����');

SELECT * FROM tbl_subject order by su_num;

-- �����͸� �Է� �� �� Ȯ�� �� ���� ���� �����Ͱ� 2���� �ִ�.
-- �غ�� ���� �����͸� Ȯ���� �ô��� �����ȣ 006�� ������ �ƴϰ� �����̴�.
-- �ش��ϴ� �����͸� �����Ϸ��� �Ѵ�.

-- �����ȣ 006�� ������� ���ǿ��� �������� �ٲ۴�.
-- USW (UPDATE SET WHERE)
UPDATE tbl_subject SET su_name='����' WHERE su_num='006';

INSERT INTO tbl_subject(su_num, su_name) VALUES('900','��������');
SELECT * FROM tbl_subject order by su_num;

-- �����͸� Ȯ���غ��� �����ȣ 900 �̶�� �׸��� �ִ�.
-- �� �����͸� �����Ϸ��� �Ѵ�. 
-- DFW (DELETE FROM WHERE)
DELETE FROM tbl_subject WHERE su_num='900';
SELECT * FROM tbl_subject order by su_num;


-- ���� ���̺��� �����͸� Ȯ���ϴµ� ����Į���� �����͵��� ������� �ƴ� �����ȣ�� �Ǿ��ִ�.
-- � �������� �˱Ⱑ �ſ� ��ƴ�. 
-- ���� ���̺�� �������̺��� join�ؼ� ��ȸ�� �Ϸ��� �Ѵ�.
SELECT SC.sc_st_num,SC.sc_subject,SU.su_name, SC.sc_score    -- �й�,�����ȣ,�����,��������
FROM tbl_score SC -- Ȯ���ϰ��� �ϴ� ��(main) ���̺�
LEFT JOIN tbl_subject SU -- ��(main) ���̺��� ��ȸ�� �����ִ� sub ���̺�
ON SC.sc_subject = SU.su_num; -- �� ���̺��� �����ϱ� ���� ���ǹ�

-- ���� ��ȸ�� �ϴµ� �л����� ��� ������ �������� Ȯ���ϱⰡ ��ƴ�.
-- �л����̺�� join �����ؼ� ��ȸ�� �Ϸ��� �Ѵ�.
SELECT SC.sc_st_num, ST.st_name, SC.sc_score -- �й�, �л��̸�, ����
FROM tbl_score SC -- Ȯ���ϰ��� �ϴ� ��(main) ���̺�
LEFT JOIN tbl_student ST -- ��(main) ���̺��� ��ȸ�� �����ִ� sub ���̺�
ON TRIM('00' || SC.sc_st_num) = TRIM(ST.st_num); -- �� ���̺��� �����ϱ� ���� ���ǹ�

-- �л������� �й� : 00001
-- ���������� �й� : 001
-- ���ڿ� ���� (�ڸ���) ���ߴ� ��� 
-- 1. ON TRIM('00'|| SC.sc_st_num) = TRIM(st.st_num) 
-- 2. ON RPAD(SC.sc_st_num,5,'0')
SELECT RPAD('3',5,'0') FROM DUAL;
SELECT LPAD('3',5,'0') FROM DUAL;
-- ���ڿ� �ռ�
SELECT 'KOREA' || '�� �츮����' FROM DUAL;

select '00' || SC_ST_NUM from TBL_SCORE ;

-- �������̺�� �л����̺��� �й� Į���� type�� �޶� JOIN�� ������� �����Ƿ� Į���� �����Ѵ�.
ALTER TABLE tbl_student MODIFY st_num VARCHAR2(5);
ALTER TABLE tbl_score MODIFY sc_st_num VARCHAR2(5);


-- �л����̺�� �������̺��� �������̺� ���ÿ� join �����ؼ� view �ϱ�
-- SELECT�� �ؼ� ��ȸ�� ����� VIEW�� �����Ϸ���
-- AS(�˸��ƽ�)�� ����� �ش�.
CREATE VIEW view_score
AS
SELECT 
    SC.sc_st_num AS �й�,
    ST.st_name AS �л��̸�,
    SC.sc_subject AS �����ȣ,
    SU.su_name AS �����̸�,
    SC.sc_score AS ����
FROM tbl_score SC

    LEFT JOIN tbl_student ST
    ON TRIM('00' || SC.sc_st_num) = TRIM(ST.st_num)
    
    LEFT JOIN tbl_subject SU
    ON SC.sc_subject = SU.su_num
ORDER BY sc.sc_st_num; --�й������� ����

DROP VIEW view_score;


-- view score�� �������̺�, �л����̺�, �������̺��� JOIN�� view�̴�.
SELECT * FROM view_score;

-- view_score�� ����ؼ� SELECT ����
SELECT * FROM view_score;

-- �й� �̸� ���� ������ view ����
SELECT �й�, �л��̸�, SUM(����), AVG(����)
FROM view_score
GROUP BY �й�, �л��̸�
ORDER BY �й�;

-- �й�, �̸�, ����, ����, ����, ����, ����, ����
-- 1. �л��� ������ �߿��� ��������� ������ ���� �� �� �����ִ� ���
SELECT �й�, �л��̸�,
     SUM(DECODE(�����ȣ,'001',����)) AS ����
FROM view_score
GROUP BY �й�, �л��̸�
ORDER BY �й�;

-- 2. �� �л��� ������ �������� ���ڵ忡 ������ �ΰ� view�� �� �� �϶�ǥ ó�� ���̴� SQL
CREATE VIEW �����϶�ǥ
AS
SELECT �й�, �л��̸�,
     SUM(DECODE(�����ȣ,'001',����)) AS ����,
     SUM(DECODE(�����ȣ,'002',����)) AS ����,
     SUM(DECODE(�����ȣ,'003',����)) AS ����,
     SUM(DECODE(�����ȣ,'004',����)) AS ����,
     SUM(DECODE(�����ȣ,'005',����)) AS ����,
     SUM(����) AS ����,
     AVG(����) AS ���,
     RANK() OVER( ORDER BY AVG(����) DESC) AS ����
     
FROM view_score
GROUP BY �й�, �л��̸�
ORDER BY ���� ;

-- GROUP BY�� ����ؼ� SQL�� �ۼ��ϴ� ���
-- SUM, AVG, COUNT, MAX, MIN, RANK �� ����Լ��� ������ �ʴ� Į���̳�, 
-- ���ĵ��� ��� GROUP BY�� �ۼ��� �־���Ѵ�.

SELECT * FROM �����϶�ǥ
ORDER BY �й�;

-- Ư���� Į���� Ȯ���ϰ� ���� ��
-- SELECT Į����,Į����,Į���� FROM ���̺��;
select �й�, �л��̸�, ���� FROM �����϶�ǥ;

-- ��� Į���� Ȯ���ϰ� ���� �� 
SELECT * FROM �����϶�ǥ;

-- VIEW������ INSERT�� �ȵ�

-- �����͸� �߰��� �� 
-- INSERT�� �� �� Į���� ������ ���� ������
INSERT INTO tbl_subject(su_num, su_name, su_pro)
VALUES('009','��������','�̸���');

-- UPDATE�Ҷ��� ������ Į���� ������ ����Ǿ� �ִ��� ������� �� ��
-- �ݵ�� WHERE ���� ����� ��
-- Ư���� ��찡 �ƴϸ� �Ѱ��� ���ڵ庰�� UPDATE�� ������ ��
UPDATE tbl_subject SET su_pro = '�Ӳ���' WHERE su_num = '009';

-- DELETE�� FROM Ű���� ���̿��� �ƹ��͵� �ۼ����� �� ��
-- �ݵ�� WHERE ���� ����� �� 
-- Ư���� ��찡 �ƴϸ� �Ѱ��� ���ڵ徿 ������ ������ ��
DELETE FROM tbl_subject WHERE su_num = '009';

