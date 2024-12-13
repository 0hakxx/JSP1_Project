<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Insert title here</title>
</head>
<body>
  <!-- 상단 테이블 시작 -->
  <table width="800">
    <!-- 첫 번째 행: 로고 및 제목 -->
    <tr height="100">
      <!-- 로고 이미지 (2열 병합) -->
      <td colspan="2" align="center" width="206">
        <img alt="" src="../images/2.png" width="200" height="70">
      </td>
      <!-- 사이트 제목 (4열 병합) -->
      <td colspan="4" align="center">
        <font size="10">낭만 캠핑</font>
      </td>
    </tr>
    <!-- 두 번째 행: 네비게이션 메뉴 -->
    <tr height="50">
      <!-- 각 메뉴 항목 -->
      <td width="110" align="center">텐트</td>
      <td width="110" align="center">의자</td>
      <td width="110" align="center">식기류</td>
      <td width="110" align="center">침낭</td>
      <td width="110" align="center">테이블</td>
      <!-- 사용자 ID 표시 (URL 파라미터에서 가져옴) -->
      <td width="140" align="center"><%=request.getParameter("id") %></td>
    </tr>
  </table>
  <!-- 상단 테이블 끝 -->
</body>
</html>
