--관리자 화면입니다.
-- 관리자 (DBA)가 사용하는 명령어
-- 물리적 객체를 생성하는 명령:create로시작

--사용자를 생성
--보통 DDL명령중에서 표준 SQL에서 가장많이 사용하는명령어
--사용자란: DBMS에 접속(connection) 하여 SQL문을 실행할 수 있는 ID
--오라콜에서의 사용자: DB Schema개념으로 TABLE 들을 포함하는 저장소 개념


--오라클에서 사용자를 등록하는 명령문
CREATE USER biz --사용자 아이디,표준 SQL
IDENTIFIED BY 1234; --사용자 비밀번호.오라클SQL

--DCL 명령인 GRANT 명령을 수행해서
--biz라는 사용자에게 CREATE SESSION이라는 권한을 부여했다
-- 그러므로 해서 biz라는 사용자는
-- 오라클에 연결(접속)할 수 있게 되고 의미는 없지만 최소한 SELECT명령을
--수행 해볼수 있도록 되었다
-- 즉, DB에  간접적인 어떤영향을 미치도록 하는 명령어들 
--이런 명령을 DCL(Data controll lang)라고한다
GRANT CREATE SESSION TO biz;

--GRANT 명령은 사용자에게 DB SQL문을 사용할 수 있는 등급(권한)을 부여하는 명령
-- 아래 GRANT DAB TO biz 는 biz사용자에게 관리다 권한에 살짝 못미치는
--막대한 권한을 부여한다
--GRANT DBA TO biz;
GRANT CREATE TABLE TO biz;

REVOKE CREATE SESSION FROM biz;