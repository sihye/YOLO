  

-- �������
CREATE TABLE membergroup (
	MG_NO   number        NOT NULL, -- ������й�ȣ
	MG_CODE VARCHAR2(500) NOT NULL, -- ����ڵ�
	MG_NAME VARCHAR2(500) NOT NULL  -- �����
);


-- ������� �⺻Ű
CREATE UNIQUE INDEX PK_membergroup
	ON membergroup ( -- �������
		MG_NO ASC -- ������й�ȣ
	);

-- �������
ALTER TABLE membergroup
	ADD
		CONSTRAINT PK_membergroup -- ������� �⺻Ű
		PRIMARY KEY (
			MG_NO -- ������й�ȣ
		);

-- ȸ��
CREATE TABLE Member (
	M_USERID         VARCHAR2(500) NOT NULL, -- ���̵�
	MG_NO2           number        NOT NULL, -- ������й�ȣ
	M_NO             NUMBER        NOT NULL, -- ȸ����ȣ
	M_PWD            VARCHAR2(500) NOT NULL, -- ��й�ȣ
	M_NAME           VARCHAR2(500) NOT NULL, -- �̸�
	M_EMAIL1         VARCHAR2(500) NULL,     -- �̸���
	M_EMAIL2         VARCHAR2(500) NULL,     -- �̸���2
	M_ADDRESS        VARCHAR2(500) NULL,     -- �ּ�
	M_ADDRESSDETAIL  VARCHAR2(500) NULL,     -- �ּ�
	M_BANKNAME       VARCHAR2(500) NULL,     -- �����
	M_ACCOUNT        VARCHAR2(500) NULL,     -- ���¹�ȣ
	M_JOINDATE       DATE          DEFAULT sysdate NULL     , -- ������
	M_LEAVEDATE      DATE          NULL,     -- Ż����
	K_NO1            NUMBER        NOT NULL,     -- ī�װ�����ȣ1
	K_NO2            NUMBER        NULL,     -- ī�װ�����ȣ2
	K_NO3            NUMBER        NULL, -- ī�װ�����ȣ3
	M_TEL1           VARCHAR2(500) NULL,     -- �ڵ���
	M_TEL2           VARCHAR2(500) NULL,     -- �ڵ���
	M_TEL3           VARCHAR2(500) NULL,     -- �ڵ���
	Q_QUESTIONNO     NUMBER        NOT NULL, -- ������ȣ
	M_QUESTIONANSWER VARCHAR2(500) NULL      -- ������
);

-- ȸ�� �⺻Ű
CREATE UNIQUE INDEX PK_Member
	ON Member ( -- ȸ��
		M_USERID ASC -- ���̵�
	);

-- ȸ��
ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member -- ȸ�� �⺻Ű
		PRIMARY KEY (
			M_USERID -- ���̵�
		);

-- �����׸�
CREATE TABLE question (
	Q_QUESTIONNO   NUMBER   NOT NULL, -- ������ȣ
	Q_QUESTIONNAME VARCHAR2(500) NULL      -- ������
);

-- �����׸� �⺻Ű
CREATE UNIQUE INDEX PK_question
	ON question ( -- �����׸�
		Q_QUESTIONNO ASC -- ������ȣ
	);

-- �����׸�
ALTER TABLE question
	ADD
		CONSTRAINT PK_question -- �����׸� �⺻Ű
		PRIMARY KEY (
			Q_QUESTIONNO -- ������ȣ
		);

-- ī�װ����з�
CREATE TABLE categorygroup (
	KG_NO   NUMBER        NOT NULL, -- �з���ȣ
	KG_CODE NUMBER        NOT NULL, -- �з��ڵ�
	KG_NAME VARCHAR2(500) NOT NULL  -- �з��̸�
);

-- ī�װ����з� �⺻Ű
CREATE UNIQUE INDEX PK_categorygroup
	ON categorygroup ( -- ī�װ����з�
		KG_NO ASC -- �з���ȣ
	);

-- ī�װ����з�
ALTER TABLE categorygroup
	ADD
		CONSTRAINT PK_categorygroup -- ī�װ����з� �⺻Ű
		PRIMARY KEY (
			KG_NO -- �з���ȣ
		);

-- ī�װ���
CREATE TABLE category (
	K_NO   NUMBER        NOT NULL, -- ī�װ�����ȣ
	KG_NO  NUMBER        NOT NULL, -- �з���ȣ
	K_CODE NUMBER        NULL,     -- ī�װ����ڵ�
	K_NAME VARCHAR2(500) NULL      -- ī�װ����̸�
);

-- ī�װ��� �⺻Ű
CREATE UNIQUE INDEX PK_category
	ON category ( -- ī�װ���
		K_NO ASC -- ī�װ�����ȣ
	);

-- ī�װ���
ALTER TABLE category
	ADD
		CONSTRAINT PK_category -- ī�װ��� �⺻Ű
		PRIMARY KEY (
			K_NO -- ī�װ�����ȣ
		);

-- Ŭ����
CREATE TABLE Class (
	C_NO         NUMBER        NOT NULL, -- Ŭ������ȣ
	M_USERID     VARCHAR2(500) NOT NULL, -- ȣ��Ʈ���̵�
	K_NO         NUMBER        NOT NULL, -- ī�װ�����ȣ
	C_NAME       VARCHAR2(500) NOT NULL, -- Ŭ������
	C_PRICE      NUMBER        DEFAULT 0 not NULL     , -- ���
	C_GOAL       VARCHAR2(500) NULL,     -- ��ǥ
	C_TARGET     VARCHAR2(500) NULL,     -- ���
	C_SPEVIALTY  VARCHAR2(500) NULL,     -- Ư�����
	C_DETAILINFO VARCHAR2(500) NULL,     -- ������
	C_PLACE     VARCHAR2(500) NOT NULL, -- ���
	C_PLACEDETAIL   VARCHAR2(500) NOT NULL, -- ���ּ�
	C_MAINIMG    VARCHAR2(500) not null,     -- �����̹���
	C_DETAILIMG1 VARCHAR2(500) NULL,     -- ���̹���1
	C_DETAILIMG2 VARCHAR2(500) NULL,     -- ���̹���2
	C_DETAILIMG3 VARCHAR2(500) NULL,     -- ���̹���3
	C_PAYMENTWAY VARCHAR2(500) not null,     -- �������
	C_MAXPERSON  VARCHAR2(500) NULL,     -- �ִ��ο�
	C_HITS       NUMBER        DEFAULT 0, -- ��ȸ��
	C_DEL        VARCHAR2(5)    NULL, -- ��������
	C_REGDATE    DATE          DEFAULT sysdate-- �����
);

-- Ŭ���� �⺻Ű
CREATE UNIQUE INDEX PK_Class
	ON Class ( -- Ŭ����
		C_NO ASC -- Ŭ������ȣ
	);

-- Ŭ����
ALTER TABLE Class
	ADD
		CONSTRAINT PK_Class -- Ŭ���� �⺻Ű
		PRIMARY KEY (
			C_NO -- Ŭ������ȣ
		);

-- Ŭ����
ALTER TABLE Class
	ADD
		CONSTRAINT FK_Member_TO_Class -- ȸ�� -> Ŭ����
		FOREIGN KEY (
			M_USERID -- ȣ��Ʈ���̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- Ŭ����
ALTER TABLE Class
	ADD
		CONSTRAINT FK_category_TO_Class -- ī�װ��� -> Ŭ����
		FOREIGN KEY (
			K_NO -- ī�װ�����ȣ
		)
		REFERENCES category ( -- ī�װ���
			K_NO -- ī�װ�����ȣ
		);
-- Ŭ��������
CREATE TABLE booking (
	BK_NO       NUMBER        NOT NULL, -- �����ȣ
	P_NO        NUMBER        NOT NULL, -- ������ȣ
	BK_USERID   VARCHAR2(500) NOT NULL, -- ���̵�
	SC_NO       NUMBER        NOT NULL, -- �����ٹ�ȣ
	BK_DATE     DATE          DEFAULT sysdate NULL     , -- ������
	BK_ENDCHECK VARCHAR2(500) DEFAULT 'N'  NULL     -- ��������
);


-- Ŭ�������� �⺻Ű
CREATE UNIQUE INDEX PK_booking
	ON booking ( -- Ŭ��������
		BK_NO ASC -- �����ȣ
	);

-- Ŭ��������
ALTER TABLE booking
	ADD
		CONSTRAINT PK_booking -- Ŭ�������� �⺻Ű
		PRIMARY KEY (
			BK_NO -- �����ȣ
		);

-- ������
CREATE TABLE classschedule (
	SC_NO        NUMBER        NOT NULL, -- �����ٹ�ȣ
	C_NO         NUMBER        NOT NULL, -- Ŭ������ȣ
	SC_CODE      VARCHAR2(500) NOT NULL, -- �����ٱ���
	SC_STARTDATE VARCHAR2(500) NULL,     -- ������
	SC_ENDDATE   VARCHAR2(500) NULL,     -- ������
	SC_WEEK      VARCHAR2(500) NULL,     -- ����
	SC_STARTTIME VARCHAR2(500) NULL,     -- ���۽ð�
	SC_ENDTIME   VARCHAR2(500) NULL      -- ����ð�
);


-- ������ �⺻Ű
CREATE UNIQUE INDEX PK_classschedule
	ON classschedule ( -- ������
		SC_NO ASC -- �����ٹ�ȣ
	);

-- ������
ALTER TABLE classschedule
	ADD
		CONSTRAINT PK_classschedule -- ������ �⺻Ű
		PRIMARY KEY (
			SC_NO -- �����ٹ�ȣ
		);

-- ������
ALTER TABLE classschedule
	ADD
		CONSTRAINT FK_Class_TO_classschedule -- Ŭ���� -> ������
		FOREIGN KEY (
			C_NO -- Ŭ������ȣ
		)
		REFERENCES Class ( -- Ŭ����
			C_NO -- Ŭ������ȣ
		);

-- ���ε�����

CREATE TABLE upfile (
	F_NO               NUMBER        NOT NULL, -- ���Ϲ�ȣ
	F_FILENAME         VARCHAR2(500) NULL,     -- ���ϸ�
	F_ORIGINALFILENAME VARCHAR2(500) NULL,     -- �����������ϸ�
	F_FILESIZE         NUMBER        NULL      -- ����ũ��
);

-- ���ε����� �⺻Ű
CREATE UNIQUE INDEX PK_upfile
	ON upfile ( -- ���ε�����
		F_NO ASC -- ���Ϲ�ȣ
	);

-- ���ε�����
ALTER TABLE upfile
	ADD
		CONSTRAINT PK_upfile -- ���ε����� �⺻Ű
		PRIMARY KEY (
			F_NO -- ���Ϲ�ȣ
		);

--DROP TABLE classqnaboard;
-- Ŭ����Q&A�Խ���
CREATE TABLE classqnaboard (
	CQ_NO          NUMBER        NOT NULL, -- �Խ��ǹ�ȣ
	C_NO           NUMBER        NOT NULL, -- Ŭ������ȣ
	M_USERID       VARCHAR2(500) NOT NULL, -- ���̵�
	CQ_CONTENT     CLOB          NULL,     -- ����
	CQ_REPAYCHECK  VARCHAR2(500) DEFAULT 'N' NULL, -- �亯����
	CQ_SECRETCHECK VARCHAR2(500) DEFAULT 'N' NULL, -- ��бۿ���
	CQ_DELFLAG     VARCHAR2(500) DEFAULT 'N' NULL, -- ��������
	C_REGDATE      DATE          DEFAULT sysdate NULL      -- �ۼ���
);

-- Ŭ����Q&A�Խ��� �⺻Ű
CREATE UNIQUE INDEX PK_classqnaboard
	ON classqnaboard ( -- Ŭ����Q&A�Խ���
		CQ_NO ASC -- �Խ��ǹ�ȣ
	);

-- Ŭ����Q&A�Խ���
ALTER TABLE classqnaboard
	ADD
		CONSTRAINT PK_classqnaboard -- Ŭ����Q&A�Խ��� �⺻Ű
		PRIMARY KEY (
			CQ_NO -- �Խ��ǹ�ȣ
		);

-- Ŭ����Q&A�亯
CREATE TABLE classqnarepay (
	CQR_NO      NUMBER        NOT NULL, -- �亯��ȣ
	CQ_NO       NUMBER        NOT NULL, -- �Խ��ǹ�ȣ
	M_USERID    VARCHAR2(500) NOT NULL, -- ȣ��Ʈ���̵�
	CQR_CONTENT CLOB          NOT NULL, -- ����
	CQR_DELFLAG VARCHAR2(500) DEFAULT 'N' NULL     , -- ��������
	CQR_REGDATE DATE          DEFAULT sysdate NULL      -- �ۼ���
);

-- Ŭ����Q&A�亯 �⺻Ű
CREATE UNIQUE INDEX PK_classqnarepay
	ON classqnarepay ( -- Ŭ����Q&A�亯
		CQR_NO ASC -- �亯��ȣ
	);

-- Ŭ����Q&A�亯
ALTER TABLE classqnarepay
	ADD
		CONSTRAINT PK_classqnarepay -- Ŭ����Q&A�亯 �⺻Ű
		PRIMARY KEY (
			CQR_NO -- �亯��ȣ
		);

-- Ŭ�����ı�Խ���
CREATE TABLE classboard (
	CB_NO        NUMBER        NOT NULL, -- �ı��ȣ
	C_NO         NUMBER        NOT NULL, -- Ŭ������ȣ
	M_USERID     VARCHAR2(500) NOT NULL, -- ���̵�
	CB_TITLE     VARCHAR2(500) NULL,     -- ����
	CB_REGDATE   DATE          NULL,     -- �����
	CB_READCOUNT NUMBER        NULL,     -- ��ȸ��
	CB_CONTENT   CLOB          NULL,     -- ����
	CB_GRADE     NUMBER        NULL,     -- ����
	CB_FILENAME  VARCHAR2(500) NULL      -- ���ϸ�
);

-- Ŭ�����ı�Խ��� �⺻Ű
CREATE UNIQUE INDEX PK_classboard
	ON classboard ( -- Ŭ�����ı�Խ���
		CB_NO ASC -- �ı��ȣ
	);

-- Ŭ�����ı�Խ���
ALTER TABLE classboard
	ADD
		CONSTRAINT PK_classboard -- Ŭ�����ı�Խ��� �⺻Ű
		PRIMARY KEY (
			CB_NO -- �ı��ȣ
		);

-- ����
CREATE TABLE message (
	MS_NO      NUMBER        NOT NULL, -- ������ȣ
	M_USERID   VARCHAR2(500) NOT NULL, -- �������
	MS_TITLE   VARCHAR2(500) NULL,     -- ����
	MS_CONTENT CLOB          NULL,     -- ����
	MS_REGDATE DATE         DEFAULT sysdate NULL      -- �����
);


-- ���� �⺻Ű
CREATE UNIQUE INDEX PK_message
	ON message ( -- ����
		MS_NO ASC -- ������ȣ
	);

-- ����
ALTER TABLE message
	ADD
		CONSTRAINT PK_message -- ���� �⺻Ű
		PRIMARY KEY (
			MS_NO -- ������ȣ
		);

-- �Խ��Ǻз�
CREATE TABLE boardgroup  (
	BG_NO           NUMBER        NOT NULL, -- �Խ��Ǻз���ȣ
	BG_NAME         VARCHAR2(500) NOT NULL, -- �Խ����̸�
	BG_INFO         CLOB          NOT NULL, -- �Ұ�
	BG_ORDER        NUMBER        NOT NULL, -- ����
	BG_REPAYCHECK   VARCHAR2(500) NOT NULL, -- ��۰��ɿ���
	BG_FILEUPCHECK  VARCHAR2(500) NOT NULL, -- ����÷�ΰ��ɿ���
	BG_FILEUPNUMBER NUMBER        NOT NULL, -- ÷�ΰ������ϼ���
	BG_FILEUPSIZE   NUMBER        NOT NULL, -- ÷�ΰ�������ũ��
	BG_REGDATE      DATE          DEFAULT sysdate NULL     , -- �����
	BG_EDITDATE     DATE          DEFAULT sysdate NULL  -- ����������
);


-- �Խ��Ǻз� �⺻Ű
CREATE UNIQUE INDEX PK_boardgroup 
	ON boardgroup  ( -- �Խ��Ǻз�
		BG_NO ASC -- �Խ��Ǻз���ȣ
	);

-- �Խ��Ǻз�
ALTER TABLE boardgroup 
	ADD
		CONSTRAINT PK_boardgroup  -- �Խ��Ǻз� �⺻Ű
		PRIMARY KEY (
			BG_NO -- �Խ��Ǻз���ȣ
		);

-- ��������
CREATE TABLE noticeboard (
	NB_NO        NUMBER        NOT NULL, -- �Խ��ǹ�ȣ
	M_USERID     VARCHAR2(500) NOT NULL, -- ��ھ��̵�
	BG_NO        NUMBER        NOT NULL, -- �Խ��Ǻз���ȣ
	NB_TITLE     VARCHAR2(500) NOT NULL, -- ����
	NB_REGDATE   DATE          DEFAULT sysdate NULL     , -- �����
	NB_READCOUNT NUMBER       DEFAULT 0 NULL     , -- ��ȸ��
	NB_CONTENT   CLOB          NOT NULL, -- ����
	NB_DELFLAG   VARCHAR2(500) DEFAULT 'N' NULL      -- ��������
);

-- �������� �⺻Ű
CREATE UNIQUE INDEX PK_noticeboard
	ON noticeboard ( -- ��������
		NB_NO ASC -- �Խ��ǹ�ȣ
	);

-- ��������
ALTER TABLE noticeboard
	ADD
		CONSTRAINT PK_noticeboard -- �������� �⺻Ű
		PRIMARY KEY (
			NB_NO -- �Խ��ǹ�ȣ
		);

-- �̿�ȳ�
CREATE TABLE useboard (
	UB_NO        NUMBER        NOT NULL, -- �Խ��ǹ�ȣ
	M_USERID     VARCHAR2(500) NOT NULL, -- ��ھ��̵�
	BG_NO        NUMBER        NOT NULL, -- �Խ��Ǻз���ȣ
	UB_TITLE     VARCHAR2(500) NOT NULL, -- ����
	UB_REGDATE   DATE          DEFAULT sysdate NULL     , -- �����
	UB_READCOUNT NUMBER        DEFAULT 0 NULL     , -- ��ȸ��
	UB_CONTENT   CLOB          NOT NULL, -- ����
	UB_DELFLAG   VARCHAR2(500) DEFAULT 'N' NULL      -- ��������
);

-- �̿�ȳ� �⺻Ű
CREATE UNIQUE INDEX PK_useboard
	ON useboard ( -- �̿�ȳ�
		UB_NO ASC -- �Խ��ǹ�ȣ
	);

-- �̿�ȳ�
ALTER TABLE useboard
	ADD
		CONSTRAINT PK_useboard -- �̿�ȳ� �⺻Ű
		PRIMARY KEY (
			UB_NO -- �Խ��ǹ�ȣ
		);

-- ���ϱ�
CREATE TABLE shoppingbasket   (
	SB_NO      NUMBER        NOT NULL, -- ���ȣ
	SB_USERID  VARCHAR2(500) NOT NULL, -- ���̵�
	C_NO       NUMBER        NULL,     -- Ŭ������ȣ
	SC_REGDATE DATE          DEFAULT sysdate  NULL-- �����
);

-- ���ϱ� �⺻Ű
CREATE UNIQUE INDEX PK_shoppingbasket  
	ON shoppingbasket   ( -- ���ϱ�
		SB_NO ASC -- ���ȣ
	);

-- ���ϱ�
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT PK_shoppingbasket   -- ���ϱ� �⺻Ű
		PRIMARY KEY (
			SB_NO -- ���ȣ
		);

-- ���ϱ�
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT FK_Member_TO_shoppingbasket   -- ȸ�� -> ���ϱ�
		FOREIGN KEY (
			SB_USERID -- ���̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- ���ϱ�
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT FK_Class_TO_shoppingbasket   -- Ŭ���� -> ���ϱ�
		FOREIGN KEY (
			C_NO -- Ŭ������ȣ
		)
		REFERENCES Class ( -- Ŭ����
			C_NO -- Ŭ������ȣ
		);

-- ����
CREATE TABLE payment (
	PM_NO            NUMBER        NOT NULL, -- ������ȣ
	C_NO             NUMBER        NOT NULL, -- Ŭ������ȣ
	M_USERID         VARCHAR2(500) NOT NULL, -- ���̵�
	PM_PAYMENTWAY    VARCHAR2(500) NULL,     -- �������
	PM_PAYMENTDATE   DATE          NULL,     -- ������
	PM_COMPLETECHECK VARCHAR2(500) DEFAULT 'N' NULL     , -- �����ϷῩ��
	PM_CANCELCHECK   VARCHAR2(500) DEFAULT 'N' NULL     -- ������ҿ���
);

-- ���� �⺻Ű
CREATE UNIQUE INDEX PK_payment
	ON payment ( -- ����
		PM_NO ASC -- ������ȣ
	);

-- ����
ALTER TABLE payment
	ADD
		CONSTRAINT PK_payment -- ���� �⺻Ű
		PRIMARY KEY (
			PM_NO -- ������ȣ
		);

-- �������
CREATE TABLE paymentcancel (
	PMC_NO       NUMBER        NOT NULL, -- ������ҹ�ȣ
	PM_NO        NUMBER        NOT NULL, -- ������ȣ
	PMC_DATE     DATE          NULL,     -- �����
	PMC_PROQRESS VARCHAR2(500) DEFAULT '������' , -- ���������Ȳ
	PMC_CALCEL   VARCHAR2(500) NULL,     -- �������
	PMC_DETAIL   VARCHAR2(500) NULL      -- ������
);

-- ������� �⺻Ű
CREATE UNIQUE INDEX PK_paymentcancel
	ON paymentcancel ( -- �������
		PMC_NO ASC -- ������ҹ�ȣ
	);

-- �������
ALTER TABLE paymentcancel
	ADD
		CONSTRAINT PK_paymentcancel -- ������� �⺻Ű
		PRIMARY KEY (
			PMC_NO -- ������ҹ�ȣ
		);

-- �����ڸ��ΰ���
CREATE TABLE operator (
	OP_NO       NUMBER        NOT NULL, -- ������ȣ
	F_NO        NUMBER        NOT NULL, -- ���Ϲ�ȣ
	K_NO        NUMBER        NULL,     -- ī�װ�����ȣ
	OP_SHOWFLAG VARCHAR2(500) DEFAULT 'N'      -- �����ֱ⿩��
);

-- �����ڸ��ΰ��� �⺻Ű
CREATE UNIQUE INDEX PK_operator
	ON operator ( -- �����ڸ��ΰ���
		OP_NO ASC -- ������ȣ
	);

-- �����ڸ��ΰ���
ALTER TABLE operator
	ADD
		CONSTRAINT PK_operator -- �����ڸ��ΰ��� �⺻Ű
		PRIMARY KEY (
			OP_NO -- ������ȣ
		);

-- ��������
CREATE TABLE messagemaga (
	MS_NO    NUMBER             NULL, -- ������ȣ
	M_USERID VARCHAR2(500)      NULL, -- �޴»��
	MS_CHECK VARCHAR2(5) DEFAULT 'N'  -- Ȯ�ο���
);

-- ȸ��
ALTER TABLE Member
	ADD
		CONSTRAINT FK_membergroup_TO_Member -- ������� -> ȸ��
		FOREIGN KEY (
			MG_NO2 -- ������й�ȣ
		)
		REFERENCES membergroup ( -- �������
			MG_NO -- ������й�ȣ
		);

-- ȸ��
ALTER TABLE Member
	ADD
		CONSTRAINT FK_category_TO_Member -- ī�װ��� -> ȸ��
		FOREIGN KEY (
			K_NO1 -- ī�װ�����ȣ1
		)
		REFERENCES category ( -- ī�װ���
			K_NO -- ī�װ�����ȣ
		);

-- ȸ��
ALTER TABLE Member
	ADD
		CONSTRAINT FK_category_TO_Member3 -- ī�װ��� -> ȸ��2
		FOREIGN KEY (
			K_NO2 -- ī�װ�����ȣ2
		)
		REFERENCES category ( -- ī�װ���
			K_NO -- ī�װ�����ȣ
		);

-- ȸ��
ALTER TABLE Member
	ADD
		CONSTRAINT FK_category_TO_Member2 -- ī�װ��� -> ȸ��3
		FOREIGN KEY (
			K_NO3 -- ī�װ�����ȣ3
		)
		REFERENCES category ( -- ī�װ���
			K_NO -- ī�װ�����ȣ
		);

-- ȸ��
ALTER TABLE Member
	ADD
		CONSTRAINT FK_question_TO_Member -- �����׸� -> ȸ��
		FOREIGN KEY (
			Q_QUESTIONNO -- ������ȣ
		)
		REFERENCES question ( -- �����׸�
			Q_QUESTIONNO -- ������ȣ
		);

-- ī�װ���
ALTER TABLE category
	ADD
		CONSTRAINT FK_categorygroup_TO_category -- ī�װ����з� -> ī�װ���
		FOREIGN KEY (
			KG_NO -- �з���ȣ
		)
		REFERENCES categorygroup ( -- ī�װ����з�
			KG_NO -- �з���ȣ
		);

-- Ŭ����
ALTER TABLE Class
	ADD
		CONSTRAINT FK_Member_TO_Class -- ȸ�� -> Ŭ����
		FOREIGN KEY (
			M_USERID -- ȣ��Ʈ���̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- Ŭ����
ALTER TABLE Class
	ADD
		CONSTRAINT FK_category_TO_Class -- ī�װ��� -> Ŭ����
		FOREIGN KEY (
			K_NO -- ī�װ�����ȣ
		)
		REFERENCES category ( -- ī�װ���
			K_NO -- ī�װ�����ȣ
		);

-- Ŭ��������
ALTER TABLE booking
	ADD
		CONSTRAINT FK_classschedule_TO_booking -- ������ -> Ŭ��������
		FOREIGN KEY (
			SC_NO -- �����ٹ�ȣ
		)
		REFERENCES classschedule ( -- ������
			SC_NO -- �����ٹ�ȣ
		);

-- Ŭ��������
ALTER TABLE booking
	ADD
		CONSTRAINT FK_Member_TO_booking -- ȸ�� -> Ŭ��������
		FOREIGN KEY (
			BK_USERID -- ���̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- Ŭ��������
ALTER TABLE booking
	ADD
		CONSTRAINT FK_payment_TO_booking -- ���� -> Ŭ��������
		FOREIGN KEY (
			P_NO -- ������ȣ
		)
		REFERENCES payment ( -- ����
			PM_NO -- ������ȣ
		);

-- ������
ALTER TABLE classschedule
	ADD
		CONSTRAINT FK_Class_TO_classschedule -- Ŭ���� -> ������
		FOREIGN KEY (
			C_NO -- Ŭ������ȣ
		)
		REFERENCES Class ( -- Ŭ����
			C_NO -- Ŭ������ȣ
		);

-- Ŭ����Q&A�Խ���
ALTER TABLE classqnaboard
	ADD
		CONSTRAINT FK_Member_TO_classqnaboard -- ȸ�� -> Ŭ����Q&A�Խ���
		FOREIGN KEY (
			M_USERID -- ���̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- Ŭ����Q&A�Խ���
ALTER TABLE classqnaboard
	ADD
		CONSTRAINT FK_Class_TO_classqnaboard -- Ŭ���� -> Ŭ����Q&A�Խ���
		FOREIGN KEY (
			C_NO -- Ŭ������ȣ
		)
		REFERENCES Class ( -- Ŭ����
			C_NO -- Ŭ������ȣ
		);

-- Ŭ����Q&A�亯
ALTER TABLE classqnarepay
	ADD
		CONSTRAINT FK_Member_TO_classqnarepay -- ȸ�� -> Ŭ����Q&A�亯
		FOREIGN KEY (
			M_USERID -- ȣ��Ʈ���̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- Ŭ����Q&A�亯
ALTER TABLE classqnarepay
	ADD
		CONSTRAINT FK_classqnaboardclassqnarepay -- Ŭ����Q&A�Խ��� -> Ŭ����Q&A�亯
		FOREIGN KEY (
			CQ_NO -- �Խ��ǹ�ȣ
		)
		REFERENCES classqnaboard ( -- Ŭ����Q&A�Խ���
			CQ_NO -- �Խ��ǹ�ȣ
		);

-- Ŭ�����ı�Խ���
ALTER TABLE classboard
	ADD
		CONSTRAINT FK_Memberclassboard -- ȸ�� -> Ŭ�����ı�Խ���
		FOREIGN KEY (
			M_USERID -- ���̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- Ŭ�����ı�Խ���
ALTER TABLE classboard
	ADD
		CONSTRAINT FK_Classclassboard -- Ŭ���� -> Ŭ�����ı�Խ���
		FOREIGN KEY (
			C_NO -- Ŭ������ȣ
		)
		REFERENCES Class ( -- Ŭ����
			C_NO -- Ŭ������ȣ
		);

-- ����
ALTER TABLE message
	ADD
		CONSTRAINT FK_Member_TO_message -- ȸ�� -> ����
		FOREIGN KEY (
			M_USERID -- �������
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- ��������
ALTER TABLE noticeboard
	ADD
		CONSTRAINT FK_boardgroupnoticeboard -- �Խ��Ǻз� -> ��������
		FOREIGN KEY (
			BG_NO -- �Խ��Ǻз���ȣ
		)
		REFERENCES boardgroup  ( -- �Խ��Ǻз�
			BG_NO -- �Խ��Ǻз���ȣ
		);

-- ��������
ALTER TABLE noticeboard
	ADD
		CONSTRAINT FK_Membernoticeboard -- ȸ�� -> ��������
		FOREIGN KEY (
			M_USERID -- ��ھ��̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- �̿�ȳ�
ALTER TABLE useboard
	ADD
		CONSTRAINT FK_boardgroupuseboard -- �Խ��Ǻз� -> �̿�ȳ�
		FOREIGN KEY (
			BG_NO -- �Խ��Ǻз���ȣ
		)
		REFERENCES boardgroup  ( -- �Խ��Ǻз�
			BG_NO -- �Խ��Ǻз���ȣ
		);

-- �̿�ȳ�
ALTER TABLE useboard
	ADD
		CONSTRAINT FK_Memberuseboard -- ȸ�� -> �̿�ȳ�
		FOREIGN KEY (
			M_USERID -- ��ھ��̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- ���ϱ�
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT FK_Membershoppingbasket   -- ȸ�� -> ���ϱ�
		FOREIGN KEY (
			SB_USERID -- ���̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- ���ϱ�
ALTER TABLE shoppingbasket  
	ADD
		CONSTRAINT FK_cheduleshoppingbasket   -- ������ -> ���ϱ�
		FOREIGN KEY (
			SC_NO -- �����ٹ�ȣ
		)
		REFERENCES classschedule ( -- ������
			SC_NO -- �����ٹ�ȣ
		);

-- ����
ALTER TABLE payment
	ADD
		CONSTRAINT FK_Member_TO_payment -- ȸ�� -> ����
		FOREIGN KEY (
			M_USERID -- ���̵�
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);

-- ����
ALTER TABLE payment
	ADD
		CONSTRAINT FK_Class_TO_payment -- Ŭ���� -> ����
		FOREIGN KEY (
			C_NO -- Ŭ������ȣ
		)
		REFERENCES Class ( -- Ŭ����
			C_NO -- Ŭ������ȣ
		);

-- �������
ALTER TABLE paymentcancel
	ADD
		CONSTRAINT FK_paymentpaymentcancel -- ���� -> �������
		FOREIGN KEY (
			PM_NO -- ������ȣ
		)
		REFERENCES payment ( -- ����
			PM_NO -- ������ȣ
		);

-- �����ڸ��ΰ���

ALTER TABLE operator
	ADD
		CONSTRAINT FK_upfileoperator -- ���ε����� -> �����ڸ��ΰ���
		FOREIGN KEY (
			F_NO -- ���Ϲ�ȣ
		)
		REFERENCES upfile ( -- ���ε�����
			F_NO -- ���Ϲ�ȣ
		);

-- �����ڸ��ΰ���
ALTER TABLE operator
	ADD
		CONSTRAINT FK_category_TO_operator -- ī�װ��� -> �����ڸ��ΰ���
		FOREIGN KEY (
			K_NO -- ī�װ�����ȣ
		)
		REFERENCES category ( -- ī�װ���
			K_NO -- ī�װ�����ȣ
		);
-- ��������
ALTER TABLE messagemaga
	ADD
		CONSTRAINT FK_message_TO_messagemaga -- ���� -> ��������
		FOREIGN KEY (
			MS_NO -- ������ȣ
		)
		REFERENCES message ( -- ����
			MS_NO -- ������ȣ
		);

-- ��������
ALTER TABLE messagemaga
	ADD
		CONSTRAINT FK_Member_TO_messagemaga -- ȸ�� -> ��������
		FOREIGN KEY (
			M_USERID -- �޴»��
		)
		REFERENCES Member ( -- ȸ��
			M_USERID -- ���̵�
		);
-- �Ű�
CREATE TABLE notify (
	C_NO      NUMBER        NOT NULL, -- Ŭ������ȣ
	N_CODE    VARCHAR2(500) NOT NULL, -- �Ű��׸�
	N_CONTENT VARCHAR2(500) NOT NULL  -- �Ű�����
);

-- �Ű� �⺻Ű
CREATE UNIQUE INDEX PK_notify
	ON notify ( -- �Ű�
		C_NO ASC -- Ŭ������ȣ
	);

-- �Ű�
ALTER TABLE notify
	ADD
		CONSTRAINT PK_notify -- �Ű� �⺻Ű
		PRIMARY KEY (
			C_NO -- Ŭ������ȣ
		);

-- �Ű�
ALTER TABLE notify
	ADD
		CONSTRAINT FK_Class_TO_notify -- Ŭ���� -> �Ű�
		FOREIGN KEY (
			C_NO -- Ŭ������ȣ
		)
		REFERENCES Class ( -- Ŭ����
			C_NO -- Ŭ������ȣ
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
start with 1
nomaxvalue
nocache;


create sequence USEBOARD_seq
increment by 1
start with 1
nomaxvalue
nocache;