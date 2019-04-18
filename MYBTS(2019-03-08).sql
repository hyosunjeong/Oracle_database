-- mybts화면

CREATE TABLE tbl_user(
    userid CHAR(5) PRIMARY KEY,
    username nVARCHAR2(20),
    tel nVARCHAR2(20)
);

CREATE TABLE tbl_hobby(
    id NUMBER PRIMARY KEY,
    userid CHAR(5),
    hobby nVARCHAR2(20)
);

-- tbl user와 tbl hobby의 관계
-- tbl_user에서 userid는 중복되지 않으며 
-- tbl_user에서는 1개만 존재하는 값이다.

-- tbl_hobby table에서 userid는 여러개의 데이터가 있을 수 있으며
-- userid 칼럼을 기준으로 tbl_user와 1:다의 관계를 갖는다.

-- tbl_user와 tbl_hobby의 1:다의 관계를 FK로 설정한다

-- FK를 설정할 때는 다(多)의 위치에 있는 table을 기준으로 ALTER를 실행한다
ALTER TABLE tbl_hobby ADD FOREIGN KEY(userid) -- 다의 위치
REFERENCES tbl_user(userid)                   -- 1의 위치
ON DELETE CASCADE;                            -- 제약조건

-- FK의 조건
-- USER에 userid가 있으면 HOBBY에는 0개 이상의 userid가 있을 수 있다.
-- USER에 userid가 없으면 HOBBY에는 절대 있을 수 없다. 있어서는 안된다. 
--      USER에 없는 userid를 HOBBY에 추가하려고 하면 오류가 발생한다.
-- 만약 HOBBY에 있는 userid를 USER에서 삭제하려고 시도하면
-- FK의 조건에 위배되어 삭제 할 수 없다.
-- 방법 1: 먼저 HOBBY에 있는 userid를 모두 삭제하고 USER에 있는 userid 삭제
-- 방법 2: FK에 ON DELETE CASCADE를 설정 해 둔다.

