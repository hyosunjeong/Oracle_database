-- 여기는 myMem으로 접속한 화면입니다.

-- GROUP BY를 이용해서 어떤 Table 데이터로부터 중복되지 않은 List를 추출하기
    -- SELECT를 실행했을때 같은 값을 가진 LIST가 다수 나타나는데
    -- 그들의 대표값 1개씩만 추출하고 싶을때 
-- GROUP BY절을 사용해서 SQL을 작성한다.
SELECT Io_inout FROM tbl_iolist;
SELECT io_inout FROM tbl_iolist GROUP BY io_inout;

-- 중복되지 않은 상품 리스트를 추출하는 SQL
SELECT io_coname FROM tbl_iolist GROUP BY io_coname;

SELECT d_name FROM tbl_dept; --거래처정보에서 거래처명을 보여줘라

-- 거래처명이 중복된 것을 묶어서 리스트로 보여달라 
SELECT d_name FROM tbl_dept GROUP BY d_name; -- => 거래처이름을 묶어서 중복된 내용은 하나만 보여줘라
SELECT d_name, d_ceo FROM tbl_dept GROUP BY d_name, d_ceo;

SELECT io_coname, count(io_coname) FROM tbl_iolist GROUP BY io_coname;
SELECT d_name,d_ceo, count(d_name) FROM tbl_dept GROUP BY d_name, d_ceo;