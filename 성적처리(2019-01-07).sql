-- 여기는 gradeUser로 접속한 화면입니다.

SELECT * FROM tbl_student;

-- 20번 학생의 정보를 조회
SELECT * FROM tbl_student Where st_num ='00020';

SELECT * FROM tbl_student WHere st_num = 20; --숫자만 들어 있을 경우 검색 되고 문자가 들어있으면 검색이 안된다.

SELECT * FROM tbl_student WHERE st_name LIKE '%홍%';

SELECT * FROM tbl_student WHERE st_num = 00010;