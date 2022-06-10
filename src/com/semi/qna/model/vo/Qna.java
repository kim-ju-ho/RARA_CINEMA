package com.semi.qna.model.vo;

import java.io.Serializable;
import java.sql.Date;


public class Qna implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5836133637715056571L;
	
	private int qno;
	private String qtype;
	private String qtitle;
	private String qcontent;
	private String qwriter;
	private String answer;
	private String qfile;
	private String status;
	private Date qdate;
	
	
	public Qna() {

	}


	public Qna(int qno, String qtype, String qtitle, String qwriter, String answer) {
		super();
		this.qno = qno;
		this.qtype = qtype;
		this.qtitle = qtitle;
		this.qwriter = qwriter;
		this.answer = answer;
	}
	
	


	


	public Qna(int qno, String qtype, String qtitle, String qcontent, String qwriter, String qfile) {
		super();
		this.qno = qno;
		this.qtype = qtype;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qwriter = qwriter;
		this.qfile = qfile;
	}


	public Qna(int qno, String qtype, String qtitle, String qcontent, String qwriter, String answer, String qfile,
			String status, Date qdate) {
		super();
		this.qno = qno;
		this.qtype = qtype;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qwriter = qwriter;
		this.answer = answer;
		this.qfile = qfile;
		this.status = status;
		this.qdate = qdate;
	}


	public int getQno() {
		return qno;
	}


	public void setQno(int qno) {
		this.qno = qno;
	}


	public String getQtype() {
		return qtype;
	}


	public void setQtype(String qtype) {
		this.qtype = qtype;
	}


	public String getQtitle() {
		return qtitle;
	}


	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}


	public String getQcontent() {
		return qcontent;
	}


	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}


	public String getQwriter() {
		return qwriter;
	}


	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public String getQfile() {
		return qfile;
	}


	public void setQfile(String qfile) {
		this.qfile = qfile;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Date getQdate() {
		return qdate;
	}


	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}


	@Override
	public String toString() {
		return "Qna [qno=" + qno + ", qtype=" + qtype + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qwriter="
				+ qwriter + ", answer=" + answer + ", qfile=" + qfile + ", status=" + status + ", qdate=" + qdate + "]";
	}

	
	
	
	
	

}
