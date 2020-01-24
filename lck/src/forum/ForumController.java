package forum;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/forum")
public class ForumController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	void translate(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		translate(request, response);
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		ForumVO fvo = new ForumVO();
		ForumDAO fdao = new ForumDAO();

		try {
			BeanUtils.copyProperties(fvo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String action = request.getParameter("action");
		System.out.println(action);
		if (action.equals("")) {
			out.println("[심각] 어떠한 정보도 처리 할 수 없었습니다.");
			out.println("관리자 문의 요망");
		} else if (action.equals("inputUserId")) {
			String userId = request.getParameter("userId");
			System.out.println(userId);
			session.setAttribute("userId", userId);
			request.getRequestDispatcher("new_topic.jsp").forward(request, response);
			
		} else if (action.equals("searchPost")) {

			String postSubject = request.getParameter("postSubject");
			try {
				response.getWriter().write(getJson(postSubject));
			} catch (SQLException e) {
				e.printStackTrace();
			}	
			
		} else if (action.equals("addpost")) {
			try {
				fdao.insert(fvo);
				response.sendRedirect("ShowForumList");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("edit")) {
			//int postId = Integer.parseInt(request.getParameter("postId"));
			int postNum = Integer.parseInt(request.getParameter("postNum"));
			String postContentSub = request.getParameter("postContentSub");
			String postContentText = request.getParameter("postContentText");
			
			try {
				fdao.update(postNum, postContentSub, postContentText);
			} catch (SQLException e) {
				e.printStackTrace();
			}		
			request.getRequestDispatcher("ShowForumList").forward(request, response);
		} else if (action.equals("del")) {
			int postNum = Integer.parseInt(request.getParameter("postNum"));
			try {
				fdao.delete(postNum);
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
	
	
	public String getJson(String postSubject) throws SQLException {
		if(postSubject == null) postSubject = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ForumDAO fdao = new ForumDAO();
		ArrayList<ForumVO> flist = fdao.search(postSubject);
		for(int i = 0; i < flist.size(); i++) {	

			
			result.append("[{\"value\": \"" + flist.get(i).getForumNum() + "\"},");
			result.append("{\"value\": \"" + flist.get(i).getPostId() + "\"},");		
			result.append("{\"value\": \"" + flist.get(i).getIdentityPhoto() + "\"},");
			result.append("{\"value\": \"" + flist.get(i).getPostSubject() + "\"},");
			result.append("{\"value\": \"" + flist.get(i).getPostContent() + "\"},");
			result.append("{\"value\": \"" + flist.get(i).getPostFile() + "\"},");
			result.append("{\"value\": \"" + flist.get(i).getSawCount() + "\"},");
			result.append("{\"value\": \"" + flist.get(i).getPostDate());
			
		    if(i == flist.size()-1) {
		    	 result.append("\"}]");
		    }
		    else {
		     	 result.append("\"}],");
		    }
		}
		result.append("]}");
		return result.toString();
	}
	
	
}
