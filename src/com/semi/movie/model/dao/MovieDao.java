package com.semi.movie.model.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.movie.model.vo.Movie;
import com.semi.qna.model.vo.Qna;

public class MovieDao {
	private Properties prop;
	

	public MovieDao() {
		prop = new Properties();
		String filePath = Qna.class.getResource("/config/movie-query.properties").getPath();
	
		try {
			prop.load(new FileReader(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}


	public ArrayList<Movie> selectList(Connection con) {
		ArrayList<Movie> mlist = new ArrayList<Movie>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("movielist");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Movie mv = new Movie();
				mv.setMovieTitle(rset.getString("MOVIE_TITLE"));
				mv.setMovieNo(rset.getInt("MOVIE_CODE"));
				mv.setPoster_path(rset.getString("POSTERPATH"));
				mv.setMovieOpen(rset.getDate("OPEN"));
				
				mlist.add(mv);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return mlist;
	}


	public ArrayList<Movie> selectpreList(Connection con) {
		ArrayList<Movie> mlist = new ArrayList<Movie>();
		Statement stmt = null;
		ResultSet rset = null;
		////쿼리 수정해야돼!!!!!!!!!!!!! 일단 똑같이 해놨는데 이건 상영 예정작이야!!!!!!!!!!!!!!!!!!!
		String sql = prop.getProperty("movieprelist");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Movie mv = new Movie();
				mv.setMovieTitle(rset.getString("MOVIE_TITLE"));
				mv.setMovieNo(rset.getInt("MOVIE_CODE"));
				mv.setPoster_path(rset.getString("POSTERPATH"));
				mv.setMovieOpen(rset.getDate("OPEN"));
				
				mlist.add(mv);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return mlist;
	}


	public Movie movieSelect(Connection con, int movieNo) {
		Movie m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovie");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Movie();
				m.setMovieTitle(rset.getString("MOVIE_TITLE"));
				m.setMovieNo(movieNo);
				m.setMovieOpen(rset.getDate("OPEN"));
				m.setMovieClose(rset.getDate("CLOSE"));
				m.setMovieGenre(rset.getString("GENRE"));
				m.setDirector(rset.getString("DIRECTOR"));
				m.setActor(rset.getString("ACTOR"));
				m.setAgeLimit(rset.getInt("AGELIMIT"));
				m.setRunningTime(rset.getInt("RUNNINGTIME"));
				m.setTrailerURL(rset.getString("TRAILERURL"));
				m.setMphotopath(rset.getString("MPHOTOPATH"));
				m.setPoster_path(rset.getString("POSTERPATH"));
				m.setMovieInfo(rset.getString("MOVIEINFO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

//=========================================이 밑으로 더보기=========================================	
	
	
//현재상영작 쿼리문 고쳐야함
	public ArrayList<Movie> selectListMore(Connection con, int currentPage, int limit) {
		ArrayList<Movie> mlist = new ArrayList<Movie>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListMore");
		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow + limit -1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Movie mv = new Movie();
				mv.setMovieTitle(rset.getString("MOVIE_TITLE"));
				mv.setMovieNo(rset.getInt("MOVIE_CODE"));
				mv.setPoster_path(rset.getString("POSTERPATH"));
				mv.setMovieOpen(rset.getDate("OPEN"));
				
				mlist.add(mv);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mlist;
	}

//	상영예정작 쿼리문 고쳐야함
	public ArrayList<Movie> selectPreListMore(Connection con, int currentPage, int limit) {
		ArrayList<Movie> mlist = new ArrayList<Movie>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPreListMore");
		try {
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow + limit -1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Movie mv = new Movie();
				mv.setMovieTitle(rset.getString("MOVIE_TITLE"));
				mv.setMovieNo(rset.getInt("MOVIE_CODE"));
				mv.setPoster_path(rset.getString("POSTERPATH"));
				mv.setMovieOpen(rset.getDate("OPEN"));
				
				mlist.add(mv);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mlist;
	}

//페이징 처리
	public int getListCount(Connection con) {
		int listCount =0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}


	public Movie movieSelectPre(Connection con, int movieNo) {
		Movie m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMoviePre");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Movie();
				m.setMovieTitle(rset.getString("MOVIE_TITLE"));
				m.setMovieNo(movieNo);
				m.setMovieOpen(rset.getDate("OPEN"));
				m.setMovieClose(rset.getDate("CLOSE"));
				m.setMovieGenre(rset.getString("GENRE"));
				m.setDirector(rset.getString("DIRECTOR"));
				m.setActor(rset.getString("ACTOR"));
				m.setAgeLimit(rset.getInt("AGELIMIT"));
				m.setRunningTime(rset.getInt("RUNNINGTIME"));
				m.setTrailerURL(rset.getString("TRAILERURL"));
				m.setMphotopath(rset.getString("MPHOTOPATH"));
				m.setPoster_path(rset.getString("POSTERPATH"));
				m.setMovieInfo(rset.getString("MOVIEINFO"));
			}
			
			System.out.println(m);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

}
