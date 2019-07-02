-- 여기는 USER6 화면입니다.

CREATE TABLE tbl_product(
    p_code	VARCHAR2(5)	PRIMARY KEY	,
    p_name	nVARCHAR2(50)		NOT NULL,
    p_iprice	NUMBER		,
    p_oprice	NUMBER		
);

SELECT
    *
FROM tbl_product;
commit;

