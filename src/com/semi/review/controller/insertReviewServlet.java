package com.semi.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.review.model.service.ReviewService;
import com.semi.review.model.vo.Review;

/**
 * Servlet implementation class insertReviewServlet
 */
@WebServlet("/insertReview.ro")
public class insertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movienum = Integer.parseInt(request.getParameter("mo"));
		int score = Integer.parseInt(request.getParameter("score"));
		String userId = request.getParameter("id");
		String content = request.getParameter("content");
		
		Review r = new Review();
		r.setMcode(movienum);
		r.setUserId(userId);
		r.setRscore(score);
		r.setRecontent(content);
		System.out.println("서블릿 r"+r);
		
		int result = new ReviewService().insertReview(r);
		
		if(result > 0) {
			response.sendRedirect("reviewList.rl?no="+movienum);
		}else {
			request.setAttribute("msg", "댓글 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
