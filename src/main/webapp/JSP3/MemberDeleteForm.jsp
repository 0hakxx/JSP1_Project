<%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-15
  Time: 오후 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<center>
    <h2> 회원 삭제하는 페이지입니다. </h2>
    <table width="400" border="1">
        <form action="MemberDeleteProc.jsp" method="post">
            <tr height="50">
                <td align="center" width="50">아이디</td>
                <td align="center" width="250"><%=request.getParameter("id")%> </td>
            </tr>


            <tr height="50">
                <td align="center" width="150">패스워드</td>
                <td align="center" width="250"><input type="password" name="pass1"></td>
            </tr>



            <tr height="50">
                <td align="center" colspan="2">
                    <!-- hidden 필드를 사용하여 사용자에게는 보여줄 필요가 없지만
                    서버로 전송해야 하는 id 값을 안전하게 전달하기 위해서 -->
                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                    <input type="submit" value="회원 삭제하기">&nbsp;&nbsp;
        </form>
        <button onclick="location.href='MemberList.jsp'">회원 전체 보기</button>
        </td>
        </tr>
    </table>
</center>
</body>
</html>
