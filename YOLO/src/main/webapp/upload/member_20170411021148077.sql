-- ȸ��
CREATE TABLE member (
	id         VARCHAR2(50)  NOT NULL, -- id
	pwd        VARCHAR2(50)  NOT NULL, -- pwd
	name       VARCHAR2(50)  NOT NULL, -- �̸�
	zipcode    VARCHAR2(5)   NOT NULL, -- �����ȣ
	addr       VARCHAR2(200) NOT NULL, -- �ּ�
	detailaddr VARCHAR2(200) NOT NULL, -- ���ּ�
	tel        VARCHAR2(50)  NULL,     -- ��ȭ��ȣ
	email      VARCHAR2(200) NULL      -- �̸���
);

-- ȸ�� �⺻Ű
CREATE UNIQUE INDEX PK_member
	ON member ( -- ȸ��
		id ASC -- id
	);

-- ȸ��
ALTER TABLE member
	ADD
		CONSTRAINT PK_member -- ȸ�� �⺻Ű
		PRIMARY KEY (
			id -- id
		);




