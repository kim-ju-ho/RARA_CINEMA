package com.semi.movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.movie.model.service.MovieService;
import com.semi.movie.model.vo.Movie;
import com.semi.qna.model.vo.PageInfo;

/**
 * Servlet implementation class movieInfo
 */
@WebServlet("/movieList.ml")
public class movieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public movieListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		ArrayList<Movie> list = new ArrayList();
		ArrayList<Movie> prelist = new ArrayList();
		MovieService ms = new MovieService();

        list = ms.selectList();
        prelist = ms.selectpreList();
        
        String page="";
	        
	        if(list != null) {
	           page = "views/movie/movieList.jsp";
	           request.setAttribute("list",list);
	           request.setAttribute("prelist",prelist);
	           
	          
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
