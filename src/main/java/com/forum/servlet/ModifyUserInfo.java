package com.forum.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.forum.dao.UserDao;
import com.forum.entity.User;

public class ModifyUserInfo extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String temp = (String) request.getSession().getAttribute("uname");
		User user = new User();
		user.setUsername(request.getParameter("name"));
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		try {
			user.setDate(f.parse(request.getParameter("date")));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		user.setPhone(request.getParameter("phone"));
		user.setMail(request.getParameter("mail"));
		if(user.getUsername().equals("")) {
			JOptionPane.showMessageDialog(null, "用户名不能为空！");
			response.sendRedirect("../jsp/personal.jsp");
			return;
		} else {
			UserDao dao = new UserDao();
		    try {
			    if(!temp.equals(user.getUsername()) && dao.isRegistered(user.getUsername())) {
			    	JOptionPane.showMessageDialog(null, "该用户名已被占用！");
				    response.sendRedirect("../jsp/personal.jsp");
				    return;
			    } else {
			        if(dao.modifyUser(user, temp)) {
			        	JOptionPane.showMessageDialog(null, "修改成功！");
			        	request.getSession().setAttribute("uname", user.getUsername());
						response.sendRedirect("../jsp/personal.jsp");
				        return;
				    } else {
			        	JOptionPane.showMessageDialog(null, "未知错误，修改失败！");
						response.sendRedirect("../jsp/personal.jsp");
			        }
			    }
		    } catch (SQLException e) {
			    // TODO Auto-generated catch block
			    e.printStackTrace();
		    }
	    }
	}

}
