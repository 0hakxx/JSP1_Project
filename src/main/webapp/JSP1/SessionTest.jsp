<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>���� ����</title>
</head>
<body>
<h2>���� ����</h2>
<%
  // ���ǿ� ������ ������ ����
  String name = "shin";

  // ���ǿ� "name1"�̶�� Ű�� name(shin) ���� ����
  session.setAttribute("name1", name);

  // ���� ��ȿ �ð��� 10�ʷ� ���� -> 10�� �� ���� ��ħ �� shin�� null�� ����
  session.setMaxInactiveInterval(10);

%>

<!--
    SessionName.jsp �������� �̵��ϴ� ��ũ ����
    GET ���(URL �Ķ����)���� name ���� ���� (���ǰ� ������ ������ ����)
-->
<a href="SessionName.jsp?name=<%= name %>">���� ���� �������� �̵�</a>
</body>
</html>
