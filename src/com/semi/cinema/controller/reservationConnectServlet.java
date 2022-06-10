package com.semi.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class reservationConnectServlet
 */
@WebServlet("/reservationConnect.rc")
public class reservationConnectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reservationConnectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String moviename = request.getParameter("moviename");
		
		String page = "";
		
		if(moviename != null) {
			page = "views/reservation/reservation.jsp";
			request.setAttribute("moviename", moviename);
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
