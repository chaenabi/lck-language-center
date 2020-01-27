package common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
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


@WebServlet("/TakeEmailFromClient")
public class TakeEmailFromClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String EMAIL = "martlalrts@naver.com";
	private static final String PASS = "npc2023per4@e";

	public class SMTPAuthenticator extends Authenticator{ 
	    @Override
	    protected PasswordAuthentication getPasswordAuthentication() {
	        return new PasswordAuthentication(EMAIL, PASS);
	    }
	}
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String from = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		PrintWriter out = response.getWriter();
		Properties p = new Properties(); // 정보를 담을 객체
		
		//mail server 설정
        String host = "smtp.naver.com";

        //SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
        
		p.put("mail.smtp.host", host);

		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		// SMTP 서버에 접속하기 위한 정보들

		try{
		    Authenticator auth = new SMTPAuthenticator();
		    Session ses = Session.getInstance(p, auth);
		    
		    ses.setDebug(true);
		    
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		    msg.setSubject(subject); // 제목
		    
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr); // 보내는 사람
		    
		    Address toAddr = new InternetAddress(EMAIL);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		    
		    msg.setContent("hello, I'm " + name + ".<br> "+ message, "text/html;charset=UTF-8"); // 내용과 인코딩
		    
		    Transport.send(msg); // 전송
		} catch(Exception e){
		    e.printStackTrace();
		    out.println("<script>alert('Send Mail Failed..');history.back();</script>");
		    // 오류 발생시 뒤로 돌아가도록
		    return;
		}

		out.println("<script>alert('Send Mail Success!!');location.href='mailForm.html';</script>");
		// 성공 시
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
