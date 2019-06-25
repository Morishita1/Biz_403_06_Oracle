-- 여기는 관리자 화면입니다.
-- c:\bizwork\mydb 폴더에 uwer5TS 이름으로 tablespace를 생성하고
-- 초기크기는 500MB, 자동등가 100KB

-- user 사용자를 생성
-- DBA로 권한을 부여

-- user5 접속정보를 설정하고
-- user5 질의 작성기를 창을 열어서

-- student 엑셀파일을 참조하여 학생테이블을 생성하고
-- 엑셀 데이터를 임포트 수행

CREATE TABLESPACE user5TS
DATAFILE 'C:/bizwork/mydb/USER5TS.DBF'
SIZE 500M AUTOEXTEND ON NEXT 100K;

CREATE USER user5
IDENTIFIED BY 1234
DEFAULT TABLESPACE user5TS;

GRANT DBA TO user5;