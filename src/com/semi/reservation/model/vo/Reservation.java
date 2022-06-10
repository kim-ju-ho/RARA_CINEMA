package com.semi.reservation.model.vo;

import java.io.Serializable;

public class Reservation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1077585826045459225L;
	

	private String rmovie;
	private String rageLimit;
	private String rpeoNum;
	private String rcinema;
	private String rscreen;
	private String rshowtime;
	private int rpirce;
	private String rimage;
	
	

	public Reservation() {}

	public Reservation(String rmovie, String rageLimit, String rpeoNum, String rcinema, String rscreen, String rshowtime,
			int rpirce,String rimage) {
		super();
		this.rmovie = rmovie;
		this.rageLimit = rageLimit;
		this.rpeoNum = rpeoNum;
		this.rcinema = rcinema;
		this.rscreen = rscreen;
		this.rshowtime = rshowtime;
		this.rpirce = rpirce;
		this.rimage = rimage;
	}

	
	public Reservation(String rmovie, String rageLimit) {
		super();
		this.rmovie = rmovie;
		this.rageLimit = rageLimit;
	}

	public String getRmovie() {
		return rmovie;
	}

	public void setRmovie(String rmovie) {
		this.rmovie = rmovie;
	}

	public String getRageLimit() {
		return rageLimit;
	}

	public void setRageLimit(String rageLimit) {
		this.rageLimit = rageLimit;
	}

	public String getRpeoNum() {
		return rpeoNum;
	}

	public void setRpeoNum(String rpeoNum) {
		this.rpeoNum = rpeoNum;
	}

	public String getRcinema() {
		return rcinema;
	}

	public void setRcinema(String rcinema) {
		this.rcinema = rcinema;
	}

	public String getRscreen() {
		return rscreen;
	}

	public void setRscreen(String rscreen) {
		this.rscreen = rscreen;
	}

	public String getRshowtime() {
		return rshowtime;
	}

	public void setRshowtime(String rshowtime) {
		this.rshowtime = rshowtime;
	}

	public int getRpirce() {
		return rpirce;
	}

	public void setRpirce(int rpirce) {
		this.rpirce = rpirce;
	}

	public String getRimage() {
		return rimage;
	}

	public void setRimage(String rimage) {
		this.rimage = rimage;
	}

	@Override
	public String toString() {
		return "Reservation [rmovie=" + rmovie + ", rageLimit=" + rageLimit + ", rpeoNum=" + rpeoNum + ", rcinema="
				+ rcinema + ", rscreen=" + rscreen + ", rshowtime=" + rshowtime + ", rpirce=" + rpirce + ", rimage="
				+ rimage + "]";
	}

}
