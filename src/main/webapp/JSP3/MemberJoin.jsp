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
    <form action="MemberJoinProc.jsp" method="post">
        <!-- 테이블을 사용하여 폼 레이아웃 구성 -->
        <!-- width="500"은 테이블의 전체 너비를 500픽셀로 설정 -->
        <!-- border="1"은 테이블에 1픽셀 두께의 테두리를 추가 -->
        <table width="500" border="1">
            <!-- 아이디 입력 필드 -->
            <!-- tr height="50"은 행의 높이를 50픽셀로 설정 -->
            <tr height="50">
                <!-- td width="150"은 첫 번째 열의 너비를 150픽셀로 설정 -->
                <td width="150" align="center"> 아이디 </td>
                <!-- td width="350"은 두 번째 열의 너비를 350픽셀로 설정 -->
                <td width="350" align="center">
                    <!-- input type="text"는 일반 텍스트 입력 필드 생성 -->
                    <!-- name="id"는 서버로 전송될 때 사용될 필드 이름 -->
                    <!-- size="40"은 입력 필드의 표시 너비를 40자로 설정 -->
                    <input type="text" name="id" size="40">
                </td>
            </tr>
            <!-- 비밀번호 입력 필드 -->
            <tr height="50">
                <td width="150" align="center"> 패스워드 </td>
                <td width="350" align="center">
                    <input type="text" name="pass1" size="40">
                    <!-- 보안을 위해 type="password"로 변경하는 것이 좋음 -->
                    <!-- password 타입은 입력 내용을 *로 표시하여 숨김 -->
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
                    <!-- type="email"은 이메일 형식 검증을 브라우저에서 자동으로 수행 -->
                    <input type="email" name="email" size="40">
                </td>
            </tr>
            <!-- 전화번호 입력 필드 -->
            <tr height="50">
                <td width="150" align="center"> 전화번호 </td>
                <td width="350" align="center">
                    <!-- type="tel"은 모바일 기기에서 숫자 키패드를 표시 -->
                    <input type="tel" name="tel" size="40">
                </td>
            </tr>
            <!-- 관심분야 선택 (다중 선택 가능한 체크박스) -->
            <tr height="50">
                <td width="150" align="center">당신의 관심분야 </td>
                <td width="350" align="center">
                    <!-- checkbox 타입으로 여러 항목 중 다중 선택 가능 -->
                    <!-- name이 같은 checkbox는 서버에서 배열로 받음 -->
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
                    <!-- select 요소로 드롭다운 목록 생성 -->
                    <select name="job">
                        <!-- option 요소로 선택 항목 정의 -->
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
                    <!-- radio 타입으로 여러 항목 중 하나만 선택 가능 -->
                    <!-- name이 같은 radio 버튼끼리 그룹 형성 -->
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
                    <!-- textarea로 여러 줄 입력 가능한 텍스트 영역 생성 -->
                    <!-- rows는 표시할 줄 수, cols는 한 줄의 문자 수 -->
                    <textarea rows="5" cols="40" name="info"></textarea>
                </td>
            </tr>
            <!-- 제출 및 취소 버튼 -->
            <tr height="50">
                <!-- colspan="2"로 두 열을 합침 -->
                <td align="center" colspan="2">
                    <!-- type="submit"은 폼 데이터를 서버로 제출 -->
                    <input type="submit" value="회원가입">
                    <!-- type="reset"은 폼의 모든 필드를 초기값으로 재설정 -->
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
    <!-- 회원 가입 폼 끝 -->
</center>
</body>
</html>
