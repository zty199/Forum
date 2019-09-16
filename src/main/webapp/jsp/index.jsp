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
	<link rel="stylesheet" type="text/css" href="/Forum/css/NewFile.css" />
    <link rel="stylesheet" type="text/css" href="/Forum/css/NewFile1.css" />
    <link rel="stylesheet" type="text/css" href="/Forum/css/NewFile2.css" />

  </head>
  <body bgcolor="#F2F2F2">

	<ul class="layui-nav">
	<li class="layui-nav-item"><a href="/Forum/jsp/index.jsp">主页</a></li>
	<li class="layui-nav-item"><a href="/Forum/jsp/forums.jsp">版块</a></li>
	<%
	if (usr == null) {
	%>
	<li class="layui-nav-item"><a href="/Forum/jsp/login.jsp">登录</a></li>
	<li class="layui-nav-item"><a href="/Forum/jsp/register.jsp">注册</a></li>
	<%
	} else {
	%>
	<li class="layui-nav-item"><a href="/Forum/jsp/personal.jsp">个人中心</a></li>
	<li class="layui-nav-item"><a href="/Forum/jsp/writetiezi.jsp">我要发贴</a></li>
	<li class="layui-nav-item"><a href="/Forum/jsp/logout.jsp">注销</a></li>	
	<%
	    if (usr.getAdmin()) {
	%>
	<li class="layui-nav-item"><a href="/Forum/jsp/administrator.jsp">管理员</a></li>
	<%
	    }
	}
	%>
	</ul>
 
<div style="padding: 20px; background-color: #F2F2F2;">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header"><a href="">Windows</a></div>
        <div class="layui-card-body">
        <a href="">Windows专区</a>
        </div>
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header"><a href="">Linux</a></div>
        <div class="layui-card-body">
          <a href="">Linux专区</a>
        </div>
      </div>
    </div>
	<div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header"><a href="">macOS</a></div>
        <div class="layui-card-body">
          <a href="">macOS专区</a>
        </div>
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header"><a href="">数码3C</a></div>
        <div class="layui-card-body">
          <a href="">Windows专区</a>
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

<br/> <br/> <br/> <br/> <br/>

      <div>
        <h3 class="title"><span>热帖・技术区</span><a href="/Forum/jsp/forums.jsp" target="_self" class="morecontent">更多</a>
        </h3>
        <div class="hottopic">
          <span class="topic0">标题</span>
          <span class="topic1">提问人</span>
          
        </div>
            <ul class="hottopiclist1">
                  <li class="hottopicli">
                    <label class="hotlabel">
                    <a href="" class="classify" target="_blank">Windows</a>
                      <em class="classify_dot">・</em>
                      <a href="/Forum/servlet/DisplayThread?Thread_id=1" class="topic_title" target="_self" title="Win7蓝屏">Win7蓝屏</a>
                    </label>
                    <a href="/Forum/servlet/DisplayThread?Thread_id=1" class="questioner"  rel="nofollow" target="_self" title="user">user</a>
                    
                  </li>
                  <li class="hottopicli">
                    <label class="hotlabel">
                      <a href="" class="classify" target="_blank">Linux</a>
                      <em class="classify_dot">・</em>
                      <a href="/Forum/servlet/DisplayThread?Thread_id=2" class="topic_title" target="_self" title="Deepin进不去">Deepin进不去</a>
                    </label>
                    <a href="/Forum/servlet/DisplayThread?Thread_id=2" class="questioner" rel="nofollow" target="_self" title="user">user</a>
                    
                  </li>
                  <li class="hottopicli">
                    <label class="hotlabel">
                      <a href="" class="classify" target="_blank">macOS</a>
                      <em class="classify_dot">・</em>
                      <a href="/Forum/servlet/DisplayThread?Thread_id=3" class="topic_title" target="_self" title="更新到10.14无限重启">更新到10.14无限重启</a>
                    </label>
                    <a href="/Forum/servlet/DisplayThread?Thread_id=3" class="questioner" rel="nofollow" target="_self" title="user">user</a>
                    
                  </li>                            
            </ul>
      </div>
      
      
      
</body>
</html>
