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
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet("/UpdatePwd.me")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd = request.getParameter("userPwd");
		
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		m.setUserPwd(userPwd);
	
		System.out.println("업데이트 서블릿 : " + m);
		
		MemberService ms = new MemberService();
		
		try {
			ms.PwdupdateMember(m);
			System.out.println("메인 회원 정보 수정 완료");
			session.setAttribute("member", m);
			response.sendRedirect("index.jsp");
		}catch(MemberException e) {
			request.setAttribute("msg", "회원가입 중 에러 발생!");
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
