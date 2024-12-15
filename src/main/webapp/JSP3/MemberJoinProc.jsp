<%@ page import="java.net.ConnectException" %>

<%@ page import="java.sql.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="bean.MemberDAO" %>
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

		// 'hobby' 파라미터의 모든 값을 배열로 받아옴 (관심 분야는 다중 선택 가능하기 때문)
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
		// 이는 다중 선택된 취미를 하나의 문자열로 MemberBean에 저장하기 위함입니다.
		mbean.setHobby(texthobby);

		//데이터베이스 클래스 객체 생성
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean);

	%>


	Oracle에 성공적으로 정상적으로 inset 되었습니다!
</center>

</body>
</html>
