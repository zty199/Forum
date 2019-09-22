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
import com.forum.entity.User;

public class ModifyForumInfo extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
		Forum forum = new Forum();
		forum.setId(Integer.parseInt(request.getParameter("fid")));
		forum.setTitle(request.getParameter("title"));
		String temp = forum.getTitle();
		forum.setInfo(request.getParameter("info"));
		String str = request.getParameter("type");
		int n = 0;
		if(str != "")
			n = Integer.parseInt(str);
		forum.setType(n > 0 ? true : false);
		User usr = new User();
		usr = (User) request.getSession().getAttribute("usr");
		if(usr == null || !usr.getAdmin()) {
			JOptionPane.showMessageDialog(null, "请先登录！");
			request.getSession().setAttribute("usr", null);
			response.sendRedirect("../jsp/login.jsp");
			return;
		}
		if(forum.getTitle().equals("")) {
			JOptionPane.showMessageDialog(null, "版块名称不能为空！");
			response.sendRedirect("../jsp/modifyforum.jsp?");
			return;
		} else {
			ForumDao dao = new ForumDao();
		    try {
			    if(!temp.equals(forum.getTitle()) && dao.isExisted(forum.getTitle())) {
			    	JOptionPane.showMessageDialog(null, "该版块名已被使用！");
				    response.sendRedirect("../jsp/modifyforum.jsp?fid=" + forum.getId());
				    return;
			    } else {
			        if(str.equals("")) {
				        JOptionPane.showMessageDialog(null, "请选择版块类型！");
				        response.sendRedirect("../jsp/modifyforum.jsp?fid=" + forum.getId());
				        return;
			        } else {
			        	if(dao.modifyForum(forum)) {
			        		JOptionPane.showMessageDialog(null, "修改版块信息成功！");
					        response.sendRedirect("../jsp/manageforums.jsp");
					        return;
			        	} else {
			        		JOptionPane.showMessageDialog(null, "未知错误，修改版块信息失败！");
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
