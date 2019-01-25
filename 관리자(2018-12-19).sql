-- ����� ������ ȭ���Դϴ�.
CREATE USER myuser1 IDENTIFIED BY 1111;
-- TABLESPACE�� SYSTEM TABLESPACE�� �ڵ� �����ȴ�
-- ���� ȯ�濡���� �ſ� ������ ����̴�.

GRANT CREATE TABLE TO myuser1;
GRANT SELECT, UPDATE, INSERT ON [table] TO myuser1;

CREATE TABLESPACE mytsA 
DATAFILE 'd:bizwork/ordata/mytsa.dbf'
SIZE 100M 
AUTOEXTEND ON NEXT 100K;

-- ����� ����� ������ �� ���̺����̽��� �������ʰ�
-- TABLE���� �����ϸ� ������ TABLE���� SYSTEM TS�� �����Ǿ�
-- ���߿� ���̺����̽��� ���� �� �ű���� ���� ������ �߻��Ѵ�.
-- ���� ����ڸ� �����ϰ� ���̺��� ����� ���� ���̺����̽��� �ݵ�� �����ϰ�
-- ������� DEFAULT TABLESPACE�� ������ �־���Ѵ�.

ALTER USER myuser1 DEFAULT TABLESPACE mytsA;

CREATE TABLE EMP_TABLE(
    EMPNO CHAR(6) PRIMARY KEY,--�����ȣ
    EMPNAME nVARCHAR2(20) NOT NULL, -- �����
    EMPBIRTH CHAR(8), -- �������
    DEPTNO CHAR(3) NOT NULL, -- �μ���ȣ
    HREDATE CHAR(10) NOT NULL -- �Ի�����
);

INSERT INTO EMP_TABLE VALUES('170001','ȫ�浿','880212','001','2015-12-01');
INSERT INTO EMP_TABLE VALUES('170002','�̸���','770215','003','2001-03-07');
INSERT INTO EMP_TABLE VALUES('170003','������','820513','003','2004-11-14');
INSERT INTO EMP_TABLE VALUES('170004','�庸��','941102','004','2018-05-20');
INSERT INTO EMP_TABLE VALUES('170005','�Ӳ���','801212','001','2008-07-25');

SELECT * FROM EMP_TABLE;

UPDATE emp_table SET hredate = '2018-03-01' WHERE empname = '�庸��';
-- �� SQL�� ���� �����ͻ����δ� ������ ����̳�
-- �����Ͱ� ������ ��� �̸��� �庸���� ����� �ߺ����� �ʴ´ٴ� ������ ����.
-- ���� ����� �̸��� �������� ������ �õ��ϴ°��� �����͹��Ἲ�� ��ġ�� �ſ� ������ ����̴�.
-- 1. ������Ʈ�� �ϱ����� �����ϰ����ϴ� ������ ��ȸ�ؾ��Ѵ�.
SELECT * FROM emp_table WHERE empname ='�庸��'; -- ��Ÿ ���� ������ �����ؼ� �˻�
-- 2. ��ȸ�� ������ �߿��� �����ϰ��� �ϴ� �������� PK�� �Լ��Ѵ�.
    -- ���⿡�� ��ȸ�� PK : 170004
-- 3. ��ȸ�� PK�� �̿��ؼ� ������ ������ �õ��Ѵ�.
UPDATE emp_table SET hredate = '2018-03-01' WHERE empno = '170004';

