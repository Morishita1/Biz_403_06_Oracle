-- USER6 화면입니다

CREATE TABLE tbl_member (
 m_userid	VARCHAR(15)	PRIMARY KEY,
 m_password	VARCHAR(64)	NOT NULL,
 m_name	nVARCHAR2(39)	,
 m_email	VARCHAR(25)	NOT NULL,
 m_tel	VARCHAR(20)	,
 m_role	VARCHAR(5)
);




SELECT
    *
FROM tbl_member;
