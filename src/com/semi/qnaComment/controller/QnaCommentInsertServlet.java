package com.semi.qnaComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qnaComment.model.service.QnaCommentService;
import com.semi.qnaComment.model.vo.QnaComment;


/**
 * Servlet implementation class QnaCommentServlet
 */
@WebServlet("/insertComment.qo")
public class QnaCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		String content = request.getParameter("replyContent");
		
		QnaComment qco = new QnaComment(qno,content);
		int result = new QnaCommentService().insertComment(qco);
		System.out.println(qco);
		System.out.println(result);
		
		if(result > 0) {
			response.sendRedirect("selectOne.qo?qno="+qno);
		}else {
			request.setAttribute("msg", "댓글 작성 실패");
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
