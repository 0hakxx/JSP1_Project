<%@ page language="java" contentType="text/html; charset=EUC-KR"
		 pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>
		<h2>이 페이지는 로그인 정보가 넘어가는 페이지 입니다</h2>
		<%
			// POST 방식으로 전송된 한글 데이터를 올바르게 처리하기 위한 인코딩 설정
			request.setCharacterEncoding("EUC-KR");

			// request 객체에서 'id' 파라미터 값을 가져와 변수에 저장
			String id = request.getParameter("id");

			// ResponseRedirect.jsp 페이지로 리다이렉트하면서 id 값을 쿼리 파라미터로 전달하는 방식
			//response.sendRedirect("ResponseRedirect.jsp?id="+id);
		%>

		<%--
		<jsp:forward> 액션 태그를 사용하여 ResponseRedirect.jsp 페이지로 요청을 전달
		이 방식은 서버 내부에서 페이지 전환이 일어나며, URL은 변경되지 않는다
		<jsp:param> 태그를 사용하여 추가 파라미터를 전달
		아래 경우, id와 phone 파라미터가 추가됨
		주의: 이 id 값은 위에서 가져온 id 값을 덮어쓰게 됨
		--%>
		<jsp:forward page = "ResponseRedirect.jsp">
			<jsp:param name="id" value="mmmm"/>
			<jsp:param name="phone" value="1234"/>
		</jsp:forward>


</body>
</html>
