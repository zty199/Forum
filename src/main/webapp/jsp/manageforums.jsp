<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.forum.dao.ForumDao,com.forum.entity.User,com.forum.entity.Forum"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User usr = new User();
usr = (User)request.getSession().getAttribute("usr");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>板块管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	
	<link rel="stylesheet" type="text/css" href="/Forum/css/layui.css" media="all">

  </head>
  <jsp:include page="isAdmin.jsp"></jsp:include>
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
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; text-align: center;">
      <legend>版块列表</legend>
    </fieldset>
	<br>
    <div class="layui-form">
      <table class="layui-table" lay-size="lg"  style="text-align: center; vertical-align: middle;">
        <colgroup>
          <col width="300">
          <col width="200">
          <col width="200">
          <col width="300">
          <col width="300">
        </colgroup>
        <thead>
          <tr>
            <th>版块ID</th>
            <th>版块标题</th>
            <th>版块信息</th>
            <th>版块类型</th>
            <th>操作选项</th>
          </tr> 
        </thead>
        <tbody>
        <%
          int per = 4, total = 1, current = 1;
          if(request.getParameter("per") != null)
              per = Integer.valueOf(request.getParameter("per"));
          if(per <= 0) per = 1;
          if(request.getParameter("total") != null)
              total = Integer.valueOf(request.getParameter("total"));
          if(request.getParameter("current") != null)
              current = Integer.valueOf(request.getParameter("current"));
          if(current <= 0) current = 1;
          else if(current > total) current = total;
          ForumDao dao = new ForumDao();
          List<Forum> list = dao.getAllForum();
          total = list.size() / per;
          if(list.size() % per != 0)
              total += 1;
          int i;
          for(i = (current - 1) * per; i < (current * per >= list.size() ? list.size() : current * per); i++) {
        	  Forum forum = list.get(i);
        %>
          <tr>
            <td><%=forum.getId()%></td>
            <td><%=forum.getTitle()%></td>
            <td><%=forum.getInfo()%></td>
            <td>
            <%
                if(forum.getType()) {
            %>
                    大版块
            <%
                } else {
            %>
                    小版块 
            <%
                }
            %>
            </td>
            <td>
              <button type="button" class="layui-btn layui-btn-lg" onclick="window.location.href='/Forum/jsp/modifyforum.jsp?fid=<%=forum.getId()%>';"><i class="layui-icon layui-icon-edit"></i>编辑</button>
            </td>
          </tr>
        <%
          }
        %>
        </tbody>
        <tr>
          <td>
            <form name="form1" action="jsp/manageforums.jsp?total=<%=total%>" method="post">
              每页显示<input type="text" name="per" size="5" value="<%=per%>"/>条<button type="submit" class="layui-btn layui-btn-sm">确定</button>
            </form>
          </td>
          <td colspan="2"><form name="form2" action="jsp/manageforums.jsp?per=<%=per%>&total=<%=total%>" method="post">第<input type="text" name="current" size="5" value="<%=current%>"/>页，共<%=total%>页<button type="submit" class="layui-btn layui-btn-sm">跳转</button></form></td>
          <td colspan="2">
            <button type="button" class="layui-btn layui-btn-sm" onclick="window.location.href='/Forum/jsp/manageforums.jsp?per=<%=per%>&total=<%=total%>&current=<%=current-1%>';"><i class="layui-icon layui-icon-prev"></i>上一页</button>
            <button type="button" class="layui-btn layui-btn-sm" onclick="window.location.href='/Forum/jsp/manageforums.jsp?per=<%=per%>&total=<%=total%>&current=<%=current+1%>';"><i class="layui-icon layui-icon-next"></i>下一页</button>
            <button type="button" class="layui-btn layui-btn-sm" onclick="window.location.href='/Forum/jsp/addforum.jsp';"><i class="layui-icon layui-icon-add-1"></i>新建版块</button>
            <button type="button" class="layui-btn layui-btn-sm" onclick="window.location.href='/Forum/jsp/administrator.jsp';"><i class="layui-icon layui-icon-return"></i>返回</button>
          </td>
        </tr>
      </table>
    </div>
    <br><br><br>
    <script src="/Forum/js/layui.all.js" charset="utf-8"></script>
    
  </body>
</html>
