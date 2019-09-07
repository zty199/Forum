<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发起帖子界面</title>
<link rel="stylesheet" type="text/css" href="NewFile.css" />
<link rel="stylesheet" type="text/css" href="NewFile1.css" />
</head>
<body background="../images/index.jpg">
	<br>
	<div class="topframe">
		<a href="/Forum/jsp/index.jsp" target="_blank">论坛首页</a> <span
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
			String user = null;
			user = (String) session.getAttribute("uname");
			if (user == null) {
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
					<a href="/Forum/jsp/personalinformation.jsp">普通用户</a>
				</dl>
				<dl>
					<a href="/Forum/jsp/manageridentification.jsp">管理员</a>
				</dl>
			</div>
		</span>
		<%
			}
		%>
	</div>
	<br>
	<br>
	    <div class="publish0">
		<input autocomplete="off" type="text" name="title"
			placeholder="输入文章标题" style="width: 500px; height: 30px;"
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
	    <div class="publish">
		<form name="write" action="" method="post"
			enctype="multipart/form-data" >
			<textarea cols="72" rows="20" placeholder="输入文章内容" ></textarea> 
			<br> <br> <label>主题版块 :</label>&nbsp;&nbsp;&nbsp;&nbsp; <select
				id="select_parent_forum" name="parentforum">
				<option value="" selected>-选择大版块-</option>
				<option value="">食物</option>
				<option value="">住宿</option>
				<option value="">服装</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp; <select id="select_child_forum"
				name="childforum">
				<option value="" selected>-选择小版块-</option>
				<option value="">小吃店</option>
				<option value="">餐馆</option>
				<option value="">酒店</option>
				<option value="">旅馆</option>
			</select><br> <br> <input type="submit" value="提交" class="submit1">
		</form>
		</div>
</body>
</html>