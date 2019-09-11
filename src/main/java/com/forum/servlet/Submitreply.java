package com.forum.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.forum.dao.ReplyDao;
import com.forum.entity.Reply;

public class Submitreply extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
        //SmartUpload su = new SmartUpload();//新建一个SmartUpload对象 
        //PrintWriter out = response.getWriter();	
        Reply reply = new Reply();
        //String a1 = request.getParameter("Thread_id");
        //int a = Integer.parseInt(a1);
        int a = 1;
        String b = "小吃店";
        //String b = request.getParameter("Forum_small");
        String c = request.getParameter("Reply_content");
        String d = request.getParameter("Reply_writer");
		reply.setThread_id(a);
		reply.setForum_small(b);
		reply.setReply_content(request.getParameter("Reply_content"));
		reply.setReply_writer(request.getParameter("Reply_writer"));
	    //out.println(b);
        ReplyDao dao = new ReplyDao();
        if(a==0||b.equals("")||c.equals("")||d.equals("")) {
			JOptionPane.showMessageDialog(null, "文章信息不完整，请重新填写！");
			response.sendRedirect("../jsp/replytiezi.jsp");
			return;
		} 
        try {
        	if (dao.addReply(reply)) {
        		JOptionPane.showMessageDialog(null, "文章回复成功！");
        		response.sendRedirect("../jsp/index.jsp");
        		return;
        	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
