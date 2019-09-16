package com.forum.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
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
		thread.setForum_big(request.getParameter("Forum_big"));
		thread.setForum_small(request.getParameter("Forum_small"));
		thread.setThread_title(request.getParameter("Thread_title"));
		thread.setThread_content(request.getParameter("Thread_content"));
		thread.setThread_writer(request.getParameter("Thread_writer"));
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		thread.setThread_date(timestamp);
        ThreadDao dao = new ThreadDao();
        if(thread.getForum_big().equals("")||thread.getForum_small().equals("")||thread.getThread_title().equals("")||thread.getThread_content().equals("")||thread.getThread_writer().equals("")) {
			JOptionPane.showMessageDialog(null, "信息不完整，请重新填写！");
			response.sendRedirect("../jsp/writetiezi.jsp");
			return;
		}
        try {
        	if (dao.addThread(thread)) {
        		JOptionPane.showMessageDialog(null, "帖子发布成功！");
        		response.sendRedirect("../servlet/DisplayThread?Thread_id=" + thread.getThread_id());
        		return;
        	} else {
        		JOptionPane.showMessageDialog(null, "未知原因，发布失败！");
        		response.sendRedirect("../jsp/writetiezi.jsp");
        	}
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
