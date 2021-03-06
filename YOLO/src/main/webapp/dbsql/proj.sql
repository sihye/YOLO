  

-- 멤버구분
CREATE TABLE membergroup (
	MG_NO   number        NOT NULL, -- 멤버구분번호
	MG_CODE VARCHAR2(500) NOT NULL, -- 멤버코드
	MG_NAME VARCHAR2(500) NOT NULL  -- 멤버명
);


-- 멤버구분 기본키
CREATE UNIQUE INDEX PK_membergroup
	ON membergroup ( -- 멤버구분
		MG_NO ASC -- 멤버구분번호
	);

-- 멤버구분
ALTER TABLE membergroup
	ADD
		CONSTRAINT PK_membergroup -- 멤버구분 기본키
		PRIMARY KEY (
			MG_NO -- 멤버구분번호
		);

-- 회원
CREATE TABLE Member (
	M_USERID         VARCHAR2(500) NOT NULL, -- 아이디
	MG_NO2           number        NOT NULL, -- 멤버구분번호
	M_NO             NUMBER        NOT NULL, -- 회원번호
	M_PWD            VARCHAR2(500) NOT NULL, -- 비밀번호
	M_NAME           VARCHAR2(500) NOT NULL, -- 이름
	M_EMAIL1         VARCHAR2(500) NOT NULL, -- 이메일
	M_EMAIL2         VARCHAR2(500) NOT NULL,  -- 이메일2
	M_BIRTH          VARCHAR2(500) NOT NULL, -- 생년월일
	M_GENDER         VARCHAR2(100) NOT NULL, -- 성별
	M_ADDRESS        VARCHAR2(500) NULL,     -- 주소
	M_ADDRESSDETAIL  VARCHAR2(500) NULL,     -- 주소
	M_BANKNAME       VARCHAR2(500) NULL,     -- 은행명
	M_ACCOUNT        VARCHAR2(500) NULL,     -- 계좌번호
	M_JOINDATE       DATE          DEFAULT sysdate NULL     , -- 가입일
	M_LEAVEDATE      DATE          NULL,     -- 탈퇴일
	K_NO1            NUMBER        NOT NULL,     -- 카테고리번호1
	K_NO2            NUMBER        NULL,     -- 카테고리번호2
	K_NO3            NUMBER        NULL, -- 카테고리번호3
	M_TEL1           VARCHAR2(500) NOT NULL,     -- 핸드폰
	M_TEL2           VARCHAR2(500) NOT NULL,     -- 핸드폰
	M_TEL3           VARCHAR2(500) NOT NULL,     -- 핸드폰
	Q_QUESTIONNO     NUMBER        NOT NULL, -- 질문번호
	M_QUESTIONANSWER VARCHAR2(500) NULL,      -- 질문답
	M_REASON         VARCHAR2(500) NULL      -- 탈퇴이유
);

-- 회원 기본키
CREATE UNIQUE INDEX PK_Member
	ON Member ( -- 회원
		M_USERID ASC -- 아이디
	);

-- 회원
ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member -- 회원 기본키
		PRIMARY KEY (
			M_USERID -- 아이디
		);

-- 질문항목
CREATE TABLE question (
	Q_QUESTIONNO   NUMBER   NOT NULL, -- 질문번호
	Q_QUESTIONNAME VARCHAR2(500) NULL      -- 질문명
);

-- 질문항목 기본키
CREATE UNIQUE INDEX PK_question
	ON question ( -- 질문항목
		Q_QUESTIONNO ASC -- 질문번호
	);

-- 질문항목
ALTER TABLE question
	ADD
		CONSTRAINT PK_question -- 질문항목 기본키
		PRIMARY KEY (
			Q_QUESTIONNO -- 질문번호
		);

-- 카테고리분류
CREATE TABLE categorygroup (
	KG_NO   NUMBER        NOT NULL, -- 분류번호
	KG_CODE NUMBER        NOT NULL, -- 분류코드
	KG_NAME VARCHAR2(500) NOT NULL  -- 분류이름
);

-- 카테고리분류 기본키
CREATE UNIQUE INDEX PK_categorygroup
	ON categorygroup ( -- 카테고리분류
		KG_NO ASC -- 분류번호
	);

-- 카테고리분류
ALTER TABLE categorygroup
	ADD
		CONSTRAINT PK_categorygroup -- 카테고리분류 기본키
		PRIMARY KEY (
			KG_NO -- 분류번호
		);

-- 카테고리
CREATE TABLE category (
	K_NO   NUMBER        NOT NULL, -- 카테고리번호
	KG_NO  NUMBER        NOT NULL, -- 분류번호
	K_CODE NUMBER        NULL,     -- 카테고리코드
	K_NAME VARCHAR2(500) NULL      -- 카테고리이름
);

-- 카테고리 기본키
CREATE UNIQUE INDEX PK_category
	ON category ( -- 카테고리
		K_NO ASC -- 카테고리번호
	);

-- 카테고리
ALTER TABLE category
	ADD
		CONSTRAINT PK_category -- 카테고리 기본키
		PRIMARY KEY (
			K_NO -- 카테고리번호
		);
--commit;
-- 클래스
CREATE TABLE Class (
   C_NO         NUMBER        NOT NULL, -- 클래스번호
   M_USERID     VARCHAR2(500) NOT NULL, -- 호스트아이디
   K_NO         NUMBER        NOT NULL, -- 카테고리번호
   C_NAME       VARCHAR2(500) NOT NULL, -- 클래스명
   C_PRICE      NUMBER        DEFAULT 0 not NULL     , -- 비용
   C_GOAL       VARCHAR2(500) NULL,     -- 목표
   C_TARGET     VARCHAR2(500) NULL,     -- 대상
   C_SPEVIALTY  VARCHAR2(500) NULL,     -- 특기사항
   C_DETAILINFO clob NULL,     -- 상세정보
   C_PLACE     VARCHAR2(500) NOT NULL, -- 장소
   C_PLACEDETAIL   VARCHAR2(500) NOT NULL, -- 상세주소
   C_coordinate VARCHAR2(500) NOT NULL, --좌표
   C_MAINIMG    VARCHAR2(500) not null,     -- 메인이미지
   C_DETAILIMG1 VARCHAR2(500) NULL,     -- 상세이미지1
   C_DETAILIMG2 VARCHAR2(500) NULL,     -- 상세이미지2
   C_DETAILIMG3 VARCHAR2(500) NULL,     -- 상세이미지3
   C_PAYMENTWAY VARCHAR2(500) not null,     -- 결제방법
   C_MAXPERSON  VARCHAR2(500) NULL,     -- 최대인원
   C_HITS       NUMBER        DEFAULT 0, -- 조회수
   C_DEL        VARCHAR2(5)   DEFAULT 'N', -- 삭제여부
   C_REGDATE    DATE          DEFAULT sysdate-- 등록일
);

-- 클래스 기본키
CREATE UNIQUE INDEX PK_Class
	ON Class ( -- 클래스
		C_NO ASC -- 클래스번호
	);

-- 클래스
ALTER TABLE Class
	ADD
		CONSTRAINT PK_Class -- 클래스 기본키
		PRIMARY KEY (
			C_NO -- 클래스번호
		);

-- 클래스
ALTER TABLE Class
	ADD
		CONSTRAINT FK_Member_TO_Class -- 회원 -> 클래스
		FOREIGN KEY (
			M_USERID -- 호스트아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 클래스
ALTER TABLE Class
	ADD
		CONSTRAINT FK_category_TO_Class -- 카테고리 -> 클래스
		FOREIGN KEY (
			K_NO -- 카테고리번호
		)
		REFERENCES category ( -- 카테고리
			K_NO -- 카테고리번호
		);
-- 스케줄
CREATE TABLE classschedule (
	SC_NO        NUMBER        NOT NULL, -- 스케줄번호
	C_NO         NUMBER        NOT NULL, -- 클래스번호
	SC_CODE      VARCHAR2(500) NOT NULL, -- 스케줄구분
	SC_STARTDATE VARCHAR2(500) NULL,     -- 시작일
	SC_ENDDATE   VARCHAR2(500) NULL,     -- 종료일
	SC_WEEK      VARCHAR2(500) NULL,     -- 요일
	SC_STARTTIME1 VARCHAR2(500) NULL,     -- 시작시간
	SC_ENDTIME1   VARCHAR2(500) NULL,       -- 종료시간
	SC_STARTTIME2 VARCHAR2(500) NULL,     -- 시작시간
	SC_ENDTIME2   VARCHAR2(500) NULL,       -- 종료시간
	SC_STARTTIME3 VARCHAR2(500) NULL,     -- 시작시간
	SC_ENDTIME3   VARCHAR2(500) NULL      -- 종료시간
);


-- 스케줄 기본키
CREATE UNIQUE INDEX PK_classschedule
	ON classschedule ( -- 스케줄
		SC_NO ASC -- 스케줄번호
	);

-- 스케줄
ALTER TABLE classschedule
	ADD
		CONSTRAINT PK_classschedule -- 스케줄 기본키
		PRIMARY KEY (
			SC_NO -- 스케줄번호
		);

-- 스케줄
ALTER TABLE classschedule
	ADD
		CONSTRAINT FK_Class_TO_classschedule -- 클래스 -> 스케줄
		FOREIGN KEY (
			C_NO -- 클래스번호
		)
		REFERENCES Class ( -- 클래스
			C_NO -- 클래스번호
		);
		
-- 클래스예약
CREATE TABLE booking (
	BK_NO       NUMBER        NOT NULL, -- 예약번호
	BK_USERID   VARCHAR2(500) NOT NULL, -- 아이디
	SC_NO       NUMBER        NOT NULL, -- 스케줄번호
	BK_DATE     DATE          DEFAULT sysdate, -- 예약일
	BK_BDATE    VARCHAR2(500) NOT NULL,  --클래스 예약일
	BK_TIME     VARCHAR2(500) NULL,     -- 예약시간
	BK_ENDCHECK VARCHAR2(500) DEFAULT 'N' -- 종료유무
);

-- 클래스예약 기본키
CREATE UNIQUE INDEX PK_booking
	ON booking ( -- 클래스예약
		BK_NO ASC -- 예약번호
	);

-- 클래스예약
ALTER TABLE booking
	ADD
		CONSTRAINT PK_booking -- 클래스예약 기본키
		PRIMARY KEY (
			BK_NO -- 예약번호
		);

-- 클래스예약
ALTER TABLE booking
	ADD
		CONSTRAINT FK_classschedule_TO_booking -- 스케줄 -> 클래스예약
		FOREIGN KEY (
			SC_NO -- 스케줄번호
		)
		REFERENCES classschedule ( -- 스케줄
			SC_NO -- 스케줄번호
		);

-- 클래스예약
ALTER TABLE booking
	ADD
		CONSTRAINT FK_Member_TO_booking -- 회원 -> 클래스예약
		FOREIGN KEY (
			BK_USERID -- 아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);
		




-- 업로드파일

CREATE TABLE upfile (
	F_NO               NUMBER        NOT NULL, -- 파일번호
	F_FILENAME         VARCHAR2(500) NULL,     -- 파일명
	F_ORIGINALFILENAME VARCHAR2(500) NULL,     -- 오리지날파일명
	F_FILESIZE         NUMBER        NULL      -- 파일크기
);

-- 업로드파일 기본키
CREATE UNIQUE INDEX PK_upfile
	ON upfile ( -- 업로드파일
		F_NO ASC -- 파일번호
	);

-- 업로드파일
ALTER TABLE upfile
	ADD
		CONSTRAINT PK_upfile -- 업로드파일 기본키
		PRIMARY KEY (
			F_NO -- 파일번호
		);

--DROP TABLE classqnaboard;
-- 클래스Q&A게시판
CREATE TABLE classqnaboard (
	CQ_NO          NUMBER        NOT NULL, -- 게시판번호
	C_NO           NUMBER        NOT NULL, -- 클래스번호
	M_USERID       VARCHAR2(500) NOT NULL, -- 아이디
	CQ_CONTENT     CLOB          NULL,     -- 내용
	CQ_REPAYCHECK  VARCHAR2(500) DEFAULT 'N' NULL, -- 답변유무
	CQ_SECRETCHECK VARCHAR2(500) DEFAULT 'N' NULL, -- 비밀글여부
	CQ_DELFLAG     VARCHAR2(500) DEFAULT 'N' NULL, -- 삭제유무
	C_REGDATE      DATE          DEFAULT sysdate NULL      -- 작성일
);

-- 클래스Q&A게시판 기본키
CREATE UNIQUE INDEX PK_classqnaboard
	ON classqnaboard ( -- 클래스Q&A게시판
		CQ_NO ASC -- 게시판번호
	);

-- 클래스Q&A게시판
ALTER TABLE classqnaboard
	ADD
		CONSTRAINT PK_classqnaboard -- 클래스Q&A게시판 기본키
		PRIMARY KEY (
			CQ_NO -- 게시판번호
		);

-- 클래스Q&A답변
CREATE TABLE classqnarepay (
	CQR_NO      NUMBER        NOT NULL, -- 답변번호
	CQ_NO       NUMBER        NOT NULL, -- 게시판번호
	M_USERID    VARCHAR2(500) NOT NULL, -- 호스트아이디
	CQR_CONTENT CLOB          NOT NULL, -- 내용
	CQR_DELFLAG VARCHAR2(500) DEFAULT 'N' NULL     , -- 삭제유무
	CQR_REGDATE DATE          DEFAULT sysdate NULL      -- 작성일
);

-- 클래스Q&A답변 기본키
CREATE UNIQUE INDEX PK_classqnarepay
	ON classqnarepay ( -- 클래스Q&A답변
		CQR_NO ASC -- 답변번호
	);

-- 클래스Q&A답변
ALTER TABLE classqnarepay
	ADD
		CONSTRAINT PK_classqnarepay -- 클래스Q&A답변 기본키
		PRIMARY KEY (
			CQR_NO -- 답변번호
		);

-- 클래스후기게시판
CREATE TABLE classboard (
	CB_NO        NUMBER        NOT NULL, -- 후기번호
	C_NO         NUMBER        NOT NULL, -- 클래스번호
	M_USERID     VARCHAR2(500) NOT NULL, -- 아이디
	CB_TITLE     VARCHAR2(500) NULL,     -- 제목
	CB_REGDATE   DATE          NULL,     -- 등록일
	CB_READCOUNT NUMBER        NULL,     -- 조회수
	CB_CONTENT   CLOB          NULL,     -- 내용
	F_NO1  NUMBER NULL ,     -- 파일번호
	F_NO2  NUMBER NULL ,     -- 파일번호
	F_NO3  NUMBER NULL      -- 파일번호
);

-- 클래스후기게시판 기본키
CREATE UNIQUE INDEX PK_classboard
	ON classboard ( -- 클래스후기게시판
		CB_NO ASC -- 후기번호
	);

-- 클래스후기게시판
ALTER TABLE classboard
	ADD
		CONSTRAINT PK_classboard -- 클래스후기게시판 기본키
		PRIMARY KEY (
			CB_NO -- 후기번호
		);

alter table classboard
add constraint classboard_FNO1_fk foreign key (f_no1) references upfile(f_no);

alter table classboard
add constraint classboard_FNO2_fk foreign key (f_no2) references upfile(f_no);

alter table classboard
add constraint classboard_FNO3_fk foreign key (f_no3) references upfile(f_no);


-- 쪽지
CREATE TABLE message (
	MS_NO      NUMBER        NOT NULL, -- 쪽지번호
	MS_USERID   VARCHAR2(500) NOT NULL, -- 보낸사람
	MSG_USERID VARCHAR2(500) NOT NULL, -- 받는사람
	MS_TITLE   VARCHAR2(500) NULL,     -- 제목
	MS_CONTENT CLOB          NULL,     -- 내용
	MS_REGDATE DATE         DEFAULT sysdate NULL      -- 등록일
);


-- 쪽지 기본키
CREATE UNIQUE INDEX PK_message
	ON message ( -- 쪽지
		MS_NO ASC -- 쪽지번호
	);

-- 쪽지
ALTER TABLE message
	ADD
		CONSTRAINT PK_message -- 쪽지 기본키
		PRIMARY KEY (
			MS_NO -- 쪽지번호
		);

-- 게시판분류
CREATE TABLE boardgroup  (
	BG_NO           NUMBER        NOT NULL, -- 게시판분류번호
	BG_NAME         VARCHAR2(500) NOT NULL, -- 게시판이름
	BG_INFO         CLOB          NOT NULL, -- 소개
	BG_ORDER        NUMBER        NOT NULL, -- 순서
	BG_REPAYCHECK   VARCHAR2(500) NOT NULL, -- 답글가능여부
	BG_FILEUPCHECK  VARCHAR2(500) NOT NULL, -- 파일첨부가능여부
	BG_FILEUPNUMBER NUMBER        NOT NULL, -- 첨부가능파일숫자
	BG_FILEUPSIZE   NUMBER        NOT NULL, -- 첨부가능파일크기
	BG_REGDATE      DATE          DEFAULT sysdate NULL     , -- 등록일
	BG_EDITDATE     DATE          DEFAULT sysdate NULL  -- 최종수정일
);


-- 게시판분류 기본키
CREATE UNIQUE INDEX PK_boardgroup 
	ON boardgroup  ( -- 게시판분류
		BG_NO ASC -- 게시판분류번호
	);

-- 게시판분류
ALTER TABLE boardgroup 
	ADD
		CONSTRAINT PK_boardgroup  -- 게시판분류 기본키
		PRIMARY KEY (
			BG_NO -- 게시판분류번호
		);

-- 공지사항
CREATE TABLE noticeboard (
	NB_NO        NUMBER        NOT NULL, -- 게시판번호
	M_USERID     VARCHAR2(500) NOT NULL, -- 운영자아이디
	BG_NO        NUMBER        NOT NULL, -- 게시판분류번호
	NB_TITLE     VARCHAR2(500) NOT NULL, -- 제목
	NB_REGDATE   DATE          DEFAULT sysdate NULL     , -- 등록일
	NB_READCOUNT NUMBER       DEFAULT 0 NULL     , -- 조회수
	NB_CONTENT   CLOB          NOT NULL, -- 내용
	NB_DELFLAG   VARCHAR2(500) DEFAULT 'N' NULL,      -- 삭제구분
	F_NO1	     NUMBER	NULL        ,       --파일1
	F_NO2	     NUMBER	NULL	    ,	
	F_NO3	     NUMBER	NULL
);

-- 공지사항 기본키
CREATE UNIQUE INDEX PK_noticeboard
	ON noticeboard ( -- 공지사항
		NB_NO ASC -- 게시판번호
	);

-- 공지사항
ALTER TABLE noticeboard
	ADD
		CONSTRAINT PK_noticeboard -- 공지사항 기본키
		PRIMARY KEY (
			NB_NO -- 게시판번호
		);
alter table NOTICEBOARD
add constraint NOTICEBOARD_FNO_fk foreign key (f_no1) references upfile(f_no);
alter table NOTICEBOARD
add constraint NOTICEBOARD_FNO2_fk foreign key (f_no2) references upfile(f_no);
alter table NOTICEBOARD
add constraint NOTICEBOARD_FNO3_fk foreign key (f_no3) references upfile(f_no);


-- 이용안내
CREATE TABLE useboard (
   UB_NO        NUMBER        NOT NULL, -- 게시판번호
   M_USERID     VARCHAR2(500) NOT NULL, -- 운영자아이디
   BG_NO        NUMBER        NOT NULL, -- 게시판분류번호
   UB_TITLE     VARCHAR2(500) NOT NULL, -- 제목
   UB_REGDATE   DATE          DEFAULT sysdate NULL     , -- 등록일
   UB_READCOUNT NUMBER        DEFAULT 0 NULL     , -- 조회수
   UB_CONTENT   CLOB          NOT NULL, -- 내용
   UB_DELFLAG   VARCHAR2(500) DEFAULT 'N' NULL  ,    -- 삭제구분
   UB_TYPE      NUMBER          DEFAULT 1 not NULL       --파일1
);

-- 이용안내 기본키
CREATE UNIQUE INDEX PK_useboard
	ON useboard ( -- 이용안내
		UB_NO ASC -- 게시판번호
	);

-- 이용안내
ALTER TABLE useboard
	ADD
		CONSTRAINT PK_useboard -- 이용안내 기본키
		PRIMARY KEY (
			UB_NO -- 게시판번호
		);



-- 찜하기
CREATE TABLE shoppingbasket   (
	SB_NO      NUMBER        NOT NULL, -- 찜번호
	SB_USERID  VARCHAR2(500) NOT NULL, -- 아이디
	C_NO       NUMBER        NULL,     -- 클래스번호
	SC_REGDATE DATE          DEFAULT sysdate  NULL-- 등록일
);
alter table shoppingbasket
add (SC_NO NUMBER  NULL);

-- 찜하기 기본키
CREATE UNIQUE INDEX PK_shoppingbasket  
	ON shoppingbasket   ( -- 찜하기
		SB_NO ASC -- 찜번호
	);

-- 찜하기
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT PK_shoppingbasket   -- 찜하기 기본키
		PRIMARY KEY (
			SB_NO -- 찜번호
		);

-- 찜하기
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT FK_Member_TO_shoppingbasket   -- 회원 -> 찜하기
		FOREIGN KEY (
			SB_USERID -- 아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 찜하기
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT FK_Class_TO_shoppingbasket   -- 클래스 -> 찜하기
		FOREIGN KEY (
			C_NO -- 클래스번호
		)
		REFERENCES Class ( -- 클래스
			C_NO -- 클래스번호
		);

-- 결제
CREATE TABLE payment (
	PM_NO            VARCHAR2(100)        NOT NULL, -- 결제번호
	C_NO             NUMBER        NOT NULL, -- 클래스번호
	M_USERID         VARCHAR2(500) NOT NULL, -- 아이디
	BK_NO            NUMBER        NOT NULL,     -- 예약번호
	PM_PAYMENTWAY    VARCHAR2(500) NULL,     -- 결제방법
	PM_PAYMENTDATE   DATE          DEFAULT sysdate,     -- 결제일
	PM_COMPLETECHECK VARCHAR2(500)      DEFAULT 'N' , -- 결제완료여부
	PM_CANCELCHECK   VARCHAR2(500)      DEFAULT'N' -- 결제취소여부
);

-- 결제 기본키
CREATE UNIQUE INDEX PK_payment
	ON payment ( -- 결제
		PM_NO ASC -- 결제번호
	);

-- 결제
ALTER TABLE payment
	ADD
		CONSTRAINT PK_payment -- 결제 기본키
		PRIMARY KEY (
			PM_NO -- 결제번호
		);

-- 결제
ALTER TABLE payment
	ADD
		CONSTRAINT FK_Member_TO_payment -- 회원 -> 결제
		FOREIGN KEY (
			M_USERID -- 아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 결제
ALTER TABLE payment
	ADD
		CONSTRAINT FK_Class_TO_payment -- 클래스 -> 결제
		FOREIGN KEY (
			C_NO -- 클래스번호
		)
		REFERENCES Class ( -- 클래스
			C_NO -- 클래스번호
		);

-- 결제
ALTER TABLE payment
	ADD
		CONSTRAINT FK_booking_TO_payment -- 클래스예약 -> 결제
		FOREIGN KEY (
			BK_NO -- 예약번호
		)
		REFERENCES booking ( -- 클래스예약
			BK_NO -- 예약번호
		);
		


-- 결제취소
CREATE TABLE paymentcancel (
	PMC_NO       NUMBER        NOT NULL, -- 결제취소번호
	PM_NO        varchar2(100)        NOT NULL, -- 결제번호
	PMC_DATE     DATE          NULL,     -- 취소일
	PMC_PROQRESS VARCHAR2(500) DEFAULT '진행중' , -- 결제진행상황
	PMC_CALCEL   VARCHAR2(500) NULL,     -- 취소유형
	PMC_DETAIL   VARCHAR2(500) NULL      -- 상세정보
);

-- 결제취소 기본키
CREATE UNIQUE INDEX PK_paymentcancel
	ON paymentcancel ( -- 결제취소
		PMC_NO ASC -- 결제취소번호
	);

-- 결제취소
ALTER TABLE paymentcancel
	ADD
		CONSTRAINT PK_paymentcancel -- 결제취소 기본키
		PRIMARY KEY (
			PMC_NO -- 결제취소번호
		);

-- 관리자메인관리
CREATE TABLE operator (
	OP_NO       NUMBER        NOT NULL, -- 관리번호
	F_NO        NUMBER        NOT NULL, -- 파일번호
	K_NO        NUMBER        NULL,     -- 카테고리번호
	OP_SHOWFLAG VARCHAR2(500) DEFAULT 'N'      -- 보여주기여부
);

-- 관리자메인관리 기본키
CREATE UNIQUE INDEX PK_operator
	ON operator ( -- 관리자메인관리
		OP_NO ASC -- 관리번호
	);

-- 관리자메인관리
ALTER TABLE operator
	ADD
		CONSTRAINT PK_operator -- 관리자메인관리 기본키
		PRIMARY KEY (
			OP_NO -- 관리번호
		);

-- 쪽지관리
CREATE TABLE messagemaga (
	MS_NO    NUMBER             NULL, -- 쪽지번호
	MSMG_USERID VARCHAR2(500)      NULL, -- 받는사람
	MS_CHECK VARCHAR2(5) DEFAULT 'N'  -- 확인여부
);

-- 관심호스트
CREATE TABLE follow (
	FL_NO      NUMBER        NOT NULL, -- 팔로우번호
	FL_USERID  VARCHAR2(500) NOT NULL, -- 팔로워아이디
	FL_WUSERID VARCHAR2(500) NOT NULL, -- 팔로우아이디
	FL_REGDATE DATE          NULL      -- 등록일
);

-- 관심호스트 기본키
CREATE UNIQUE INDEX PK_follow
	ON follow ( -- 관심호스트
		FL_NO ASC -- 팔로우번호
	);

-- 관심호스트
ALTER TABLE follow
	ADD
		CONSTRAINT PK_follow -- 관심호스트 기본키
		PRIMARY KEY (
			FL_NO -- 팔로우번호
		);

-- 관심호스트
ALTER TABLE follow
	ADD
		CONSTRAINT FK_Member_TO_follow -- 회원 -> 관심호스트
		FOREIGN KEY (
			FL_USERID -- 팔로워아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 관심호스트
ALTER TABLE follow
	ADD
		CONSTRAINT FK_Member_TO_follow2 -- 회원 -> 관심호스트2
		FOREIGN KEY (
			FL_WUSERID -- 팔로우아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 회원
ALTER TABLE Member
	ADD
		CONSTRAINT FK_membergroup_TO_Member -- 멤버구분 -> 회원
		FOREIGN KEY (
			MG_NO2 -- 멤버구분번호
		)
		REFERENCES membergroup ( -- 멤버구분
			MG_NO -- 멤버구분번호
		);

-- 회원
ALTER TABLE Member
	ADD
		CONSTRAINT FK_category_TO_Member -- 카테고리 -> 회원
		FOREIGN KEY (
			K_NO1 -- 카테고리번호1
		)
		REFERENCES category ( -- 카테고리
			K_NO -- 카테고리번호
		);

-- 회원
ALTER TABLE Member
	ADD
		CONSTRAINT FK_category_TO_Member3 -- 카테고리 -> 회원2
		FOREIGN KEY (
			K_NO2 -- 카테고리번호2
		)
		REFERENCES category ( -- 카테고리
			K_NO -- 카테고리번호
		);

-- 회원
ALTER TABLE Member
	ADD
		CONSTRAINT FK_category_TO_Member2 -- 카테고리 -> 회원3
		FOREIGN KEY (
			K_NO3 -- 카테고리번호3
		)
		REFERENCES category ( -- 카테고리
			K_NO -- 카테고리번호
		);

-- 회원
ALTER TABLE Member
	ADD
		CONSTRAINT FK_question_TO_Member -- 질문항목 -> 회원
		FOREIGN KEY (
			Q_QUESTIONNO -- 질문번호
		)
		REFERENCES question ( -- 질문항목
			Q_QUESTIONNO -- 질문번호
		);

-- 카테고리
ALTER TABLE category
	ADD
		CONSTRAINT FK_categorygroup_TO_category -- 카테고리분류 -> 카테고리
		FOREIGN KEY (
			KG_NO -- 분류번호
		)
		REFERENCES categorygroup ( -- 카테고리분류
			KG_NO -- 분류번호
		);

-- 클래스
ALTER TABLE Class
	ADD
		CONSTRAINT FK_Member_TO_Class -- 회원 -> 클래스
		FOREIGN KEY (
			M_USERID -- 호스트아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 클래스
ALTER TABLE Class
	ADD
		CONSTRAINT FK_category_TO_Class -- 카테고리 -> 클래스
		FOREIGN KEY (
			K_NO -- 카테고리번호
		)
		REFERENCES category ( -- 카테고리
			K_NO -- 카테고리번호
		);



-- 스케줄
ALTER TABLE classschedule
	ADD
		CONSTRAINT FK_Class_TO_classschedule -- 클래스 -> 스케줄
		FOREIGN KEY (
			C_NO -- 클래스번호
		)
		REFERENCES Class ( -- 클래스
			C_NO -- 클래스번호
		);

-- 클래스Q&A게시판
ALTER TABLE classqnaboard
	ADD
		CONSTRAINT FK_Member_TO_classqnaboard -- 회원 -> 클래스Q&A게시판
		FOREIGN KEY (
			M_USERID -- 아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 클래스Q&A게시판
ALTER TABLE classqnaboard
	ADD
		CONSTRAINT FK_Class_TO_classqnaboard -- 클래스 -> 클래스Q&A게시판
		FOREIGN KEY (
			C_NO -- 클래스번호
		)
		REFERENCES Class ( -- 클래스
			C_NO -- 클래스번호
		);

-- 클래스Q&A답변
ALTER TABLE classqnarepay
	ADD
		CONSTRAINT FK_Member_TO_classqnarepay -- 회원 -> 클래스Q&A답변
		FOREIGN KEY (
			M_USERID -- 호스트아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 클래스Q&A답변
ALTER TABLE classqnarepay
	ADD
		CONSTRAINT FK_classqnaboardclassqnarepay -- 클래스Q&A게시판 -> 클래스Q&A답변
		FOREIGN KEY (
			CQ_NO -- 게시판번호
		)
		REFERENCES classqnaboard ( -- 클래스Q&A게시판
			CQ_NO -- 게시판번호
		);

-- 클래스후기게시판
ALTER TABLE classboard
	ADD
		CONSTRAINT FK_Memberclassboard -- 회원 -> 클래스후기게시판
		FOREIGN KEY (
			M_USERID -- 아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 클래스후기게시판
ALTER TABLE classboard
	ADD
		CONSTRAINT FK_Classclassboard -- 클래스 -> 클래스후기게시판
		FOREIGN KEY (
			C_NO -- 클래스번호
		)
		REFERENCES Class ( -- 클래스
			C_NO -- 클래스번호
		);

-- 쪽지
ALTER TABLE message
	ADD
		CONSTRAINT FK_Member_TO_message -- 회원 -> 쪽지
		FOREIGN KEY (
			MS_USERID -- 보낸사람
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 공지사항
ALTER TABLE noticeboard
	ADD
		CONSTRAINT FK_boardgroupnoticeboard -- 게시판분류 -> 공지사항
		FOREIGN KEY (
			BG_NO -- 게시판분류번호
		)
		REFERENCES boardgroup  ( -- 게시판분류
			BG_NO -- 게시판분류번호
		);

-- 공지사항
ALTER TABLE noticeboard
	ADD
		CONSTRAINT FK_Membernoticeboard -- 회원 -> 공지사항
		FOREIGN KEY (
			M_USERID -- 운영자아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 이용안내
ALTER TABLE useboard
	ADD
		CONSTRAINT FK_boardgroupuseboard -- 게시판분류 -> 이용안내
		FOREIGN KEY (
			BG_NO -- 게시판분류번호
		)
		REFERENCES boardgroup  ( -- 게시판분류
			BG_NO -- 게시판분류번호
		);

-- 이용안내
ALTER TABLE useboard
	ADD
		CONSTRAINT FK_Memberuseboard -- 회원 -> 이용안내
		FOREIGN KEY (
			M_USERID -- 운영자아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 찜하기
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT FK_Membershoppingbasket   -- 회원 -> 찜하기
		FOREIGN KEY (
			SB_USERID -- 아이디
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);

-- 찜하기
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT FK_cheduleshoppingbasket   -- 스케줄 -> 찜하기
		FOREIGN KEY (
			SC_NO -- 스케줄번호
		)
		REFERENCES classschedule ( -- 스케줄
			SC_NO -- 스케줄번호
		);

-- 결제취소
ALTER TABLE paymentcancel
	ADD
		CONSTRAINT FK_paymentpaymentcancel -- 결제 -> 결제취소
		FOREIGN KEY (
			PM_NO -- 결제번호
		)
		REFERENCES payment ( -- 결제
			PM_NO -- 결제번호
		);

-- 관리자메인관리

ALTER TABLE operator
	ADD
		CONSTRAINT FK_upfileoperator -- 업로드파일 -> 관리자메인관리
		FOREIGN KEY (
			F_NO -- 파일번호
		)
		REFERENCES upfile ( -- 업로드파일
			F_NO -- 파일번호
		);

-- 관리자메인관리
ALTER TABLE operator
	ADD
		CONSTRAINT FK_category_TO_operator -- 카테고리 -> 관리자메인관리
		FOREIGN KEY (
			K_NO -- 카테고리번호
		)
		REFERENCES category ( -- 카테고리
			K_NO -- 카테고리번호
		);

-- 쪽지관리
ALTER TABLE messagemaga
	ADD
		CONSTRAINT FK_Member_TO_messagemaga -- 회원 -> 쪽지관리
		FOREIGN KEY (
			MSMG_USERID -- 받는사람
		)
		REFERENCES Member ( -- 회원
			M_USERID -- 아이디
		);
-- 신고
CREATE TABLE notify (
    n_no    number not null,
	C_NO      NUMBER        NOT NULL, -- 클래스번호
	N_CODE    VARCHAR2(500) NOT NULL, -- 신고항목
	N_REGDATE DATE		DEFAULT SYSDATE,
	n_userid    VARCHAR2(500) NOT NULL,
	N_CONTENT VARCHAR2(500) NOT NULL  -- 신고내용
);

-- 신고 기본키
CREATE UNIQUE INDEX PK_notify
	ON notify ( -- 신고
		n_no ASC -- 클래스번호
	);

-- 신고
ALTER TABLE notify
	ADD
		CONSTRAINT PK_notify -- 신고 기본키
		PRIMARY KEY (
			n_no -- 클래스번호
		);

-- 신고
ALTER TABLE notify
	ADD
		CONSTRAINT FK_Class_TO_notify -- 클래스 -> 신고
		FOREIGN KEY (
			n_userid -- 클래스번호
		)
		REFERENCES member ( -- 클래스
			M_USERID -- 클래스번호
		);

ALTER TABLE notify
	ADD
		CONSTRAINT FK_member_TO_notify -- 클래스 -> 신고
		FOREIGN KEY (
			C_NO -- 클래스번호
		)
		REFERENCES Class ( -- 클래스
			C_NO -- 클래스번호
		);
create sequence BOARDGROUP_seq
increment by 1
start with 1
nomaxvalue
nocache;

create sequence BOOKING_seq
increment by 1
start with 1
nomaxvalue
nocache;

create sequence CATEGORY_seq
increment by 1
start with 1
nomaxvalue
nocache;

create sequence CATEGORYGROUP_seq
increment by 1
start with 1
nomaxvalue
nocache;


create sequence CLASS_seq
increment by 1
start with 1
nomaxvalue
nocache;
		
create sequence CLASSBOARD_seq
increment by 1
start with 1
nomaxvalue
nocache;		

create sequence CLASSQNABOARD_seq
increment by 1
start with 1
nomaxvalue
nocache;


create sequence CLASSQNAREPAY_seq
increment by 1
start with 1
nomaxvalue
nocache;


create sequence CLASSSCHEDULE_seq
increment by 1
start with 1
nomaxvalue
nocache;


create sequence MEMBER_seq
increment by 1
start with 1
nomaxvalue
nocache;

create sequence MEMBERGROUP_seq
increment by 1
start with 1
nomaxvalue
nocache;


create sequence MESSAGE_seq
increment by 1
start with 1
nomaxvalue
nocache;

create sequence MESSAGEMAGA_seq
increment by 1
start with 1
nomaxvalue
nocache;


create sequence NOTICEBOARD_seq
increment by 1
start with 1
nomaxvalue
nocache;
		

create sequence OPERATOR_seq
increment by 1
start with 1
nomaxvalue
nocache;


create sequence PAYMENT_seq
increment by 1
start with 1
nomaxvalue
nocache;


create sequence PAYMENTCANCEL_seq
increment by 1
start with 1
nomaxvalue
nocache;


create sequence QUESTION_seq
increment by 1
start with 1
nomaxvalue
nocache;

create sequence SHOPPINGBASKET_seq
increment by 1
start with 1
nomaxvalue
nocache;

create sequence UPFILE_seq
increment by 1
start with 2
nomaxvalue
nocache;


create sequence USEBOARD_seq
increment by 1
start with 1
nomaxvalue
nocache;

create sequence FOLLOW_seq
increment by 1
start with 1
nomaxvalue
nocache;

create sequence notify_seq
increment by 1
start with 1
nomaxvalue
nocache;