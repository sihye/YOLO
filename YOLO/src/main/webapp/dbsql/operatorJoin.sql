create view operatorJoin
as
select o.op_no, up.f_originalfilename,cg.k_name,o.op_showflag 
from OPERATOR o, CATEGORY cg,UPFILE up
where o.K_NO = cg.K_NO and o.F_NO = up.F_NO