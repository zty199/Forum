<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao,com.forum.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User usr = null;
usr = (User) session.getAttribute("usr");
String preUrl = request.getHeader("referer");
session.setAttribute("preUrl", preUrl);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录 - 技术论坛</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
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
	
    <br>
	
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px; text-align: center;">
      <legend>用户登录</legend>
    </fieldset>
	
	<br>
	
    <form class="layui-form" action="servlet/Login" method="post" style="text-align: center;">
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">用户名</label>
          <div class="layui-input-inline" style="width: 300px;">
            <input type="text" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
          </div>
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">密码</label>
          <div class="layui-input-inline" style="width: 300px;">
            <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
          </div>
        </div>
      </div>
      <div style="text-align: center;">
        <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
        <button type="button" class="layui-btn layui-btn-primary" onclick="javascript:history.back(-1);">返回</button>
      </div>
      <br>
      <hr style="width: 100%;"/>
      <p style="width: 100%;"><a href="/Forum/jsp/register.jsp">还没有账户？注册</a></p>
    </form>
  
    <script src="/Forum/js/layui.all.js" charset="utf-8"></script>
    
  </body>
</html>
