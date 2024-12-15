<%@ page import="bean.MemberBean" %>
<%@ page import="java.lang.reflect.Member" %>
<%@ page import="bean.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-15
  Time: 오후 4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상세 회원 정보 확인 페이지</title>
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
  <h2> 한 회원 정보 보기 </h2>
  <table width="400" border="1">
    <tr height="50">
      <td align="center" width="50">아이디</td>
      <td align="center" width="250"><%=mbean.getId()%></td>
    </tr>

    <tr height="50">
      <td align="center" width="150">이메일</td>
      <td align="center" width="250"><%=mbean.getEmail()%></td>
    </tr>

    <tr height="50">
      <td align="center" width="150">전화번호</td>
      <td align="center" width="250"><%=mbean.getTel()%></td>
    </tr>

    <tr height="50">
      <td align="center" width="150">관심 분야</td>
      <td align="center" width="250"><%=mbean.getHobby()%></td>
    </tr>

    <tr height="50">
      <td align="center" width="150">직업</td>
      <td align="center" width="250"><%=mbean.getJob()%></td>
    </tr>

    <tr height="50">
      <td align="center" width="150">나이</td>
      <td align="center" width="250"><%=mbean.getAge()%></td>
    </tr>

    <tr height="50">
      <td align="center" width="150">정보</td>
      <td align="center" width="250"><%=mbean.getInfo()%></td>
    </tr>


    <tr height="50">
      <td align="center" colspan="2">
        <button onclick="location.href='MemberUpdateForm.jsp?id=<%=mbean.getId()%>'">회원수정</button>
        <button onclick="location.href='MemberDeleteForm.jsp?id=<%=mbean.getId()%>'">회원삭제</button>
        <button onclick="location.href='MemberList.jsp'">목록보기</button>
        <button onclick="location.href='MemberJoin.jsp'">회원가입</button>
      </td>
    </tr>

  </table>
</center>

</body>
</html>
