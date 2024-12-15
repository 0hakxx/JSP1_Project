<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>

<%
    // 세션에서 사용자 아이디를 가져옵니다.
    String id = (String)session.getAttribute("id");

    // 요청 파라미터에서 center 값을 가져옵니다.
    String center = request.getParameter("center");
%>

<%
        // 사용자가 로그인한 경우 (id가 null이 아님)
        if(id != null){
        %>
          <!-- 로그인한 사용자에게 인사 메시지를 표시합니다. -->
          <%=id %> 님
          <!-- 로그아웃 버튼을 생성합니다. 클릭 시 Main.jsp로 이동하며 로그아웃 처리 요청을 보냅니다. -->
          <button onclick="location.href='Main.jsp?logout=1'">로그아웃</button>
        <%

        }  // 사용자가 로그인하지 않은 경우 (center 값이 null인 경우)
        else if(center == null){
          // center에 값이 존재하는 경우에만 로그인 버튼을 띄움.
          // center가 null인 경우에는 아직 로그인하지 않은 상태로 간주합니다.
        %>
        <!-- 로그인 버튼을 생성합니다. 클릭 시 Main.jsp로 이동하며 LoginForm.jsp를 표시하도록 요청합니다. -->
        <button onclick="location.href='Main.jsp?center=LoginForm.jsp'">로그인</button>
        <%

        }
        else { // 이 else 블록은 현재 사용되지 않지만, 향후 추가적인 처리를 위해 남겨둘 수 있습니다.
        %>
<%
  }
%>

</body>
</html>
