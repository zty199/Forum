<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao,com.forum.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User usr = new User();
usr = (User)request.getSession().getAttribute(("usr"));
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
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <!--
	<link rel="stylesheet" type="text/css" href="/Forum/jsp/NewFile.css">
	-->
	
  </head>
  
  <body background="images/personal.jpg">
    <center>
    <form action="servlet/ModifyUserInfo" method="post">
      <table border="1" style="background-color: White; ">
        <caption>个人信息</caption>
        <tr><td><center>用户ID</center></td><td><center><%=usr.getUserid()%></center></td></tr>
        <tr><td><center>用户名</center></td><td><center><input type="text" name="name" value="<%=usr.getUsername()%>"/></center></td></tr>
        <tr><td><center>密码</center></td><td><center><input type="password" name="pwd" value="<%=usr.getPwd()%>"/></center></td></tr>
        <tr><td><center>确认密码</center></td><td><center><input type="password" name="cpwd" value="<%=usr.getPwd()%>"/></center></td></tr>
        <tr><td><center>注册日期</center></td><td><center><%=usr.getDate()%></center></td></tr>
        <tr><td><center>电话</center></td><td><center><input type="text" name="phone" value="<%=usr.getPhone()%>"/></center></td></tr>
        <tr><td><center>邮箱</center></td><td><center><input type="text" name="mail" value="<%=usr.getMail()%>"/></center></td></tr>
        <tr>
          <td colspan="2">
            <center>
              <input type="submit" value="修改"/>
              <input type="button" value="重置" onclick="window.location='/Forum/jsp/personal.jsp'"/>
              <input type="button" value="返回" onclick="window.location='/Forum/jsp/index.jsp'"/>
            </center>
          </td>
        </tr>
      </table>
    </form>
    </center>
  </body>
</html>