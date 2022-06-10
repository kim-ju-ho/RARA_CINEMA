package com.semi.mypage.model.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.mypage.model.dao.MyPageDao;
import com.semi.qna.model.vo.Qna;
import com.semi.review.model.vo.Review;

public class MyPageService {
	
	MyPageDao mpDao = new MyPageDao();
//페이지에서 보이는 기능
	public ArrayList<Qna> myqnalist(String mId) {
		Connection con = getConnection();

		ArrayList<Qna> list = mpDao.myqnalist(con,mId);

		close(con);
		return list;
	}


	public ArrayList<Review> myReviewlist(String mId) {
		Connection con = getConnection();
		ArrayList<Review> mrlist = mpDao.myReviewlist(con,mId);
		return mrlist;
	}

//더보기 기능들..	
	public int getListCount(String userId) {
		Connection con = getConnection();
		
		int listCount = mpDao.getListCount(con, userId);
		close(con);
		
		return listCount;
	}
	
	public ArrayList<Qna> selectList(int currentPage, int limit, String userId) {
		Connection con = getConnection();
		
		ArrayList<Qna> list = mpDao.selectList(con,currentPage,limit,userId);
		
		close(con);
		return list;
	}



}
