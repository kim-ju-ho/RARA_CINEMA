package com.semi.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaUpdateServlet
 */
@WebServlet("/qnaUpdate.qo")
public class QnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 1024*1024*10;
		//2. multipart/form-data 형식으로 전송되었는지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		//3. 웹상의 루트 경로 찾기
		String root = request.getServletContext().getRealPath("/");
		String savePath = root+"resource/qnaUploadFiles";
		//4. 실제 담아온 파일 기타 정보를 활용해서 multipartRequest 생성
		MultipartRequest mrequest = new MultipartRequest(request, //변경하기 위한 원본 객체
														savePath, 						
														maxSize,						
														"UTF-8",						
														new DefaultFileRenamePolicy() 								
														);
	      // 파일 업로드 로직 실시
	      // 5-1. 기본 전송값 처리하기
          int qno = Integer.parseInt(mrequest.getParameter("qno"));
		  String qtype = mrequest.getParameter("qtype");
	      String title = mrequest.getParameter("title");
	      String content = mrequest.getParameter("content");
	      String writer = mrequest.getParameter("userName");
	      //6. 전송된 파일을 vo에 담아서 서비스로 전달
	      Qna q = new Qna();
	      q.setQno(qno);
	      q.setQwriter(writer);
	      q.setQtype(qtype);
	      q.setQtitle(title);
	      q.setQcontent(content);
	      q.setQfile(mrequest.getFilesystemName("file"));
	      System.out.println("업데이트 서블릿 "+q);
        int result = new QnaService().updateQna(q);
        
        if(result > 0) {
           response.sendRedirect("selectOne.qo?qno="+qno);
        } else {
           request.setAttribute("mag", "게시글 수정 실패!");
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
