package com.semi.cinema.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.semi.cinema.model.service.CinemaService;
import com.semi.cinema.model.vo.Cinema;

/**
 * Servlet implementation class ScreenListServlet
 */
@WebServlet("/MovieList.do")
public class MovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		String cinemaName = request.getParameter("cinemaName");
		String date = request.getParameter("date");
		
		System.out.println(date);
		System.out.println(cinemaName);
		
		Date selectday = null;
		String[] dateArr = date.split("-");
		int[] intArr = new int[dateArr.length];
		
		for(int i=0; i<dateArr.length;i++) {
			intArr[i] = Integer.parseInt(dateArr[i]);
		}
		
		selectday = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		
		
		
		ArrayList<Cinema> movielist = new ArrayList<>();
		CinemaService cs = new CinemaService();
		
		movielist = cs.movielist(cinemaName,selectday);
		
		System.out.println("check  : " + movielist.size());
		
//		JSONObject movie = null;
//		JSONArray result = new JSONArray();
//		
//		for(Cinema Cinema: movielist) {
//			movie = new JSONObject();
//
//			movie.put("movieName", Cinema.getMovieName());
//			movie.put("genre", Cinema.getGenre());
//			movie.put("runningTime", Cinema.getRunnigtime());
//			movie.put("open", Cinema.getOpen());
//			movie.put("screen", Cinema.getScreen());
//			movie.put("startTime", Cinema.getStarttime());
//			movie.put("nullSeat", Cinema.getNullseat());
//			
//			result.add(movie);
//		}
		
//		response.getWriter().print(result.toJSONString());
		new Gson().toJson(movielist,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
