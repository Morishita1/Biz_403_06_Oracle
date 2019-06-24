-- USER3 화면입니다.

SELECT SC.sc_num, ST.st_name,SC.sc_subject,SC.sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num=ST.st_num;
        
SELECT SC.sc_num, ST.st_name,SUM(SC.sc_score)
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num=ST.st_num
GROUP BY SC.sc_num,ST.st_name
ORDER BY SC.sc_num;

-- ROUND : 반올림, TRUNC : 버림
SELECT SC.sc_num, ST.st_name,TRUNC(AVG(SC.sc_score)),ROUND(AVG(SC.sc_score))
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num=ST.st_num
GROUP BY SC.sc_num,ST.st_name
ORDER BY SC.sc_num;

SELECT SC.sc_num, ST.st_name,SUM(SC.sc_score) AS 총점,TRUNC(AVG(SC.sc_score)) AS 평균1,ROUND(AVG(SC.sc_score)) AS 평균2
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num=ST.st_num
GROUP BY SC.sc_num,ST.st_name
HAVING ROUND(AVG(SC.sc_score)) >=80
ORDER BY SC.sc_num;
