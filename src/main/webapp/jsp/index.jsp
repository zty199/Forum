<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao,com.forum.entity.User,com.forum.dao.ThreadDao,com.forum.entity.Thread"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
User usr = null;
usr = (User) session.getAttribute("usr");
Thread thread = new Thread();
ThreadDao dao = new ThreadDao();
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
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    
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
	
	<fieldset class="layui-elem-field layui-field-title" style=" margin-top: 30px;">
	  <legend>精选帖子・热帖区</legend>
	</fieldset>
 
	<div style="padding: 20px; background-color: #F2F2F2;">
  	  <div class="layui-row layui-col-space15">
	    <div class="layui-col-md6">
          <div class="layui-card">
            <div class="layui-card-header"><a href="/Forum/jsp/threads.jsp?Forum_id=1">Windows —— Windows专区</a></div>
            <div class="layui-card-body">
              <a href="/Forum/jsp/replytiezi.jsp?Thread_id=1">Win7蓝屏</a>
            </div>
          </div>
        </div>
      <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header"><a href="/Forum/jsp/threads.jsp?Forum_id=2">Linux —— Linux专区</a></div>
          <div class="layui-card-body">
            <a href="/Forum/jsp/replytiezi.jsp?Thread_id=2">Deepin进不去</a>
          </div>
        </div>
      </div>
	  <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header"><a href="/Forum/jsp/threads.jsp?Forum_id=3">macOS —— macOS专区</a></div>
          <div class="layui-card-body">
            <a href="/Forum/jsp/replytiezi.jsp?Thread_id=3">更新到10.14无限重启</a>
          </div>
        </div>
      </div>
      <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header"><a href="/Forum/jsp/threads.jsp?Forum_id=4">数码3C —— 数码3C资讯</a></div>
          <div class="layui-card-body">
            <a href="/Forum/jsp/replytiezi.jsp?Thread_id=4">三星Note7自燃</a>
          </div>
        </div>
      </div>
	  <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header"><a href="">板块名</a></div>
          <div class="layui-card-body">
            <a href="">内容</a>
          </div>
        </div>
      </div>
      <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header"><a href="">板块名</a></div>
          <div class="layui-card-body">
            <a href="">内容</a>
          </div>
        </div>
      </div>
	  <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header"><a href="">板块名</a></div>
          <div class="layui-card-body">
            <a href="">内容</a>
          </div>
        </div>
      </div>
	  <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header"><a href="">板块名</a></div>
          <div class="layui-card-body">
            <a href="">内容</a>
          </div>
        </div>
      </div>
	  <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header"><a href="">板块名</a></div>
          <div class="layui-card-body">
            <a href="">内容</a>
          </div>
        </div>
      </div>
	  <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header"><a href="">板块名</a></div>
          <div class="layui-card-body">
            <a href="">内容</a>
          </div>
        </div>
      </div>
  	  
    </div>
  </div>
  <br><br>
  <script src="/Forum/js/layui.all.js" charset="utf-8"></script>

  </body>
</html>
