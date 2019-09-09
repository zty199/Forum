<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao, com.forum.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user = new User();
user.setUsername(request.getParameter("uname"));
UserDao dao = new UserDao();
user = dao.getInfo(user.getUsername());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>个人中心</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache,must-revalidate">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
	<link rel="stylesheet" type="text/css" href="/Forum/jsp/NewFile.css">
	-->
	
  </head>
  
  <body background="images/personal.jpg">
    <center>
      <table border="1">
        <caption>个人信息</caption>
        <tr><td><center>用户名</center></td><td><center><%=user.getUsername()%></center></td></tr>
        <tr><td><center>注册日期</center></td><td><center><%=user.getDate()%></center></td></tr>
        <tr><td><center>电话</center></td><td><center><%=user.getPhone()%></center></td></tr>
        <tr><td><center>邮箱</center></td><td><center><%=user.getMail()%></center></td></tr>
        <tr>
          <td colspan="2">
            <center>
              <input type="button" value="返回" onclick="window.location='/Forum/jsp/index.jsp'"/>
            </center>
          </td>
        </tr>
      </table>
    </center>
  </body>
</html>