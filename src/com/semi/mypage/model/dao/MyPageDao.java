package com.semi.mypage.model.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.qna.model.vo.Qna;
import com.semi.review.model.vo.Review;

public class MyPageDao {
	private Properties prop;
	
	public MyPageDao() {
			prop = new Properties();
			String filePath = Qna.class.getResource("/config/mypage-query.properties").getPath();
		
			try {
				prop.load(new FileReader(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			
		}
	}

	public ArrayList<Qna> myqnalist(Connection con, String mId) {
		ArrayList<Qna> qlist = new ArrayList<Qna>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("myqnalist");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna q = new Qna();
				q.setQtitle(rset.getString("QTITLE"));
				if(rset.getInt("ANSWER") >0 ) {
					q.setAnswer("응답");
				}else {
					q.setAnswer("미응답");
				}
				qlist.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return qlist;
	}

	
	public ArrayList<Review> myReviewlist(Connection con, String mId) {
		ArrayList<Review> mrlist = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("myReviewlist");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				r.setMtitle(rset.getString("MOVIE_TITLE"));
				r.setRscore(rset.getInt("RE_SCORE"));
				
				mrlist.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mrlist;
	}

	public int getListCount(Connection con, String userId) {
		int listCount =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(userId);
		
		String sql = prop.getProperty("listCount");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
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

	public ArrayList<Qna> selectList(Connection con, int currentPage, int limit, String userId) {
		ArrayList<Qna> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
					
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow + limit -1;
			pstmt.setString(1, userId);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			rset = pstmt.executeQuery();
			list = new ArrayList<Qna>();
			
			while(rset.next()) {
				Qna q = new Qna();
				q.setQno(rset.getInt("QNO"));
				q.setQtype(rset.getString("QTYPE"));
				q.setQtitle(rset.getString("QTITLE"));
				q.setQcontent(rset.getString("QCONTENT"));
				q.setQwriter(rset.getString("QWRITER"));
				if(rset.getInt("ANSWER") >0 ) {
					q.setAnswer("응답");
				}else {
					q.setAnswer("미응답");
				}
				q.setQdate(rset.getDate("QDATE"));
				list.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


}
