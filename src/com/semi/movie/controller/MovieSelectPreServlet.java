package com.semi.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.movie.model.service.MovieService;
import com.semi.movie.model.vo.Movie;

/**
 * Servlet implementation class MovieSelectPreServlet
 */
@WebServlet("/moviepre.mo")
public class MovieSelectPreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieSelectPreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movieNo = Integer.parseInt(request.getParameter("no"));
		Movie m = new Movie();
		MovieService ms = new MovieService();
		m = ms.movieSelectPre(movieNo);
		
		String page="";
		
		System.out.println(m);
        
        if(m != null) {
           page = "views/movie/movieInfoPre.jsp";
           request.setAttribute("m",m);
           
          
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
