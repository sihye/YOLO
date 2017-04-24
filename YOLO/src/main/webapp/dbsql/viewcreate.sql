--[viewcreate.sql]



CREATE OR REPLACE VIEW qnaboard
AS SELECT q.*,c.C_NAME
FROM classqnaboard q,class c
WHERE q.C_NO=c.C_NO;
select*from qnaboard;


CREATE OR REPLACE VIEW reviewboard
AS SELECT a.*,c.C_NAME
FROM CLASSBOARD  a,class c
WHERE a.C_NO=c.C_NO;
select*from reviewboard;

--DROP VIEW favoriteclass;

CREATE OR REPLACE VIEW favoriteclass
AS select sb.*,c.C_NAME,c.C_PLACE,c.C_PRICE,c.C_PAYMENTWAY
from MEMBER m,CLASS c,SHOPPINGBASKET sb
where m.M_USERID = sb.SB_USERID
and c.C_NO = sb.C_NO;
select*from favoriteclass;
--commit

create view ExcelMemberView
as
select m.M_NO,M_USERID, m.M_NAME, m.M_TEL1, m.M_TEL2, m.M_TEL3, m.M_EMAIL1, m.M_EMAIL2, m.M_ADDRESS, m.M_ADDRESSDETAIL, m.M_JOINDATE,
(select c.k_name from category c where c.K_NO = m.k_no1) as k_1,(select c.k_name from category c where c.K_NO = m.k_no2) as k_2,(select c.k_name from category c where c.K_NO = m.k_no3) as k_3
from member m where m.mg_no2 = 2




create view operatorJoin
as
select o.op_no, up.f_originalfilename,cg.k_name,o.op_showflag 
from OPERATOR o, CATEGORY cg,UPFILE up
where o.K_NO = cg.K_NO and o.F_NO = up.F_NO



create view operatorMemberView
as
select m_userid,m_no,mg_no2,m_name,m_joindate,(select c.k_name from category c where c.K_NO = m.k_no1)as k_1 ,
(select c.k_name from category c where c.K_NO = m.k_no2) as k_2 ,(select c.k_name from category c where c.K_NO = m.k_no3) as k_3
from member m  
where mg_no2=2;





CREATE OR REPLACE VIEW mypayment
AS SELECT p.*,c.C_NAME,C_PRICE
FROM payment p,class c
WHERE p.C_NO=c.C_NO;

select*from mypayment;

CREATE OR REPLACE VIEW messagsend
AS SELECT m.MS_USERID,m.MS_CONTENT,m.MS_REGDATE,m.MS_TITLE,m2.MS_NO,m2.MSMG_USERID,m2.MS_CHECK
FROM message m,messagemaga m2
WHERE m.MS_NO=m2.MS_NO;
select*from messagsend;