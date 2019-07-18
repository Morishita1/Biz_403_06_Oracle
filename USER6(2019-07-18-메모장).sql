-- 여기는 USER6 화면입니다

DROP TABLE tbl_memo;

CREATE TABLE tbl_memo (
    mo_seq	NUMBER	PRIMARY KEY	NOT NULL,
    mo_date	VARCHAR2(10)		NOT NULL,
    mo_time	VARCHAR2(10)		NOT NULL,
    mo_auth	nVARCHAR2(50),		
    mo_subject	nVARCHAR2(125),		
    mo_memo	nVARCHAR2(1000)		
);

--오라클의 RANDOM값을 생성하는 코드

SELECT ROUND(DBMS_RANDOM.VALUE(0,999999999999),0) FROM DUAL;

SELECT
    *
FROM tbl_memo;

