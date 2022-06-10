package com.semi.reservation.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.semi.reservation.model.vo.Reservation;
import com.semi.reservation.service.ReservationService;



/**
 * Servlet implementation class MovieListAbc
 */
@WebServlet("/abc.go")
public class MovieListAbc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieListAbc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws IOException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		  
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Reservation> list = new ArrayList<Reservation>();
	      
	      ReservationService rs = new ReservationService();
			
			list = rs.list();
		
			
				
			  JSONObject movieInfo = null;
		      JSONArray result = new JSONArray();
		
		      for(Reservation r : list) {
			         movieInfo = new JSONObject();
			         
			        movieInfo.put("ageLimit",r.getRageLimit());
			        movieInfo.put("movieTitle", r.getRmovie());
			         
			         
			         result.add(movieInfo);
			         System.out.println(result);
			         System.out.println("가나다도 서블릿옴..!");
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
