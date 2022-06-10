package com.semi.email;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class SendEmail_findPwd
 */
@WebServlet("/SendEmail_findPwd.me")
public class SendEmail_FindPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmail_FindPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  //mail server 설정
      String host = "smtp.gmail.com";
      String user = "dg379022@gmail.com"; 
      String password = "ldj1010!";
      
      //메일 받을 주소
      String userEmail = request.getParameter("emailtext1")+"@"
				+request.getParameter("emailtext2");
      String userid = request.getParameter("idtext");
      
		System.out.println(request.getParameter("emailtext1")+"@"
				+request.getParameter("emailtext2") + ":" + userEmail);
      		
		
		// 머야 이름하고 이메일 비교
		
		  Member findUser = new MemberService().findPwd(userid,userEmail);
		  System.out.println(findUser.getUserId());
		  
		  request.setAttribute("findUser", findUser);
		  
      		/*request.getParameter("email");*/
      
      //SMTP 서버 정보를 설정한다.
      Properties props = new Properties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", 465);
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.ssl.enable", "true");
      
      //인증 번호 생성기
      StringBuffer temp =new StringBuffer();
      Random rnd = new Random();
      for(int i=0;i<10;i++)
      {
          int rIndex = rnd.nextInt(3);
          switch (rIndex) {
          case 0:
              // A-Z
              temp.append((char) ((int) (rnd.nextInt(26)) + 65));
              break;
          case 1:
              // 0-9
              temp.append((rnd.nextInt(10)));
              break;
          }
      }
      String AuthCode2 = temp.toString();
      
      System.out.println(AuthCode2);
      
      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
          protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication(user,password);
          }
      });
      
      //email 전송
      try {
          MimeMessage msg = new MimeMessage(session);
          msg.setFrom(new InternetAddress(user, "RARA CINEMA"));
          msg.addRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("emailtext1")+"@"
  				+request.getParameter("emailtext2")));
          msg.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
          
          //메일 제목
          msg.setSubject("라라 시네마 아이디 찾기 인증 메일입니다.");
          //메일 내용
          msg.setText("인증 번호는 "+temp + "입니다. 정확하게 입력해주세요.");
          
          Transport.send(msg);
          System.out.println("이메일 전송");
          
      }catch (Exception e) {
          e.printStackTrace();// TODO: handle exception
      }
  
      
      HttpSession saveKey = request.getSession();
      saveKey.setAttribute("AuthCode2", AuthCode2);
      response.getWriter().print(AuthCode2);
      
      
      
      
      }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
