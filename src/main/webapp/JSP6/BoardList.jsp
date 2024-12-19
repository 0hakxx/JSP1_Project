<%@ page import="bean.boardDAO" %>
<%@ page import="bean.MemberBean" %>
<%@ page import="bean.MemberDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="bean.boardBean" %><%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-16
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            color: #1a73e8;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>
<body>


<%--게시글 보기에 카운터링을 설정하기 위한 변수 설정--%>


<%
      request.setCharacterEncoding("UTF-8");
//    이 JSP 페이지는 게시판의 모든 게시글 목록을 표시합니다.데이터베이스에서 전체 게시글의 정보를 가져온다.
//    boardBean 객체는 각 게시글의 정보를 담고 있습니다.

    int PostsPerPage = 10;  //한 페이지에 표시할 게시글 수

    //사용자의 현재 페이지 번호 가져오기
    String currentPage = request.getParameter("currentPage");

    //DAO(Connection Pool) 객체 생성
    // 첫 페이지 또는 다른 페이지에서 넘어온 경우 currentPage가 null일 수 있음
    // 이 경우 기본값으로 1페이지 설정
    if(currentPage==null){
        currentPage="1"; // 기본 페이지 번호 설정
    }
    // 현재 페이지 번호를 정수로 변환
    int currentPageInt = Integer.parseInt(currentPage);



    int totalPosts = 0; // 전체 게시글 수를 저장할 변수

    // 전체 게시글 수 조회
    boardDAO bdao = new boardDAO();
    totalPosts = bdao.getAllCount();


    //회원들의 정보가 얼마나 들어가 있는지 모르기 때문에 가변길이인 vector를 이용하여 데이터를 저장해줌.
    //즉 boardBean Vector 여러 객체를 Return 받는다.
    Vector<boardBean> vec = bdao.getAllBoard();
    // 현재 페이지에 해당하는 게시글의 시작과 끝 행 번호 계산
    // 예: 2페이지라면, startRow = 11, endRow = 20
    int startRow = (currentPageInt-1)* PostsPerPage + 1;
    int endRow = currentPageInt * PostsPerPage;
    // 현재 페이지에 해당하는 게시글 목록 조회
    Vector<boardBean> vec = bdao.getAllBoard(startRow,endRow);


    // 화면에 표시할 게시글 번호 계산 (최신글이 위로 오도록)
    // 예: 총 게시글이 55개이고 현재 1페이지라면, number는 55부터 시작
    int number = 0;
    number = totalPosts - ((currentPageInt-1) * PostsPerPage);

      request.setCharacterEncoding("UTF-8");

%>


<h2>게시판 리스트</h2>
<table width="700" border="1">
    <tr height="50">
        <td align="center" width="50">번호</td>
        <td align="center" width="320">제목</td>
        <td align="center" width="100">작성자</td>
        <td align="center" width="150">작성일</td>
        <td align="center" width="80">조회수</td>
    </tr>

    <%
        for(int i=0; i < vec.size(); i++)
        {
            //벡터에 저장되어있는 boardBean객체들의 모음을 하나씩 bean에 저장.
            boardBean bean = vec.get(i);

    %>

    <tr height="40">
        <td align="center" width="50"> <%=i+1%> </td>
        <td align="center" width="50"> <%=number--%> </td>
<%--        number--으로 주는 이유는 number 변수는 초기에 전체 게시글 수에서 현재 페이지의 이전 게시글 수를 뺀 값으로 설정됨(110 Line)--%>
<%--        게시글 목록을 출력할 때마다 number--를 사용하여 번호를 1씩 감소시킨다.--%>
<%--        이렇게 하는 이유는--%>
<%--        예를 들어, 총 게시글이 55개이고 한 페이지당 10개씩 표시한다면:--%>
<%--        1페이지: 55,54,53,...,46--%>
<%--        2페이지: 45,44,43,...,36--%>
<%--        이런 식으로 순차적으로 번호가 매겨지기 위한 사용자의 편리성을 위한 것이다.--%>


        <td align="left" width="320"><a href="BoardInfo.jsp?num=<%=bean.getNum()%>" style="text-decoration: none"> <%--링크의 밑줄 제거--%>
            <%
                // 답글인 경우 들여쓰기와 화살표 표시로 계층 구조를 시각화
                if(bean.getRe_step() > 1) {
                    // 기본 들여쓰기 공백
                    for(int k = 0; k < (bean.getRe_step() - 1) * 5; k++) {
                        out.write("&nbsp;");
                    }
            %>
            RE:
            <%
                }
            %>
            <%=bean.getSubject() %></a></td><%--제목 클릭 시 자세하게 보는 페이지로 이동--%>


        <td align="center" width="100"><%=bean.getWriter()%></td>
        <td align="center" width="150"><%=bean.getReg_data()%></td>
        <td align="center" width="80"><%=bean.getReadcount()%></td>
    </tr>
    <%
        }
    %>




</table>
    <div style="text-align: center; margin-top: 20px;">
<%--페이지 카운터링 소스를 작성--%>
<p>
<%
  if( totalPosts > 0){
      // 총 게시글 수를 페이지당 게시글 수로 나누고, 나머지가 있으면 1을 더함
      //예. 게시글이 55개이면 6 페이지까지 출력
      int PageCount = totalPosts / PostsPerPage + (totalPosts % PostsPerPage==0 ? 0 : 1); //카운터링 숫자를 얼마까지 보여줄건지 결정

      // 화면에 표시할 페이지 그룹의 시작 페이지 계산
      int StartPage = 1;
      // 현재 페이지가 10의 배수가 아닌 경우
      if(currentPageInt % 10 != 0){
          StartPage = ((int)(currentPageInt/10))*10+1; //실수형을 정수형으로 변환
      }
      // 현재 페이지가 10의 배수인 경우 (예: 10, 20, 30...)
      else {
          StartPage = ((int)(currentPageInt/10) - 1)*10+1; //실수형을 정수형으로 변환
      }

      int pageBlock = 10; // 한 번에 표시할 페이지 번호의 개수
      int endPage = StartPage + pageBlock - 1; // 화면에 표시할 마지막 페이지 번호
      if(endPage > PageCount) endPage = PageCount; // 마지막 페이지가 전체 페이지 수를 넘지 않도록 조정

      // '이전' 링크 표시 (시작 페이지가 11 이상인 경우)
      if(StartPage > 10){
%>
    <a href="BoardList.jsp?currentPage=<%=StartPage-10%>">[이전]</a>
    <%
        }
        // 페이지 번호 표시
        for(int i=StartPage; i<=endPage; i++){
    %>
    <a href="BoardList.jsp?currentPage=<%=i%>">[<%=i %>]</a>
    <%
        }
        // '다음' 링크 표시 (마지막 페이지가 전체 페이지 수보다 작은 경우)
        if(endPage < PageCount){
    %>
    <a href="BoardList.jsp?currentPage=<%=StartPage+10%>">[다음]</a>
    <%
            }
        }
    %>
</p>
    <div style="text-align: right; margin-top: 20px;">
<%--        글쓰기 버튼 클릭 시 BoardWriteForm.jsp 으로 이동--%>
        <input type="button" class="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'">
    </div>

<%--        추가 설명:--%>
<%--        103 Line에서  bean.getNum()을 사용하지 않고 i 인덱스로 대체하는 이유는--%>
<%--        답변형 게시판이기 때문에 getNum으로 하면 현재 저장되어 있는 bean객체는 DAO에서 select ORDERBY 사용하여--%>
<%--        sorting을 Ref, Re_step을 ASC으로 조회를 한 결과이므로 번호가 1,2,3,4,...순서대로 출력되지 않고 최신글이 위로 보여준다--%>
<%--         반대로 NUM은 계속 1씩 증가하여, 최신글이 가장 크다.--%>
<%--        그렇다고 getNum은 쓸데없는 컬럼이 아니다, NUM컬럼은 PK로 사용하여 사용자가 요청하는 게시글이 어떤 것인지 알 수 있다.--%>



</body>
</html>
