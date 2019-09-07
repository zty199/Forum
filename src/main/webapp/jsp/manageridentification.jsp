<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员身份认证</title>
</head>
<body>
<center>
    <form action="servlet/Login" method="post">
      <table>
        <caption>管理员身份验证</caption>
        <tr><td>编号:</td><td><input type="text" name="number" size="20"/></td></tr>
        <tr><td>密码:</td><td><input type="password" name="password" size="20"/></td></tr>
        <tr>
          <td colspan="2">
            <center>
              <input type="submit" value="验证"/>
              <input type="button" value="返回首页" onclick="window.location.href='/Forum/jsp/index.jsp';" >
            </center>
          </td>
        </tr>
      </table>
    </form>
    </center>
</body>
</html>