package com.semi.reservation.controller;



import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.reservation.model.vo.Reservation;
import com.semi.reservation.service.ReservationService;



/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/selectlist.rs")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String moviename = request.getParameter("moviename");
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Reservation> list = new ArrayList<>();
		
		ReservationService rs = new ReservationService();
		
		list = rs.selectList();
		String page = "";
		
		if(list != null) {
			System.out.println("서블릿은 탐 ㅋㅋ! ");
			System.out.println(list);
			page = "views/reservation/reservation.jsp";
			request.setAttribute("list",list);
			request.setAttribute("selectmovie", moviename);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg","영화목록 불러오기 실패!! ");
		}
		
		
	
	request.getRequestDispatcher(page).forward(request,response);
	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
