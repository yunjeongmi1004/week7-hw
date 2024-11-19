<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 탐색 라이브러리 --%>
<%@ page import="java.sql.DriverManager" %>

<%-- 데이터 베이스 연결 라이브러리 --%>
<%@ page import="java.sql.Connection" %>

<%-- SQL 준비 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%-- 데이터베이스로부터 값 받아오기 라이브러리 --%>
<%@ page import="java.sql.ResultSet" %>

<%
    //jsp 영역

    // 앞 페이지에서 넘어온 값에 대한 인코딩 설정 (한글 안깨지게)
    request.setCharacterEncoding("utf-8");

    //db 통신
    // Connector파일 찾아오기, 에러가 난다면 커넥터 파일이 없음 / 디비를 설치 않았거나 / 디비 서버가 꺼져있음
    Class.forName("org.mariadb.jdbc.Driver");

    // db 서버에 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234" );
  
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    String sql = "SELECT * FROM member WHERE id = ? AND pw =? ";
    
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, id);
    query.setString(2, pw);


    ResultSet result =  query.executeQuery();
    
    if(result.next()){        
        // 로그인 정보를 세션 객체에 저장
        session.setAttribute("id", id);
        session.setAttribute("pw", pw);
        response.sendRedirect("../page/boardListPage.jsp");
    }else{
        // 로그인 실패 화면(아이디는 있으나 비밀번호가 틀렸을 경우)
        response.sendRedirect("../page/loginFailPage.jsp");
    }

%>
