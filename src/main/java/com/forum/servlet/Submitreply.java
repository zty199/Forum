package com.forum.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.forum.dao.ReplyDao;
import com.forum.dao.ThreadDao;
import com.forum.entity.Reply;
import com.forum.entity.Thread;
import com.forum.entity.User;

public class Submitreply extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(request.getParameter("Thread_id"));
        String close = request.getParameter("close");
        User user = (User) request.getSession().getAttribute("usr");
        try {
        	Thread thread = new Thread();
        	ThreadDao dao = new ThreadDao();
        	thread = dao.getInfo(id);
        	Reply reply = new Reply();
        	reply.setThread_id(id);
        	reply.setForum_big(thread.getForum_big());
        	reply.setForum_small(thread.getForum_small());
        	reply.setReply_content(request.getParameter("Reply_content"));
        	if(user == null) {
        		reply.setReply_writer("无名氏");
        	} else {
        		if(close == "on")
        			reply.setReply_writer("无名氏");
        		else
        			reply.setReply_writer(user.getUsername());
        	}
        	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    		reply.setReply_date(timestamp);
        	ReplyDao dao1 = new ReplyDao();
        	if(reply.getReply_content().equals("")||reply.getReply_writer().equals("")) {
        		JOptionPane.showMessageDialog(null, "信息不完整，请重新填写！");
        		response.sendRedirect("../jsp/replytiezi.jsp?Thread_id="+id);
        		return;
        	} else {
        		if (dao1.addReply(reply)) {
        			JOptionPane.showMessageDialog(null, "帖子回复成功！");
        			response.sendRedirect("../jsp/replytiezi.jsp?Thread_id="+id);
        			return;
        		} else {
        			JOptionPane.showMessageDialog(null, "未知原因，回复失败！");
            		response.sendRedirect("../jsp/replytiezi.jsp?Thread_id="+id);
        		}
        	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
