<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<h2>회원 정보 보기</h2>
<%
  // 사용자가 입력한 데이터의 인코딩을 UTF-8로 설정(Post 방식은 한글이 깨지는 경우가 있음)
  request.setCharacterEncoding("UTF-8");

  // 폼에서 전송된 파라미터들을 받아옴
  String id = request.getParameter("id");
  String pass1 = request.getParameter("pass1");
  String pass2 = request.getParameter("pass2");
  String email = request.getParameter("email");
  String tel = request.getParameter("tel");
  String job = request.getParameter("job");
  String age = request.getParameter("age");
  String info = request.getParameter("info");

  // 취미는 여러 개를 선택할 수 있으므로 배열로 받기 위해 getParameterValues
  String[] hobby = request.getParameterValues("hobby");



  // 비밀번호 확인: pass1과 pass2가 일치하지 않으면 경고창을 띄우고 이전 페이지로 이동
  if (!pass1.equals(pass2)) {
%>
<script type="text/javascript">
  alert("비밀번호가 틀립니다.");
  history.go(-1); //이전 페이지로 이동
</script>
<%
  }
%>

<!-- 사용자 정보를 테이블 형식으로 출력 -->
<table width="400" border="1">
  <tr height="50">
    <td width="150" align="center">아이디</td>
    <td width="350" align="center"><%= id %></td>
  </tr>

  <tr height="50">
    <td width="150" align="center">이메일</td>
    <td width="350" align="center"><%= email %></td>
  </tr>
  <tr height="50">
    <td width="150" align="center">전화번호</td>
    <td width="350" align="center"><%= tel %></td>
  </tr>
  <tr height="50">
    <td width="150" align="center">당신의 관심분야</td>
    <td width="150" align="center">
      <%
        // 선택된 취미들을 반복문을 통해 출력
        for(int i=0; i<hobby.length; i++) {
          out.write(hobby[i] + " ");
        }
      %>
    </td>
  </tr>
  <tr height="50">
    <td width="150" align="center">직업은</td>
    <td width="350" align="center"><%= job %></td>
  </tr>
  <tr height="50">
    <td width="150" align="center">연령은</td>
    <td width="350" align="center"><%= age %></td>
  </tr>
  <tr height="50">
    <td width="150" align="center">하고 싶은 말</td>
    <td width="350" align="center"><%= info %></td>
  </tr>
</table>
</body>
</html>
