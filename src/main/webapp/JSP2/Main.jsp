<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<center>
    <!-- ��ü ���̾ƿ��� ���� ���̺� -->
    <table border="1" width="800">
        <!-- ��� ���� -->
        <tr height="150">
            <td align="center" colspan="2">
                <!-- Top.jsp ������ �����ϰ� Top.jsp�� "id" �Ķ���͸� "aaa"�� ���� -->
                <jsp:include page="Top.jsp">
                    <jsp:param value="aaa" name="id" />
                </jsp:include>
            </td>
        </tr>

        <!-- �߾� ���� (���� �޴� + ���� ������) -->
        <tr height="400">
            <!-- ���� �޴� ���� -->
            <td align="center" width="200">
                <!-- Left.jsp ������ ���� -->
                <jsp:include page="Left.jsp"/>
            </td>
            <!-- ���� ������ ���� -->
            <td align="center" width="600">
                <!-- Center.jsp ������ ���� -->
                <jsp:include page="Center.jsp" />
            </td>
        </tr>

        <!-- �ϴ� ���� -->
        <tr height="100">
            <td align="center" colspan="2">
                <!-- Buttom.jsp ������ ���� (��Ÿ ����: Bottom�� �ƴ�) -->
                <jsp:include page="Buttom.jsp" />
            </td>
        </tr>
    </table>
</center>

</body>
</html>
