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

		// 'hobby' �Ķ������ ��� ���� �迭�� �޾ƿ� (���� ���� ������ ����̱� ����.)
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
		mbean.setHobby(texthobby);
	%>
	<h2>����� ���ɺо� <%=mbean.getHobby()%></h2>

	<!-- MemberBean ��ü���� ID�� ��� ������ ������ ��� -->
	<h2>����� ID��  <%=mbean.getId()%></h2>
	<h2>����� ���ɺо� <%=mbean.getHobby()%></h2>
</center>

</body>
</html>
