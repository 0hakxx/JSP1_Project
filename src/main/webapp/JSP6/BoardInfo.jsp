<%@ page import="bean.boardDAO" %>
<%@ page import="bean.boardBean" %><%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-16
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 상세보기</title>
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
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background: white;
        }

        td {
            padding: 12px;
            border: 1px solid #e0e0e0;
        }

        .label {
            background-color: #4a90e2;
            color: white;
            font-weight: bold;
            width: 120px;
        }

        .content {
            background-color: #ffffff;
        }

        .button-group {
            text-align: center;
            padding: 20px 0;
        }

        .btn {
            padding: 8px 16px;
            margin: 0 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btn-reply {
            background-color: #4CAF50;
            color: white;
        }

        .btn-edit {
            background-color: #2196F3;
            color: white;
        }

        .btn-delete {
            background-color: #f44336;
            color: white;
        }

        .btn-list {
            background-color: #757575;
            color: white;
        }

        .btn:hover {
            opacity: 0.8;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    // URL 파라미터로 전달된 게시글 번호(PK)를 가져옴
    // trim()으로 공백 제거 후 정수로 변환
    int num = Integer.parseInt(request.getParameter("num").trim());


    //해당 페이지는 한 게시글만 보여줘야 한다.

    // 데이터베이스 객체 생성
    boardDAO bdao = new boardDAO();

    //메서드 호출하여 받은 num(PK 기본키) 파라미터 값에 해당하는 DB 정보가 담긴 bean 객체를 return
    boardBean bean = bdao.getOneBoard(num);
%>

<div class="container">
    <table>
        <tr>
            <td class="label">글번호</td>
            <td class="content"><%=bean.getNum()%></td>
            <td class="label">조회수</td>
            <td class="content"><%=bean.getReadcount()%></td>
        </tr>
        <tr>
            <td class="label">작성일</td>
            <td class="content" colspan="3"><%=bean.getReg_data()%></td>
        </tr>
        <tr>
            <td class="label">이메일</td>
            <td class="content" colspan="3"><%=bean.getEmail()%></td>
        </tr>
        <tr>
            <td class="label">제목</td>
            <td class="content" colspan="3"><%=bean.getSubject()%></td>
        </tr>
        <tr>
            <td class="label">글내용</td>
            <td class="content" colspan="3" style="min-height: 200px; white-space: pre-wrap;"><%=bean.getContent()%></td>
        </tr>
    </table>

    <div class="button-group">
        <%--num을 전달하지 않는 이유--%>
        <%--새로운 답글은 새로운 게시글 번호를 부여받게 됩니다2--%>
        <%--답글 작성 시 필요한 정보는 원본 게시글과의 관계를 나타내는 ref, re_step, re_level 값들입니다2--%>
        <%--답글의 게시글 번호(num)는 데이터베이스에 저장될 때 시퀀스나 auto_increment 등을 통해 자동으로 생성됩니다3--%>
        <%--따라서 답글 작성 시에는 원본 게시글과의 관계를 표현하는 값들만 전달하면 되고, 새로운 게시글 번호는 자동으로 부여되므로 num 파라미터는 불필요--%>
<%--            따라서 BoardReWriteForm.jsp에서 num을 따로 파라미터 전달하지 않는다.--%>


        <%-- 답글쓰기 버튼: 계층형 게시판 구현을 위한 파라미터 전달 --%>
        <%-- num: 원본 게시글 번호 --%>
        <%-- ref: 게시글 그룹 번호(같은 그룹의 게시글들을 묶음) --%>
        <%-- re_step: 답글의 순서 --%>
        <%-- re_level: 답글의 들여쓰기 레벨 --%>
        <input type="button" class="btn btn-reply" value="답글쓰기"
               onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">

        <%--  삭제하기, 수정하기는 DB의 PK(고유키)인 num: 원본 게시글 번호만 전달받으면 어떤 게시글인지 알 수 있기 때문에 NUM만 전달한다.--%>
        <input type="button" class="btn btn-edit" value="수정하기"
               onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum()%>'">
        <input type="button" class="btn btn-delete" value="삭제하기"
               onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum()%>'">

        <input type="button" class="btn btn-list" value="목록보기"
               onclick="location.href='BoardList.jsp'">
    </div>
</div>

</body>
</html>
