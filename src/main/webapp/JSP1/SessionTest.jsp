<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>세션 연습</title>
</head>
<body>
<h2>세션 연습</h2>
<%
  // 세션에 저장할 데이터 정의
  String name = "shin";

  // 세션에 "name1"이라는 키로 name(shin) 값을 저장
  session.setAttribute("name1", name);

  // 세션 유효 시간을 10초로 설정 -> 10초 뒤 새로 고침 시 shin이 null로 변경
  session.setMaxInactiveInterval(10);

%>

<!--
    SessionName.jsp 페이지로 이동하는 링크 생성
    GET 방식(URL 파라미터)으로 name 값을 전달 (세션과 별개로 데이터 전달)
-->
<a href="SessionName.jsp?name=<%= name %>">세션 네임 페이지로 이동</a>
</body>
</html>
