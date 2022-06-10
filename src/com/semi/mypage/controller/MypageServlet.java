package com.semi.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.mypage.model.service.MyPageService;
import com.semi.qna.model.vo.PageInfo;
import com.semi.qna.model.vo.Qna;
import com.semi.review.model.vo.Review;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/myPage.mo")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Qna> mqlist = new ArrayList();
		ArrayList<Review> mrlist = new ArrayList();
		
		String mId = request.getParameter("id");
		MyPageService ms = new MyPageService();
		System.out.println("마이페이지 아이디 값 넘어오나"+mId);
		mqlist = ms.myqnalist(mId);
		mrlist = ms.myReviewlist(mId);
		System.out.println("마이페이지 서블렛 qna 리스트 "+mqlist);
		System.out.println("마이페이지 서블렛 review 리스트 "+mrlist);
		
		
		String page ="";
		if(mId != null) {
	           page = "views/mypage/My_page.jsp";
//	           request.setAttribute("rslist",resv); //최근 예매내역
	           request.setAttribute("qlist", mqlist); //나의 질문
	           request.setAttribute("rlist", mrlist); // 내 리뷰
	        } else {
	           page = "views/common/errorPage.jsp";
	           request.setAttribute("msg", "마이페이지 불러오기 에러!");
	        }
		request.getRequestDispatcher(page).forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
