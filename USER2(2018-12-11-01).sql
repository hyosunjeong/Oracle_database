-- ����� user2 ȭ���Դϴ�.

CREATE TABLE tbl_grade(
    str_num CHAR(3) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)
);


INSERT INTO tbl_grade VALUES('001',80,70,60);
INSERT INTO tbl_grade VALUES('002',90,85,70);
INSERT INTO tbl_grade VALUES('003',95,70,65);
INSERT INTO tbl_grade VALUES('004',80,80,65);
INSERT INTO tbl_grade VALUES('005',85,95,90);

SELECT str_num, intKor, intEng, intMath FROM tbl_grade;

-- ���� �Էµ� �����Ͱ� ��¼�ٺ��� �й� ������ �ڼ��� 
-- �Է��� �Ǿ��ִ�. �� �����͸� �й������� ����ʹ�.
SELECT * FROM tbl_grade ORDER BY str_num;


SELECT * FROM tbl_users ORDER BY str_name ASC; -- �������� ����
SELECT * FROM tbl_users ORDER BY str_name DESC; --�������� ����(descending)


-- SUM, AVG �Լ��� �������
SELECT SUM(intKor), SUM(intEng), SUM(intMath) FROM tbl_grade; 

-- ����Լ��� Į������ ��� ����� �����ϴ� �Լ����̴�.

-- �� �л��� ������ �������
SELECT str_num, intKor, intEng, intMath,
    (intKor+intEng+intMath) AS ����
FROM tbl_grade;    

-- �� �л��� ��յ� �������
SELECT str_num, intKor, intEng, intMath,
    (intKor+intEng+intMath) AS ����,
     (intKor+intEng+intMath)/3 AS ���
FROM tbl_grade;    

--tbl_grade�� �����͸� ��ü ����
DELETE FROM tbl_grade;

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('001',
    ROUND( DBMS_RANDOM.VALUE(50,100),0),
    ROUND( DBMS_RANDOM.VALUE(50,100),0),
    ROUND( DBMS_RANDOM.VALUE(50,100),0)
    );

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('002',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
    );


INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('003',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
    );


INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('004',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
    );


INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('005',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
    );


SELECT * FROM tbl_grade
ORDER BY str_num;

SELECT str_num, intKor, intEng, intMath,
    (intKor+intEng+intMath) AS ����,
   ROUND( (intKor+intEng+intMath)/3,2) AS ���
FROM tbl_grade;


-- ������ ����Ͽ� ���������� ǥ���ϴ� ���
SELECT str_num, intKor, intEng, intMath,
    (intKor+intEng+intMath) AS ����,
    ROUND( (intKor+intEng+intMath)/3,2) AS ���,
    RANK() 
            OVER(ORDER BY(intKor+intEng+intMath) DESC) AS ����
FROM tbl_grade
ORDER BY str_num;



SELECT  str_num, intKor, intEng, intMath,
    (intKor+intEng+intMath) AS ����,
    ROUND( (intKor+intEng+intMath)/3,2) AS ���
FROM tbl_grade WHERE ROUND((intKor+intEng+intMath)/3,2) >=70 ;


SELECT   str_num, intKor, intEng, intMath,
    (intKor+intEng+intMath) AS ����,
    ROUND( (intKor+intEng+intMath)/3,2) AS ���
FROM tbl_grade WHERE ROUND((intKor+intEng+intMath)/3,2) <50;







