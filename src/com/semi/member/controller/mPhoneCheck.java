package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;

/**
 * Servlet implementation class mPhoneCheck
 */
@WebServlet("/PhoneCheck.me")
public class mPhoneCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mPhoneCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String phone = request.getParameter("tel1")+"-"
				 	   + request.getParameter("tel2")+"-"
				 	   + request.getParameter("tel3");
	        MemberService ms = new MemberService();
	        
	        int result = ms.PhoneCheck(phone);
	        
	        System.out.println(phone);
	        //select문을 쓰는데 열의 값을 count(*)
	        //0 : 써도됨 : ok
	        //1: 쓰면안됨 : no
	        System.out.println(result);
	        response.getWriter().print((result>0)? "N" : "Y");
	     
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
