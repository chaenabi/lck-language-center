package forum;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

/**
 * Servlet implementation class ShowForumOne
 */
@WebServlet("/ShowForumOne")
public class ShowForumOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
	void translate(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
	}  
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		translate(request, response);
		//PrintWriter out = response.getWriter();
		//HttpSession session = request.getSession();

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
	    if (action.equals("selectOne")) {

			int forumNum = Integer.parseInt(request.getParameter("forumNum"));
	
			try {
				
				fvo = fdao.selectOne(forumNum);

				//System.out.println(fvo.toString());
				int cnt = fdao.increaseSawCnt(fvo.getSawCount(), fvo.getForumNum());

				fvo.setSawCount(cnt);
				String postPhoto = fvo.getPostPhoto();
				String postVideo = fvo.getPostVideo();
				
				
				//System.out.println(postPhoto);
				//System.out.println(postVideo);
//				if(postPhoto.contains("contents")) {
//					postPhoto = postPhoto.substring(postPhoto.lastIndexOf("/") + 1);
//				}
//				if(postVideo.contains("contents")) {
//					postVideo = postVideo.substring(postVideo.lastIndexOf("/") + 1);
//				}
				System.out.println(fvo.getComment());
				request.setAttribute("postId", fvo.getPostId());
				request.setAttribute("forumNum", fvo.getForumNum());
				request.setAttribute("profile", fvo.getIdentityPhoto());
				request.setAttribute("postPhoto", postPhoto);
				request.setAttribute("postVideo", postVideo);
				request.setAttribute("postSubject", fvo.getPostSubject());
				request.setAttribute("postContent", fvo.getPostContent());
				request.setAttribute("sawCount", fvo.getSawCount());	
				request.setAttribute("comments", fvo.getComment());

				
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			RequestDispatcher dispatcher = request.getRequestDispatcher("topic.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
