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
			    request.getRequestDispatcher("../jsp/index.jsp").forward(request, response);
			} else {
			    JOptionPane.showMessageDialog(null, "用户名或密码错误！");
			    request.getRequestDispatcher("../jsp/login.jsp").forward(request, response);
			    return;
			}
		} catch (HeadlessException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    }

}
