<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<!--  ReqeustLogin에서 넘어온 아이디와 패스워드를 읽어들임 -->
<%
  // 사용자의 정보가 저장되어 있는 객체.
  // request의 getParameter()로 사용자의 정보를 추출
  // input의 name을 기술.

  // 사용자가 입력한 아이디를 request 객체에서 가져옴
  String id = request.getParameter("id");

  // 사용자가 입력한 패스워드를 request 객체에서 가져옴
  String pass = request.getParameter("pass");
%>

<h2>
  당신의 아이디는 <%= id %> 이고 패스워드는 <%= pass %> 입니다.
</h2>


</body>
</html>
