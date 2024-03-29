﻿package user;

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
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();

		UserVO uvo = UserVO.getInstance();
		UserDAO udao = new UserDAO();

		try {
			BeanUtils.copyProperties(uvo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String action = request.getParameter("action");
		if (action.equals("")) {
			out.println("[심각] 어떠한 정보도 처리 할수 없었습니다.");
			out.println("관리자 문의 요망");
		} else if (action.equals("login")) {

//			System.out.println("userid: " + uvo.getUserId());
//			System.out.println("name: " + uvo.getName());
//			System.out.println("password: " + uvo.getPassword());

			boolean flag = false;
			try {
				flag = udao.login(uvo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (!flag) {
				response.sendRedirect("login.jsp");
			} else {
				try {
					udao.selectOne(uvo);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.setAttribute("userId", uvo.getUserId());
				session.setAttribute("username", uvo.getName());
				session.setAttribute("profile", uvo.getIdentityPhoto());
				session.setAttribute("phone", uvo.getPhone());
				session.setAttribute("position", uvo.getPosition());

				response.sendRedirect("ShowForumList");
			}
		} else if (action.equals("selectOne")) {

		} else if (action.equals("add")) {
			try {
				udao.insert(uvo);
				response.sendRedirect("ShowForumList");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("edit")) {

			response.sendRedirect("ShowForumList");
		} else if (action.equals("del")) {

			response.sendRedirect("ShowForumList");
		} else if (action.equals("logout")) {
			request.getSession(true).invalidate();
			response.sendRedirect("ShowForumList");
		}

		else {
			out.println("[심각] 에러 발생");
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
