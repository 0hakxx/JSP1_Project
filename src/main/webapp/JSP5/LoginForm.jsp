<%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-16
  Time: 오후 3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  로그인 구현 페이지입니다.
  <form method="post" action="SessionLogin.jsp">
    <table>
      <tr height="50">
        <td height="50">로그인</td>
        <td height="50"><input type="text" name="id"></td>
      </tr>
      <tr height="50">
        <td height="50">패스워드</td>
        <td height="50"><input type="password" name="pass"></td>
      </tr>
      <tr height="50">
        <td height="50"><input type="submit" value="로그인"></td>
      </tr>
    </table>
  </form>
  
  </body>
</html>
