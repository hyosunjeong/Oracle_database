-- ����� myuser�� ������ ȭ���Դϴ�.

CREATE TABLE tbl_employee(
    strEmtNo CHAR(3) PRIMARY KEY,
    strName nVARCHAR2(20) NOT NULL,
    strJob nVARCHAR2(20),
    intSal NUMBER(10),
    strDeptNo nVARCHAR2(20)
);

INSERT INTO tbl_employee
VALUES('001','ȫ�浿','�λ����',2500000,'�ѹ���');

INSERT INTO tbl_employee
VALUES('002','�̸���','�������',2500000,'������');

INSERT INTO tbl_employee
VALUES('003','������','�޿�����',2500000,'�ѹ���');

INSERT INTO tbl_employee
VALUES('004','����','�������',2500000,'�����');

INSERT INTO tbl_employee
VALUES('005','�Ӱ���','ǰ������',2500000,'�����');

SELECT * FROM tbl_employee ORDER BY strEmtNo;


-- ���ǰ˻�
-- � Į���� ����� ���� �������� ����Ʈ�� �����ϴ� ��
SELECT strEmtNo,strName,strJob,intSal,strDeptNo
FROM tbl_employee
WHERE strDeptNo = '�ѹ���';

-- tbl_employee ���̺��� strDeptNo�� �μ��� ��Ÿ���� Į���̴�.
-- �� ȸ�翡�� �μ����� �Ϻ� ����Ǵµ�,
-- �ѹ��θ� �λ�����η� �����ϰ��� �Ѵ�.
UPDATE tbl_employee 
SET strDeptNo = '�λ������'
WHERE strDeptNo = '�ѹ���';

-- ���Ի���� �Ի縦 �Ѵ�.
-- ���Ի�� ������ �߰��Ѵ�.
    -- �̸� : ��ϼ�, ���� : �λ纸��, �μ�: �λ������
INSERT INTO tbl_employee
VALUES ('006','��ϼ�','�λ纸��',1500000,'�λ������');    

SELECT * FROM tbl_employee;


-- ȸ�� ��ü�� �μ� ������ �ٽ� �õ��Ѵ�.
-- �ٸ� �μ��� �̸��� 3�����ε�
-- ���� �λ�����θ� 5���ڿ��� ������ �ȵ�� �Ѵ�.
-- �λ�����θ� �λ�η� �����ϰ��� �Ѵ�.
UPDATE tbl_employee
SET strDeptNo = '�λ��'
WHERE strDeptNo = '�λ������';


-- tbl_emp ���̺��� ��2����ȭ(2NF)�� �ϱ� ����
-- 1. �μ����̺��� �����ϰ�
-- 2. �μ������� �߰��� ���´�.

CREATE TABLE tbl_dept( --�μ����̺�
    strDeptNo CHAR(3) PRIMARY KEY,
    strDeptName nVARCHAR2(20) NOT NULL,
    strDeptChief nVARCHAR2(20)
);


INSERT INTO tbl_dept VALUES ('01','�ѹ���','ȫ�浿');
INSERT INTO tbl_dept VALUES ('02','������','�̸���');
INSERT INTO tbl_dept VALUES ('03','�����','����');
INSERT INTO tbl_dept VALUES ('04','�����','�Ӳ���');

SELECT * FROM tbl_employee ORDER BY strEmtNo;

--3. tbl_emp ���̺��� strDeptNoĮ���� strDeptName���� ����
ALTER TABLE tbl_employee RENAME COLUMN strDeptNo TO strDeptName;

SELECT * FROM tbl_employee;

-- 4. tbl_emp ���̺� strDeptNo(3) Į���� �߰��Ѵ�.
-- ���θ��� �μ����̺��� �μ���ȣ(�ڵ�) Į���� ���� �������� 
-- ���ο� Į���� ���
ALTER TABLE tbl_employee ADD strDeptNo CHAR(3);

-- ���̺��� Į���� ����, �߰�, ������ �Ŀ� 
-- ���� ������ ���� ���
DESCRIBE tbl_employee;
DESC tbl_employee;

SELECT * FROM tbl_employee;

-- 5. tbl_emp���̺��� strDetpNo Į���� 
-- tbl_dept ���̺� ������ �����Ͽ� �ش��ϴ� no�� UPDATE�Ѵ�.
UPDATE tbl_employee
SET strDeptNo = '01'
WHERE strDeptName = '�λ��';

UPDATE tbl_employee
SET strDeptNo = '02'
WHERE strDeptName = '������';

UPDATE tbl_employee
SET strDeptNo = '03'
WHERE strDeptName = '�����';

SELECT * FROM tbl_employee;

-- 6.strDeptName Į���� �����Ѵ�.
-- ���ǻ��� : ��� �������� strDeptNo�� ���������� 
-- Ȯ���ϴ� ������ �ݵ�� ���ľ� �Ѵ�.
ALTER TABLE tbl_employee DROP COLUMN strDeptName;

SELECT * FROM tbl_employee;


SELECT E.strEmtNo, E.strName, E.strJob, E.strDeptNo, D.strDeptName
FROM tbl_employee E, tbl_dept D
WHERE E.strDeptNo = D.strDeptNo
ORDER BY strEmtNo;
 

 SELECT * FROM tbl_dept;
 
-- ������ �ѹ��θ� �λ�����η� ����
 UPDATE tbl_dept
 SET strDeptName = '�λ������'
 WHERE strDeptNo = '01';
 
-- ���� �� ������ Ȯ��
SELECT E.strEmtNo, E.strName, E.strJob, E.strDeptNo, D.strDeptName
FROM tbl_employee E, tbl_dept D
WHERE E.strDeptNo = D.strDeptNo
ORDER BY strEmtNo;





