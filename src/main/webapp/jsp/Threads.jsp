<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao,com.forum.entity.User"%>
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

    <title>首页 - 技术论坛</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache,must-revalidate">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/Forum/jsp/NewFile.css" />
    <link rel="stylesheet" type="text/css" href="/Forum/jsp/NewFile1.css" />
    <link rel="stylesheet" type="text/css" href="/Forum/jsp/NewFile2.css" />

  </head>
  <body background="images/index.jpg">
	<br>
	<div class="topframe">
		<a href="/Forum/jsp/index.jsp" target="_self">论坛首页</a> <span
			class="dropdown"> <a href="javascript:void(0);">精选版块</a>
			<div class="dropdownmenu">
				<dl>
					<dt>
						<a href="/Forum/jsp/food.jsp">食物</a>
					</dt>
					<dd>
						<a href="/Forum/jsp/restaurant.jsp">餐馆</a>&nbsp;&nbsp;<a
							href="/Forum/jsp/noshery.jsp">小吃店</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a href="/Forum/jsp/accomodation.jsp">住宿</a>
					</dt>
					<dd>
					<a href="/Forum/jsp/restaurant.jsp">酒店</a>&nbsp;&nbsp;<a
							href="/Forum/jsp/noshery.jsp">旅馆</a>
					</dd>
				</dl>
			</div>
		</span> <a href="/Forum/jsp/writetiezi.jsp" class="write">我要发帖</a>
		<%
			if (usr == null) {
		%>
		<a href="/Forum/jsp/login.jsp" class="buttonlogin">登录</a> <a
			href="/Forum/jsp/register.jsp" class="buttonregister">注册</a>
		<%
			} else {
	    %>
		<a href="/Forum/jsp/logout.jsp" class="exit">注销</a> <span
			class="buttoncenter"> <a href="javascript:void(0);">个人中心</a>
			<div class="centerdownmenu">
				<dl>
					<a href="/Forum/jsp/personal.jsp">普通用户</a>
				</dl>
				<dl>
				<%
				    if (usr.getAdmin()) {
				%>
					<a href="/Forum/jsp/administrator.jsp">管理员</a>
				<%
				    }
				%>
				</dl>
			</div>
		</span>
		<%
			}
		%>
	</div>
	<%
        if(usr == null) {
    %>
            <center><p class="welcome"><%out.print("欢迎,请登录！");%></p></center>
	<%
		} else {
	%>
		    <center><p class="welcome"><%out.print("欢迎," + usr.getUsername() + "!");%></p></center>
	<%
		}
	%>
	
       <br> <br> <br> <br> <br><br>
        <div>
        <h3 class="title"><span>热帖・技术区</span><a href="" target="_blank" class="morecontent">更多</a>
        </h3>
        <div class="hottopic">
          <span class="topic0">标题</span>
          <span class="topic1">提问人</span>
          <span class="topic2">回复数</span>
          <span class="topic3">人气</span>
        </div>
            <ul class="hottopiclist1">
                  <li class="hottopicli">
                    <label class="hotlabel">
                      <a href="/Forum/jsp/noshery.jsp" class="classify" target="_blank">小吃店</a>
                      <em class="classify_dot">・</em>
                      <a href="/Forum/servlet/DisplayThread?Thread_id=1" class="topic_title" target="_blank" title="有关点击js点击事件深层问题求助">有关点击js点击事件深层问题求助</a>
                    </label>
                    <a href="" class="questioner"  rel="nofollow" target="_blank" title="love_yzm">love_yzm</a>
                    <span class="reply_num">17</span>
                    <span class="view">141</span>
                  </li>
                  <li class="hottopicli">
                    <label class="hotlabel">
                      <a href="/forums/VBDotNET" class="classify" target="_blank">餐馆</a>
                      <em class="classify_dot">・</em>
                      <a href="/Forum/servlet/DisplayThread?Thread_id=2" class="topic_title" target="_blank" title="有微软的吗？有人说String.IsNullOrEmpty函数有BUG至今未被修复">有微软的吗？有人说String.IsNullOrEmpty函数有BUG至今未被修复</a>
                    </label>
                    <a href="" class="questioner" rel="nofollow" target="_blank" title="New佳佳">New佳佳</a>
                    <span class="reply_num">33</span>
                    <span class="view">884</span>
                  </li>
                  <li class="hottopicli">
                    <label class="hotlabel">
                      <a href="/forums/ASPDotNET" class="classify" target="_blank">酒店</a>
                      <em class="classify_dot">・</em>
                      <a href="/Forum/servlet/DisplayThread?Thread_id=3" class="topic_title" target="_blank" title="页面查询数据查询超过两万条数据时无法显示？？？">页面查询数据查询超过两万条数据时无法显示？？？</a>
                    </label>
                    <a href="" class="questioner" rel="nofollow" target="_blank" title="吃瓜日常">吃瓜日常</a>
                    <span class="reply_num">36</span>
                    <span class="view">1127</span>
                  </li>                            
            </ul>
      </div>
       <br> <br> <br> <br> <br><br>
	<div>
		<label>版主推荐区</label>
	</div>
	<br>
	<br>

  </body>
</html>
