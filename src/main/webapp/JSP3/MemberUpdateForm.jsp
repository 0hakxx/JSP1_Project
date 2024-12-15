<%@ page import="bean.MemberBean" %>
<%@ page import="java.lang.reflect.Member" %>
<%@ page import="bean.MemberDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-15
  Time: 오후 4:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--1.MemberList.jsp에서 넘겨준  파라미터 값을 받아온다.--%>
<%--2.데이터베이스에서 한 회원의 정보를 가져옴.--%>
<%
    String id = request.getParameter("id");
    MemberDAO mdao = new MemberDAO();
    MemberBean mbean = mdao.oneSelectMember(id); //해당하는 id 의 회원정보를 리턴받는다.

%>

<%--3.table 태그를 사용하여 화면에 회원의 정보를 출력한다.--%>
<center>
    <h2> 회원 정보 수정하는 페이지입니다. </h2>
    <table width="400" border="1">
    <form action="MemberUpdateFormProc.jsp" method="post">
        <tr height="50">
            <td align="center" width="50">아이디</td>
            <td align="center" width="250"><%=mbean.getId()%></td>
        </tr>

        <tr height="50">
            <td align="center" width="150">이메일</td>
            <td align="center" width="250"><input type="text" name="email" value="<%=mbean.getEmail()%>"></td>
        </tr>

        <tr height="50">
            <td align="center" width="150">전화번호</td>
            <td align="center" width="250"><input type="tel" name="tel" value="<%=mbean.getTel()%>"></td>
        </tr>

        <tr height="50">
            <td align="center" width="150">패스워드</td>
            <td align="center" width="250"><input type="password" name="pass1"></td>
        </tr>



        <tr height="50">
            <td align="center" colspan="2">
                <!-- hidden 필드를 사용하여 사용자에게는 보여줄 필요가 없지만
                서버로 전송해야 하는 id 값을 안전하게 전달하기 위해서 -->
                <input type="hidden" valye="id" value="<%=mbean.getId()%>">
                <input type="submit" value="회원 수정하기">&nbsp;&nbsp;
    </form>
                <button onclick="location.href='MemberList.jsp'">회원 전체 보기</button>
            </td>
        </tr>
    </table>
</center>


</body>
</html>
