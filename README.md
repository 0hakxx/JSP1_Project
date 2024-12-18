# JSP 게시판 프로젝트

## 📝 JSP 게시판 프로젝트 
프로젝트 소개 JSP와 Oracle DB를 활용한 기본적인 게시판 시스템입니다. 커넥션 풀을 사용하여 효율적인 데이터베이스 연결 관리를 구현했습니다.

## ⚙️ 개발 환경
- 언어: Java, JSP 
- 데이터베이스: Oracle 
- 서버: Apache Tomcat 
- IDE: IntelliJ IDEA 
- 형상관리: Git

## 🛠 주요 기능
- 게시글 CRUD 구현
- 답글 기능 
- 조회수 카운트
- 비밀번호 기반 게시글 보호
- 계층형 게시판 구조

## 📋 데이터베이스 구조
CREATE TABLE BOARD (
NUM NUMBER PRIMARY KEY,
WRITER VARCHAR2(20),
EMAIL VARCHAR2(50),
SUBJECT VARCHAR2(50),
PASSWORD VARCHAR2(20),
REG_DATE DATE,
REF NUMBER,
RE_STEP NUMBER,
RE_LEVEL NUMBER,
READCOUNT NUMBER,
CONTENT VARCHAR2(2000)
);

## 🔍 주요 구현 사항
- 커넥션 풀 활용: JNDI를 통한 효율적인 데이터베이스 연결 관리
- 계층형 구조: ref, re_step, re_level을 활용한 답글 기능 구현
- MVC 패턴: Bean 객체를 활용한 데이터 처리(Model1)
- 보안: 게시글 수정/삭제 시 비밀번호 검증

## 📦 프로젝트 구조

src/
├── main/
│ ├── java/
│ │ └── bean/
│ │ ├── boardBean.java
│ │ └── boardDAO.java
│ └── webapp/JSP6
│ ├── BoardList.jsp
│ ├── BoardWrite.jsp
│ ├── BoardUpdate.jsp
│ └── BoardDelete.jsp

JSP1~JSP5 폴더는 기본적인 JSP 활용문법 및 회원가입 예제.


## 🚀 시작하기
1. 프로젝트 클론
2. Oracle DB 설정
3. Tomcat 서버 구성
4. 프로젝트 실행

## 📝 라이선스
This project is licensed under the MIT License

