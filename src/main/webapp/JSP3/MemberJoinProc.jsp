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
	<h2>ȸ�� ���� ����</h2>
	<%
		// ��û���� ���޵� �������� ���ڵ��� UTF-8�� ����
		request.setCharacterEncoding("UTF-8");

		// 'hobby' �Ķ������ ��� ���� �迭�� �޾ƿ� (���� �оߴ� ���� ���� �����ϱ� ����)
		String [] hobby = request.getParameterValues("hobby");
		// �迭�� ������ �ϳ��� ���ڿ��� ��ġ�� ���� ���� �ʱ�ȭ
		String texthobby ="";

		// �迭�� ��� ��Ҹ� ��ȸ�ϸ� �ϳ��� ���ڿ��� ��ħ
		for(int i =0; i < hobby.length; i++) {
			texthobby += hobby[i] + " ";
		}
	%>

	<!-- MemberBean ��ü ���� �� ��û �Ķ���� ���� -->
	<jsp:useBean id="mbean" class="bean.MemberBean">
		<!-- ��� ��û �Ķ���͸� MemberBean ��ü�� �Ӽ��� �ڵ� ���� -->
		<jsp:setProperty  name="mbean" property="*"/>
	</jsp:useBean>

	<%
		// ������ ������ ���ڿ��� hobby �Ӽ� ����
		// �̴� ���� ���õ� ��̸� �ϳ��� ���ڿ��� MemberBean�� �����ϱ� �����Դϴ�.
		mbean.setHobby(texthobby);
	%>

	<!-- MemberBean ��ü���� ID�� ��� ������ ������ ��� -->
	<h2>����� ID��  <%=mbean.getId()%></h2>
	<h2>����� ���ɺо� <%=mbean.getHobby()%></h2>


	<!--Oracle DB ���� ���� ����-->
	<%
		// �����ͺ��̽� ���� ���� ����
		String id = "system";
		String pass = "123456";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		//JDBC ����̹� �ε�
		try {
			//1.�����ͺ��̽��� ����Ѵٰ� ����
			//�̴� Oracle �����ͺ��̽����� ������ ���� �ʿ��մϴ�.
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//2. ������ ���̽� ����
			// DriverManager�� ����Ͽ� �����ͺ��̽��� �����մϴ�.
			Connection con = DriverManager.getConnection(url,id,pass);

			// ���� �ۼ�
			// ȸ������(ȸ�� ������ �����ϱ� ����) SQL �������� �غ��մϴ�.
			String Sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
			//���� ����
			// PreparedStatement ��ü�� �����Ͽ� SQL �������� �����ϰ� ���� ������ �غ��մϴ�.
			PreparedStatement pstmt = con.prepareStatement(Sql);
			//?�� �°� ������ ����
			// PreparedStatement�� �Ķ���Ϳ� MemberBean ��ü�� �� �ʵ� ���� �����մϴ�.
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());


			pstmt.executeUpdate(); //insert, delete, update �� �����ϴ� ��ɾ�
			// executeUpdate() �޼ҵ带 ȣ���Ͽ� ������ �����ͺ��̽��� ��������� �����մϴ�.

			//�ڿ� �ݳ�, �����ͺ��̽� ������ �����Ͽ� ���ҽ��� �����մϴ�.
			con.close();

		}catch (Exception e){
			// Oracle JDBC ����̹��� ã�� �� ���� ��� ���� �޽����� ����մϴ�.
			System.err.println("Oracle JDBC�� ã�� �� �����ϴ�.");
			e.printStackTrace();
			return;
		}
	%>

	Oracle�� ���������� ���������� inset �Ǿ����ϴ�!
</center>

</body>
</html>
