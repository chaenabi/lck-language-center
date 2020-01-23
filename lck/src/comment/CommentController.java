package comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;

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

		} else if (action.equals("validate")) {
			
			int commentnum = Integer.parseInt(request.getParameter("commentnum"));
			String password = request.getParameter("password");
			String commentid = request.getParameter("commentid");
			

			boolean flag = false;
			try {
				flag = cdao.IsThereValidData(commentnum, password, commentid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			if(flag) sendSuccessMsg(response);
			
		} else if (action.equals("edit")) {
			
			int commentnum = Integer.parseInt(request.getParameter("commentnum"));
			String commentContent = request.getParameter("commentcontent");

			System.out.println(commentnum);
			System.out.println(commentContent);

			try {
				cdao.update(commentnum, commentContent);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("ShowForumList");
			
		}else if (action.equals("del")) {
			int commentnum = Integer.parseInt(request.getParameter("commentnum"));
			String commentid = request.getParameter("commentid");
			System.out.println(commentnum);
			System.out.println(commentid);
			
			try {
				cdao.delete(commentnum, commentid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("ShowForumList").forward(request, response);
			
			
			
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
	
	public void sendSuccessMsg(HttpServletResponse resp) throws IOException {
		//req.setCharacterEncoding("UTF-8");
		//resp.setContentType("application/json");
		resp.setContentType("text/plain");
		
		PrintWriter out = resp.getWriter();
		String result = "validated";
		// out.println 을 쓰면 반드시 ajax에서 응답값을 trim 해주어야한다. (\n 포함되어서 넘어감)
	    out.print(result);
	}
	
}
	
