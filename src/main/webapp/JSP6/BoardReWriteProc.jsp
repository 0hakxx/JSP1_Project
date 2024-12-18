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
    //이 페이지에서는 받은 파라미터들을 가지고,,DB에 답글을 저장시켜야 하고 게시글보기(BoardList.jsp)로 리다이렉트해야한다.
    request.setCharacterEncoding("UTF-8");
%>


<%--BoardReWriteForm.jsp로부터 hidden 필드로 받은 데이터들을 저장을 하지 않고 바로 Bean 객체에 맵핑--%>
<%--int ref = Integer.parseInt(request.getParameter("ref").trim());--%>
<%--int restep = Integer.parseInt(request.getParameter("re_step").trim());--%>
<%--int level = Integer.parseInt(request.getParameter("re_level").trim());--%>

    <jsp:useBean id="boardbean" class="bean.boardBean">
        <jsp:setProperty name="boardbean" property="*"/>
    </jsp:useBean>


<%
    //데이터베이스 객체 생성
    boardDAO bdao = new boardDAO();


    //위에서 맵핑된 bardbean 객체를 DAO의 댓글을 DB에 저장하는 메서드 호출
    bdao.reWriteBoard(boardbean);

    response.sendRedirect("BoardList.jsp");

%>




</body>
</html>
