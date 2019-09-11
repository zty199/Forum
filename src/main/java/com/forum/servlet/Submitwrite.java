package com.forum.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.forum.dao.ThreadDao;
import com.forum.entity.Thread;

public class Submitwrite extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");	
        Thread thread = new Thread();
        String a = request.getParameter("Forum_big");
        String b = request.getParameter("Forum_small");
        String c = request.getParameter("Thread_title");
        String d = request.getParameter("Thread_content");
        String f = request.getParameter("Thread_writer");
		thread.setForum_big(request.getParameter("Forum_big"));
		thread.setForum_small(request.getParameter("Forum_small"));
		thread.setThread_title(request.getParameter("Thread_title"));
		thread.setThread_content(request.getParameter("Thread_content"));
		thread.setThread_writer(request.getParameter("Thread_writer"));
        ThreadDao dao = new ThreadDao();
        if(a.equals("")||b.equals("")||c.equals("")||d.equals("")||f.equals("")) {
			JOptionPane.showMessageDialog(null, "请将文章信息填写完整！");
			response.sendRedirect("../jsp/writetiezi.jsp");
			return;
		}
        try {
        	if (dao.addThread(thread)) {
        		JOptionPane.showMessageDialog(null, "发布成功！");
        		response.sendRedirect("../jsp/index.jsp");
        		return;
        	} else {
        		JOptionPane.showMessageDialog(null, "未知原因，发布失败！");
        		response.sendRedirect("../jsp/index.jsp");
        	}
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
