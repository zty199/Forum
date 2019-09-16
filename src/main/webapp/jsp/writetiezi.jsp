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
  
    <title>发起帖子界面</title>
    
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
		</span> <a href="/Forum/jsp/writetiezi.jsp" target="_blank" class="write">我要发帖</a>
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
					<a href="/Forum/jsp/personal.jsp?uname=<%=usr.getUsername()%>">普通用户</a>
				</dl>
				<dl>
				<%
				    if (usr.getAdmin()) {
				%>
					<a href="/Forum/jsp/administrator.jsp?uname=<%=usr.getUsername()%>">管理员</a>
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
	<br>
	<br>
	 <div class="publish">
		<!--<form name="write" action="../servlet/submitwrite" method="post"
			enctype="multipart/form-data" >-->
		<form name="writeform" action="servlet/Submitwrite" method="post" >
	    <div class="publish0">
		<input autocomplete="off" type="text" name="Thread_title"
			placeholder="输入文章标题" style="width: 450px; height: 30px;"
			class="txtinput"> &nbsp;&nbsp; <select id="point"
			name="titlepoint" class="selectscore" style="height: 30px;">
			<option value="0">0</option>
			<option value="20">20</option>
			<option value="50">50</option>
			<option value="100">100</option>
			<option value="150">150</option>
			<option value="200">200</option>
			<option value="250">250</option>
			<option value="300">300</option>
			<option value="350">350</option>
			<option value="400">400</option>
		</select> 
		</div>
		<br> <br>
			<textarea name="Thread_content" cols="72" rows="20" placeholder="输入文章内容" ></textarea> 
			<br> <br><br> <br>  <label>主题版块 :</label>&nbsp;&nbsp;&nbsp;&nbsp; <select
				name="Forum_big">
				<option value="" selected>-选择大版块-</option>
				<%
				    ForumDao dao = new ForumDao();
				    List<Forum> list1 = dao.getForum_big();
				    for(Forum forum:list1) {
				%>
				<option value="<%=forum.getTitle()%>"><%=forum.getTitle()%></option>
				<%
				    }
				%>
			</select>&nbsp;&nbsp;&nbsp;&nbsp; <select 
				name="Forum_small">
				<option value="" selected>-选择小版块-</option>
				<%
				    List<Forum> list2 = dao.getForum_small();
				    for(Forum forum:list2) {
				%>
				<option value="<%=forum.getTitle()%>"><%=forum.getTitle()%></option>
				<%
				    }
				%>
			</select><br> <br> 		
			<label>帖子发起者:</label>&nbsp;&nbsp;&nbsp;&nbsp;<select name="Thread_writer" >
			    <option value="" selected>请选择...</option>
			    <%
			        if(usr != null) {
			    %>
				<option value="<%=usr.getUsername()%>">本名</option>
				<%
				    }
				%>
				<option value="无名氏">匿名</option>
				</select><br><br>
			<input type="submit" value="提交" class="submit1">	
		</form>
		</div>
  </body>
</html>