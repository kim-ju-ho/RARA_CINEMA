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

/**
 * Servlet implementation class MyQna
 */
@WebServlet("/myqna.ql")
public class MyQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Qna> list = new ArrayList();
		MyPageService mps = new MyPageService();

		int startPage;
        int endPage;
        int maxPage;
        int currentPage;
        int limit;
        currentPage = 1;
        limit = 10;
        
        if(request.getParameter("currentPage") != null) {
           currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        String userId = request.getParameter("id");
        System.out.println("마이페이지에서 qna 페이지로 넘어갈 때 Id:"+userId);
        
        // 페이징 처리
        int listCount = mps.getListCount(userId);
        maxPage = (int)((double)listCount/limit + 0.9);
        startPage = ((int)((double)currentPage/limit+0.9)-1)*limit + 1;
        
        endPage = startPage + limit -1;
        if(endPage > maxPage) {
           endPage = maxPage;
        }
        //리스트 가져오기
        list = mps.selectList(currentPage, limit, userId);

        
        String page="";
	        
	        if(list != null) {
	           page = "views/qna/qnaList.jsp";
	           request.setAttribute("list",list);
	           
	           PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	           request.setAttribute("pi", pi);
	        } else {
	           page = "views/common/errorPage.jsp";
	           request.setAttribute("msg", "Qna목록 불러오기 에러!");
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
