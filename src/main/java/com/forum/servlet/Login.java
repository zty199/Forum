package com.forum.servlet;

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
        String preUrl = (String) request.getSession().getAttribute("preUrl");
        User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPwd(request.getParameter("password"));
		UserDao dao = new UserDao();
        try {
			if (dao.isValid(user.getUsername(), user.getPwd())) {
				user = dao.getInfo(user.getUsername());
				request.getSession().setAttribute("usr", user);
				if(preUrl != null && !preUrl.endsWith("register.jsp") && !preUrl.endsWith("login.jsp")) {
					response.sendRedirect(preUrl);
				} else {
					response.sendRedirect("../jsp/index.jsp");
				}
			    return;
			} else {
				request.getSession().setAttribute("usr", null);
			    JOptionPane.showMessageDialog(null, "用户名或密码错误！");
			    response.sendRedirect("../jsp/login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    }

}
