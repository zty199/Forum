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

public class Register extends HttpServlet {
	
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
		user.setCpwd(request.getParameter("confirmpwd"));
		if(user.getUsername().equals("")) {
			JOptionPane.showMessageDialog(null, "用户名不能为空！");
			response.sendRedirect("../jsp/register.jsp");
			return;
		} else {
			UserDao dao = new UserDao();
		    try {
		    	if(user.getUsername().equals("无名氏")) {
		    		JOptionPane.showMessageDialog(null, "该用户名不可用！");
				    response.sendRedirect("../jsp/register.jsp");
		    	} else {
		    		if(dao.isRegistered(user.getUsername())) {
					    JOptionPane.showMessageDialog(null, "该用户名已被占用！");
					    response.sendRedirect("../jsp/register.jsp");
					    return;
				    } else {
				        if(user.getPwd().equals("")) {
					        JOptionPane.showMessageDialog(null, "密码不能为空！");
					        response.sendRedirect("../jsp/register.jsp");
					        return;
				        } else {
				            if(!user.getPwd().equals(user.getCpwd())) {
				                JOptionPane.showMessageDialog(null, "两次输入的密码不一致！");
				                response.sendRedirect("../jsp/register.jsp");
					            return;
				            } else {
				        	    if(dao.addUser(user)) {
				        		    JOptionPane.showMessageDialog(null, "注册成功！");
				        		    response.sendRedirect("../jsp/login.jsp");
					                return;
				        	    } else {
				        	    	JOptionPane.showMessageDialog(null, "未知错误，注册失败！");
				        	    	response.sendRedirect("../jsp/register.jsp");
				        	    }
				            }
				        }
				    }
		    	}
		    } catch (SQLException e) {
			    // TODO Auto-generated catch block
			    e.printStackTrace();
		    }
	    }
	}

}
