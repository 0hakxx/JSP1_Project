<%@ page import="bean.boardDAO" %>
<%@ page import="bean.boardBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 상세보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        input[type="text"], input[type="password"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"], input[type="button"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    // 요청의 문자 인코딩을 UTF-8로 설정
    request.setCharacterEncoding("UTF-8");

    // BoardInfo.jsp에서 URL 파라미터로 전달된 게시글 번호를 가져와 정수로 변환
    int num = Integer.parseInt(request.getParameter("num").trim());

    // boardDAO 객체 생성 (데이터베이스 작업을 위한 객체)
    boardDAO bdao = new boardDAO();
    // 게시글 정보를 담을 boardBean 객체 생성
    boardBean bean = new boardBean();
    // 게시글 번호(num)에 해당하는 게시글 정보를 가져와 bean 객체에 저장
    bean = bdao.getOneBoard(num);
%>

<!-- 게시글 삭제 폼 시작 -->
<form action="BoardDeleteProc.jsp" method="post">
    <table>
        <!-- 작성자 및 작성일 표시 -->
        <tr>
            <td width="120" align="center">작성자</td>
            <td width="180" align="center"><%=bean.getWriter()%></td>
            <td width="120" align="center">작성일</td>
            <td width="180" align="center"><%=bean.getReg_data()%></td>
        </tr>

        <!-- 제목 입력 필드 -->
        <tr>
            <td width="120" align="center">제목</td>
            <td colspan="3"><%=bean.getSubject()%></td>
        </tr>

        <!-- 비밀번호 입력 필드 -->
        <tr>
            <td width="120" align="center">패스워드</td>
            <td colspan="3"><input type="password" name="password"></td>
        </tr>

        <!-- 글 내용 입력 영역 -->
        <tr>
            <td width="120" align="center">글내용</td>
            <td colspan="3"><textarea rows="10" name="content"><%=bean.getContent()%></textarea></td>
        </tr>

        <!-- 수정 및 목록 버튼 -->
        <tr>
            <td colspan="4" align="center">
                <!-- 게시글 번호를 hidden 필드로 전송 -->
                <input type="hidden" name="num" value="<%=bean.getNum() %>">
                <input type="submit" value="글삭제">
                <input type="button" onclick="location.href='BoardList.jsp'" value="전체 글 보기">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
