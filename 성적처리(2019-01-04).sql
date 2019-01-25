-- 성적처리를 위한 gradeUser로 접속한 화면

SELECT * FROM tbl_student;

-- 학번으로 조건 검색
SELECT * FROM tbl_student WHERE st_num ='003';

-- 학생의 이름으로 검색
SELECT * FROM tbl_student WHERE st_name = '배칠수';

-- 학생의 이름이 같은 데이터가 있는지 확인 (= 중복된 이름이 있는지 확인)
-- 이름 칼럼으로 GROUP BY를 실행해서 결과를 확인한다.
SELECT st_name, COUNT(st_name) 
FROM tbl_student
GROUP BY st_name;

SELECT * FROM tbl_student WHERE st_name = '윤정희';

SELECT * FROM tbl_student;

-- SELECT를 수행할 때 (특별히 문자열일 경우) 값의 전체를 알지 못하고
-- 일부만을 알고 있을 때, 부분 문자열 검색
-- 부분 문자열 검색은 데이터의 SQL 명령문중에 가장 성능이 떨어지는 실행
-- 따라서 특별한 경우가 아니면 가급적 사용하지 않는 것이 좋다.

SELECT * FROM tbl_student WHERE st_name LIKE '김%';

-- 서울 이라는 문자열로 시작되는 모든 데이터
SELECT * FROM tbl_student WHERE st_addr LIKE '서울%';

-- st_name 칼럼에 정이라는 문자열이 포함된 데이터
SELECT * FROM tbl_student WHERE st_name LIKE '%정%';


SELECT * FROM tbl_student WHERE st_name LIKE '%윤' OR st_name LIKE '%정%' OR st_name LIKE '%철%';  -- LIKE 키워드를 쓰면 순차검색으로 성능이 떨어진다.


--  private String sc_num;
--	private int sc_kor;
--	private int sc_eng;
--	private int sc_math;

CREATE TABLE tbl_score(
    sc_num CHAR(5) PRIMARY KEY,
    sc_kor NUMBER(3),
    sc_eng NUMBER(3),
    sc_math NUMBER(3)
    );
