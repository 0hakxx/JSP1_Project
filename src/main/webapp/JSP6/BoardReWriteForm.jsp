<%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-16
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>답글 작성하기</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .board-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }
        .board-table td {
            padding: 15px;
            border: 1px solid #ddd;
        }
        .board-table input[type="text"],
        .board-table input[type="email"],
        .board-table input[type="password"],
        .board-table textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .board-table textarea {
            resize: vertical;
        }
        .btn-group {
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 5px;
            font-weight: bold;
        }
        .btn-submit {
            background-color: #4CAF50;
            color: white;
        }
        .btn-reset {
            background-color: #f44336;
            color: white;
        }
        .btn-list {
            background-color: #2196F3;
            color: white;
        }
        .title {
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
        }
    </style>
</head>
<body>
<%
      request.setCharacterEncoding("UTF-8");
//    BoardInfo.jsp로부터 받은 데이터를 다시 hidden 필드의 값으로 Relay처럼 처리 페이지(BoardReWriteProc)로 전달한다.
//    최종적으로 게시판 목록(BoardList.jsp)으로 이동하는 구조

    //BoardInfo(하나의 게시글을 확인하는 페이지에서 받은 파라미터 값을 변수에 저장한다
    int num = Integer.parseInt(request.getParameter("num").trim());
    int ref = Integer.parseInt(request.getParameter("ref").trim());
    int re_step = Integer.parseInt(request.getParameter("re_step").trim());
    int re_level = Integer.parseInt(request.getParameter("re_level").trim());

%>

<div class="container">
    <h2 class="title">답글 작성하기</h2>
    <form action="BoardReWriteProc.jsp" method="post">
        <table class="board-table">
            <tr>
                <td width="150" align="center">작성자</td>
                <td><input type="text" name="writer" placeholder="작성자를 입력하세요"></td>
            </tr>
            <tr>
                <td width="150" align="center">제목</td>
                <td><input type="text" name="subject" value="[답변]" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
                <td width="150" align="center">이메일</td>
                <td><input type="email" name="email" placeholder="이메일을 입력하세요"></td>
            </tr>
            <tr>
                <td width="150" align="center">비밀번호</td>
                <td><input type="password" name="password" placeholder="비밀번호를 입력하세요"></td>
            </tr>
            <tr>
                <td width="150" align="center">글 내용</td>
                <td><textarea rows="10" name="content" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="btn-group">
                    <!-- 답글 처리에 필요한 원본 게시글의 정보를 hidden 필드로 전달 -->
                    <!-- ref: 원본 게시글의 그룹 번호 - 같은 그룹의 답글들을 묶기 위한 값 -->
                    <input type="hidden" name="ref" value="<%=ref%>">

                    <!-- re_step: 답글의 순서를 정하는 값 - 같은 그룹 내에서 답글이 표시되는 순서 결정 -->
                    <input type="hidden" name="re_step" value="<%=re_step%>">

                    <!-- re_level: 답글의 들여쓰기 레벨 - 답글의 깊이를 표현하는 값 -->
                    <input type="hidden" name="re_level" value="<%=re_level%>">

                    <!-- 폼 제출 버튼 - BoardReWriteProc.jsp로 데이터 전송 -->
                    <input type="submit" value="답글 쓰기 완료" class="btn btn-submit">

                    <!-- 입력한 내용을 초기화하는 리셋 버튼 -->
                    <input type="reset" value="취소" class="btn btn-reset">

                    <!-- 게시글 목록 페이지로 이동하는 버튼 -->
                    <input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기" class="btn btn-list">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
