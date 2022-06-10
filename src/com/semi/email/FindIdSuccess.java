package com.semi.email;

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
 * Servlet implementation class FindIdSuccess
 */
@WebServlet("/findIdSuccess.me")
public class FindIdSuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdSuccess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("emailtext1")+"@"
				+request.getParameter("emailtext2");
		String userName = request.getParameter("userName");
		String userId = "null";

		 Member findUser = new Member(userName,userId,email);
		 
		 System.out.println("서블릿" + findUser);
		
		MemberService ms = new MemberService();

		try { 
			Member SucessfindUser = ms.findUserid(findUser);
			System.out.println("아이디 찾기 서블릿 통과!!");
			HttpSession session = request.getSession(false);
			session.setAttribute("member",SucessfindUser);
	
		
		} catch (MemberException e) { // 에러 났을 때
			request.setAttribute("exception", e);
			request
			.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);		
			
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
