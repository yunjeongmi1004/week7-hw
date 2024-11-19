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


    //db 통신
    // Connector파일 찾아오기, 에러가 난다면 커넥터 파일이 없음 / 디비를 설치 않았거나 / 디비 서버가 꺼져있음
    Class.forName("org.mariadb.jdbc.Driver");

    // db 서버에 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234" );


    // sql 준비
    String sql = "SELECT id, name, email FROM member";
    PreparedStatement query = connect.prepareStatement(sql);

    // sql 전송(SELECT 쓸떄는 다름)
    ResultSet result = query.executeQuery();

    // result.next()
    // result.next()
    // result.next()

    // 테이블에 존재하는 row의 개수만큼 화면에 반복 출력
    // js의 createElement를 써서 원래는 html 중복코드를 해결 했었음.
    // --> 모든 페이지에 공통으로 등러가는 header 나 aside등 사용 

    // 우리같은 경우는 jsp와 html의 스파게티 코드로 해결을 할 것


%>

<jsp:include page="header.jsp"></jsp:include>
<body>
    <main>
        <h1>Log In</h1>
        <section>
            <form action="loginAction.jsp" method="post" name="userinfo">
                <input type="text" name="id" placeholder="Id">
                <input type="password" name="pw" placeholder="Password">
                <input type="submit" value="Log In" class="btn">
            </form>
           <a href="signupPage.jsp" class="btn bg-bage">Sign Up</a>
            <a href="" class="btn-text">Forgot Password?</a>
        </section>
    </main>
</body>
