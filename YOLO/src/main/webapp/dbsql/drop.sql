-- 멤버구분
DROP TABLE membergroup CASCADE CONSTRAINTS;

-- 회원
DROP TABLE Member CASCADE CONSTRAINTS;

-- 질문항목
DROP TABLE question;

-- 카테고리분류
DROP TABLE categorygroup CASCADE CONSTRAINTS;

-- 카테고리
DROP TABLE category CASCADE CONSTRAINTS;

-- 클래스
DROP TABLE Class CASCADE CONSTRAINTS;

-- 클래스예약
DROP TABLE booking;

-- 스케줄
DROP TABLE classschedule CASCADE CONSTRAINTS;

-- 업로드파일
DROP TABLE upfile;

-- 클래스Q&A게시판
DROP TABLE classqnaboard;

-- 클래스Q&A답변
DROP TABLE classqnarepay;

-- 클래스후기게시판
DROP TABLE classboard;

-- 쪽지
DROP TABLE message;

-- 게시판분류
DROP TABLE boardgroup;

-- 공지사항
DROP TABLE noticeboard;

-- 이용안내
DROP TABLE useboard;

-- 찜하기
DROP TABLE shoppingbasket;

-- 결제
DROP TABLE payment;

-- 결제취소
DROP TABLE paymentcancel;

-- 관리자메인관리
DROP TABLE operator;

-- 쪽지관리
DROP TABLE messagemaga;