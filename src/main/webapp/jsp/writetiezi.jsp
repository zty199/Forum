<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.ForumDao,com.forum.dao.UserDao,com.forum.entity.Forum,com.forum.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
User usr = null;
usr = (User) session.getAttribute("usr");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  
    <title>发表帖子 - 技术论坛</title>
    
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
	  <legend>发表帖子</legend>
	</fieldset>
	
	<form class="layui-form" action="servlet/Submitwrite" method="post">
      <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
          <input name="Thread_title" class="layui-input" type="text" placeholder="请输入标题" autocomplete="off">
        </div>
      </div>
     
      <label class="layui-form-label">选择版块</label>
      <div class="layui-input-inline">
        <select name="Forum_big">
          <option value="" selected>-请选择大版块-</option>
          <%
			  ForumDao dao = new ForumDao();
			  List<Forum> list1 = dao.getForum_big();
			  for(Forum forum:list1) {
		  %>
		  <option value="<%=forum.getTitle()%>"><%=forum.getTitle()%></option>
		  <%
			  }
		  %>
        </select>
      </div>
      &nbsp;
      <div class="layui-input-inline">
        <select name="Forum_small">
          <option value="" selected>-请选择小版块-</option>
          <%
			  List<Forum> list2 = dao.getForum_small();
			  for(Forum forum:list2) {
		  %>
		  <option value="<%=forum.getTitle()%>"><%=forum.getTitle()%></option>
		  <%
			  }
		  %>
        </select>
      </div>
      
      <br><br>
      
      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">帖子内容</label>
        <div class="layui-input-block" style="border:0px; background:rgba(0, 0, 0, 0);">
          <textarea class="layui-textarea" placeholder="请输入内容" name="Thread_content"></textarea>
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
          <button class="layui-btn" type="submit" lay-filter="demo1" lay-submit=""><i class="layui-icon layui-icon-release"></i>发布</button>
          <button class="layui-btn layui-btn-primary" type="reset"><i class="layui-icon layui-icon-refresh"></i>清空</button>
          <button type="button" class="layui-btn layui-btn-primary" onclick="window.location='/Forum/jsp/index.jsp';"><i class="layui-icon layui-icon-return"></i>返回</button>
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