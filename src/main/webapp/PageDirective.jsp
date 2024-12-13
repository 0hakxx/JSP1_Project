<%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-11
  Time: 오후 5:26
  To change this template use File | Settings | File Templates.
--%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" errorPage="error.jsp" isErrorPage="true" %>
<!-- 이 JSP는, 다른 JSP에서 발생하는 예외(Exception)를 내장객체인 exception으로 받아서,
예외처리하는 역할을 수행(isErrorPage="true"인 경우)-->

<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    int sum = 10/0;

%>

</body>
</html>
