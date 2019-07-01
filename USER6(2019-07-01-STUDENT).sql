-- 여기는 USER6 입니다.

DROP TABLE tbl_student;
CREATE TABLE tbl_student(
    st_num VARCHAR2(5) PRIMARY KEY,
    st_name nVARCHAR2(50) NOT NULL,
    st_tel VARCHAR2(20),
    st_grade NUMBER
);

INSERT INTO tbl_student(st_num,st_name,st_tel,st_grade)
VALUES('00001','홍길동','001',3);
INSERT INTO tbl_student(st_num,st_name,st_tel,st_grade)
VALUES('00002','성춘향','011',2);
INSERT INTO tbl_student(st_num,st_name,st_tel,st_grade)
VALUES('00003','이몽룡','111',4);
INSERT INTO tbl_student(st_num,st_name,st_tel,st_grade)
VALUES('00004','임꺽정','002',1);
INSERT INTO tbl_student(st_num,st_name,st_tel,st_grade)
VALUES('00005','장녹수','022',3);

COMMIT;

SELECT
    *
FROM tbl_student;


CREATE TABLE tbl_score(
    sc_seq NUMBER PRIMARY KEY,
    sc_st_num VARCHAR(5) NOT NULL,
    sc_subject nVARCHAR2(20) NOT NULL,
    sc_score NUMBER
);

CREATE SEQUENCE seq_score
START WITH 1
INCREMENT BY 1;

INSERT INTO tbl_score(sc_seq, sc_st_num,sc_subject,sc_score)
VALUES(seq_score.NEXTVAL,'00001','국어',90);

commit;

SELECT
    *
FROM tbl_student;

SELECT
    *
FROM tbl_score;