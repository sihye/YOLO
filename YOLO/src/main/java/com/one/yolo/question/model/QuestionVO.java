package com.one.yolo.question.model;

public class QuestionVO {
	
	private int qQuestionno;
	private String qQuestionname;
	
	public int getqQuestionno() {
		return qQuestionno;
	}
	public void setqQuestionno(int qQuestionno) {
		this.qQuestionno = qQuestionno;
	}
	public String getqQuestionname() {
		return qQuestionname;
	}
	public void setqQuestionname(String qQuestionname) {
		this.qQuestionname = qQuestionname;
	}
	@Override
	public String toString() {
		return "QuestionVO [qQuestionno=" + qQuestionno + ", qQuestionname=" + qQuestionname + "]";
	}
	
}
