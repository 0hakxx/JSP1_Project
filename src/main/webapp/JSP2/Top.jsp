<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Insert title here</title>
</head>
<body>
  <!-- ��� ���̺� ���� -->
  <table width="800">
    <!-- ù ��° ��: �ΰ� �� ���� -->
    <tr height="100">
      <!-- �ΰ� �̹��� (2�� ����) -->
      <td colspan="2" align="center" width="206">
        <img alt="�̹��� ���� �����ϴ�." src="../images/2.png" width="200" height="70">
      </td>
      <!-- ����Ʈ ���� (4�� ����) -->
      <td colspan="4" align="center">
        <font size="10">���� ķ��</font>
      </td>
    </tr>
    <!-- �� ��° ��: �׺���̼� �޴� -->
    <tr height="50">
      <!-- �� �޴� �׸� -->
      <td width="110" align="center">��Ʈ</td>
      <td width="110" align="center">����</td>
      <td width="110" align="center">�ı��</td>
      <td width="110" align="center">ħ��</td>
      <td width="110" align="center">���̺�</td>
      <!-- ����� ID ǥ�� (URL �Ķ���Ϳ��� ������) -->
      <td width="140" align="center"><%=request.getParameter("id") %></td>
    </tr>
  </table>
  <!-- ��� ���̺� �� -->
</body>
</html>