package com.semi.email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Part;
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

/**
 * Servlet implementation class SendEmailServlet
 */
@WebServlet("/sendEmail.me")
public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @return 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  //mail server 설정
        String host = "smtp.gmail.com";
        String user = "dg379022@gmail.com"; 
        String password = "ldj1010!";
        
        //메일 받을 주소
        String to_email = request.getParameter("emailtext1")+"@"
				+request.getParameter("emailtext2");
        
		System.out.println(request.getParameter("emailtext1")+"@"
				+request.getParameter("emailtext2") + ":" + to_email);
        		
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
        String AuthCode = temp.toString();
        System.out.println(AuthCode);
        
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
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
            
            //메일 제목
            msg.setSubject("라라 시네마 인증 메일입니다.");
            //메일 내용
            msg.setText("인증 번호는 "+temp + "입니다. 정확하게 입력해주세요.");
            
            Transport.send(msg);
            System.out.println("이메일 전송");
            
        }catch (Exception e) {
            e.printStackTrace();// TODO: handle exception
        }
    
        
        HttpSession saveKey = request.getSession();
        saveKey.setAttribute("AuthCode", AuthCode);
        response.getWriter().print(AuthCode);
        
        
        
        }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
