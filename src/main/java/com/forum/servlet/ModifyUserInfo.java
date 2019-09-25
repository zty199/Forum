package com.forum.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Date;

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
		User user = new User();
		user.setUserid(Integer.parseInt(request.getParameter("uid")));
		user.setUsername(request.getParameter("name"));
		String temp = user.getUsername();
		user.setPwd(request.getParameter("pwd"));
		user.setCpwd(request.getParameter("cpwd"));
		Date date = Date.valueOf(request.getParameter("date"));
		user.setDate(date);
		user.setPhone(request.getParameter("phone"));
		user.setMail(request.getParameter("mail"));
		User usr = new User();
		usr = (User) request.getSession().getAttribute("usr");
		if(usr == null) {
			JOptionPane.showMessageDialog(null, "请先登录！");
			request.getSession().setAttribute("usr", null);
			response.sendRedirect("../jsp/login.jsp");
			return;
		}
		if(usr.getUserid() != user.getUserid()) {
			JOptionPane.showMessageDialog(null, "登录信息不符，请重新登录！");
			request.getSession().setAttribute("usr", null);
			response.sendRedirect("../jsp/login.jsp");
			return;
		}
		if(user.getUsername().equals("")) {
			JOptionPane.showMessageDialog(null, "用户名不能为空！");
			response.sendRedirect("../jsp/personal.jsp");
			return;
		} else {
			if(user.getUsername().equals("无名氏")) {
				JOptionPane.showMessageDialog(null, "该用户名不可用！");
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
				    	if(user.getPwd().equals("")) {
					        JOptionPane.showMessageDialog(null, "密码不能为空！");
					        response.sendRedirect("../jsp/personal.jsp");
					        return;
				        } else {
				            if(!user.getPwd().equals(user.getCpwd())) {
				                JOptionPane.showMessageDialog(null, "两次输入的密码不一致！");
				                response.sendRedirect("../jsp/personal.jsp");
					            return;
				            } else {
				            	if(dao.modifyUser(user, temp)) {
				            		JOptionPane.showMessageDialog(null, "修改成功！");
				            		user.setAdmin(usr.getAdmin());
				            		request.getSession().setAttribute("usr", user);
				            		response.sendRedirect("../jsp/personal.jsp");
				            		return;
				            	} else {
				            		JOptionPane.showMessageDialog(null, "未知错误，修改失败！");
				            		response.sendRedirect("../jsp/personal.jsp");
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

}
