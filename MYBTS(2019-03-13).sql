-- mybts접속화면

SELECT * 
FROM tbl_files F
LEFT JOIN tbl_memo M
    ON F.parent_id= M.id;
    
-- tbl_memo를 삭제하면
-- tbl_files도 삭제된다
-- FK on delete cascade를 설정했기 때문
DELETE FROM tbl_memo;
SELECT * FROM tbl_files;
commit;