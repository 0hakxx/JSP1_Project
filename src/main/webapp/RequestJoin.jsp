<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<center>
    <h2>회원 가입</h2>
    <!-- 회원 가입 폼 시작 -->
    <!-- action 속성은 폼 데이터를 처리할 JSP 페이지를 지정 -->
    <!-- method="post"는 데이터를 URL에 노출시키지 않고 전송 -->
    <form action="RequestJoinProc.jsp" method="post">
        <!-- 테이블을 사용하여 폼 레이아웃 구성 -->
        <table width="500" border="1">
            <!-- 아이디 입력 필드 -->
            <tr height="50">
                <td width="150" align="center"> 아이디 </td>
                <td width="350" align="center">
                    <input type="text" name="id" size="40">
                </td>
            </tr>
            <!-- 비밀번호 입력 필드 -->
            <tr height="50">
                <td width="150" align="center"> 패스워드 </td>
                <td width="350" align="center">
                    <input type="text" name="pass1" size="40">
                    <!-- 보안을 위해 type="password"로 변경하는 것이 좋음 -->
                </td>
            </tr>
            <!-- 비밀번호 확인 필드 -->
            <tr height="50">
                <td width="150" align="center"> 패스워드확인 </td>
                <td width="350" align="center">
                    <input type="text" name="pass2" size="40">
                    <!-- 보안을 위해 type="password"로 변경하는 것이 좋음 -->
                </td>
            </tr>
            <!-- 이메일 입력 필드 -->
            <tr height="50">
                <td width="150" align="center"> 이메일 </td>
                <td width="350" align="center">
                    <input type="email" name="email" size="40">
                    <!-- type="email"은 이메일 형식 검증을 Chrome 브라우저에서 자동으로 수행된다 html 5의 기능 -->
                </td>
            </tr>
            <!-- 전화번호 입력 필드 -->
            <tr height="50">
                <td width="150" align="center"> 전화번호 </td>
                <td width="350" align="center">
                    <input type="tel" name="tel" size="40">
                    <!-- type="tel"은 모바일 기기에서 숫자 키패드를 표시 -->
                </td>
            </tr>
            <!-- 관심분야 선택 (다중 선택 가능한 체크박스) -->
            <tr height="50">
                <td width="150" align="center">당신의 관심분야 </td>
                <td width="350" align="center">
                    <input type="checkbox" name="hobby" value="캠핑">캠핑 &nbsp; &nbsp;
                    <input type="checkbox" name="hobby" value="등산">등산 &nbsp; &nbsp;
                    <input type="checkbox" name="hobby" value="영화">영화 &nbsp; &nbsp;
                    <input type="checkbox" name="hobby" value="독서">독서  &nbsp; &nbsp;
                </td>
            </tr>
            <!-- 직업 선택 (select => 단일 선택 드롭다운) -->
            <tr height="50">
                <td width="150" align="center"> 당신의 직업은 </td>
                <td width="350" align="center">
                    <select name="job">
                        <option value="교사">교사</option>
                        <option value="의사">의사</option>
                        <option value="변호사">변호사</option>
                        <option value="기술사">기술사</option>
                    </select>
                </td>
            </tr>
            <!-- 연령대 선택 (단일 선택 라디오 버튼) -->
            <tr height="50">
                <td width="150" align="center">당신의 연령은</td>
                <td width="350" align="center">
                    <input type="radio" name="age" value="10">10대 &nbsp; &nbsp;
                    <input type="radio" name="age" value="20">20대 &nbsp; &nbsp;
                    <input type="radio" name="age" value="30">30대&nbsp; &nbsp;
                    <input type="radio" name="age" value="40">40대 &nbsp; &nbsp;
                </td>
            </tr>
            <!-- 추가 정보 입력을 위한 텍스트 영역 -->
            <tr height="50">
                <td width="150" align="center">하고 싶은 말 </td>
                <td width="350" align="center">
                    <textarea rows="5" cols="40" name="info"></textarea>
                </td>
            </tr>
            <!-- 제출 및 취소 버튼 -->
            <tr height="50">
                <td align="center" colspan="2">
                    <input type="submit" value="회원가입">
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
    <!-- 회원 가입 폼 끝 -->
</center>
</body>
</html>
