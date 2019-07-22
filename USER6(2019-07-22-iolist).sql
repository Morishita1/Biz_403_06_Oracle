-- USER6
CREATE TABLE tbl_iolist (
io_seq	NUMBER	PRIMARY KEY,	
io_date	VARCHAR2(10)		NOT NULL,
io_pcode	nVARCHAR2(5)		NOT NULL,
io_ccode	nVARCHAR2(5)		NOT NULL,
io_inout	VARCHAR2(1)		NOT NULL,
io_qty	NUMBER,
io_price	NUMBER,	
io_total	NUMBER		
);

DELETE FROM tbl_iolist ;
COMMIT;
CREATE TABLE tbl_comp (
c_code	VARCHAR2(5)	PRIMARY KEY	,
c_name	nVARCHAR2(50)		NOT NULL,
c_ceo	nVARCHAR2(50)		NOT NULL,
c_tel	VARCHAR2(20)		,
c_addr	nVARCHAR2(255)
);

SELECT
    *
FROM tbl_comp;

SELECT
    *
FROM tbl_product;

DELETE FROM tbl_product ;