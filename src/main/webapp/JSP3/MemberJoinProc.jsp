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

		//�����ͺ��̽� Ŭ���� ��ü ����
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean);

	%>


	Oracle�� ���������� ���������� inset �Ǿ����ϴ�!
</center>

</body>
</html>
