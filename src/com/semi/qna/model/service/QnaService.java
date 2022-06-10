package com.semi.qna.model.service;


import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.qna.model.dao.QnaDao;
import com.semi.qna.model.vo.Qna;

public class QnaService {

	private QnaDao qDao = new QnaDao();

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = qDao.getListCount(con);
		close(con);
		
		return listCount;
	}
	
public ArrayList<Qna> selectList(int currentPage, int limit) {
		
		Connection con = getConnection();

		ArrayList<Qna> list = qDao.selectList(con,currentPage,limit);

		close(con);
		return list;
	}

public Qna selectOne(int qno) {
		Connection con = getConnection();
		
		Qna q = qDao.selectOne(con, qno);
		
		close(con);
	return q;
}

public int insertQna(Qna q) {
	Connection con = getConnection();
	
	int result = qDao.insertQna(con, q);
	
	if(result >0 ) commit(con);
	else rollback(con);
	
	close(con);
return result;
}

public Qna updateView(int qno) {
	Connection con = getConnection();
	
	Qna q = qDao.selectOne(con, qno);
	close(con);
	return q;
}

public int updateQna(Qna q) {
	Connection con = getConnection();
      
	int result = qDao.updateQna(con,q);
  
	if(result>0) commit(con);
	else rollback(con);
  
	close(con);
	return result;
}



public int deleteQna(int qno) {
	Connection con = getConnection();
	int result = qDao.deleteQna(con,qno);
	if(result >= 1) commit(con);
	else rollback(con);
	
	close(con);
	
	return result;
}



	
}
