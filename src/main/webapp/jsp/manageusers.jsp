<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao,com.forum.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User usr = new User();
usr = (User) session.getAttribute("usr");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
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
    <table border="1">
      <caption>用户列表</caption>
      <tr>
          <td><center>用户ID</center></td>
          <td><center>用户名</center></td>
          <td><center>密码</center></td>
          <td><center>管理员权限</center></td>
          <td><center>注册日期</center></td>
          <td><center>电话</center></td>
          <td><center>邮箱</center></td>
          <td><center>操作选项</center></td>
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
          UserDao dao = new UserDao();
          List<User> list = dao.getAllUser();
          total = list.size() / per;
          if(list.size() % per != 0)
              total += 1;
          int i;
          for(i = (current - 1) * per; i < (current * per >= list.size() ? list.size() : current * per); i++) {
              User user = list.get(i);
      %>
              <tr>
                <td><center><%=user.getUserid()%></center></td>
                <td><center><%=user.getUsername()%></center></td>
                <td><center><%=user.getPwd()%></center></td>
                <td><center><%=user.getAdmin()%></center></td>
                <td><center><%=user.getDate()%></center></td>
                <td><center><%=user.getPhone()%></center></td>
                <td><center><%=user.getMail()%></center></td>
                <td>
                  <center>
                    <input type="button" value="删除" onclick="window.location.href='/Forum/servlet/DeleteUser?uid=<%=user.getUserid()%>';"/>
                  </center>
                </td>
              </tr>
      <%
          }
      %>
      <tr>
        <td colspan="3"><form name="form1" action="jsp/manageusers.jsp?total=<%=total%>" method="post">每页显示<input type="text" name="per" size="5" value="<%=per%>"/>条<input type="submit" value="确定"/></form></td>
        <td colspan="3"><form name="form2" action="jsp/manageusers.jsp?per=<%=per%>&total=<%=total%>" method="post">第<input type="text" name="current" size="5" value="<%=current%>"/>页，共<%=total%>页<input type="submit" value="跳转"/></form></td>
        <td>
          <input type="button" value="上一页" onclick="window.location.href='/Forum/jsp/manageusers.jsp?per=<%=per%>&total=<%=total%>&current=<%=current-1%>';"/>
        </td>
        <td>
          <input type="button" value="下一页" onclick="window.location.href='/Forum/jsp/manageusers.jsp?per=<%=per%>&total=<%=total%>&current=<%=current+1%>';"/>
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
