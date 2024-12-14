<%@ page import="java.net.ConnectException" %>
<%@ page import="java.sql.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
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
	%>

	<!-- MemberBean 객체에서 ID와 취미 정보를 가져와 출력 -->
	<h2>당신의 ID는  <%=mbean.getId()%></h2>
	<h2>당신의 관심분야 <%=mbean.getHobby()%></h2>


	<!--Oracle DB 계정 연결 정보-->
	<%
		// 데이터베이스 연결 정보 설정
		String id = "system";
		String pass = "123456";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		//JDBC 드라이버 로드
		try {
			//1.데이터베이스를 사용한다고 선언
			//이는 Oracle 데이터베이스와의 연결을 위해 필요합니다.
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//2. 데이터 베이스 접속
			// DriverManager를 사용하여 데이터베이스에 연결합니다.
			Connection con = DriverManager.getConnection(url,id,pass);

			// 쿼리 작성
			// 회원가입(회원 정보를 삽입하기 위한) SQL 쿼리문을 준비합니다.
			String Sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
			//쿼리 실행
			// PreparedStatement 객체를 생성하여 SQL 인젝션을 방지하고 쿼리 실행을 준비합니다.
			PreparedStatement pstmt = con.prepareStatement(Sql);
			//?에 맞게 쿼리문 맵핑
			// PreparedStatement의 파라미터에 MemberBean 객체의 각 필드 값을 설정합니다.
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());


			pstmt.executeUpdate(); //insert, delete, update 시 실행하는 명령어
			// executeUpdate() 메소드를 호출하여 실제로 데이터베이스에 변경사항을 적용합니다.

			//자원 반납, 데이터베이스 연결을 종료하여 리소스를 해제합니다.
			con.close();

		}catch (Exception e){
			// Oracle JDBC 드라이버를 찾을 수 없는 경우 에러 메시지를 출력합니다.
			System.err.println("Oracle JDBC를 찾을 수 없습니다.");
			e.printStackTrace();
			return;
		}
	%>

	Oracle에 성공적으로 정상적으로 inset 되었습니다!
</center>

</body>
</html>
