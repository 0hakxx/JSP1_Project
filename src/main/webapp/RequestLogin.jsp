<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<center>
    <h2>�α��� ������</h2>
    <!-- �α��� �� ���� -->
    <!-- action �Ӽ��� �� �����͸� ó���� JSP �������� ���� -->
    <!-- method="post"�� �����͸� URL�� �����Ű�� �ʰ� ���� -->
    <form action="RequestLoginProc.jsp" method="post">
        <!-- ���̺��� ����Ͽ� �α��� �� ����ȭ(�ڽ�) -->
        <table width="400" border="1">
            <!-- ���̵� �Է� �� -->
            <tr height="60">
                <td align="center" width="150">���̵�</td>
                <td align="left" width="250">
                    <!-- ����� ���̵� �Է� �ʵ� -->
                    <input type="text" name="id">
                </td>
            </tr>

            <!-- �н����� �Է� �� -->
            <tr height="60">
                <td align="center" width="150">�н�����</td>
                <td align="left" width="250">
                    <!-- ����� �н����� �Է� �ʵ� (type="password"�� �Է� ���� ����) -->
                    <input type="password" name="pass">
                </td>
            </tr>

            <!-- ���� ��ư �� -->
            <tr height="60">
                <!-- colspan="2"�� �� ���� ��ħ -->
                <td colspan="2" align="center">
                    <!-- �� ���� ��ư ��  <form> </form> ������ �ִ� �����͸� RequestLoginProc.jsp ���� ����-->

                    <input type="submit" value="����">
                </td>
            </tr>

        </table>
    </form>
    <!-- �α��� �� �� -->
</center>

</body>
</html>
