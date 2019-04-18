-- iolist 접속 화면

DROP TABLE tbl_product;

CREATE TABLE tbl_product(
    p_code	CHAR(13)		PRIMARY KEY,
    p_name	nVARCHAR2(125)	NOT NULL,	
    p_tax	CHAR(1) DEFAULT '1',		
    p_iprice	NUMBER,		
    p_oprice	NUMBER		
);

DROP TABLE tbl_iolist;

CREATE TABLE tbl_iolist(
    io_id	    NUMBER		PRIMARY KEY,
    io_date	    CHAR(10)	NOT NULL,	
    io_time     CHAR(10)     NOT NULL,
    io_pcode	CHAR(13)	NOT NULL,	
    io_dcode	CHAR(5) 	NOT NULL,	
    io_inout	CHAR(1)	    NOT NULL,	
    io_tax      CHAR(1)     DEFAULT '1',
    io_quan	    NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER,		
    io_tax_total	NUMBER	    	
);

DROP TABLE tbl_dept;

CREATE TABLE tbl_dept(
    d_code	CHAR(5)		PRIMARY KEY,
    d_name	nVARCHAR2(125)	NOT NULL,	
    d_ceo	nVARCHAR2(50),		
    d_tel	nVARCHAR2(20),		
    d_addr	nVARCHAR2(125)		
);


SELECT * FROM tbl_product;
commit;

SELECT * FROM tbl_dept;
commit;