-- 여기는 USER4 화면입니다

DROP TABLE tbl_score;
CREATE TABLE tbl_score(
    sc_seq	NUMBER	PRIMARY KEY	NOT NULL,
    sc_date	VARCHAR2(10) NOT NULL,
    sc_st_no	CHAR(3)		NOT NULL,
    sc_subject	nVARCHAR2(50)		NOT NULL,
    sc_score	NUMBER		
);


-- score를 위한 SEQUENCE를 생성
-- 시작번호를 100으로 한이유는
-- 현재 엑셀에ㅐ 데이터를 입력해서 임포트를 할려고 한다
-- 엑셀에 입력되어 있는 데이터가 일련번호를 21까지 차지하고 있어서
-- 이후 INSERT를 수행할때 새로운번호를 100부터 시작하기 위함이다.
CREATE SEQUENCE seq_score
START WITH 100
INCREMENT BY 1;

SELECT
    *
FROM tbl_score;

-- 만약 성적데이터에 포함된 과목명이 변경되는 일이 발생하면
-- 예를들어 국어 한국어 로 바꾸려고 한다
--UPDATE tbl_score
--SET sc_subject='한국어'
--WHERE sc_subject ='국어';

-- 성적테이블과 학생테이블이 분리된 상태
-- 성적정보를 보면서 학번에 대한 학생이 누구인지 알고 싶으면
-- JOIN을 실행해서 확인


CREATE TABLE tbl_test
AS(
SELECT SC.sc_date, Sc.sc_st_no,ST.st_name,ST.st_addr,SC.sc_subject,SC.sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
     on SC.sc_st_no=ST.st_no
     );
     
SELECT
    *
FROM tbl_test;
-- 이테이블의 조용필 학생의 주소가 null인데 주소가 확인이 되어
-- 주소를 입력하려고 한다.
UPDATE tbl_test
SET st_addr='서울특별시'
WHERE st_name='조용필';
-- 하지만 이러한 명령을 수행하는 과정에서
-- 만약 조용필 학생이 동명이인이 있다면
-- 실제 변경하지 말아야 할 데이터가 변경되는 사태가 발생을 한다.
-- 그래서 다수의 레코드를 변경하는 명령은 매우 신중하게 사용해야 한다.

-- 조용필 학생의 주소를 변경하자
SELECT
    *
FROM tbl_student;
UPDATE tbl_student
SET st_addr= '서울특별시'
WHERE st_no='001';

SELECT SC.sc_date, Sc.sc_st_no,ST.st_name,ST.st_addr,SC.sc_subject,SC.sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
     on SC.sc_st_no=ST.st_no;
     
-- 데이터 베이스 제 2 정규화
-- 성적데이터로 부터 과목정보를 별도로 분리하여
-- 과목테이블로 생성을 하고 
-- 성적을조회할때 과목테이블과 JOIN하여 볼수 있도록 설정할 예정


-- 1. 성적데이터로 부터 과목정보를 추출
SELECT sc_subject
FROM tbl_score
GROUP BY sc_subject
ORDER BY sc_subject;

-- 2. 과목 테이블을 만들고
CREATE TABLE tbl_subject (
    sb_no	CHAR(3)	PRIMARY KEY	NOT NULL,
    sb_name	nVARCHAR2(20)	NOT NULL,
    sb_rem	nVARCHAR2(50)		
);

-- 3. 과목 데이터를 추가해서 과목정보 테이블 완성
INSERT INTO tbl_subject(sb_no,sb_name,sb_rem)
VALUES('001','국어','한국어능력시험');
INSERT INTO tbl_subject(sb_no,sb_name,sb_rem)
VALUES('002','수학','고등수학');
INSERT INTO tbl_subject(sb_no,sb_name,sb_rem)
VALUES('003','영어','스피킹');

SELECT *
FROM tbl_score SC
    LEFT JOIN tbl_subject SB
        ON SC.sc_subject= SB.sb_name;
        
-- 4. 점수테이블에는 과목의 이름만 존재하고 있기 때문에
--      과목의 이름에 해당하는 과목코들르
--      점수테이블에 UPDATE를 해 주어야 한다
--  가. 과목테이블에 과목코드 칼럼을 하나 추가하자
ALTER TABLE tbl_score ADD (sc_sb_no CHAR(3));

-- 나. 과목테이블로 부터 점수 테이블에 있는 과목이름을 참조하여
--      과목코드를 점수테이블에 업데이트를 실행


-- A. 먼저 tbl_score 테이블을 펼처놓고
-- tbl_score 테이블의 sc_subject 칼럼의 값을
-- sub SQL인 SELECT 문에게 보낸다.
-- B. sub SQL(Query)인 SELECT 문은
--      tbl_subject 테이블에서
--      sc_subject(과목명)을 검색하여
--      일치하는 값이 있으면
--      과목코드를 return한다
--C. UPDATE 명령은 return 받은 고목코드를 tbl_score sc_sb_no 칼럼에
--      Update를 실행한다.
UPDATE tbl_score SC
SET SC.sc_sb_no=
    (
        
        SELECT sb_no FROM tbl_subject SB
        WHERE SB.sb_name=SC.sc_subject
        );

SELECT
    *
FROM tbl_score;
        
-- tbl_score 의 sc_subject 칼럼을 삭제
ALTER TABLE tbl_score DROP COLUMN sc_subject;

SELECT
    *
FROM tbl_score;

-- tbl_score 테이블을 제2정규화 완료했다..

SELECT
    *
FROM tbl_score SC
    LEFT JOIN tbl_subject SB
    ON SC.sc_sb_no=SB.sb_no;


SELECT
    *
FROM tbl_subject;

UPDATE tbl_subject
SET sb_rem='훈민정음'
WHERE sb_no='001';


-- 점수를 확인하면서
-- 과목코드에 대한 과목명도 보고
-- 학번에 대한 학생이름도 같이 보고

CREATE VIEW view_score
AS(
    SELECT
        SC.sc_date,SC.sc_st_no, ST.st_name,ST.st_addr,
        SC.sc_sb_no,SB.sb_name,
        SC.sc_score
    FROM tbl_score SC
        LEFT JOIN tbl_subject SB
        ON SC.sc_sb_no=SB.sb_no
        LEFT JOIN tbl_student ST
        ON SC.sc_st_no=ST.st_no

);

SELECT
    *
FROM view_score;