package com.semi.qnaComment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QnaComment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6157766098465889514L;
	
	private int qno;
	private int cno;
	private String qcContent;
	private Date qcDate;
	
	
	public QnaComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnaComment(int qno, String qcContent) {
		super();
		this.qno = qno;
		this.qcContent = qcContent;
	}

	public QnaComment(int qno, int cno, String qcContent, Date qcDate) {
		super();
		this.qno = qno;
		this.cno = cno;
		this.qcContent = qcContent;
		this.qcDate = qcDate;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getQcContent() {
		return qcContent;
	}

	public void setQcContent(String qcContent) {
		this.qcContent = qcContent;
	}

	public Date getQcDate() {
		return qcDate;
	}

	public void setQcDate(Date qcDate) {
		this.qcDate = qcDate;
	}

	@Override
	public String toString() {
		return "QnaComment [qno=" + qno + ", cno=" + cno + ", qcContent=" + qcContent + ", qcDate=" + qcDate + "]";
	}
	
	

	
	
}
