-- mybts 접속 화면 

DELETE TBL_BOARD;

SELECT * FROM tbl_board;

-- 게시판 리스트 보기

SELECT b_date,b_time,b_subject FROM tbl_board ORDER BY b_date DESC,b_time DESC; -- 내림차순정렬

-- 오라클에서는 일정한 갯수만큼의 데이터를 추출 할 때 별다른 키워드나 기능들이 없으므로
-- ROWNUM이라는 키워드로 칼럼을 만들고, ROWNUM 범위의 데이터를 잘라서 SELECT를 수행한다.
-- 만약 데이터를 ORDER BY로 정렬을 했을 경우 
-- ROWNUM이 엉뚱하게 부여되어 원하는 데이터를 추출할 수 없다.
SELECT ROWNUM, b_userid, b_date, b_time, b_subject
FROM tbl_board
WHERE ROWNUM BETWEEN 1 AND 10
ORDER BY b_date DESc, b_time DESC;

-- 위와 같은 ISSUER가 있어서 오라클에서는 약간의 꼼수로 SUB QUERY를 사용한다.
-- 1. 전체 데이터를 원하는 칼럼으로 정렬을 수행
-- 2. 정렬된 데이터를 가상의 테이블로 삼는다
-- 3. 그 테이블로부터 select를 수행하면서
-- 4. ROWNUM 칼럼을 부착하여
-- 5. 범위를 지정한다.


-- 서브쿼리로 등록해서 실행
SELECT ROWNUM, M.b_userid, M.b_date, M.b_time, M.b_subject 
FROM 
    (SELECT id, b_userid, b_date,b_time,b_subject 
    FROM tbl_board 
    ORDER BY b_date DESC,b_time DESC) M
WHERE ROWNUM BETWEEN 1 AND 10;

-- 서브쿼리를 작성하여 범위를 지정할 때의 가장 큰 문제점
-- 전체데이터를 정렬하는 과정에서 속도저하 발생
-- 조금이나마 성능 개선을 위해서 INDEX라는 것을 활용해 본다.

CREATE INDEX idx_board ON tbl_board(b_date,b_time); -- 다중칼럼 INDEX
CREATE INDEX idx_board_subject ON tbl_board(b_subject); -- 단일칼럼 INDEX

-- INDEX 테이블의 칼럼중에 빈번하게 SELECT 조건, ORDER BY 조건에 사용되는 
-- 칼럼을 INDEX라는 것으로 생성해준다.
-- 기본 테이블과 별도로 검색칼럼과 실제 데이터 레코드 주소만을 갖는 
-- 일종의 시스템 테이블이다.
-- INDEX는 항상 검색 칼럼을 기준으로 정렬이 되어 있다.
-- 그래서 인덱스가 되어 있는 칼럼을 기준으로 검색을 하면
-- 그렇지 않은 칼럼을 검색할 때 보다 엄청난 속도 향상을 보여준다.
-- 단,
-- INSERT, UPDATE, DELETE가 이루어질때는 실제 table과 INDEX를 동시에 갱신하여야하고
-- INDEX는 정렬작업까지 수행해야 하기때문에 상당히 속도저하가 발생할 수 있다.

-- PRIMARY KEY는 자동으로 기본 INDEX로 설정된다.
-- PK : NOT NULL, UNIQUE, INDEX가 기본 설정


CREATE TABLE tbl_bbs_files(
    ID          NUMBER  PRIMARY KEY,
    PARENT_ID   NUMBER  NOT NULL,
    FILE_NAME   NVARCHAR2(125),
    SAVE_FILE_NAME  NVARCHAR2(125)
);


-- tbl_board와 tbl_bbs_files를 참조키 설정
--ALTER TABLE tbl_bbs_files
--ADD CONSTRAINT fk_bbs_files FOREIGN KEY (PARENT_ID)
--REFERENCES tbl_board(id)

-- tbl_bbs_files를 생성했는데 간단히 사용하기 위해
-- tbl_board에 1개의 파일을 저장할 칼럼을 추가
ALTER TABLE tbl_board ADD b_image nVARCHAR2(125);

DESC tbl_board;

SELECT * FROM tbl_board
ORDER BY b_date DESC, b_time DESC;




