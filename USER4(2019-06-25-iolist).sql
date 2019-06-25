-- 여기는 USER4 화면입니다

CREATE TABLE tbl_iolost (
    io_seq	    NUMBER	PRIMARY KEY,
    io_date	    VARCHAR2(10)		NOT NULL,
    io_product	nVARCHAR2(50)		NOT NULL,
    io_dept	    nVARCHAR2(50)		NOT NULL,
    io_dept_ceo	nVARCHAR2(30)		,
    io_inout	nVARCHAR2(10)		NOT NULL,
    io_amt  	NUMBER		,
    io_price	NUMBER	,	
    io_total	NUMBER		
);

SELECT
    *
FROM tbl_iolost;

-- 매입과 매출을 구분해서 개수 세기
SELECT io_inout, COUNT(*) FROM tbl_iolost
GROUP BY io_inout ;

-- tbl_iolist 테이블의 제2정규화 작업을 진행
-- 상품정보를 tbl_iolist로부터 분리해서 상품테이블로 생성하기
-- 상품이름중 1개씩만 골라서 리스트로 추출
SELECT io_product
FROM tbl_iolost
GROUP BY io_product
ORDER BY io_product;

-- 상품테이블 생성
CREATE TABLE tbl_product(
    p_code	VARCHAR2(7)	PRIMARY KEY,
    p_name	nVARCHAR2(50)		NOT NULL,
    p_iprive	NUMBER		,
    p_oprice	NUMBER		
);

SELECT COUNT(*)
FROM tbl_product;

-- 거래처 정보 분리를 위해서
-- tbl_iolist에서 거래처 정보를 분리

SELECT io_dept,io_dept_ceo
FROM tbl_iolost
GROUP BY io_dept,io_dept_ceo
ORDER BY io_dept;

CREATE TABLE tbl_comp(
    c_code	VARCHAR2(5)	PRIMARY KEY,	
    c_name	nVARCHAR2(50)		NOT NULL,
    c_ceo	nVARCHAR2(50)		NOT NULL,
    c_tel	VARCHAR2(15)		,
    c_addr	nVARCHAR2(125)		
);

SELECT COUNT(*) FROM tbl_comp;

ALTER TABLE tbl_iolost ADD io_pcode VARCHAR2(7);
ALTER TABLE tbl_iolost ADD io_ccode VARCHAR2(5);

UPDATE tbl_iolost IO
SET io_pcode=
    (
    SELECT P.p_code FROM tbl_product P
    WHERE P.p_name=IO.io_product
);

UPDATE tbl_iolost IO
SET io_ccode=
    (
     SELECT C.c_code FROM tbl_comp C
    WHERE C.c_name=IO.io_dept AND
    C.c_ceo=IO.io_dept_ceo
);

ALTER TABLE tbl_iolost DROP COLUMN io_product;
ALTER TABLE tbl_iolost DROP COLUMN io_dept;
ALTER TABLE tbl_iolost DROP COLUMN io_dept_ceo;