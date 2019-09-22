package com.forum.servlet;

import java.awt.HeadlessException;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.forum.dao.ReplyDao;
import com.forum.dao.ThreadDao;
import com.forum.entity.User;

public class DeleteThread extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(request.getParameter("tid"));
        ThreadDao dao = new ThreadDao();
        ReplyDao dao1 = new ReplyDao();
        User usr = new User();
		usr = (User) request.getSession().getAttribute("usr");
		if(usr == null || !usr.getAdmin()) {
			JOptionPane.showMessageDialog(null, "请先登录！");
			request.getSession().setAttribute("usr", null);
			response.sendRedirect("../jsp/login.jsp");
			return;
		}
        try {
			if(dao.delThread(id) && dao1.delAllReply(id)) {
				JOptionPane.showMessageDialog(null, "删除成功！");
				response.sendRedirect("../jsp/managethreads.jsp");
				return;
			} else {
				JOptionPane.showMessageDialog(null, "未知原因，删除失败或回帖为空，请检查数据库！");
				response.sendRedirect("../jsp/managethreads.jsp");
			}
		} catch (HeadlessException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
