<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <a href="/Forum/jsp/test2.jsp?name=<%=URLEncoder.encode("张天怿","utf-8")%>">aaaaaa</a>
</body>
</html>