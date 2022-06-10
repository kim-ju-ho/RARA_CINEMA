package com.semi.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.PageInfo;
import com.semi.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaListServelt
 */
@WebServlet("/qnaList.ql")
public class QnaListServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Qna> list = new ArrayList();
		QnaService qs = new QnaService();

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
        
        // 페이징 처리
        int listCount = qs.getListCount();
        System.out.println("서블릿 총 페이지 수 : " + listCount);
        maxPage = (int)((double)listCount/limit + 0.9);
        startPage = ((int)((double)currentPage/limit+0.9)-1)*limit + 1;
        
        endPage = startPage + limit -1;
        if(endPage > maxPage) {
           endPage = maxPage;
        }
        
        System.out.println("페이지 숫자 "+listCount);
        list = qs.selectList(currentPage, limit);

        System.out.println(list);
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
