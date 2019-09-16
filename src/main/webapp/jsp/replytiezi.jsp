<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.UserDao,com.forum.entity.User,com.forum.dao.ThreadDao,com.forum.entity.Thread,com.forum.entity.Reply"%>
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
  
    <title>回复帖子界面</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache,must-revalidate">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/Forum/css/NewFile.css" />
    <link rel="stylesheet" type="text/css" href="/Forum/css/NewFile1.css" />
    <link rel="stylesheet" type="text/css" href="/Forum/css/NewFile2.css" />
    
  </head>
  <body>
  <%
      Thread thread = new Thread();
      thread = (Thread) session.getAttribute("thread");
      List list = (List) session.getAttribute("list");
      /*String Forum_big = (String)session.getAttribute("para1");
	  String Forum_small = (String)session.getAttribute("para2");
	  String Thread_title = (String)session.getAttribute("para3");
	  String Thread_writer = (String)session.getAttribute("para4");
	  String Thread_content = (String)session.getAttribute("para5");
	  String Thread_date = (String)session.getAttribute("para6");*/
  %> 
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
		<a href="/Forum/jsp/logout.jsp" class="exit">EXIT</a> <span
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
	<div class="secondframe">
		<a href="/Forum/jsp/index.jsp" target="_blank">论坛</a> <span>></span> <a href="food.jsp"
			target="_blank"><%=thread.getForum_big()%></a> <span>></span> <a href="restaurant.jsp"
			target="_blank"><%=thread.getForum_small()%></a>
	</div>
	<div class="thirdframe">
		<h3>
			帖子标题:<%=thread.getThread_title()%>&nbsp;&nbsp;&nbsp; <span> [问题点数：???分] </span>
		</h3>
	</div>
	<div class="thirdframe">
		<a href="" class="store">收藏帖子</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#replytext" class="reply">回复</a>
	</div>
	
	<div class="onetable">
		<dl class="replydl">
			<dt class="replydt">
				<%=thread.getThread_writer()%>
            </dt>
			<dd class="replydd"><%=thread.getThread_content()%> </dd>
		</dl>
		<%
		    for(int i = 0; i < list.size(); i++)
            {
	            Reply reply = (Reply)list.get(i);
	            String Reply_content=reply.getReply_content();
	            String Reply_writer=reply.getReply_writer();
        %>
		<dl class="replydl">
			<dt class="replydt">
				<%=reply.getReply_writer()%>
            </dt>
			<dd class="replydd"><%=reply.getReply_content()%> </dd>
		</dl>
		<%
		    }
		%>
<!--<form name="reply" action="../servlet/submitreply" method="post" enctype="multipart/form-data" class="publishreply">-->
	<div class="publishreply">
	  <form name="reply" action="servlet/Submitreply?Thread_id=<%=thread.getThread_id()%>" method="post" >
	    <center>
	      <textarea id="replytext" cols="104" rows="10" name="Reply_content" placeholder="please input the content about your question.">
	      </textarea><br><br><!-- <textarea>和</textarea>之间不能有空格，or the content of placeholder can not display. -->
	    </center>
	    <label>帖子回复者:</label>&nbsp;&nbsp;&nbsp;&nbsp;<select name="Reply_writer" >
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
        <input type="submit" value="回帖" class="replybutton">
      </form>
      </div>
    </div>
  </body>
</html>