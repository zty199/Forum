<%@ page language="java" import="java.util.*,javax.swing.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao,com.forum.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User usr = new User();
usr = (User) session.getAttribute("usr");
if(usr == null) {
	JOptionPane.showMessageDialog(null, "请先登录！");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
