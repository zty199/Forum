<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="NewFile1.css" />
<link rel="stylesheet" type="text/css" href="NewFile.css" />
</head>
<body>
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
		</span> <a href="/Forum/jsp/writetiezi.jsp" class="write">我要发帖</a> <%
			String user = null;
			user = (String) session.getAttribute("uname");
			if (user == null) {
		%>
		<a href="/Forum/jsp/login.jsp" class="buttonlogin">登录</a> <a
			href="/Forum/jsp/register.jsp" class="buttonregister">注册</a>
		<%
			} else {%>
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
	<div class="secondframe">
		<a href="/" target="_blank">论坛</a> <span>></span> <a href="food.jsp"
			target="_blank">食物</a> <span>></span> <a href="restaurant.jsp"
			target="_blank">餐馆</a>
	</div>
	<div class="thirdframe">
		<h3>
			帖子标题:???????????&nbsp;&nbsp;&nbsp; <span> [问题点数：???分] </span>
		</h3>
	</div>
	<div class="thirdframe">
		<a href="" class="store">收藏帖子</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
			href="#replytext" class="reply">回复</a>
	</div>
	<div class="onetable">
		<dl class="replydl">
			<dt class="replydt">
				????????/?????yuhguygbu
            </dt>
			<dd class="replydd">jhvjhgbjb </dd>
		</dl>
		<dl class="replydl">
			<dt class="replydt">
				????????/?????yuhguygbu
            </dt>
			<dd class="replydd">jhvjhgbjb </dd>
		</dl>
		<dl class="replydl">
			<dt class="replydt">
				????????/?????yuhguygbu
            </dt>
			<dd class="replydd">jhvjhgbjb </dd>
		</dl>
		<dl class="replydl">
			<dt class="replydt">
				????????/?????yuhguygbu
            </dt>
			<dd class="replydd">jhvjhgbjb </dd>
		</dl>
	</div>
<form name="reply" action="" method="post" enctype="multipart/form-data" class="publishreply">
<center>
<textarea id="replytext" cols="104" rows="10" placeholder="please input the content about your question.">
</textarea><br><br>
</center>
<input type="submit" value="提交回复" class="replybutton">
</form>
</body>
</html>