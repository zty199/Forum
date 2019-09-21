<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.*,com.forum.entity.User,com.forum.dao.ForumDao,com.forum.entity.Forum,com.forum.dao.ThreadDao,com.forum.entity.Thread"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
User usr = null;
usr = (User) session.getAttribute("usr");
Forum forum = new Forum();
forum.setId(Integer.parseInt(request.getParameter("Forum_id")));
ForumDao dao = new ForumDao();
forum = dao.getInfo(forum.getId());
ThreadDao dao1 = new ThreadDao();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><%=forum.getTitle()%> - 技术论坛</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache,must-revalidate">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <link rel="stylesheet" type="text/css" href="/Forum/css/layui.css" media="all">
    
  </head>
      
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
 
  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend><%=forum.getInfo()%>・全部帖子</legend>
  </fieldset>
   
  <div id="demo20"></div>
  <ul id="biuuu_city_list"></ul> 
    <div style="padding: 20px; background-color: #F2F2F2;">
      <div class="layui-row layui-col-space15">
      <%
          List<Thread> list = dao1.getThreads(forum.getTitle());
          for(Thread thread:list) {
      %>
        <div class="layui-col-md12">
          <div class="layui-card">
            <div class="layui-card-header">
              <a href="/Forum/jsp/threads.jsp?Forum_id=<%=forum.getId()%>"><%=thread.getForum_small()%></a>&nbsp;——&nbsp;
              <a href="/Forum/jsp/threads.jsp?Forum_id=<%=forum.getId()%>">
              <%
                  Forum temp = new Forum();
                  temp = dao.getForum(thread.getForum_small());
              %>
                <%=temp.getInfo()%>
              </a>
            </div>
            <div class="layui-card-body">
              <a href="/Forum/jsp/replytiezi.jsp?Thread_id=<%=thread.getThread_id()%>"><%=thread.getThread_title()%></a>&nbsp;・&nbsp;用户&nbsp;
              <a href="/Forum/servlet/ShowUserInfo?uname=<%=thread.getThread_writer()%>" target="_blank"><%=thread.getThread_writer()%></a>&nbsp;・&nbsp;发布于&nbsp;
              <%=thread.getThread_date()%>
            </div>
          </div>
        </div>
      <%
          }
      %>
      </div>
    </div>
    
    <script src="/Forum/js/layui.all.js" charset="utf-8"></script>
    
  </body>
</html>