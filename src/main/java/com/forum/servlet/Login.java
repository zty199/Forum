package com.forum.servlet;

import java.awt.HeadlessException;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.forum.dao.UserDao;
import com.forum.entity.User;

public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPwd(request.getParameter("password"));
		UserDao dao = new UserDao();
        try {
			if (dao.isValid(user.getUsername(), user.getPwd())) {
				user.setAdmin(dao.isAdmin(user.getUsername()));
				request.getSession().setAttribute("usr", user);
				response.sendRedirect("../jsp/index.jsp");
				//request.getRequestDispatcher("../jsp/index.jsp").forward(request, response);
			    return;
			} else {
				request.getSession().setAttribute("uname", null);
			    JOptionPane.showMessageDialog(null, "用户名或密码错误！");
			    response.sendRedirect("../jsp/login.jsp");
			}
		} catch (HeadlessException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    }

}
