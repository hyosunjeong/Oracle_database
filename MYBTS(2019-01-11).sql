-- ����� myBTs�� ������ ȭ���Դϴ�.

-- mySQL
SHOW TABLES;

-- Oracle
SELECT * FROM DBA_TABLES;
-- myBTS�� ������ TABLE�� �����޶�
SELECT * FROM DBA_TABLES WHERE OWNER = 'MYBTS';

-- ���̺��� ������ ����ʹ�. ��� CREATE �Ǿ����� Ȯ��
DESC tbl_student;
DESC tbl_score;

-- �������� Ȯ��
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_SEQUENCES;

-- ������ ���� ��Ű��
SELECT SEQ_SCORE.NEXTVAL FROM DUAL;

SELECT* FROM tbl_score;


DELETE FROM tbl_score;

-- ID���� PK�� ������ ��� �ٸ� TABLE�� JOIN�� �� �� Key�� ���Ǵ� ��찡 �ִ�. 
-- �׷��� ���� �����͸� �����ϰ� ���ο� �����͸� �߰� �� ���� ������ ����ϴ� id���� ������� �ʴ´�.
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','001',80 );
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','002',70 );
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','003',60 );
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','004',50 );
INSERT INTO tbl_score(id,st_num,sc_sb_code,sc_score) VALUES ( SEQ_SCORE.nextval,'00001','005',90 );

select * from tbl_score;



-- ���� view�� �����Ͽ� java�� �����Ͽ� ����� ���
-- �� AS Į������ �̸��� vo�� �ɹ������� �����ؾ� �ϴµ�
-- �ѱ۷� �ۼ��� ��� member������ �ѱ۷� �ۼ��ؾ��Ѵ�.
-- �ǹ������� �ѱۻ���� �����ϴ� ����� ������ �������� �ۼ��Ѵ�.
CREATE VIEW view_score_sum
AS
select st_num,
    SUM(DECODE(sc_sb_code,'001',sc_score,0)) AS ss_kor,
    SUM(DECODE(sc_sb_code,'002',sc_score,0)) AS ss_eng,
    SUM(DECODE(sc_sb_code,'003',sc_score,0)) AS ss_math,
    SUM(DECODE(sc_sb_code,'004',sc_score,0)) AS ss_sci,
    SUM(DECODE(sc_sb_code,'005',sc_score,0)) AS ss_music
FROM tbl_score
GROUP BY st_num;


SELECT * FROM view_score_sum;

SELECT * FROM tbl_student;
SELECT * FROM tbl_score;



