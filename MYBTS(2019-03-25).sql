CREATE TABLE tbl_books(
    b_id NUMBER PRIMARY KEY,
    b_userid VARCHAR2(20) NOT NULL,
    b_isbn VARCHAR2(20) NOT NULL,
    b_title nVARCHAR2(30) NOT NULL,
    b_date VARCHAR2(10) NOT NULL,
    b_star NUMBER(2,1),
    b_text nVARCHAR2(100)
);

DESCRIBE tbl_books;

drop table tbl_books;

CREATE SEQUENCE SEQ_BOOK
START WITH 1
INCREMENT BY 1;
