<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.entity.User"%>
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
    
    <title>添加新板块</title>
    
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
  <jsp:include page="isAdmin.jsp"></jsp:include>
  <body>
    <center>
    <form action="servlet/AddForum" method="post">
      <table>
        <caption>添加新板块</caption>
        <tr><td>板块名称</td><td><input type="text" name="title" size="20"/></td></tr>
        <tr><td>版块信息</td><td><input type="text" name="info" size="20" value="这个版块还没有介绍呢......"/></td></tr>
        <tr>
          <td>版块类型</td>
          <td>
            <select id="type" name="type">
              <option value="" selected>请选择...</option>
              <option value="1">大版块</option>
	          <option value="0">小版块</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <center>
              <input type="submit" value="添加"/>
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
