-- 답변
CREATE TABLE reborder (
	reno    number        NOT NULL, -- 답변글번호
	id      VARCHAR2(50)  NOT NULL, -- id
	no      number        NOT NULL, -- 게시글번호
	content CLOB          NOT NULL, -- 내용
	regdate DATE          DEFAULT sysdate, -- 날짜
	delflag CHAR          DEFAULT 'N' -- 삭제여부
);

-- 답변 기본키
CREATE UNIQUE INDEX PK_reborder
	ON reborder ( -- 답변
		reno ASC -- 답변글번호
	);

-- 답변
ALTER TABLE reborder
	ADD
		CONSTRAINT PK_reborder -- 답변 기본키
		PRIMARY KEY (
			reno -- 답변글번호
		);

-- 답변
ALTER TABLE reborder
	ADD
		CONSTRAINT FK_member_TO_reborder -- 회원 -> 답변
		FOREIGN KEY (
			id -- id
		)
		REFERENCES member ( -- 회원
			id -- id
		)		
		ON DELETE CASCADE;
-- 답변
ALTER TABLE reborder
	ADD
		CONSTRAINT FK_border_TO_reborder -- 게시글 -> 답변
		FOREIGN KEY (
			no -- 게시글번호
		)
		REFERENCES border ( -- 게시글
			no -- 게시글번호
		)
		 ON DELETE CASCADE;
create sequence reborder_seq
start with 1
increment by 1
nocache;