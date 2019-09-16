<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.forum.entity.User"%>
<%
User user = null;
user = (User)session.getAttribute("usr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="NewFile1.css" />
<link rel="stylesheet" type="text/css" href="NewFile.css" />
<link rel="stylesheet" type="text/css" href="NewFile2.css" />
<link rel="stylesheet" type="text/css" href="NewFile3.css" />
<title>Insert title here</title>
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
		</span> <a href="/Forum/jsp/writetiezi.jsp" class="write">我要发帖</a>
		<%
			if (user == null) {
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
					<a href="/Forum/jsp/personal.jsp?uname=<%=user.getUsername()%>">普通用户</a>
				</dl>
				<dl>
				<%
				    if (user.getAdmin()) {
				%>
					<a href="/Forum/jsp/manager.jsp">管理员</a>
				<%
				    }
				%>
				</dl>
			</div>
		</span>
		<%
			}
		%>
	</div><br><br>
 <div class="sectionframefirst">
 fgbgfbf
 </div>
  <div class="sectionframesecond">
 fgbgfbf
 </div>
  <div class="sectionframethird">
 fgbgfbf
 </div>
 <div class="sectionframeforth">
        <div class="sectiontopic">
          <span class="sectiontopic0">赏分</span>
          <span class="sectiontopic1">主题标题</span>
          <span class="sectiontopic2">作者</span>
          <span class="sectiontopic3">回复/查看</span>
          <span class="sectiontopic4">最后发表</span>
          <span class="sectiontopic5">管理</span>
        </div>
            <ol class="sectiontopiclist">
                  <li class="sectiontopicli">
                    <label class="sectionscore">150</label>
                    <label class="sectiontheme">
                      <a href="/Forum/jsp/noshery.jsp" class="sectionclassify" target="_blank">小吃街</a>
                      <em class="sectionclassify_dot">・</em>
                      <a href="/Forum/servlet/DisplayThread?number=1" class="sectiontopic_title" target="_blank" title="有关特色小吃的问题求助">值得一尝的特色小吃</a>
                    </label>
                    <a href="" class="sectionwriter"  rel="nofollow" target="_blank" title="love_yzm">love_yzm</a>
                    <span class="sectionreply_num">17</span>
                    <span class="sectionview">141</span>
                  </li>
           
                  <li class="sectiontopicli">
                  <label class="sectionscore">150</label>
                    <label class="sectiontheme">
                      <a href="/forums/VBDotNET" class="sectionclassify" target="_blank">餐馆</a>
                      <em class="sectionclassify_dot">・</em>
                      <a href="/Forum/jsp/replytiezi.jsp" class="sectiontopic_title" target="_blank" title="有关地道餐馆的问题求助">走过，路过，但不能错过的地道餐馆</a>
                    </label>
                    <a href="" class="sectionwriter" rel="nofollow" target="_blank" title="New佳佳">New佳佳</a>
                    <span class="sectionreply_num">33</span>
                    <span class="sectionview">884</span>
                  </li>
                  
                  <li class="sectiontopicli">
                  <label class="sectionscore">150</label>
                    <label class="sectiontheme">
                      <a href="/forums/ASPDotNET" class="sectionclassify" target="_blank">酒店</a>
                      <em class="sectionclassify_dot">・</em>
                      <a href="/Forum/jsp/replytiezi.jsp" class="sectiontopic_title" target="_blank" title="有关酒店问题求助">要说哪家酒店的毛巾最干净，安保系数最高，当属洒家推荐的了</a>
                    </label>
                    <a href="" class="sectionwriter" rel="nofollow" target="_blank" title="吃瓜日常">吃瓜日常</a>
                    <span class="sectionreply_num">36</span>
                    <span class="sectionview">1127</span>
                  </li>                            
            </ol>
      </div>
       <br> <br> <br> <br> <br><br>
</body>
</html>