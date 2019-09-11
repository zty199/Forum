<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.ForumDao,com.forum.entity.User,com.forum.entity.Forum"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User usr = new User();
usr = (User)request.getSession().getAttribute("usr");
Forum forum = new Forum();
ForumDao dao = new ForumDao();
forum.setId(Integer.parseInt(request.getParameter("fid")));
forum = dao.getInfo(forum.getId());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改版块信息</title>
    
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
    <form action="servlet/ModifyForumInfo?fid=<%=forum.getId()%>" method="post">
      <table border="1" style="background-color: White; ">
        <caption>修改版块信息</caption>
        <tr><td><center>版块ID</center></td><td colspan="2"><center><%=forum.getId()%></center></td></tr>
        <tr><td><center>版块名称</center></td><td colspan="2"><center><input type="text" name="title" value="<%=forum.getTitle()%>"/></center></td></tr>
        <tr><td><center>版块信息</center></td><td colspan="2"><center><input type="text" name="info" value="<%=forum.getInfo()%>"/></center></td></tr>
        <tr>
          <td><center>版块类型</center></td>
          <td>
          <center>
            <%
                if(forum.getType()) {
            %>
                    大版块
            <%
                } else {
            %>
                    小版块 
            <%
                }
            %>
          </center>
          </td>
          <td>
            <select id="type" name="type">
              <option value="" selected>请选择...</option>
              <option value="1">大版块</option>
	          <option value="0">小版块</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="3">
            <center>
              <input type="submit" value="修改"/>
              <input type="button" value="重置" onclick="window.location='/Forum/jsp/modifyforum.jsp?fid=<%=forum.getId()%>'"/>
              <input type="button" value="返回" onclick="javascript:history.back(-1);"/>
            </center>
          </td>
        </tr>
      </table>
    </form>
    </center>
  </body>
</html>
