--[insert.sql]
--categorygroup

select * from categorygroup;

insert into categorygroup
values(CATEGORYGROUP_seq.nextval,1,'카테고리분류1');
insert into categorygroup
values(CATEGORYGROUP_seq.nextval,1,'카테고리분류2');
insert into categorygroup
values(CATEGORYGROUP_seq.nextval,1,'카테고리분류3');


--category
select * from category;

insert into category
values(CATEGORY_seq.nextval,1,1,'카테고리1');
insert into category
values(CATEGORY_seq.nextval,1,1,'카테고리2');
insert into category
values(CATEGORY_seq.nextval,1,1,'카테고리3');

--question

select * from question;

insert into question
values(QUESTION_seq.nextval,'테스트질문1');
insert into question
values(QUESTION_seq.nextval,'테스트질문2');
insert into question
values(QUESTION_seq.nextval,'테스트질문3');

--membergroup
select*from membergroup;

 insert into membergroup
values(1,1,'admin');
insert into membergroup
values(2,2,'member');
insert into membergroup
values(3,3,'host');


--Member
select * from member ;

insert into member(M_USERID,MG_NO2,M_NO,M_PWD,M_NAME,M_JOINDATE,K_NO1,Q_QUESTIONNO,M_QUESTIONANSWER)
values('hong','2',MEMBER_seq.nextval,'123','테스트홍',sysdate,'1',1,'테스트질문답');
insert into member(M_USERID,MG_NO2,M_NO,M_PWD,M_NAME,M_JOINDATE,K_NO1,Q_QUESTIONNO,M_QUESTIONANSWER)
values('kim','2',MEMBER_seq.nextval,'123','테스트홍',sysdate,'1',1,'테스트질문답');
insert into member(M_USERID,MG_NO2,M_NO,M_PWD,M_NAME,M_JOINDATE,K_NO1,Q_QUESTIONNO,M_QUESTIONANSWER)
values('chang','2',MEMBER_seq.nextval,'123','테스트홍',sysdate,'1',1,'테스트질문답');


--class
select * from class;

insert into class
values(CLASS_seq.nextval,'hong',1,'가나다라',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);
insert into class
values(CLASS_seq.nextval,'hong',1,'클래스',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);
insert into class
values(CLASS_seq.nextval,'kim',1,'클래스',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);
insert into class
values(CLASS_seq.nextval,'chang',1,'클래스',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);
insert into class
values(CLASS_seq.nextval,'hong',1,'카타파하',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);

--classschedule
select*from classschedule;

insert into classschedule
values(CLASSSCHEDULE_seq.nextval,1,'스케줄1','2017','2018','일','1234','134');
insert into classschedule
values(CLASSSCHEDULE_seq.nextval,1,'스케줄2','2017','2018','일','1234','134');
insert into classschedule
values(CLASSSCHEDULE_seq.nextval,1,'스케줄3','2017','2018','일','1234','134');

--upfile
select*from upfile;

insert into upfile
values(UPFILE_seq.nextval,'관리자용더미','관리자용더미',0);
insert into upfile
values(UPFILE_seq.nextval,'file1','file2',1024);
insert into upfile
values(UPFILE_seq.nextval,'file1','file3',1024);

--classqnaboard
select*from classqnaboard;

insert into classqnaboard
values(CLASSQNABOARD_seq.nextval,1,'hong','fdsfs','N','N','N',sysdate);
insert into classqnaboard
values(CLASSQNABOARD_seq.nextval,1,'kim','fdsfs','N','N','N',sysdate);
insert into classqnaboard
values(CLASSQNABOARD_seq.nextval,1,'chang','fdsfs','N','N','N',sysdate);
insert into classqnaboard
values(CLASSQNABOARD_seq.nextval,1,'hong','fdsfs','N','N','N','2017-04-06');
insert into classqnaboard
values(CLASSQNABOARD_seq.nextval,4,'hong','fdsfs','N','N','N','2017-03-06');
insert into classqnaboard
values(CLASSQNABOARD_seq.nextval,5,'hong','fdsfs','N','N','N','2016-12-06');

--classboard
select*from classboard;

insert into CLASSBOARD
values(CLASSBOARD_seq.nextval,1,'hong','후기',sysdate,0,'fdsfsdsf',4,'fdsds');
insert into CLASSBOARD
values(CLASSBOARD_seq.nextval,1,'kim','후기',sysdate,0,'fdsfsdsf',4,'fdsds');
insert into CLASSBOARD
values(CLASSBOARD_seq.nextval,1,'chang','후기',sysdate,0,'fdsfsdsf',4,'fdsds');
insert into CLASSBOARD
values(CLASSBOARD_seq.nextval,4,'chang','후기','2014-03-15',0,'fdsfsdsf',4,'fdsds');
insert into CLASSBOARD
values(CLASSBOARD_seq.nextval,5,'chang','후기','2014-01-13',0,'fdsfsdsf',4,'fdsds');


--boardgroup
select*from boardgroup;

insert into boardgroup
values(BOARDGROUP_seq.nextval,'gkgkgk','dfsfsdfds',1,'N','N',1,1024,sysdate,sysdate);
insert into boardgroup
values(BOARDGROUP_seq.nextval,'qwwqwqw','dfsfsdfds',1,'N','N',1,1024,sysdate,sysdate);
insert into boardgroup
values(BOARDGROUP_seq.nextval,'zxzxxzzx','dfsfsdfds',1,'N','N',1,1024,sysdate,sysdate);

-- 공지사항
select*from noticeboard;

insert into noticeboard
(NB_NO,M_USERID,BG_NO,NB_TITLE,NB_REGDATE,NB_READCOUNT,NB_CONTENT,NB_DELFLAG)
values(1,'hong',1,'zxcv',sysdate,3,'내~용','y');
insert into noticeboard
(NB_NO,M_USERID,BG_NO,NB_TITLE,NB_REGDATE,NB_READCOUNT,NB_CONTENT,NB_DELFLAG)
values(2,'kim',2,'asdf',sysdate,3,'내~용','y');
insert into noticeboard
(NB_NO,M_USERID,BG_NO,NB_TITLE,NB_REGDATE,NB_READCOUNT,NB_CONTENT,NB_DELFLAG)
values(3,'chang',3,'qwer',sysdate,3,'내~용','y');

-- 이용안내
select*from useboard;

insert into useboard
(UB_NO,M_USERID,BG_NO,UB_TITLE,UB_REGDATE,UB_READCOUNT,UB_CONTENT,UB_DELFLAG)
values(1,'hong',1,'M',sysdate,'5','내용1','Y');
insert into useboard
(UB_NO,M_USERID,BG_NO,UB_TITLE,UB_REGDATE,UB_READCOUNT,UB_CONTENT,UB_DELFLAG)
values(2,'kim',1,'M',sysdate,'5','내용2','Y');
insert into useboard
(UB_NO,M_USERID,BG_NO,UB_TITLE,UB_REGDATE,UB_READCOUNT,UB_CONTENT,UB_DELFLAG)
values(3,'chang',1,'M',sysdate,'5','내용3','Y');


-- 찜하기
select*from shoppingbasket ;

insert into shoppingbasket
(SB_NO,SB_USERID,C_NO,SC_REGDATE)
values(SHOPPINGBASKET_seq.nextval,'hong',1,sysdate);
insert into shoppingbasket
(SB_NO,SB_USERID,C_NO,SC_REGDATE)
values(SHOPPINGBASKET_seq.nextval,'kim',1,sysdate);
insert into shoppingbasket
(SB_NO,SB_USERID,C_NO,SC_REGDATE)
values(SHOPPINGBASKET_seq.nextval,'chang',1,sysdate);
insert into shoppingbasket
(SB_NO,SB_USERID,C_NO,SC_REGDATE)
values(SHOPPINGBASKET_seq.nextval,'hong',2,sysdate);
insert into shoppingbasket
(SB_NO,SB_USERID,C_NO,SC_REGDATE)
values(SHOPPINGBASKET_seq.nextval,'hong',3,sysdate);


-- 결제
select*from payment;

insert into payment
(PM_NO,C_NO,M_USERID,PM_PAYMENTWAY,PM_PAYMENTDATE,PM_COMPLETECHECK,PM_CANCELCHECK)
values(1,1,'hong','카드',sysdate,'y','y');
insert into payment
(PM_NO,C_NO,M_USERID,PM_PAYMENTWAY,PM_PAYMENTDATE,PM_COMPLETECHECK,PM_CANCELCHECK)
values(2,1,'kim','현금',sysdate,'y','y');
insert into payment
(PM_NO,C_NO,M_USERID,PM_PAYMENTWAY,PM_PAYMENTDATE,PM_COMPLETECHECK,PM_CANCELCHECK)
values(3,1,'chang','수표',sysdate,'y','y');

--booking
select*from booking;

insert into booking
values(BOOKING_seq.nextval,1,'hong',1,sysdate,'N');
insert into booking
values(BOOKING_seq.nextval,1,'kim',1,sysdate,'N');
insert into booking
values(BOOKING_seq.nextval,1,'chang',1,sysdate,'N');

-- 결제취소
select*from paymentcancel;

insert into paymentcancel
(PMC_NO,PM_NO,PMC_DATE,PMC_PROQRESS,PMC_CALCEL,PMC_DETAIL)
values(1,1,sysdate,'진행중','그냥','111');
insert into paymentcancel
(PMC_NO,PM_NO,PMC_DATE,PMC_PROQRESS,PMC_CALCEL,PMC_DETAIL)
values(2,2,sysdate,'진행중','실수','222');
insert into paymentcancel
(PMC_NO,PM_NO,PMC_DATE,PMC_PROQRESS,PMC_CALCEL,PMC_DETAIL)
values(3,3,sysdate,'진행중','soso','333');



-- 관리자메인관리
select*from operator;

insert into operator
(OP_NO,F_NO,K_NO,OP_SHOWFLAG)
values(1,1,1,'');

insert into operator
(OP_NO,F_NO,K_NO,OP_SHOWFLAG)
values(2,1,2,'');

insert into operator
(OP_NO,F_NO,K_NO,OP_SHOWFLAG)
values(3,1,3,'');
--message
select*from message;

insert into message
values(MESSAGE_seq.nextval,'hong','abc','sdfdsfs',sysdate);
insert into message
values(MESSAGE_seq.nextval,'kim','abc','sdfdsfs',sysdate);
insert into message
values(MESSAGE_seq.nextval,'chang','abc','sdfdsfs',sysdate);

-- 쪽지관리
select*from messagemaga;

insert into messagemaga
(MS_NO,M_USERID,MS_CHECK)
values(4,'hong','y');

insert into messagemaga
(MS_NO,M_USERID,MS_CHECK)
values(2,'kim','y');

insert into messagemaga
(MS_NO,M_USERID,MS_CHECK)
values(3,'chang','y');


-- 신고
select*from notify;

insert into notify
(C_NO,N_CODE,N_CONTENT)
values(1,'신고1','개인취향');

insert into notify
(C_NO,N_CODE,N_CONTENT)
values(2,'신고2','개인취향');

insert into notify
(C_NO,N_CODE,N_CONTENT)
values(3,'신고3','개인취향');

commit;
