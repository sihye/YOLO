--[insert.sql]
--categorygroup
--commit;
select * from categorygroup;

insert into categorygroup
values(CATEGORYGROUP_seq.nextval,1,'라이프스타일');
insert into categorygroup
values(CATEGORYGROUP_seq.nextval,2,'외국어');
insert into categorygroup
values(CATEGORYGROUP_seq.nextval,3,'뷰티/미용');	
insert into categorygroup
values(CATEGORYGROUP_seq.nextval,4,'스포츠');	


--category
select * from category;

insert into category
values(CATEGORY_seq.nextval,1,1,'독서/글쓰기');
insert into category
values(CATEGORY_seq.nextval,1,2,'봉사활동');
insert into category
values(CATEGORY_seq.nextval,1,3,'요리/베이킹');
insert into category
values(CATEGORY_seq.nextval,1,4,'반려동물');
insert into category
values(CATEGORY_seq.nextval,1,5,'라이프스타일 기타');


insert into category
values(CATEGORY_seq.nextval,2,1,'영어');
insert into category
values(CATEGORY_seq.nextval,2,2,'중국어');
insert into category
values(CATEGORY_seq.nextval,2,3,'일본어');
insert into category
values(CATEGORY_seq.nextval,2,4,'외국어 기타');

insert into category
values(CATEGORY_seq.nextval,3,1,'헤어');
insert into category
values(CATEGORY_seq.nextval,3,2,'네일');
insert into category
values(CATEGORY_seq.nextval,3,3,'메이크업');
insert into category
values(CATEGORY_seq.nextval,3,4,'뷰티/미용 기타');

insert into category
values(CATEGORY_seq.nextval,4,1,'축구');
insert into category
values(CATEGORY_seq.nextval,4,2,'야구');
insert into category
values(CATEGORY_seq.nextval,4,3,'요가');
insert into category
values(CATEGORY_seq.nextval,4,4,'스포츠 기타');









--question

select * from question;

insert into question
values(QUESTION_seq.nextval,'나의 출신 고향은?');
insert into question
values(QUESTION_seq.nextval,'어머니의 이름은?');
insert into question
values(QUESTION_seq.nextval,'가장 좋아하는 색은?');
insert into question
values(QUESTION_seq.nextval,'반려 동물의 이름은?');
insert into question
values(QUESTION_seq.nextval,'내가 존경하는 인물은?');

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
values('admin','1',MEMBER_seq.nextval,'123','관리자',sysdate,'1',1,'테스트질문답');
insert into member(M_USERID,MG_NO2,M_NO,M_PWD,M_NAME,M_JOINDATE,K_NO1,Q_QUESTIONNO,M_QUESTIONANSWER)
values('hong','2',MEMBER_seq.nextval,'123','테스트홍',sysdate,'1',1,'테스트질문답');
insert into member(M_USERID,MG_NO2,M_NO,M_PWD,M_NAME,M_JOINDATE,K_NO1,Q_QUESTIONNO,M_QUESTIONANSWER)
values('kim','2',MEMBER_seq.nextval,'123','테스트홍',sysdate,'1',1,'테스트질문답');
insert into member(M_USERID,MG_NO2,M_NO,M_PWD,M_NAME,M_JOINDATE,K_NO1,Q_QUESTIONNO,M_QUESTIONANSWER)
values('chang','2',MEMBER_seq.nextval,'123','테스트홍',sysdate,'1',1,'테스트질문답');

--rollback;
--class
select * from class;

insert into class
values(CLASS_seq.nextval,'hong',1,'가나다라',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㅇㄴㅇㄴㅁ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);
insert into class
values(CLASS_seq.nextval,'hong',1,'클래스',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㄴㅇㅇ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);
insert into class
values(CLASS_seq.nextval,'hong',1,'타파하',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㅁㄴㅇ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);
insert into class
values(CLASS_seq.nextval,'chang',1,'클래스',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅑㅕ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);
insert into class
values(CLASS_seq.nextval,'hong',1,'카타파하',20000,'abc','dasfasdf'
,'ㄹㅇㄴㅁㄹㄴ','ㅇㄴㄻ','ㅁㅇㄴㄹ','ㅇㄴㅇㄴ','ㅁㄴㅇㄹ','ㅈㅂㄷ','ㅂㅈㄷㅂ','ㅂㅈㄷㄱㅈ','ㅁㅇㄴ','ㅇㅁㄴ','ㅁㄴㅇ',0,'N',sysdate);

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
values(PAYMENT_seq.nextval,1,'hong','카드',sysdate,'N','N');
insert into payment
(PM_NO,C_NO,M_USERID,PM_PAYMENTWAY,PM_PAYMENTDATE,PM_COMPLETECHECK,PM_CANCELCHECK)
values(PAYMENT_seq.nextval,2,'hong','현금',sysdate,'Y','Y');
insert into payment
(PM_NO,C_NO,M_USERID,PM_PAYMENTWAY,PM_PAYMENTDATE,PM_COMPLETECHECK,PM_CANCELCHECK)
values(PAYMENT_seq.nextval,3,'hong','수표',sysdate,'Y','N');

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
values(PAYMENTCANCEL_seq.nextval,1,sysdate,'진행중','그냥','111');
insert into paymentcancel
(PMC_NO,PM_NO,PMC_DATE,PMC_PROQRESS,PMC_CALCEL,PMC_DETAIL)
values(PAYMENTCANCEL_seq.nextval,2,sysdate,'완료','실수','222');
insert into paymentcancel
(PMC_NO,PM_NO,PMC_DATE,PMC_PROQRESS,PMC_CALCEL,PMC_DETAIL)
values(PAYMENTCANCEL_seq.nextval,3,sysdate,'진행중','soso','333');



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
values(MESSAGE_seq.nextval,'hong','kim','abc','sdfdsfs',sysdate);
insert into message
values(MESSAGE_seq.nextval,'kim','chang','abc','sdfdsfs',sysdate);
insert into message
values(MESSAGE_seq.nextval,'chang','hong','abc','sdfdsfs',sysdate);

-- 쪽지관리
select*from messagemaga;
insert into messagemaga
(MS_NO,MSMG_USERID,MS_CHECK)
values(MESSAGEMAGA_seq.nextval,'kim','y');
insert into messagemaga
(MS_NO,MSMG_USERID,MS_CHECK)
values(MESSAGEMAGA_seq.nextval,'chang','y');
insert into messagemaga
(MS_NO,MSMG_USERID,MS_CHECK)
values(MESSAGEMAGA_seq.nextval,'hong','y');

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

insert into follow
values(FOLLOW_seq.nextval,'hong','kim',sysdate);
insert into follow
values(FOLLOW_seq.nextval,'hong','chang',sysdate);
insert into follow
values(FOLLOW_seq.nextval,'hong','hong',sysdate);

commit;
