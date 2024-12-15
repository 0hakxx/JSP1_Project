<%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-16
  Time: 오전 11:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>쿠키 정보를 생성하는 페이지입니다.(Main.jsp)에서 아이디 저장 Check 시 동작합니다.</title>
</head>
<body>


<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String Checkbox = request.getParameter("checkbox");


    if(Checkbox!=null) //체크박스가 체크되어 있다면...
    {
        // 새로운 쿠키 객체 생성 (Key : "id", value : 사용자 ID), 즉 사용자 ID와 같은 쿠키값을 저장함.
        Cookie cookie = new Cookie("id", id);
        // 쿠키의 유효 시간을 10분(60초 * 10)으로 설정
        cookie.setMaxAge(60 * 10);
        //사용자에게 쿠키값을 넘겨줌.
        response.addCookie(cookie);

        Cookie[] cookies = request.getCookies();//사용자들의 저장된 쿠키값들이 몇 개인지 모르기 때문에 배열 객체 이용
        String value = new String(); //쿠키 Value를 저장하는 문자열 생성

        if(cookies!=null){ //쿠키값이 있을 때
            for(int i = 0; i < cookies.length; i++){
                if(cookies[i].getName().equals("id")){ //저장된 쿠키 이름이 "id" 인 경우
                    value = id = cookies[i].getValue();
                    out.write(value);
                    System.out.println(value);
                    break;
                }
            }
        }
        }else{
            response.sendRedirect("Main.jsp");
        }

%>
</body>
</html>
