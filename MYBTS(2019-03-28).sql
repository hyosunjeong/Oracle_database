-- mybts


-- ���� Į�� �ε���
CREATE INDEX idx_board_date ON tbl_board(b_date DESC);
CREATE INDEX idx_board_time ON tbl_board(b_time DESC);

-- pagination�� ����� ���� ����
-- ����Ŭ������ �� ���� �ʿ��� ������ SELECT�ϴ� ����� ���� ������
-- ROWNUM��� ������ Į���� ���� �ʿ��� ������ŭ SELECT �ϴµ�
-- ROWNUM�� ORDER BY �ɼ��� ���ԵǸ鼭 ������ ������ �Ǿ�
-- ���ϴ� ����� ������ �� ����.
-- �׷��� SUB QUERY�� ����ؼ� Ʈ������ ������ �Ѵ�.


SELECT ROWNUM,BM.* FROM
(SELECT * FROM tbl_board ORDER BY b_date DESC, b_time DESC) BM
WHERE ROWNUM BETWEEN 1 AND 10;

DROP INDEX idx_board_date;
DROP INDEX idx_board_time;

-- ���� Į�� �ε���
CREATE INDEX idx_board ON tbl_board(b_date DESC, b_time DESC);

SELECT * FROM tbl_board WHERE b_date > '0000-00-00';

SELECT * FROM
(SELECT ROWNUM R, B.* FROM tbl_board B
WHERE b_date > '0000-00-00') M
WHERE R BETWEEN 10 AND 20;







