-- 관리자 질의 작성기 화면
SELECT * 
FROM access$;

SELECT *
FROM access$
WHERE d_obj# = 1299;

-- SQL 명령문은 대표키워드로 시작해서 보조 키워드들이 나열되는 형태이다
-- 일반적으로 명령문이나 변수명 들은 대소문자 구별이 없다.
-- 다만 작성할때 학습차워에서
-- 키워드는 대문자로 사용하고, 기타 변수명 등은 소문자로 작성한다.

-- SQL 명령문은 여러줄에 걸쳐 사용핤후 있고
-- 명령문의 끝에는 세미콜론(;)을 붙여 준다.

-- 명령문 중간에서 Ctrol + Enter를 누르면
-- 해당하는 명령문을 오라클 DBMS에게 전송하고
-- 결과를 보여준다.

-- 연습을 위해서 잠시 DBA가 되어 봅시다.

-- 테이블 객체
-- CREATE TABLE은 데이터 저장소의 최소단위
-- 실제로 데이터들을 보관할 장소
-- 테이블 객체를 새성할수 있는 권한은 DBA에게 있다
-- DBA가 아닌경우는 일반적으로 테이블 객체를 생성할 수 없다.
CREATE TABLE tbl_student (
    st_name nVARCHAR2(30), -- 데이터의 필드, 맴버변수 역할이며 DB에서는 칼럼이라고 부른다
    st_age NUMBER
);


-- CRUD Key word 는
-- 기본 Key word와 보조 Key word가 있는데
-- 기본 Key word에 따라 보조 Key word가 필수적으로 따라 다녀야 하는 경우가 있다
INSERT INTO tbl_student(st_name,st_age)
VALUES('홍길동',33);

-- INSERT INTO VALUES
-- SELECT FROM WHERE
-- UPDATE SET WHERE
-- DELETE FROM WHERE

INSERT INTO tbl_student(st_name,st_age)
VALUES('성춘향',16);

INSERT INTO tbl_student(st_name,st_age)
VALUES('이몽룡',22);

SELECT
    *
FROM tbl_student;

SELECT
    *
FROM tbl_student
WHERE st_name='성춘향';

SELECT
    *
FROM tbl_student
WHERE st_age=16;

-- 매우 조심해서 연습할 키워드
-- UPDATE와 DELETE를 연습
-- UPDATE와 DELETE 키워드에서 WHERE 절은 선택사항이지만
-- 우리는 필수 키워드라고 생각하자
UPDATE tbl_student
SET st_age=100
WHERE st_name='이몽룡';

SELECT
    *
FROM tbl_student;


DELETE FROM tb_student
WHERE st_name='김길동';

-----------------
-- CRUD 표준명령
-----------------

-- Create
INSERT INTO 테이블명(칼럼리스트)
VALUES(데이터리스트);

-- Read
SELECT *FROM 테이블명
WHERE 칼럼=조건;

-- Update
UPDATE 테이블명
SET 칼럼1= 값, 칼럼2=값
WHERE 칼럼=조건;

-- Delete
DELETE FROM 테이블명
WHERE 칼럼=조건;