<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>
<center>
	<h2>회원 정보 보기</h2>
	<%
		// 요청으로 전달된 데이터의 인코딩을 UTF-8로 설정
		request.setCharacterEncoding("UTF-8");

		// 'hobby' 파라미터의 모든 값을 배열로 받아옴 (다중 선택 가능한 경우이기 때문.)
		String [] hobby = request.getParameterValues("hobby");
		// 배열의 내용을 하나의 문자열로 합치기 위한 변수 초기화
		String texthobby ="";

		// 배열의 모든 요소를 순회하며 하나의 문자열로 합침
		for(int i =0; i < hobby.length; i++) {
			texthobby += hobby[i] + " ";
		}
	%>

	<!-- MemberBean 객체 생성 및 요청 파라미터 매핑 -->
	<jsp:useBean id="mbean" class="bean.MemberBean">
		<!-- 모든 요청 파라미터를 MemberBean 객체의 속성에 자동 매핑 -->
		<jsp:setProperty  name="mbean" property="*"/>
	</jsp:useBean>

	<%
		// 위에서 생성한 문자열로 hobby 속성 설정
		mbean.setHobby(texthobby);
	%>
	<h2>당신의 관심분야 <%=mbean.getHobby()%></h2>

	<!-- MemberBean 객체에서 ID와 취미 정보를 가져와 출력 -->
	<h2>당신의 ID는  <%=mbean.getId()%></h2>
	<h2>당신의 관심분야 <%=mbean.getHobby()%></h2>
</center>

</body>
</html>
