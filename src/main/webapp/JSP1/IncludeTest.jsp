<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<center>
    <!-- ��ü ���̾ƿ��� ���� ���̺� ���� -->
    <table width = "600" border = "1">
        <!-- Top ���� -->
        <tr height="150" align="center">
            <td>
                <!-- Top.jsp ������ ���� -->
                <%@include file="Top.jsp" %>
            </td>
        </tr>

        <!-- Center ���� - ���� ������ -->
        <tr height="400">
            <td width = "600" align="center">
                <!-- �߾ӿ� �̹��� ǥ�� -->
                <img alt ="" src = "../images/1.jpg" width="400" height="300">
            </td>
        </tr>

        <!-- Bottom ���� -->
        <tr height="100">
            <td width = "600" align="center">
                <!-- Buttom.jsp ������ ���� -->
                <%@include file="Buttom.jsp" %>
            </td>
        </tr>
    </table>
    <!-- ��ü ���̾ƿ��� ���� ���̺� �� -->
</center>
</body>
</html>
