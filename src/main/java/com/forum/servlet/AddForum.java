package com.forum.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.forum.dao.ForumDao;
import com.forum.entity.Forum;

public class AddForum extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
		Forum forum = new Forum();
		forum.setTitle(request.getParameter("title"));
		forum.setInfo(request.getParameter("info"));
		String str = request.getParameter("type");
		if(forum.getTitle().equals("")) {
			JOptionPane.showMessageDialog(null, "板块名不能为空！");
			response.sendRedirect("../jsp/addforum.jsp");
			return;
		} else {
			ForumDao dao = new ForumDao();
		    try {
			    if(dao.isExisted(forum.getTitle())) {
				    JOptionPane.showMessageDialog(null, "已有该板块！");
				    response.sendRedirect("../jsp/addforum.jsp");
				    return;
			    } else {
			        if(str.equals("")) {
				        JOptionPane.showMessageDialog(null, "请选择版块类型！");
				        response.sendRedirect("../jsp/addforum.jsp");
				        return;
			        } else {
			        	if(dao.addForum(forum)) {
			        		JOptionPane.showMessageDialog(null, "新建版块成功！");
					        response.sendRedirect("../jsp/manageforums.jsp");
					        return;
			        	} else {
			        		JOptionPane.showMessageDialog(null, "未知错误，新建版块失败！");
					        response.sendRedirect("../jsp/manageforums.jsp");
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
