<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!-- JSP ������ ��Ƽ��: ������ ���� Java�̸�, ������ Ÿ���� text/html, ���ڵ��� EUC-KR�� ���� -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <!-- HTML ������ ���� ���ڵ��� EUC-KR�� ���� -->
    <title>Insert title here</title>
    <!-- �� �������� ���� ���� -->
</head>
<body>

<center>
    <!-- �������� ȭ�� �߾ӿ� ��ġ -->
    <h2>�α��� ������ </h2>
    <!-- ������ ������ ǥ�� -->
    <form action="ResponseLoginProc.jsp" method="post">
        <!-- �α��� ��: �����͸� POST ������� "ResponseLoginProc.jsp"�� ���� -->
        <table width="400" border="1">
            <!-- ���̺� ����: �ʺ� 400px, �׵θ� �β� 1px -->
            <tr height="60">
                <!-- ù ��° ��: ���� 60px -->
                <td align="center" width="150">���̵�</td>
                <!-- ù ��° ��: "���̵�" �ؽ�Ʈ�� ��� ����, �ʺ� 150px -->
                <td align="left" width="250">
                    <!-- �� ��° ��: �Է� �ʵ� ��ġ, ���� ����, �ʺ� 250px -->
                    <input type="text" name="id">
                    <!-- ����ڰ� ���̵� �Է��ϴ� �ؽ�Ʈ �ʵ�. name �Ӽ��� "id"�� ���� -->
                </td>
            </tr>

            <tr height="60">
                <!-- �� ��° ��: ���� 60px -->
                <td align="center" width="150">�н�����</td>
                <!-- ù ��° ��: "�н�����" �ؽ�Ʈ�� ��� ����, �ʺ� 150px -->
                <td align="left" width="250">
                    <!-- �� ��° ��: �Է� �ʵ� ��ġ, ���� ����, �ʺ� 250px -->
                    <input type="password" name="pass">
                    <!-- ����ڰ� �н����带 �Է��ϴ� ��й�ȣ �ʵ�. name �Ӽ��� "pass"�� ���� -->
                </td>
            </tr>

            <tr height="60">
                <!-- �� ��° ��: ���� 60px -->
                <td colspan="2" align="center">
                    <!-- �� ���� (colspan=2): ��ư�� ���̺� �߾ӿ� ��ġ -->
                    <input type="submit" value="����">
                    <!-- ���� ��ư. Ŭ�� �� �� �����͸� ������ ���� -->
                </td>
            </tr>
        </table>
    </form>
</center>

