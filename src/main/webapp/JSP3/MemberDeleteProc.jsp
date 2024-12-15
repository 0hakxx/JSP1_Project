<%@ page import="bean.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-15
  Time: 오후 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
    <%
        request.setCharacterEncoding("euc-kr");
    %>

    <%-- MemberBean 객체 생성 및 폼 데이터 자동 매핑 --%>
    <jsp:useBean id="mbean" class="bean.MemberBean">
        <jsp:setProperty name="mbean" property="*"/>
    </jsp:useBean>

    <%
        String id = request.getParameter("id");

        MemberDAO mdao = new MemberDAO();

        String pass = mdao.getPass(mbean.getId()); //데이터베이스에 가져온 패스워드 저장.

        //비밀번호 인증 틀렸으면 패스워드 수정이 안 되게끔 만들기 위한 코드
        if(mbean.getPass1().equals(pass)){//기존 DB 패스워드와의 인증이 성공하면 MEMBER 테이블 수정
            mdao.deleteMember(mbean.getId());
            response.sendRedirect("MemberList.jsp");
        }
        else
        {
    %>
<%-- 패스워드 불일치 시 경고 메시지 출력 및 이전 페이지로 이동 --%>
<script type="text/javascript">
    alert("패스워드가 틀렸습니다. 다시 한 번 확인해주세요.");
    history.go(-1);
</script>
<%
        //디버깅코드 -  실제 DB값과 사용자로붜 받은 PASS를 출력
        System.out.println("DB에 저장된 Password: " + pass);
        System.out.println("Input Password: " + mbean.getPass1());
    }
%>

</body>
</html>
