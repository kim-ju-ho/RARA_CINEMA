package com.semi.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.movie.model.service.MovieService;
import com.semi.movie.model.vo.Movie;
import com.semi.review.model.service.ReviewService;
import com.semi.review.model.vo.PageInfo;
import com.semi.review.model.vo.Review;

/**
 * Servlet implementation class reviewServlet
 */
@WebServlet("/reviewList.rl")
public class reviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movieNo = Integer.parseInt(request.getParameter("no"));
		Movie m = new Movie();
		ArrayList<Review> rarr = new ArrayList<Review>();
		ReviewService rs = new ReviewService();
		MovieService ms = new MovieService();
		
        int startPage;
        int endPage;
        int maxPage;
        int currentPage;
        int limit;
        currentPage = 1;
        limit = 10;
        
        if(request.getParameter("currentPage") != null) {
           currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        
        // 페이징 처리
        int listCount = rs.getListCount(movieNo);
        System.out.println("서블릿 총 페이지 수 : " + listCount);
        maxPage = (int)((double)listCount/limit + 0.9);
        startPage = ((int)((double)currentPage/limit+0.9)-1)*limit + 1;
        
        endPage = startPage + limit -1;
        if(endPage > maxPage) {
           endPage = maxPage;
        }

		m = ms.movieSelect(movieNo);
		rarr = rs.reviewList(currentPage, limit, movieNo);
		
		String page="";
        
        if(m != null) {
           page = "views/movie/movieInfoReview.jsp";
           request.setAttribute("m",m);
           request.setAttribute("rarr",rarr);
           PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
           request.setAttribute("pi", pi);
           
          
        } else {
           page = "views/common/errorPage.jsp";
           request.setAttribute("msg", "Qna목록 불러오기 에러!");
        }
        request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
