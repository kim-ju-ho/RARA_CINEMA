package com.semi.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.review.model.dao.ReviewDao;
import com.semi.review.model.vo.Review;
import static com.semi.common.JDBCTemplate.*;

public class ReviewService {
	ReviewDao rDao = new ReviewDao();

	public int getListCount(int movieNo) {
		Connection con = getConnection();
		
		int listCount = rDao.getListCount(con,movieNo);
		close(con);
		
		return listCount;
	}

	public ArrayList<Review> reviewList(int currentPage, int limit ,int movieNo) {
		Connection con = getConnection();

		ArrayList<Review> rarr = rDao.selectList(con,currentPage,limit,movieNo);

		close(con);
		return rarr;
	}

	public int insertReview(Review r) {
		Connection con = getConnection();
		int result = rDao.insertReview(con,r);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}



	public int updateReview(int rno, String content) {
		Connection con = getConnection();
		
		int result = rDao.updateReview(con, rno, content);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteReview(int rno) {
		Connection con = getConnection();
		
		int result = rDao.deleteReview(con,rno);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	

}
