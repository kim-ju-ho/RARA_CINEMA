package com.semi.cinema.model.vo;

import java.io.Serializable;
import java.sql.Date;
	
public class Cinema implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4373732675361179509L;

	private int cinemaNo;
	private String cinema;
	private String screen;
	private String movieName;
	private int totalseat;
	private String genre;
	private String runningtime;
	private Date open;
	private String starttime;
	private int nullseat;
	public Cinema() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cinema(int cinemaNo, String cinema, String screen, String movieName, int totalseat, String genre,
			String runningtime, Date open, String starttime, int nullseat) {
		super();
		this.cinemaNo = cinemaNo;
		this.cinema = cinema;
		this.screen = screen;
		this.movieName = movieName;
		this.totalseat = totalseat;
		this.genre = genre;
		this.runningtime = runningtime;
		this.open = open;
		this.starttime = starttime;
		this.nullseat = nullseat;
	}
	public int getCinemaNo() {
		return cinemaNo;
	}
	public void setCinemaNo(int cinemaNo) {
		this.cinemaNo = cinemaNo;
	}
	public String getCinema() {
		return cinema;
	}
	public void setCinema(String cinema) {
		this.cinema = cinema;
	}
	public String getScreen() {
		return screen;
	}
	public void setScreen(String screen) {
		this.screen = screen;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public int getTotalseat() {
		return totalseat;
	}
	public void setTotalseat(int totalseat) {
		this.totalseat = totalseat;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
	public Date getOpen() {
		return open;
	}
	public void setOpen(Date open) {
		this.open = open;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public int getNullseat() {
		return nullseat;
	}
	public void setNullseat(int nullseat) {
		this.nullseat = nullseat;
	}
	
}
