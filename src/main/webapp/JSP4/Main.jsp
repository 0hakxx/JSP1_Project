<%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-16
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>로그인 페이지입니다!</h2>

<form action="CookieBtn.jsp" method="post">
  <table border="1">
    <tr height="50">
      <td height="80" align="center">아이디</td>
      <td><input type="text" name="id"/></td>
    </tr>

    <tr height="50">
      <td height="80" align="center">비밀번호</td>
      <td><input type="password" name="pass"/></td>
    </tr>

    <tr>
      <td height="50" colspan="2" align="center">아이디 저장<input type="checkbox" name="checkbox"></td>
    </tr>
    <tr>
      <td height="50" colspan="2" align="center"> <input type="submit" value="로그인"></td>
    </tr>
  </table>


</form>


</body>
</html>
