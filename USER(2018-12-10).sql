-- 여기는 user1으로 접속한 화면입니다.
-- user1은 dba권한을 갖고 있다.

-- talbe 생성
-- TABLE이름 : tbl_std
-- st_num, st_name, st_tel, st_addr, int_age, int_grade 칼럼을 가지고 있고,
-- st_num은 PK로 설정되어있고, st_name은 빈칸이 없는
-- 제약사항이 설정되어 있다.

CREATE TABLE tbl_std(

    st_num CHAR(3) PRIMARY KEY,          --객체 무결성 보장
    st_name nVARCHAR2(20)  NOT NULL,
    st_tel nVARCHAR2(15),
    st_addr nVARCHAR2(125),
    int_age NUMBER(3),
    int_grade NUMBER(2)
);


-- 홍길동, 이몽룡, 성춘향, 임꺽정, 장길산 이름을 기준으로
-- 나머지 항목을 자유롭게 설정하여 데이터를 추가하시오

INSERT INTO tbl_std  VALUES('001','홍길동','010-1111-1111','서울시',12,2);
INSERT INTO tbl_std  VALUES('002','이몽룡','010-1111-2222','광주광역시',16,6);
INSERT INTO tbl_std  VALUES('003','성춘향','010-1111-3333','전주시',13,3);
INSERT INTO tbl_std  VALUES('004','임꺽정','010-1111-4444','부산광역시',11,1);
INSERT INTO tbl_std  VALUES('005','장길산','010-1111-5555','인천광역시',15,5);

SELECT * FROM tbl_std;


