<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<center>
    <!-- 전체 레이아웃을 위한 테이블 -->
    <table border="1" width="800">
        <!-- 상단 영역 -->
        <tr height="150">
            <td align="center" colspan="2">
                <!-- Top.jsp 파일을 포함하고 Top.jsp로 "id" 파라미터를 "aaa"로 전달 -->
                <jsp:include page="Top.jsp">
                    <jsp:param value="aaa" name="id" />
                </jsp:include>
            </td>
        </tr>

        <!-- 중앙 영역 (좌측 메뉴 + 메인 컨텐츠) -->
        <tr height="400">
            <!-- 좌측 메뉴 영역 -->
            <td align="center" width="200">
                <!-- Left.jsp 파일을 포함 -->
                <jsp:include page="Left.jsp"/>
            </td>
            <!-- 메인 컨텐츠 영역 -->
            <td align="center" width="600">
                <!-- Center.jsp 파일을 포함 -->
                <jsp:include page="Center.jsp" />
            </td>
        </tr>

        <!-- 하단 영역 -->
        <tr height="100">
            <td align="center" colspan="2">
                <!-- Buttom.jsp 파일을 포함 (오타 주의: Bottom이 아님) -->
                <jsp:include page="Buttom.jsp" />
            </td>
        </tr>
    </table>
</center>

</body>
</html>
