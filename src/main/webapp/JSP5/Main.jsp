<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<table border="1">
    <%
        // 응답의 문자 인코딩을 UTF-8로 설정합니다.
        response.setCharacterEncoding("UTF-8");

        // URL 파라미터에서 'center'와 'logout' 값을 가져옵니다.
        String center = request.getParameter("center");
        String logout = request.getParameter("logout");

        // 로그아웃 처리
        if(logout != null){
            // 세션의 'id' 속성을 null로 설정하여 로그아웃 처리합니다.
            session.setAttribute("id", null);
            // 세션의 최대 비활성 시간을 0으로 설정하여 즉시 만료시킵니다.
            session.setMaxInactiveInterval(0);
        }

        // 기본 center 페이지 설정
        if(center == null){
            // 'center' 파라미터가 없으면 기본값으로 "Center.jsp"를 사용합니다.
            center = "Center.jsp";
        }
    %>
    <!-- 상단 영역 -->
    <tr height="50">
        <td width="300" align="right">
            <!-- Top.jsp 페이지를 포함합니다. 이 페이지는 로그인/로그아웃 버튼을 표시합니다. -->
            <jsp:include page="Top.jsp"/>
        </td>
    </tr>
    <!-- 중앙 콘텐츠 영역 -->
    <tr height="300">
        <td width="300" align="center">
            <!-- 동적으로 결정된 center 페이지를 포함합니다. -->
            <jsp:include page="<%=center %>"/>
        </td>
    </tr>
</table>
</body>
</html>
