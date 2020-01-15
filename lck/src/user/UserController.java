package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;


@WebServlet("/user")
public class UserController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	void translate(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		translate(request, response);
		PrintWriter out = response.getWriter();
		// HttpSession session = request.getSession();
		
		 UserVO uvo = new UserVO();
		 UserDAO mdao = new UserDAO();

		// 파라미터를 DO에 매핑
		try {
			BeanUtils.copyProperties(uvo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String action = request.getParameter("action");
		if (action.equals("")) {
			out.println("[심각] 어떠한 정보도 처리할 수 없었습니다.");
			out.println("관리자 문의 요망");
		} else if (action.equals("selectOne")) {
		
			
			
		} else if (action.equals("add")) {
			System.out.println(uvo.getName());
			System.out.println(uvo.getPassword());
			System.out.println(uvo.getIdentityPhoto());
			System.out.println(uvo.getPhone());
			System.out.println(uvo.getPhonemid());
			System.out.println(uvo.getPhoneend());
			System.out.println(uvo.getPosition());
			System.out.println(uvo.getAddress());
			
			System.out.println("add 준비완료");
			
			request.getRequestDispatcher("forum.jsp").forward(request, response);
		} else if (action.equals("edit")) {

			request.getRequestDispatcher("forum.jsp").forward(request, response);
		} else if (action.equals("del")) {
			
			request.getRequestDispatcher("forum.jsp").forward(request, response);
		}

		else {
			out.println("[심각] 에러 감지. 관리자 문의");
		}

	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
