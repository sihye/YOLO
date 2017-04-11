-- 회원
CREATE TABLE member (
	id         VARCHAR2(50)  NOT NULL, -- id
	pwd        VARCHAR2(50)  NOT NULL, -- pwd
	name       VARCHAR2(50)  NOT NULL, -- 이름
	zipcode    VARCHAR2(5)   NOT NULL, -- 우편번호
	addr       VARCHAR2(200) NOT NULL, -- 주소
	detailaddr VARCHAR2(200) NOT NULL, -- 상세주소
	tel        VARCHAR2(50)  NULL,     -- 전화번호
	email      VARCHAR2(200) NULL      -- 이메일
);

-- 회원 기본키
CREATE UNIQUE INDEX PK_member
	ON member ( -- 회원
		id ASC -- id
	);

-- 회원
ALTER TABLE member
	ADD
		CONSTRAINT PK_member -- 회원 기본키
		PRIMARY KEY (
			id -- id
		);




