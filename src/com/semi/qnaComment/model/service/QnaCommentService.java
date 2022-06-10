package com.semi.qnaComment.model.service;

import static com.semi.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.semi.qnaComment.model.dao.QnaCommentDao;
import com.semi.qnaComment.model.vo.QnaComment;

public class QnaCommentService {

	QnaCommentDao qcDao = new QnaCommentDao();
	public ArrayList<QnaComment> selectList(int qno) {
		Connection con = getConnection();
		
		ArrayList<QnaComment> qclist = qcDao.selectList(con,qno);
		
		close(con);
		
		return qclist;
	}
	public int insertComment(QnaComment qco) {
			Connection con = getConnection();
			
			int result = qcDao.insertComment(con,qco);
			
			if(result > 0 ) commit(con);
			else rollback(con);
			
			close(con);
			
			return result;
	}
	public int deleteComment(int cno) {
		Connection con = getConnection();
		
		int result = qcDao.deleteComment(con,cno);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	public int updateComent(int cno, String content) {
		
		Connection con = getConnection();
		
		int result = qcDao.updateComment(con,cno,content);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
