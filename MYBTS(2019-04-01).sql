-- mybts

-- INDEX�� b_date, b_time���� ������ ���¿��� ����� �� �ִ� SQL
SELECT * FROM
(SELECT ROWNUM R, B.* FROM tbl_board B
WHERE b_date > '0000-00-00') M
WHERE R BETWEEN 10 AND 20;

-- INDEX ���� ���ڵ� ��ȣ 10������ 20������ ����Ʈ�� SELECT 
SELECT M.* FROM 
    (SELECT ROW_NUMBER() OVER (ORDER BY B_DATE  DESC, B_TIME DESC) R,
        B_DATE D, B_TIME, B_SUBJECT, B_CONTENT
FROM tbl_board) M
WHERE M.R BETWEEN 10 AND 20;
