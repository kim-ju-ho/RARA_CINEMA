package com.semi.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.Qna;
import com.semi.qnaComment.model.service.QnaCommentService;
import com.semi.qnaComment.model.vo.QnaComment;

/**
 * Servlet implementation class QnaSelectOneServlet
 */
@WebServlet("/selectOne.qo")
public class QnaSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		Qna q = new QnaService().selectOne(qno); //상세보기용
		
		ArrayList<QnaComment> qclist = new QnaCommentService().selectList(qno); //댓글...
		
		String page ="";
		if(q != null) {
			page ="views/qna/qnaDetail.jsp";
			request.setAttribute("Qna", q);
			request.setAttribute("qclist", qclist);
		}else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 실패!");
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
