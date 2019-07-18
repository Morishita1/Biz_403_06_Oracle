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

SELECT
    *
FROM tbl_books;

INSERT INTO tbl_books(b_seq,b_title,b_comp,b_auth,b_price)
VALUES(seq_book.NEXTVAL,'모바일 웹','생능출판사','박성진',33000);

INSERT INTO tbl_books(b_seq,b_title,b_comp,b_auth,b_price)
VALUES(seq_book.NEXTVAL,'오라클SQL','길벗','홍형경',28000);

INSERT INTO tbl_books(b_seq,b_title,b_comp,b_auth,b_price)
VALUES(seq_book.NEXTVAL,'열혈자바','몰라','몰라',15000);

SELECT
    *
FROM tbl_books;

COMMIT ;