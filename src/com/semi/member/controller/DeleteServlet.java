package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.exception.MemberException;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/Delete.me")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
	      
	      String userId = ((Member)session.getAttribute("member")).getUserId();
	      
	      MemberService ms = new MemberService();
	      
	      try {
	         ms.deleteMember(userId);
	         System.out.println("회원 탈퇴 완료!");
	         session.invalidate();
	         response.sendRedirect("index.jsp");
	      }catch(MemberException e) {
	         request.setAttribute("msg", "회원 탈퇴 중 에러 발생!");
	         request.setAttribute("exception", e);
	         request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
