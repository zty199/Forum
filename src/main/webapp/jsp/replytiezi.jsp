<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao,com.forum.entity.User,com.forum.dao.ThreadDao,com.forum.entity.Thread,com.forum.dao.ReplyDao,com.forum.entity.Reply"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
User usr = null;
usr = (User) session.getAttribute("usr");
Thread thread = new Thread();
thread.setThread_id(Integer.parseInt(request.getParameter("Thread_id")));
ThreadDao dao = new ThreadDao();
thread = dao.getInfo(thread.getThread_id());
ReplyDao dao1 = new ReplyDao();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  
    <title><%=thread.getThread_title()%> - 技术论坛</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache,must-revalidate">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    
    <link rel="stylesheet" href="/Forum/css/layui.css"  media="all">
    
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
	
	<fieldset class="layui-elem-field layui-field-title" style=" margin-top: 30px;">
	  <legend><%=thread.getForum_big()%>&nbsp;>&nbsp;<%=thread.getForum_small()%>&nbsp;・&nbsp;<%=thread.getThread_title()%></legend>
	</fieldset>
	
	<br>

  <ul class="layui-timeline" style="margin-left: 20px;">
    <li class="layui-timeline-item">
      <i class="layui-icon layui-timeline-axis"></i>
      <div class="layui-timeline-content layui-text">
        <h3 class="layui-timeline-title">主题：&nbsp;&nbsp;<%=thread.getThread_title()%></h3>
        <h3 class="layui-timeline-title">发布于&nbsp;&nbsp;<%=thread.getThread_date()%>&nbsp;&nbsp;发布者&nbsp;&nbsp;<a href="/Forum/servlet/ShowUserInfo?uname=<%=thread.getThread_writer()%>" target="_blank"><%=thread.getThread_writer()%></a></h3>
        <ul>
          <li><%=thread.getThread_content()%></li>
        </ul>
      </div>
    </li>
    <%
        List<Reply> list = dao1.getAllReply(thread.getThread_id());
        for(Reply reply:list)
        {
    %>
    <li class="layui-timeline-item">
      <i class="layui-icon layui-timeline-axis"></i>
      <div class="layui-timeline-content layui-text">
        <h3 class="layui-timeline-title">回复于&nbsp;&nbsp;<%=reply.getReply_date()%>&nbsp;&nbsp;回复者&nbsp;&nbsp;<a href="/Forum/servlet/ShowUserInfo?uname=<%=reply.getReply_writer()%>" target="_blank"><%=reply.getReply_writer()%></a></h3>
        <ul>
          <li><%=reply.getReply_content()%></li>
        </ul>
      </div>
    </li>
    <%
        }
    %>
  </ul>  
    
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
      <legend>回复帖子</legend>
    </fieldset>
     
	<br>

    <form class="layui-form" action="servlet/Submitreply?Thread_id=<%=thread.getThread_id()%>" method="post">
      <div class=" layui-forlayui-form-itemm-text">
        <label class="layui-form-label">回复内容</label>
        <div class="layui-input-block" style="border:0px; background:rgba(0, 0, 0, 0);">
          <textarea class="layui-textarea" placeholder="请输入内容" name="Reply_content"></textarea>
        </div>
      </div>
      
      <br>
      
      <div class="layui-form-item">
        <label class="layui-form-label">匿名回复</label>
        <div class="layui-input-block">
          <input name="close" type="checkbox" lay-skin="switch" lay-text="ON|OFF">
        </div>
      </div>
      
      <br>
      
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" type="submit" lay-filter="demo1" lay-submit=""><i class="layui-icon layui-icon-release"></i>回复</button>
          <button class="layui-btn layui-btn-primary" type="reset"><i class="layui-icon layui-icon-refresh"></i>清空</button>
        </div>
      </div>
      
      <br>
      
    </form>
     
    <script src="/Forum/js/layui.all.js" charset="utf-8"></script>
    <script>
    layui.$('#LAY-component-form-setval').on('click', function() {
      form.val('example', {
        "close": true
      });
    });
    </script>
	
  </body>
</html>