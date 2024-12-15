<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<center>
    <!-- 전체 레이아웃을 위한 테이블 시작 -->
    <table width = "600" border = "1">
        <!-- Top 영역 -->
        <tr height="150" align="center">
            <td>
                <!-- Top.jsp 파일을 포함 -->
                <%@include file="Top.jsp" %>
            </td>
        </tr>

        <!-- Center 영역 - 메인 컨텐츠 -->
        <tr height="400">
            <td width = "600" align="center">
                <!-- 중앙에 이미지 표시 -->
                <img alt ="" src = "../images/1.jpg" width="400" height="300">
            </td>
        </tr>

        <!-- Bottom 영역 -->
        <tr height="100">
            <td width = "600" align="center">
                <!-- Buttom.jsp 파일을 포함 -->
                <%@include file="Buttom.jsp" %>
            </td>
        </tr>
    </table>
    <!-- 전체 레이아웃을 위한 테이블 끝 -->
</center>
</body>
</html>
