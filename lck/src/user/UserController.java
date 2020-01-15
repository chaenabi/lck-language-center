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

		// �Ķ���͸� DO�� ����
		try {
			BeanUtils.copyProperties(uvo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String action = request.getParameter("action");
		if (action.equals("")) {
			out.println("[�ɰ�] ��� ������ ó���� �� �������ϴ�.");
			out.println("������ ���� ���");
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
			
			System.out.println("add �غ�Ϸ�");
			
			request.getRequestDispatcher("forum.jsp").forward(request, response);
		} else if (action.equals("edit")) {

			request.getRequestDispatcher("forum.jsp").forward(request, response);
		} else if (action.equals("del")) {
			
			request.getRequestDispatcher("forum.jsp").forward(request, response);
		}

		else {
			out.println("[�ɰ�] ���� ����. ������ ����");
		}

	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
