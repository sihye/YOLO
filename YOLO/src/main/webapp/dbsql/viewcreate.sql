--[viewcreate.sql]

select*from qnaboard;

CREATE OR REPLACE VIEW qnaboard
AS SELECT q.*,c.C_NAME
FROM classqnaboard q,class c
WHERE q.C_NO=c.C_NO;

select*from reviewboard;

CREATE OR REPLACE VIEW reviewboard
AS SELECT a.*,c.C_NAME
FROM CLASSBOARD  a,class c
WHERE a.C_NO=c.C_NO;

select*from favoriteclass;
CREATE OR REPLACE VIEW favoriteclass
AS select sb.*,c.C_NAME,c.C_PALCE,c.C_PRICE,c.C_PAYMENTWAY
from MEMBER m,CLASS c,SHOPPINGBASKET sb
where m.M_USERID = sb.SB_USERID
and c.C_NO = sb.C_NO;
