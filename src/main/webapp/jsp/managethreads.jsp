<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.ThreadDao,com.forum.entity.User,com.forum.entity.Thread"%>
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
    
    <title>帖子管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	
	<link rel="stylesheet" type="text/css" href="/Forum/css/layui.css" media="all">

  </head>
  <jsp:include page="isAdmin.jsp"></jsp:include>
  <body bgcolor="#F2F2F2">

	<ul class="layui-nav" style=" text-align: right">
	<li class="layui-nav-item"><a href="/Forum/jsp/index.jsp">主页</a></li>
	<li class="layui-nav-item"><a href="/Forum/jsp/forums.jsp">版块</a></li>
	<li class="layui-nav-item"><a href="/Forum/jsp/writetiezi.jsp" target="_blank">我要发贴</a></li>
	<%
	if (usr == null) {
	%>
	<li class="layui-nav-item"><a href="/Forum/jsp/login.jsp">登录</a></li>
	<li class="layui-nav-item"><a href="/Forum/jsp/register.jsp">注册</a></li>
	<%
	} else {
	%>
	<li class="layui-nav-item">
	  <a href="/Forum/jsp/personal.jsp" target="_blank">个人中心</a>
	  <%
	      if (usr.getAdmin()) {
	  %>
      <dl class="layui-nav-child">
        <dd class="layui-this"><a href="/Forum/jsp/administrator.jsp" target="_blank"><i class="layui-icon layui-icon-user"></i>&nbsp;&nbsp;管理员</a></dd>
      </dl>
      <%
	      }
	  %>
    </li>
	<li class="layui-nav-item"><a href="/Forum/jsp/logout.jsp">退出</a></li>	
	<%
	}
	%>
	</ul>
	<br>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; text-align: center;">
      <legend>帖子列表</legend>
    </fieldset>
	<br>
    <div class="layui-form">
      <table class="layui-table" lay-size="lg"  style="text-align: center; vertical-align: middle;">
        <colgroup>
          <col width="150">
          <col width="150">
          <col width="150">
          <col width="400">
          <col width="150">
          <col width="150">
          <col width="50">
        </colgroup>
        <thead>
          <tr>
            <th>帖子ID</th>
            <th>所属大板块</th>
            <th>所属小版块</th>
            <th>标题</th>
            <th>发帖人</th>
            <th>发帖日期</th>
            <th>操作选项</th>
          </tr> 
        </thead>
        <tbody>
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
            <td><%=thread.getThread_id()%></td>
            <td><%=thread.getForum_big()%></td>
            <td><%=thread.getForum_small()%></td>
            <td><%=thread.getThread_title()%></td>
            <td><%=thread.getThread_writer()%></td>
            <td><%=thread.getThread_date()%></td>
            <td>
              <button type="button" class="layui-btn layui-btn-lg" onclick="window.location.href='/Forum/servlet/DeleteThread?uid=<%=thread.getThread_id()%>';"><i class="layui-icon layui-icon-delete"></i>删除</button>
            </td>
          </tr>
        <%
        }
        %>
        </tbody>
        <tr>
          <td colspan="3"><form name="form1" action="jsp/managethreads.jsp?total=<%=total%>" method="post">每页显示<input type="text" name="per" size="5" value="<%=per%>"/>条<button type="submit" class="layui-btn layui-btn-sm">确定</button></form></td>
          <td><form name="form2" action="jsp/managethreads.jsp?per=<%=per%>&total=<%=total%>" method="post">第<input type="text" name="current" size="5" value="<%=current%>"/>页，共<%=total%>页<button type="submit" class="layui-btn layui-btn-sm">跳转</button></form></td>
          <td colspan="3">
            <button type="button" class="layui-btn layui-btn-sm" onclick="window.location.href='/Forum/jsp/managethreads.jsp?per=<%=per%>&total=<%=total%>&current=<%=current-1%>';"><i class="layui-icon layui-icon-prev"></i>上一页</button>
            <button type="button" class="layui-btn layui-btn-sm" onclick="window.location.href='/Forum/jsp/managethreads.jsp?per=<%=per%>&total=<%=total%>&current=<%=current+1%>';"><i class="layui-icon layui-icon-next"></i>下一页</button>
            <button type="button" class="layui-btn layui-btn-sm" onclick="window.location.href='/Forum/jsp/administrator.jsp';"><i class="layui-icon layui-icon-return"></i>返回</button>
          </td>
        </tr>
      </table>
    </div>
	<br><br><br>
    <script src="/Forum/js/layui.all.js" charset="utf-8"></script>
    
  </body>
</html>
