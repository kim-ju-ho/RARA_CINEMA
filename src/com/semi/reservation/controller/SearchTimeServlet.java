package com.semi.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class SearchTimeServlet
 */
@WebServlet("/search.time")
public class SearchTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		
	
		

		
		System.out.println("검색 서블릿 들리니 ??? ...");
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		  ReservationService rs = new ReservationService();
			
			list = rs.searchTime();
		
			
			  JSONObject time = null;
		      JSONArray result = new JSONArray();
		
		      for(Reservation r : list) {
			        time= new JSONObject();
			         
			       time.put("showTime",r.getRshowtime());
			         
			         
			         result.add(time);
			         System.out.println(result);
			         System.out.println("시간표 검색도 서블릿옴..!");
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
