package com.forum.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.ReplyDao;
import com.forum.dao.ThreadDao;
import com.forum.entity.Reply;
import com.forum.entity.Thread;

public class DisplayThread extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("Thread_id"));
		try {
			ThreadDao dao = new ThreadDao();
			Thread thread = new Thread();
			thread = dao.getInfo(id);
			ReplyDao dao1 = new ReplyDao();
			List<Reply> list = null;
			list = dao1.getAllReply(id);
			request.getSession().setAttribute("thread", thread);
			request.getSession().setAttribute("list", list);
			response.sendRedirect("../jsp/replytiezi.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
			/*String a = thread.getForum_big();
			String b = thread.getForum_small();
			String c = thread.getThread_title();
			String d = thread.getThread_writer();
			String f = thread.getThread_content();
			Timestamp ts = thread.getThread_date();
	        String g = "";
	        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
	        try {
	            g = format.format(ts);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }*/
	        
			/*request.getSession().setAttribute("para1", a);
			request.getSession().setAttribute("para2", b);
			request.getSession().setAttribute("para3", c);
			request.getSession().setAttribute("para4", d);
			request.getSession().setAttribute("para5", f);
			request.getSession().setAttribute("para6", g);*/	     	
		
	}

}
