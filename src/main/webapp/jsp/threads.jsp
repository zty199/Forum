<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.ThreadDao,com.forum.entity.User,com.forum.entity.Thread"%>
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
    
    <title>帖子管理</title>
    
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
      <caption>帖子列表</caption>
      <tr>
          <td><center>帖子ID</center></td>
          <td><center>所属大板块</center></td>
          <td><center>所属小版块</center></td>
          <td><center>标题</center></td>
          <td><center>发帖人</center></td>
          <td><center>发帖日期</center></td>
          <td colspan="2"><center>操作选项</center></td>
      </tr>
      <%
          int per = 4, total = 1, current = 1;
          if(request.getParameter("per") != null)
              per = Integer.valueOf(request.getParameter("per"));
          if(per <= 0) per = 1;
          if(request.getParameter("total") != null)
              total = Integer.valueOf(request.getParameter("total"));
          if(request.getParameter("current") != null)
              current = Integer.valueOf(request.getParameter("current"));
          if(current <= 0) current = 1;
          else if(current > total) current = total;
          ThreadDao dao = new ThreadDao();
          List<Thread> list = dao.getAllThread();
          total = list.size() / per;
          if(list.size() % per != 0)
              total += 1;
          int i;
          for(i = (current - 1) * per; i < (current * per >= list.size() ? list.size() : current * per); i++) {
              Thread thread = list.get(i);
      %>
              <tr>
                <td><center><%=thread.getThread_id()%></center></td>
                <td><center><%=thread.getForum_big()%></center></td>
                <td><center><%=thread.getForum_small()%></center></td>
                <td><center><%=thread.getThread_title()%></center></td>
                <td><center><%=thread.getThread_writer()%></center></td>
                <td><center><%=thread.getThread_date()%></center></td>
                <td colspan="2">
                  <center>
                    <input type="button" value="删除" onclick="window.location.href='/Forum/servlet/DeleteThread?tid=<%=thread.getThread_id()%>';"/>
                  </center>
                </td>
              </tr>
      <%
          }
      %>
      <tr>
        <td colspan="3"><form name="form1" action="jsp/threads.jsp?total=<%=total%>" method="post">每页显示<input type="text" name="per" size="5" value="<%=per%>"/>条<input type="submit" value="确定"/></form></td>
        <td colspan="3"><form name="form2" action="jsp/threads.jsp?per=<%=per%>&total=<%=total%>" method="post">第<input type="text" name="current" size="5" value="<%=current%>"/>页，共<%=total%>页<input type="submit" value="跳转"/></form></td>
        <td>
          <input type="button" value="上一页" onclick="window.location.href='/Forum/jsp/threads.jsp?per=<%=per%>&total=<%=total%>&current=<%=current-1%>';"/>
        </td>
        <td>
          <input type="button" value="下一页" onclick="window.location.href='/Forum/jsp/threads.jsp?per=<%=per%>&total=<%=total%>&current=<%=current+1%>';"/>
        </td>
      </tr>
      <tr>
        <td colspan="8">
          <center>
            <input type="button" value="返回" onclick="window.location.href='/Forum/jsp/administrator.jsp';"/>
          </center>
        </td>
      </tr>
    </table>
    </center>
  </body>
</html>
