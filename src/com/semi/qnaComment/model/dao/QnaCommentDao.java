package com.semi.qnaComment.model.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.qnaComment.model.vo.QnaComment;



public class QnaCommentDao {

	private Properties prop = new Properties();
	public QnaCommentDao() {
		String filePath = QnaComment.class.getResource("/config/comment-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public ArrayList<QnaComment> selectList(Connection con, int qno) {
		ArrayList<QnaComment>  clist =null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<QnaComment>();
			
			while(rset.next()) {
				QnaComment qco = new QnaComment();
	            qco.setCno(rset.getInt("CNO"));
	            qco.setQno(rset.getInt("QNO"));
	            qco.setQcContent(rset.getString("QCCONTENT"));
	            qco.setQcDate(rset.getDate("QCDATE"));
	            clist.add(qco);
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}

	public int insertComment(Connection con, QnaComment qco) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qco.getQno());
			pstmt.setString(2, qco.getQcContent());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteComment(Connection con, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateComment(Connection con, int cno, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, cno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
