-- 여기는 USER4 화면입니다

-- 전체리스트를 확인하는
SELECT
    *
FROM tbl_iolost;

-- 전체리스트의 개수를 확인
SELECT COUNT(*) FROM tbl_iolost;

-- 매입과 매출을 구분해서 개수를 확인
SELECT io_inout, COUNT(*) FROM tbl_iolost
GROUP BY io_inout;

-- 매입합계와 매출합계
SELECT io_inout, SUM(io_total) FROM tbl_iolost
GROUP BY io_inout;

-- 매입매출 리스트중에서
--2018-10-01~2018-10-31까지 데이터만 보고싶다.

-- io_date 칼럼은 VARCHAR2로 설정되어 문자열 데이터를 저장하고 있다.
-- 일반적인 프로그래밍 언어에서는 부등호 관계산이 숫자형 데이터만 허용이 된다.
-- 하지만 SQL에서는 저장되는 문자열의 길이 모두 같고
-- 저장되는 형식이 같으면 부등호 관계연산을 수행할수 있다.
SELECT
    *
FROM tbl_iolost
WHERE io_date >='2018-10-01' AND io_date <='2018-10-31'
ORDER BY io_date;

SELECT io_pcode
FROM tbl_iolost IO
WHERE io_pcode>= 'P000011' AND io_pcode <= 'P000020'
ORDER BY io_pcode;


SELECT io_pcode, P.p_name
FROM tbl_iolost IO
    LEFT JOIN tbl_product P
        ON P.p_code=IO.io_pcode
WHERE io_pcode>= 'P000011' AND io_pcode <= 'P000020'
ORDER BY io_pcode;

SELECT io_date, io_pcode
FROM tbl_iolost
WHERE io_pcode='P000011';


-- 매입과 매출을 구분하여 리스트를 출력 해 보려고 한다.
SELECT io_date,io_inout,SUM( io_total)
FROM tbl_iolost
GROUP BY io_date,io_inout
ORDER BY io_date;

-- 매입과 매출을 각각 칼럼으로 
SELECT io_inout,DECODE(io_inout,'매입',io_total,0) AS 매입금액,
        DECODE(io_inout,'매출',io_total,0) AS 매출금액
FROM tbl_iolost
ORDER BY io_date;

-- 상품별로 매입, 매출의 총합을 리스트로 보여달라
-- 상품코드로 묶고, 구분으로 묶어서 집계를 낸 리스트
SELECT io_pcode, io_inout,
        SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
        SUM(DECODE(io_inout,'매출',io_total,0)) AS 매출금액
FROM tbl_iolost
GROUP BY io_pcode,io_inout
ORDER BY io_pcode,io_inout;

-- 일일 매입, 매출 합계 리스트
SELECT io_date, io_inout,
        SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
        SUM(DECODE(io_inout,'매출',io_total,0)) AS 매출금액
FROM tbl_iolost
GROUP BY io_date,io_inout
ORDER BY io_date,io_inout;


-- 날짜칼럼의 값을 앞에서 7개 잘라서 년, 월만 남기고
-- 년-월 값으로 그룹을 설정한 후
-- 매입, 매출 집계를 계산
-- 월별 매입, 매출 합계 리스트
SELECT SUBSTR(io_date,0,7), io_inout,
        SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
        SUM(DECODE(io_inout,'매출',io_total,0)) AS 매출금액,
        
        SUM(DECODE(io_inout,'매출',io_total,0)) -
        SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진

        
FROM tbl_iolost
GROUP BY SUBSTR(io_date,0,7), io_inout
ORDER BY SUBSTR(io_date,0,7), io_inout;




SELECT SUBSTR(io_date,0,7),
      
        SUM(DECODE(io_inout,'매출',io_total,0)) -
        SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진
       
FROM tbl_iolost
GROUP BY SUBSTR(io_date,0,7)
ORDER BY SUBSTR(io_date,0,7);


-- 전체기간에 매입, 매출, 마진을 계산하기
SELECT
        SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
        SUM(DECODE(io_inout,'매출',io_total,0)) AS 매출금액,
    
        SUM(DECODE(io_inout,'매출',io_total,0)) -
        SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진
       
FROM tbl_iolost;


-- 3월 한달동안의 매입, 매출, 마진 계산
SELECT
        SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
        SUM(DECODE(io_inout,'매출',io_total,0)) AS 매출금액,
    
        SUM(DECODE(io_inout,'매출',io_total,0)) -
        SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진
       
FROM tbl_iolost
WHERE io_date>='2018-03-01' AND io_date <='2018-03-31';

SELECT
    *
FROM tbl_iolost
WHERE io_date>='2018-03-01' AND io_date <='2018-03-31';

-- 범위를 지정하여 검색할때
-- 두 범위값이 포함될 경우(= 이 있을 경우)에는
-- BETWEEN 키워드를 사용해서 범위 검색을 할수 있다.
SELECT
    *
FROM tbl_iolost
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31';

SELECT io_pcode,p.p_name,io.io_price,io.io_total
FROM tbl_iolost IO
    LEFT JOIN tbl_product P
        ON IO.io_pcode= P.p_code
WHERE io_pcode ='P000037' OR
        io_pcode ='P000031' OR
        io_pcode ='P000021' OR
        io_pcode ='P000011' OR
        io_pcode ='P000066' OR
        io_pcode ='P000056'
;


-- 동일한 칼럼에 포함된 값들이 있는지 검사하는 방법
-- OR, 연산을 사용하지 않고 IN 키워드를 사용해서
-- WHERE 조건 검색을 실행할 수 있다.
SELECT io_pcode,p.p_name,io.io_price,io.io_total
FROM tbl_iolost IO
    LEFT JOIN tbl_product P
        ON IO.io_pcode= P.p_code
WHERE io_pcode IN('P000037','P000031','P000021' ,'P000011');

SELECT p_code, p_name
FROM tbl_product;

SELECT p_code, p_name
FROM tbl_product
WHERE p_name='(신)구이쥐치포';

-- 검색조건에 LIKE 키워드를 사용하고 문자열대신 %를 추가하여
-- 부분문자열 검색을 실행한다.
SELECT p_code, p_name
FROM tbl_product
WHERE p_name LIKE'(신)%';

-- '(신)%' : (신)으로 시작되는 모든 문자열
-- '%(신) : (신)으로 끝나는 모든 문자열
-- '%(신)%' : (신)을 포함한 모든 문자열

SELECT p_code, p_name
FROM tbl_product
WHERE p_name LIKE'%바%';



