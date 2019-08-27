<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页 - 技术论坛</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache,must-revalidate">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
  <body background="images/index.jpg">
    This is my JSP page. <br>
    <%
      String user = null;
      user = (String)session.getAttribute("uname");
      if(user == null) {
    %>
    <table>
      <tr>
        <td colspan="2">
          <center>
            <input type="button" value="登录" onclick="window.location.href='login.jsp';"/>
            <input type="button" value="注册" onclick="window.location.href='register.jsp';"/>
          </center>
        </td>
      </tr>
    </table>
    <%
      } else {
          out.print("欢迎，" + user);
    %>
    <input type="button" value="退出登录" onclick="window.location.href='logout.jsp';"/>
    <%
      }
    %>
  </body>
</html>
