<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册 - 技术论坛</title>
    
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
    <form action="servlet/Register" method="post">
      <table>
        <caption>用户注册</caption>
        <tr><td>用户名：</td><td><input type="text" name="username" size="20"/></td></tr>
        <tr><td>密码：</td><td><input type="password" name="password" size="20"/></td></tr>
        <tr><td>确认密码：</td><td><input type="password" name="confirmpwd" size="20"/></td></tr>
        <tr>
          <td colspan="2">
            <center>
              <input type="submit" value="注册"/>
              <input type="reset" value="重置"/>
              <input type="button" value="取消"  onclick="javascript:history.back(-1);"/>
            </center>
          </td>
        </tr>
      </table>
    </form>
    </center>
  </body>
</html>
