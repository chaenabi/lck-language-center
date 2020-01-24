package forum;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;


@WebServlet("/ShowForumList")
public class ShowForumList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ForumDAO fdao = new ForumDAO();
		
		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Paging paging = new Paging();
		int count = 351;
		try {
			count = fdao.getAllCount();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		paging.setPage(page);	
		paging.setTotalCount(count);
		
		ArrayList<ForumVO> list = new ArrayList<ForumVO>();
		try {
			list = fdao.getForumList(paging, page);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		System.out.println(list);
		
		request.setAttribute("forumList", list);
		request.setAttribute("paging", paging);
		RequestDispatcher dispatcher = request.getRequestDispatcher("forum.jsp");
		dispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
