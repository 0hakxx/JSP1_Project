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
				request.setCharacterEncoding("EUC-KR");
			%>

			<!-- request로 넘어온 데이터를 자바 빈즈랑 맵핑 시켜주는 useBean-->
			<!-- jsp 내용을 자바빈 클래스(MemberBean의미)에 데이터를 맵핑(넣어줌) -->
			<jsp:useBean id="mbean" class="bean.MemberBean"><!-- 객체 생성 MemberBeab mbean = new MemberBean()과 같은 의미이다.-->
			<!-- setProperty 액션 태그로 폼에서 넘어온 모든 파라미터를 bean 객체의 속성에 자동 매핑 -->
			<!-- property="*"는 모든 프로퍼티를 한번에 설정한다는 의미, 파라미터를 모두 java 클래스 객체 변수에 저장함.-->
				<jsp:setProperty  name="mbean" property="*"/>
			</jsp:useBean>

			<h2>당신의 아이디는 <jsp:getProperty property = "id" name="mbean" /></h2>
			<h2>당신의 패스<jsp:getProperty property = "pass1" name="mbean" /></h2>
			<h2>당신의 이메일 <jsp:getProperty property = "email" name="mbean" /></h2>
			<h2>당신의 이메일 <%=mbean.getTel()%></h2>
		</center>



</body>
</html>