<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <h2>구구단 출력 페이지입니다.</h2>
</head>
<body>
<%
    for(int i=1; i<10; i++)
    {
        for(int j=1; j<10; j++)
        {
%>
            <%= i + "*" + j + "=" + j*j %><br>
<%
        }
    }
%>



<% int a = 1;%> //a 변수는  public void _jspService() 메서드 내에 생성 => 지역변수
<%! int a = 1;%>//a 변수는  멤버 변수

</body>
</html>