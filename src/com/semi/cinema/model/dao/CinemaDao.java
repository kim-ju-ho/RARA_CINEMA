package com.semi.cinema.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.cinema.model.vo.Cinema;
import static com.semi.common.JDBCTemplate.*;

public class CinemaDao {

	private Properties prop;
	
	public CinemaDao() {
		prop = new Properties();
		String filePath = CinemaDao.class.getResource("/config/cinema-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Cinema> cinemalist(Connection con) {
		ArrayList<Cinema> cinema = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("cinemaList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			cinema = new ArrayList<Cinema>();
			
			while(rset.next()) {
				Cinema c = new Cinema();
				c.setCinemaNo(rset.getInt("CINEMA_CODE"));
				c.setCinema(rset.getString("CINEMA_NAME"));
				
				cinema.add(c);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return cinema;
	}
	

	public ArrayList<Cinema> movielist(Connection con, String cinemaName,Date selectday) {
		ArrayList<Cinema> movieList = null;
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("screenMovieList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			pstmt.setDate(2, selectday);
			
			rset = pstmt.executeQuery();
			
			movieList = new ArrayList<Cinema>();
			
			while(rset.next()) {
				Cinema movie = new Cinema();
				movie.setMovieName(rset.getString("MOVIE_TITLE"));
				movie.setGenre(rset.getString("GENRE"));
				movie.setRunningtime(rset.getString("RUNNINGTIME"));
				movie.setOpen(rset.getDate("OPEN"));
				movie.setStarttime(rset.getString("START_TIME"));
				movie.setScreen(rset.getString("SCREEN_CODE"));
				movie.setNullseat(rset.getInt("NULL_SEAT"));
				
				movieList.add(movie);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return movieList;
	}

}
