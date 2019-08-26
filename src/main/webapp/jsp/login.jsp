<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录 - 技术论坛</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center>
    <form action="servlet/Login" method="post">
      <table>
        <caption>用户登录</caption>
        <tr><td>用户名:</td><td><input type="text" name="username" size="20"/></td></tr>
        <tr><td>密码:</td><td><input type="password" name="password" size="20"/></td></tr>
        <tr>
          <td colspan="2">
            <center>
              <input type="button" value="注册" onclick="window.location.href='../jsp/register.jsp';"/>
              <input type="submit" value="登录"/>
              <input type="button" value="返回首页"  onclick="window.location.href='../jsp/index.jsp';" >
            </center>
          </td>
        </tr>
      </table>
    </form>
    </center>
  </body>
</html>
