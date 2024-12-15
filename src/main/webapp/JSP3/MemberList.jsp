<%@ page import="bean.MemberDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="bean.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-15
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <%--1.데이터베이스에서 모든 회원들의 정보를 가져온다.
            MemberList.jsp는 모든 회원들에 대한 정보를 가져와서 출력하는 전용 페이지이다.
            회원들의 정보가 얼마나 들어가 있는지 모르기 때문에 가변길이인 vector를 이용하여 데이터를 저장해줌.
        --%>
        <%
            MemberDAO mdao = new MemberDAO();
            //회원들의 정보가 얼마나 들어가 있는지 모르기 때문에 가변길이인 vector를 이용하여 데이터를 저장해줌.
            Vector<MemberBean> vec = mdao.allSelectMember();

        %>

        <%--2.테이블 태그를 이용하여 회원들의 정보를 출력한다.--%>
<center>
        <h2>모든 회원 정보 보기</h2>
        <table width="800" border="1">
            <tr height="50">
                <td align="center" width="150">아이디</td>
                <td align="center" width="250">이메일</td>
                <td align="center" width="200">전화번호</td>
                <td align="center" width="200">관심 분야</td>
            </tr>

            <%
                for(int i=0; i< vec.size(); i++){
                    MemberBean bean = vec.get(i);
            %>

            <tr height="50">
                <td align="center" width="150">
                    <a href="MemberInfo.jsp?id=<%=bean.getId()%>">
                            <%=bean.getId()%>
                    </a>
                </td>

                <td align="center" width="250"><%=bean.getEmail()%></td>
                <td align="center" width="200"> <%=bean.getTel()%></td>
                <td align="center" width="200"> <%=bean.getHobby()%> </td>
            </tr>
            <%
                }
            %>

    </table>
</center>

<%--
    3. 이 JSP 페이지의 주요 기능:
       - MemberDAO를 사용하여 데이터베이스에서 모든 회원 정보를 가져옴
       - Vector<MemberBean>을 사용하여 회원 정보를 저장
       - HTML 테이블을 사용하여 회원 정보를 표시
       - 각 회원의 아이디, 이메일, 전화번호, 관심 분야를 출력

    4. 코드 구조:
       - MemberDAO 객체 생성
       - allSelectMember() 메소드를 호출하여 모든 회원 정보 조회
       - HTML 테이블 헤더 생성
       - for 루프를 사용하여 Vector의 각 MemberBean 객체에서 정보를 추출하고 표시

    5. 보안 고려사항:
       - 민감한 정보 (예: 비밀번호)는 표시되지 않도록 주의해야 함

--%>

</body>
</html>
