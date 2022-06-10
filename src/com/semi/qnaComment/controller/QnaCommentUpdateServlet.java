package com.semi.qnaComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qnaComment.model.service.QnaCommentService;

/**
 * Servlet implementation class QnaCommentUpdateServlet
 */
@WebServlet("/updateComment.qo")
public class QnaCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		int cno = Integer.parseInt(request.getParameter("cno"));
		String content = request.getParameter("content");
		System.out.println("값 있는지 확인 qno"+qno+"cno"+cno+"cont"+content);
		QnaCommentService qcs = new QnaCommentService();
	
		int result = qcs.updateComent(cno,content);
		
		if(result > 0) {
			response.sendRedirect("selectOne.qo?qno="+qno);
		}else {
			request.setAttribute("msg", "댓글 수정 실패");
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
