package com.semi.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7697584088220412509L;
	
	private int renum;
	private int mcode;
	private int memnum;
	private String mtitle;
	private String userName;
	private String userId;
	private int rscore;
	private String recontent;
	private int likenum;
	private int hatenum;
	private Date reDate;
	


	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	

	public Review(String mtitle, int rscore) {
		super();
		this.mtitle = mtitle;
		this.rscore = rscore;
	}




	public Review(int mcode, String userId, int rscore, String recontent) {
		super();
		this.mcode = mcode;
		this.userId = userId;
		this.rscore = rscore;
		this.recontent = recontent;
	}
	
	
	public String getMtitle() {
		return mtitle;
	}




	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}




	public Review(int renum, int mcode, int memnum, String userName, String userId, int rscore, String recontent,
			int likenum, int hatenum, Date reDate) {
		super();
		this.renum = renum;
		this.mcode = mcode;
		this.memnum = memnum;
		this.userName = userName;
		this.userId = userId;
		this.rscore = rscore;
		this.recontent = recontent;
		this.likenum = likenum;
		this.hatenum = hatenum;
		this.reDate = reDate;
	}




	public Review(int renum, int mcode, int memnum, String mtitle, String userName, String userId, int rscore,
			String recontent, int likenum, int hatenum, Date reDate) {
		super();
		this.renum = renum;
		this.mcode = mcode;
		this.memnum = memnum;
		this.mtitle = mtitle;
		this.userName = userName;
		this.userId = userId;
		this.rscore = rscore;
		this.recontent = recontent;
		this.likenum = likenum;
		this.hatenum = hatenum;
		this.reDate = reDate;
	}




	public String getUserId() {
		return userId;
	}
	
	
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	


	public int getRenum() {
		return renum;
	}



	public void setRenum(int renum) {
		this.renum = renum;
	}



	public int getMcode() {
		return mcode;
	}



	public void setMcode(int mcode) {
		this.mcode = mcode;
	}



	public int getMemnum() {
		return memnum;
	}



	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public int getRscore() {
		return rscore;
	}



	public void setRscore(int rscore) {
		this.rscore = rscore;
	}



	public String getRecontent() {
		return recontent;
	}



	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}



	public int getLikenum() {
		return likenum;
	}



	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}



	public int getHatenum() {
		return hatenum;
	}



	public void setHatenum(int hatenum) {
		this.hatenum = hatenum;
	}



	public Date getReDate() {
		return reDate;
	}



	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}


	@Override
	public String toString() {
		return "Review [renum=" + renum + ", mcode=" + mcode + ", memnum=" + memnum + ", userName=" + userName
				+ ", userId=" + userId + ", rscore=" + rscore + ", recontent=" + recontent + ", likenum=" + likenum
				+ ", hatenum=" + hatenum + ", reDate=" + reDate + "]";
	}




	
	
	
	
	
}
