package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.exception.MemberException;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class mInsertServlet
 */
@WebServlet("/Insert.me")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("tel1")+"-"   // 010-1234-1234
				+request.getParameter("tel2")+"-"
				+request.getParameter("tel3");
		String address = request.getParameter("userZip")+","
				+request.getParameter("userAddress")+","
				+request.getParameter("address_d");
		String email = request.getParameter("emailtext1")+"@"
				+request.getParameter("emailtext2");
		String userBirth = request.getParameter("year")+"-"
				+request.getParameter("month")+"-"
				+request.getParameter("day");
		String gender = request.getParameter("gender");


		// 멤버 vo 생성
		Member m = new Member(userName,userId,userPwd,phone,address,email,userBirth,gender);


		System.out.println("확인용 : " + m);


		MemberService ms = new MemberService();

		
			try {
				ms.joinMember(m);
				System.out.println("회원 가입 완료");
				
				
			} catch (MemberException e) {
				
				e.printStackTrace();
			}
			
		
}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doGet(request, response);
}

}
