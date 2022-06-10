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
 * Servlet implementation class QnaInsertServlet
 */
@WebServlet("/qInsert.qo")
public class QnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 1024*1024*10;
		
		//2.multipart/form-date 형식으로 전송되었는지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			//만약 올바름 multipart / form-date 로 전송되지 않았을 경우
			//에러 페이지로 이동시킨다.
			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		//3. 웹 상의 루트(최상위 경로)경로를 활용하여 저장할 폴더읭 위치 지정하기
		String root = request.getServletContext().getRealPath("/");
		System.out.println("최상위 경로 :"+root);
		
		//게시판의 첨부파일을 저장할 폴더이름 지정
		String savePath = root+"resource/qnaUploadFiles";
		
		//4. 실제로 담아온 파일 기타 정보들을 활용하여 request 객체를 -> MultipartRequest로 형변환 시켜준다
		//MultipartRequest 생성하기
		MultipartRequest mrequest = new MultipartRequest(request, //변경하기 위한 원본 객체
		savePath, 						//파일 저장 경로
		maxSize,						//저장할 파일의 최대 크기
		"UTF-8",						//저장할 문자셋 설정
		new DefaultFileRenamePolicy() 	//동잃한 이름의 파일을 저장했응 경우
										//기존의 파일명과 구분하기 위해
										//새로운 파일명 뒤에 숫자를 붙이도록 규칙을 만들었다
		);
	      // 파일 업로드 로직 실시
	      // 5-1. 기본 전송값 처리하기
	      String title = mrequest.getParameter("title");
	      String content = mrequest.getParameter("content");
	      String writer = mrequest.getParameter("userName");
	      String qtype = mrequest.getParameter("qtype");
	      //5-2.전송된 파일 처리하기
	      String fileName = mrequest.getFilesystemName("file");
	      //6. 전송된 파일을 vo에 담아서 서비스로 전달
	      Qna q = new Qna();
	      q.setQtitle(title);
	      q.setQtype(qtype);
	      q.setQcontent(content);
	      q.setQwriter(writer);
	      q.setQfile(fileName);
	
	      //7. 서비스 결과 처리
	      
	      int result = new QnaService().insertQna(q);
	      
	      if(result >0) {
	    	  response.sendRedirect("qnaList.ql");
	      } else {
	    	  request.setAttribute("msg", "게시글 작성실패");
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
