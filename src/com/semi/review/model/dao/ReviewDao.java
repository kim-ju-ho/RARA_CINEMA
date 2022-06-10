package com.semi.review.model.dao;

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
import com.semi.review.model.vo.Review;

public class ReviewDao {

	private Properties prop;
	
	public ReviewDao() {
		prop = new Properties();
		String filePath = Qna.class.getResource("/config/review-query.properties").getPath();
	
		try {
			prop.load(new FileReader(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}

	public ArrayList<Review> selectList(Connection con, int currentPage, int limit, int movieNo) {
		ArrayList<Review> rarr = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("reviewlist");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review();
				r.setRenum(rset.getInt("RE_NO"));
				r.setMcode(rset.getInt("MOVIE_CODE"));
				r.setUserName(rset.getString("MEM_NAME"));
				r.setRecontent(rset.getString("RE_CONTENT"));
				r.setRscore(rset.getInt("RE_SCORE"));
				r.setReDate(rset.getDate("REDATE"));
				r.setLikenum(rset.getInt("LIKENUM"));
				r.setHatenum(rset.getInt("HATENUM"));
				rarr.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rarr;
	}

	public int insertReview(Connection con, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r.getMcode());
			pstmt.setString(2, r.getUserId());
			pstmt.setString(3, r.getRecontent());
			pstmt.setInt(4, r.getRscore());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con, int movieNo) {
		int listCount =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String sql = prop.getProperty("listCount");
		try {
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, movieNo);
		
		rset = pstmt.executeQuery();
		if(rset.next()) {
			listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public int updateReview(Connection con, int rno, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, rno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteReview(Connection con, int rno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}



}
