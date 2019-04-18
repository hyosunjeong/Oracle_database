-- mybts


-- 단일 칼럼 인덱스
CREATE INDEX idx_board_date ON tbl_board(b_date DESC);
CREATE INDEX idx_board_time ON tbl_board(b_time DESC);

-- pagination을 만들기 위한 쿼리
-- 오라클에서는 몇 개의 필요한 개수만 SELECT하는 기능이 없기 때문에
-- ROWNUM라는 가상의 칼럼을 만들어서 필요한 개수만큼 SELECT 하는데
-- ROWNUM가 ORDER BY 옵션이 포함되면서 순서가 엉망이 되어
-- 원하는 기능을 구현할 수 없다.
-- 그래서 SUB QUERY를 사용해서 트릭으로 구현을 한다.


SELECT ROWNUM,BM.* FROM
(SELECT * FROM tbl_board ORDER BY b_date DESC, b_time DESC) BM
WHERE ROWNUM BETWEEN 1 AND 10;

DROP INDEX idx_board_date;
DROP INDEX idx_board_time;

-- 다중 칼럼 인덱스
CREATE INDEX idx_board ON tbl_board(b_date DESC, b_time DESC);

SELECT * FROM tbl_board WHERE b_date > '0000-00-00';

SELECT * FROM
(SELECT ROWNUM R, B.* FROM tbl_board B
WHERE b_date > '0000-00-00') M
WHERE R BETWEEN 10 AND 20;







