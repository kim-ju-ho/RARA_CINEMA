package com.semi.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.review.model.service.ReviewService;

/**
 * Servlet implementation class DeleteReviewServlet
 */
@WebServlet("/deleteReview.ro")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		System.out.println("리뷰 딜리트 서블릿 확인 rno="+rno+"mmno="+mno);
		ReviewService rs = new ReviewService();
		int result = rs.deleteReview(rno);
		
		if(result > 0) {
			response.sendRedirect("reviewList.rl?no="+mno);
		}else {
			request.setAttribute("msg", "댓글 수정 실패");
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
