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
    //BoardUpdateForm.jsp로부터 받은 입력값들을 통하여 수정 동작하게 하는 페이지이다.
    request.setCharacterEncoding("UTF-8");
%>

<%--//BoardUpdateForm.jsp로부터 모든 파라미터값을 새로운 bean 객체에 매핑--%>
<jsp:useBean id="boardbean" class="bean.boardBean">
    <jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>

<%

    //위에서 매핑하여 생성된 bean객체는 BoardUpdateForm 에서 보낸 파라미터들을 bean객체로 새로 만든 bean 객체이다.
    //기존 DAO 의 bean객체와 PASSW를 비교하기 위해 num을 이용한다.
    boardDAO bdao = new boardDAO();
    String pass = bdao.CheckPassword(boardbean.getNum()); //새로 생성된 bean객체의 num이 같은 원글의 bean 객체의 PASS를 갖고 온다.

    //BoardUpdate에서 보낸 PASSWORD와 원글 PASSWORD가 같은지 비교

    if(pass.equals(boardbean.getPassword())){

        //데이터 수정하는 메서드 호출(위에서 매핑되어 새로 생성된 bean객체를 사용)
        bdao.UpdateBoard(boardbean);

        //수정이 완료 된 후 리다이렉트
        response.sendRedirect("BoardList.jsp");

    }else{%>
        <script>alert("패스워드가 틀려 수정할 수 없습니다.")
            history.go(-1);
        </script>
    <%
    }
%>






</body>
</html>
