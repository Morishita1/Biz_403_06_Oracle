-- 여기는 USER6 화면입니다.
SELECT
    *
FROM tbl_student;

SELECT
    *
FROM tbl_score;

DROP TABLE tbl_score;
CREATE TABLE tbl_score(
    SC_SEQ	NUMBER,
    SC_ST_NUM	VARCHAR2(5) NOT NULL,
    SC_SUBJECT	NVARCHAR2(3) NOT NULL,
    SC_SCORE	NUMBER,
    PRIMARY KEY(SC_SEQ)
);

-- tbl_student와 tbl_score의 참조관계를 설정
-- Relation Ship
ALTER TABLE tbl_score
ADD CONSTRAINT f_st_num FOREIGN KEY (sc_St_num)
REFERENCES tbl_student(st_num)
ON DELETE CASCADE;

-- 다중칼럼 UNIQUE 설정
-- 학번이 같고, 과목번호가 같은 값이 2개이상 없도록 하라 하는 제약사항
-- 학번:0001, 과목:1 의 레코드가 있으면 0001, 1의 값은 저장하지 말라
ALTER TABLE tbl_score
ADD CONSTRAINT u_st_num_subject UNIQUE (sc_st_num, sc_subject);

INSERT INTO tbl_score(sc_seq,sc_st_num,sc_subject,sc_score)
VALUES(SEQ_SCORE.NEXTVAL,'00001','1',90);

SELECT
    *
FROM tbl_score;
COMMIT;