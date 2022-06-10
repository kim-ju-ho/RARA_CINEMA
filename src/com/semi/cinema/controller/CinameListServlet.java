package com.semi.cinema.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.semi.cinema.model.service.CinemaService;
import com.semi.cinema.model.vo.Cinema;

/**
 * Servlet implementation class CinameListServlet
 */
@WebServlet("/CinemaList.do")
public class CinameListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CinameListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Cinema> cinema = new ArrayList<>();
		CinemaService cs = new CinemaService();
		
		cinema = cs.cinemalist();
//		for(Cinema cinemaN: cinema) {
//			System.out.println("cinema : " + cinema);
//		}
		JSONObject cinemaname = null;
		JSONArray result = new JSONArray();
		
		for(Cinema cinemaN: cinema) {
			cinemaname = new JSONObject();

			cinemaname.put("cinemaName", cinemaN.getCinema());

			result.add(cinemaname);
		}
		response.getWriter().print(result.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
