package com.semi.movie.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.movie.model.dao.MovieDao;
import com.semi.movie.model.vo.Movie;

import static com.semi.common.JDBCTemplate.*;

public class MovieService {
	
	MovieDao mDao = new MovieDao();

	public ArrayList<Movie> selectList() {
		Connection con = getConnection();

		ArrayList<Movie> list = mDao.selectList(con);

		close(con);
		return list;
	}

	public ArrayList<Movie> selectpreList() {
		Connection con = getConnection();

		ArrayList<Movie> list = mDao.selectpreList(con);

		close(con);
		return list;
	}

	public Movie movieSelect(int movieNo) {
		Connection con = getConnection();

		Movie m = mDao.movieSelect(con,movieNo);

		close(con);
		return m;
	}

	public ArrayList<Movie> selectListMore(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<Movie> list = mDao.selectListMore(con,currentPage,limit);

		close(con);
		return list;
	}

	public ArrayList<Movie> selectPreListMore(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<Movie> list = mDao.selectPreListMore(con,currentPage,limit);

		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = mDao.getListCount(con);
		close(con);
		
		return listCount;
	}

	public Movie movieSelectPre(int movieNo) {
		Connection con = getConnection();
		
		

		Movie m = mDao.movieSelectPre(con,movieNo);

		close(con);
		return m;
	}



}
