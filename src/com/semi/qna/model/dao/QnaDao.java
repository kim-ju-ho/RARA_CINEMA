package com.semi.qna.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.qna.model.vo.Qna;

import static com.semi.common.JDBCTemplate.*;

public class QnaDao {

private Properties prop;
	
	public QnaDao() {
		prop = new Properties();
		String filePath = Qna.class.getResource("/config/qna-query.properties").getPath();
	
		try {
			prop.load(new FileReader(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
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
	
	public ArrayList<Qna> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Qna> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
					
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow + limit -1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
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

	public Qna selectOne(Connection con, int qno) {
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Qna();
	            q.setQno(rset.getInt("QNO"));
	            q.setQtype(rset.getString("QTYPE"));
	            q.setQtitle(rset.getString("QTITLE"));
	            q.setQcontent(rset.getString("QCONTENT"));
	            q.setQwriter(rset.getString("QWRITER"));
	            q.setQdate(rset.getDate("QDATE"));
	            q.setQfile(rset.getString("QFILE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}

	public int insertQna(Connection con, Qna q) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("insertQna");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, q.getQwriter());
			pstmt.setString(2, q.getQtype());
			pstmt.setString(3, q.getQtitle());
			pstmt.setString(4, q.getQcontent());
			pstmt.setString(5, q.getQfile());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result; 
	}

	public int updateQna(Connection con, Qna q) {
		int result = 0;
	      PreparedStatement pstmt = null;
	      
	      String sql = null;
	      if(q.getQfile() != null) {
	    	  sql =prop.getProperty("updateQnaChangeFile");
	      }else {
	    	  sql = prop.getProperty("updateQna");
	      }
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, q.getQtype());
	         pstmt.setString(2, q.getQtitle());
	         pstmt.setString(3, q.getQcontent());
	         if(q.getQfile() != null) {
	        	 pstmt.setString(4, q.getQfile());
	        	 pstmt.setInt(5, q.getQno());
	         }else {
	        	 pstmt.setInt(4, q.getQno());	        	 
	         }

	         result = pstmt.executeUpdate();
	      } catch(SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	   
		return result;
	}

	public int deleteQna(Connection con, int qno) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQna");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,qno);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


}
