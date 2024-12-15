<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!-- JSP 페이지 디렉티브: 페이지 언어는 Java이며, 콘텐츠 타입은 text/html, 인코딩은 EUC-KR로 설정 -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <!-- HTML 문서의 문자 인코딩을 EUC-KR로 설정 -->
    <title>Insert title here</title>
    <!-- 웹 페이지의 제목 설정 -->
</head>
<body>

<center>
    <!-- 콘텐츠를 화면 중앙에 배치 -->
    <h2>로그인 페이지 </h2>
    <!-- 페이지 제목을 표시 -->
    <form action="ResponseLoginProc.jsp" method="post">
        <!-- 로그인 폼: 데이터를 POST 방식으로 "ResponseLoginProc.jsp"로 전송 -->
        <table width="400" border="1">
            <!-- 테이블 생성: 너비 400px, 테두리 두께 1px -->
            <tr height="60">
                <!-- 첫 번째 행: 높이 60px -->
                <td align="center" width="150">아이디</td>
                <!-- 첫 번째 열: "아이디" 텍스트를 가운데 정렬, 너비 150px -->
                <td align="left" width="250">
                    <!-- 두 번째 열: 입력 필드 배치, 왼쪽 정렬, 너비 250px -->
                    <input type="text" name="id">
                    <!-- 사용자가 아이디를 입력하는 텍스트 필드. name 속성은 "id"로 설정 -->
                </td>
            </tr>

            <tr height="60">
                <!-- 두 번째 행: 높이 60px -->
                <td align="center" width="150">패스워드</td>
                <!-- 첫 번째 열: "패스워드" 텍스트를 가운데 정렬, 너비 150px -->
                <td align="left" width="250">
                    <!-- 두 번째 열: 입력 필드 배치, 왼쪽 정렬, 너비 250px -->
                    <input type="password" name="pass">
                    <!-- 사용자가 패스워드를 입력하는 비밀번호 필드. name 속성은 "pass"로 설정 -->
                </td>
            </tr>

            <tr height="60">
                <!-- 세 번째 행: 높이 60px -->
                <td colspan="2" align="center">
                    <!-- 열 병합 (colspan=2): 버튼을 테이블 중앙에 배치 -->
                    <input type="submit" value="전송">
                    <!-- 전송 버튼. 클릭 시 폼 데이터를 서버로 전송 -->
                </td>
            </tr>
        </table>
    </form>
</center>

