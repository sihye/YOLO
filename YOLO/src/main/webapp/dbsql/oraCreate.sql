--sys�� system �������� �α����ؼ� ����� ����, ���̺����̽� �����ϱ�
--sqlplus "/as sysdba  ==>�ý���dba����

--���̺� �����̽� ����
create tablespace YOLO 
datafile 'D:\myoracle\data2\YOLO.dbf' size 48m
extent management local
uniform size 64k
segment space management auto;

--����� ���� ����
create user YOLO 
identified by YOLO123
default tablespace YOLO;

--����� ���Ѻο�
grant connect,resource to YOLO;
--grant connect, dba to herb with admin option;

--�� ���� ���� �ο��ϱ�
grant create view to YOLO;

--������ ���� ���� �ο�
GRANT CREATE SEQUENCE TO YOLO;
