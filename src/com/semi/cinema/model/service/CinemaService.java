package com.semi.cinema.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.semi.cinema.model.dao.CinemaDao;
import com.semi.cinema.model.vo.Cinema;
import static com.semi.common.JDBCTemplate.*;

public class CinemaService {
	
	private CinemaDao cDao = new CinemaDao();

	public ArrayList<Cinema> cinemalist() {
		Connection con = getConnection();
		
		ArrayList<Cinema> cinema = cDao.cinemalist(con);
		
		close(con);
		
		return cinema;
	}

	public ArrayList<Cinema> movielist(String cinemaName,Date selectday) {
		Connection con = getConnection();
		
		ArrayList<Cinema> movie = cDao.movielist(con,cinemaName,selectday);
		
		close(con);
		
		return movie;
	}

}
