-- 여기는 MyBTS 접속 화면

CREATE TABLE tbl_member(
    id NUMBER PRIMARY KEY,
    m_userid nVARCHAR2(30) NOT NULL,
    m_password nVARCHAR2(125) NOT NULL,
    m_name nVARCHAR2(125) NOT NULL,
    m_tel nVARCHAR2(20),
    m_city nVARCHAR2(20),
    m_addr nVARCHAR2(125),
    CONSTRAINT U_userid UNIQUE (m_userid) -- 테이블을 생성할 때 UNIQUE 지정
);

-- 회원정보에서 id 칼럼은 Table 무결성을 보장하기 위한 값이고
-- 실제로 회원정보를 활용하기 위해서는 주로 사용하는 칼럼은 m_userid이다.
-- 회원정보 table의 m_userid는 중복되어서는 안된다.
-- 따라서 회원정보 table의 m_suerid 칼럼을 UNIQUE로 설정해 준다.
ALTER TABLE tbl_member ADD UNIQUE m_userid; -- 무명으로 조건 생성
ALTER TABLE tbl_member ADD CONSTRAINT U_userid UNIQUE (m_userid); -- U-userid 이름으로 조건 생성


CREATE TABLE tbl_hobby(
    id NUMBER PRIMARY KEY,
    m_userid nVARCHAR2(30) NOT NULL,
    m_hobby nVARCHAR2(20)
);

-- 정규화 : 관계형 데이터베이스의 설계에서 중복을 최소화하게 데이터를 구조화하는 프로세스

-- FOREIGN KEY를 생성 (외래키)
-- FK는 main table (tbl_member)의 어떤 칼럼과 연동을 시켜서
-- 만약 main table에 데이터를 삭제하면 sub table(tbl_hobby)의 데이터가 
-- 의미없이 남아있는 것을 방지하기 위한 설정
ALTER TABLE tbl_hobby -- FK를 설정할 table
ADD CONSTRAINT F_userid -- FK이름(임의로 설정)
FOREIGN KEY (m_userid) --FK로 설정할 칼럼
REFERENCES tbl_member(m_userid) -- main table과 칼럼
ON DELETE CASCADE; -- main table의 데이터가 삭제되면 같이 삭제하라
-- FK로 설정하려면 main table의 칼럼이 PK로 설정되거나 UNIQUE로 설정되어 있어야 한다.

INSERT INTO tbl_member(id,m_userid,m_password,m_name) VALUES(0,'aaa','1234','홍길동');

INSERT INTO tbl_hobby(id,m_userid,m_hobby) VALUES(0,'aaa','BOOK');
INSERT INTO tbl_hobby(id,m_userid,m_hobby) VALUES(1,'aaa','MUSIC');
INSERT INTO tbl_hobby(id,m_userid,m_hobby) VALUES(2,'aaa','MOVIE');

select * from tbl_member;
select * from tbl_hobby;

-- tbl_member에서 aaa 사용자 삭제
DELETE FROM tbl_member WHERE m_userid = 'aaa';
-- tbl_member에서 aaa 사용자를 삭제했더니 tbl_hobby도 삭제되었다.
select * from tbl_hobby;

-- tbl_member table에 aaa 라는 사용자가 없으면
-- tbl_hobby에 aaa 사용자의 취미를 추가할 수 없다.
INSERT INTO tbl_hobby(id,m_userid, m_hobby) VALUES(2,'aaa','MOVIE');


CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1;

select * from tbl_member;

delete from tbl_member;
commit;

