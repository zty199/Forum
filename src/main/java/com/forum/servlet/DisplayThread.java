package com.forum.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.DisplayDao;
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
		DisplayDao dao = new DisplayDao();
		int id = Integer.parseInt(request.getParameter("number"));
		ThreadDao dao1 = new ThreadDao();
		Thread thread = new Thread();
		try {
			thread = dao1.getInfo(id);
			String a = thread.getForum_big();
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
	        }
			ArrayList<Reply> list = dao.getlist(id);
			request.getSession().setAttribute("list", list);
			request.getSession().setAttribute("para1", a);
			request.getSession().setAttribute("para2", b);
			request.getSession().setAttribute("para3", c);
			request.getSession().setAttribute("para4", d);
			request.getSession().setAttribute("para5", f);
			request.getSession().setAttribute("para6", g);
			response.sendRedirect("../jsp/replytiezi.jsp");
			/*response.sendRedirect("../jsp/replytiezi.jsp?para1="+encodeURI(encodeURI(a))+"&para2="+b+"&para3="+c+"&para4="+d+"&para5="+f+"&para6="+g);
			out.println(a);
			out.println(b);
			out.println(c);
			out.println(d);	
			out.println(f);//在head里面，title不行
			out.println(g);
			out.close();*/					     	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
