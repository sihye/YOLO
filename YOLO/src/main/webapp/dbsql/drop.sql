-- �������
DROP TABLE membergroup CASCADE CONSTRAINTS;

-- ȸ��
DROP TABLE Member CASCADE CONSTRAINTS;

-- �����׸�
DROP TABLE question;

-- ī�װ��з�
DROP TABLE categorygroup CASCADE CONSTRAINTS;

-- ī�װ�
DROP TABLE category CASCADE CONSTRAINTS;

-- Ŭ����
DROP TABLE Class CASCADE CONSTRAINTS;

-- Ŭ��������
DROP TABLE booking;

-- ������
DROP TABLE classschedule CASCADE CONSTRAINTS;

-- ���ε�����
DROP TABLE upfile CASCADE CONSTRAINTS;
-- Ŭ����Q&A�亯
DROP TABLE classqnarepay;



-- Ŭ����Q&A�Խ���
DROP TABLE classqnaboard;

-- Ŭ�����ı�Խ���
DROP TABLE classboard;

-- �Խ��Ǻз�
DROP TABLE boardgroup;
-- ��������
DROP TABLE messagemaga;

-- ����
DROP TABLE message;


-- ��������
DROP TABLE noticeboard;

-- �̿�ȳ�
DROP TABLE useboard;

-- ���ϱ�
DROP TABLE shoppingbasket;

-- ����
DROP TABLE payment;

-- �������
DROP TABLE paymentcancel;

-- �����ڸ��ΰ���
DROP TABLE operator;



--�Ű�NOTIFY 
DROP TABLE NOTIFY;


DROP SEQUENCE BOARDGROUP_seq;
DROP SEQUENCE BOOKING_seq;
DROP SEQUENCE CATEGORY_seq;
DROP SEQUENCE CATEGORYGROUP_seq;
DROP SEQUENCE CLASS_seq;
DROP SEQUENCE CLASSBOARD_seq;
DROP SEQUENCE CLASSQNABOARD_seq;
DROP SEQUENCE CLASSQNAREPAY_seq;
DROP SEQUENCE CLASSSCHEDULE_seq;
DROP SEQUENCE MEMBER_seq;
DROP SEQUENCE MEMBERGROUP_seq;
DROP SEQUENCE MESSAGE_seq;
DROP SEQUENCE MESSAGEMAGA_seq;
DROP SEQUENCE NOTICEBOARD_seq;
DROP SEQUENCE OPERATOR_seq;
DROP SEQUENCE PAYMENT_seq;
DROP SEQUENCE PAYMENTCANCEL_seq;
DROP SEQUENCE QUESTION_seq;
DROP SEQUENCE SHOPPINGBASKET_seq;
DROP SEQUENCE UPFILE_seq;
DROP SEQUENCE USEBOARD_seq;