-- mybts����ȭ��

SELECT * 
FROM tbl_files F
LEFT JOIN tbl_memo M
    ON F.parent_id= M.id;
    
-- tbl_memo�� �����ϸ�
-- tbl_files�� �����ȴ�
-- FK on delete cascade�� �����߱� ����
DELETE FROM tbl_memo;
SELECT * FROM tbl_files;
commit;