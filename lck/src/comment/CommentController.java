package comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;


@WebServlet("/comment")
public class CommentController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	void translate(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		translate(request, response);
		PrintWriter out = response.getWriter();
		//HttpSession session = request.getSession();

		CommentVO cvo = new CommentVO();
		CommentDAO cdao = new CommentDAO();

		try {
			BeanUtils.copyProperties(cvo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String action = request.getParameter("action");
		
		
		if (action.equals("")) {
			out.println("[심각] 어떠한 정보도 처리 할 수 없었습니다.");
			out.println("관리자 문의 요망");
		} else if (action.equals("addComment")) {
			
			int postIdforComment = Integer.parseInt(request.getParameter("commentPost"));
			
			try {
				cdao.insert(cvo, postIdforComment);
				
				
				//todo: after write comment, call the page placed comment form
				
				request.getRequestDispatcher("ShowForumList").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("edit")) {

			request.getRequestDispatcher("ShowForumList").forward(request, response);
		} else if (action.equals("del")) {

			request.getRequestDispatcher("ShowForumList").forward(request, response);
		} else if (action.equals("logout")) {
			request.getSession(true).invalidate();
			request.getRequestDispatcher("ShowForumList").forward(request, response);
		}

		else {
			out.println("[심각] 에러 발생");
		}
		
		
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
	
