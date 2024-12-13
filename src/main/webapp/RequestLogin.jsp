<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<center>
    <h2>로그인 페이지</h2>
    <!-- 로그인 폼 시작 -->
    <!-- action 속성은 폼 데이터를 처리할 JSP 페이지를 지정 -->
    <!-- method="post"는 데이터를 URL에 노출시키지 않고 전송 -->
    <form action="RequestLoginProc.jsp" method="post">
        <!-- 테이블을 사용하여 로그인 폼 구조화(박스) -->
        <table width="400" border="1">
            <!-- 아이디 입력 행 -->
            <tr height="60">
                <td align="center" width="150">아이디</td>
                <td align="left" width="250">
                    <!-- 사용자 아이디 입력 필드 -->
                    <input type="text" name="id">
                </td>
            </tr>

            <!-- 패스워드 입력 행 -->
            <tr height="60">
                <td align="center" width="150">패스워드</td>
                <td align="left" width="250">
                    <!-- 사용자 패스워드 입력 필드 (type="password"로 입력 내용 숨김) -->
                    <input type="password" name="pass">
                </td>
            </tr>

            <!-- 제출 버튼 행 -->
            <tr height="60">
                <!-- colspan="2"로 두 열을 합침 -->
                <td colspan="2" align="center">
                    <!-- 폼 제출 버튼 시  <form> </form> 영역에 있는 데이터를 RequestLoginProc.jsp 으로 전송-->

                    <input type="submit" value="전송">
                </td>
            </tr>

        </table>
    </form>
    <!-- 로그인 폼 끝 -->
</center>

</body>
</html>
