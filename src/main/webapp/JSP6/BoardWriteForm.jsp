<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 쓰기</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        /* 컨테이너 스타일 */
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        /* 제목 스타일 */
        h2 {
            color: #333;
            text-align: center;
        }
        /* 폼 그룹 스타일 */
        .form-group {
            margin-bottom: 15px;
        }
        /* 라벨 스타일 */
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        /* 입력 필드 스타일 */
        input[type="text"], input[type="email"], input[type="password"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        /* 텍스트 영역 스타일 */
        textarea {
            height: 100px;
        }
        /* 버튼 그룹 스타일 */
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
        /* 버튼 공통 스타일 */
        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin: 0 5px;
        }
        /* 제출 버튼 스타일 */
        .submit-btn {
            background-color: #4CAF50;
            color: white;
        }
        /* 리셋 버튼 스타일 */
        .reset-btn {
            background-color: #f44336;
            color: white;
        }
        /* 조회 버튼 스타일 */
        .view-btn {
            background-color: #008CBA;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>게시글 쓰기</h2>
    <!-- 게시글 작성 폼 시작 -->
    <form action="BoardWriteProc.jsp" method="post">
        <!-- 작성자 입력 필드 -->
        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="text" id="writer" name="writer" required>
        </div>

        <!-- 제목 입력 필드 -->
        <div class="form-group">
            <label for="subject">제목</label>
            <input type="text" id="subject" name="subject" required>
        </div>

        <!-- 이메일 입력 필드 -->
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" required>
        </div>

        <!-- 비밀번호 입력 필드 -->
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required>
        </div>

        <!-- 내용 입력 필드 -->
        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" required></textarea>
        </div>

        <!-- 버튼 그룹 -->
        <div class="button-group">
            <!-- 글쓰기 제출 버튼 -->
            <input type="submit" value="글쓰기" class="button submit-btn">
            <!-- 폼 리셋 버튼 -->
            <input type="reset" value="다시작성" class="button reset-btn">
            <!-- 전체 글 보기 버튼 -->
            <button onclick="location.href='BoardList.jsp'" class="button view-btn">전체 글 보기</button>
        </div>
    </form>
    <!-- 게시글 작성 폼 끝 -->
</div>
</body>
</html>
