<%@ page language="java" contentType="text/html; charset=EUC-KR"
		 pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>
		<h2>�� �������� �α��� ������ �Ѿ�� ������ �Դϴ�</h2>
		<%
			// POST ������� ���۵� �ѱ� �����͸� �ùٸ��� ó���ϱ� ���� ���ڵ� ����
			request.setCharacterEncoding("EUC-KR");

			// request ��ü���� 'id' �Ķ���� ���� ������ ������ ����
			String id = request.getParameter("id");

			// ResponseRedirect.jsp �������� �����̷�Ʈ�ϸ鼭 id ���� ���� �Ķ���ͷ� �����ϴ� ���
			//response.sendRedirect("ResponseRedirect.jsp?id="+id);
		%>

		<%--
		<jsp:forward> �׼� �±׸� ����Ͽ� ResponseRedirect.jsp �������� ��û�� ����
		�� ����� ���� ���ο��� ������ ��ȯ�� �Ͼ��, URL�� ������� �ʴ´�
		<jsp:param> �±׸� ����Ͽ� �߰� �Ķ���͸� ����
		�Ʒ� ���, id�� phone �Ķ���Ͱ� �߰���
		����: �� id ���� ������ ������ id ���� ����� ��
		--%>
		<jsp:forward page = "ResponseRedirect.jsp">
			<jsp:param name="id" value="mmmm"/>
			<jsp:param name="phone" value="1234"/>
		</jsp:forward>


</body>
</html>
