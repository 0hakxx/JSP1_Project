<%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-16
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    session.setAttribute("id", id);
    session.setAttribute("pass", pass);
    //세션 유지시간 설정
    session.setMaxInactiveInterval(60); //1분간 아이디 유지
    response.sendRedirect("Main.jsp");
  %>
  
  </body>
</html>
