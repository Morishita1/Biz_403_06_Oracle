-- USER6의 창입니다

-- 도서정보를 저장할 table을 생성

CREATE TABLE tbl_books (

    b_seq NUMBER,
    b_title nVARCHAR2(100),
    b_comp nVARCHAR2(50),
    b_auth nVARCHAR2(50),
    b_price NUMBER

);

-- SEQ 생성

CREATE SEQUENCE seq_book
START WITH 1
INCREMENT BY 1;