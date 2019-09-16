<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao,com.forum.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User usr = new User();
usr = (User)request.getSession().getAttribute("usr");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
    <center>
    <table border="1">
      <caption>管理员操作列表</caption>
      <tr><td><center><input type="button" value="用户列表" onclick="window.location.href='/Forum/jsp/manageusers.jsp';"/></center></td></tr>
      <tr><td><center><input type="button" value="板块列表" onclick="window.location.href='/Forum/jsp/manageforums.jsp';"/></center></td></tr>
      <tr><td><center><input type="button" value="帖子列表" onclick="window.location.href='/Forum/jsp/managethreads.jsp';"/></center></td></tr>
      <tr><td><center><input type="button" value="退出管理" onclick="window.location.href='/Forum/jsp/index.jsp';"/></center></td></tr>
    </table>
    </center>
  </body>
</html>
