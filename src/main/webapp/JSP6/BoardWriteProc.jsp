<%@ page import="bean.boardDAO" %><%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-16
  Time: 오후 4:40
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
%>

<%--작성한 게시글을 한 번에 읽는다.--%>

<jsp:useBean id="boardbean" class="bean.boardBean">
<%--BoardWriteForm.jsp에서 보내는 파라미터들을 1:1로 매핑시키는데 안 보내는 파라미터는 자동으로 Null로 매핑--%>
    <jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>

<%--데이터베이스쪽으로 1:1 매핑된 Bean 객체를 넘겨주어 처리한다. 이때 DAO(Coonection Pool)을 사용한다--%>
<%
    //DAO(Connection Pool) 객체 생성
    boardDAO bdao = new boardDAO();
    //데이터베이스 저장 메서드 호출하는데 bean 객체를 넣어준다.
    bdao.insertBoard(boardbean);

%>
</body>
</html>



