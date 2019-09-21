package com.forum.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.net.URLDecoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class ShowUserInfo extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
		@SuppressWarnings("deprecation")
		String uname = URLDecoder.decode(request.getParameter("uname"));
		if(uname.equals("无名氏")) {
			JOptionPane.showMessageDialog(null, "该用户已匿名！");
			PrintWriter out = response.getWriter();
			out.print("<script language=javascript>");
			out.print("window.opener=null;");
			out.print("window.open('','_self');");
			out.print("window.close();");
            out.print("</script>"); 
	        return;
		} else {
			response.sendRedirect("../jsp/showuserinfo.jsp?uname=" + URLEncoder.encode(uname, "utf-8"));
		}
	}

}
