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