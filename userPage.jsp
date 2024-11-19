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
%>

<jsp:include page="header.jsp"></jsp:include>
<body>

    <main class="sub">
        <h1>회원정보</h1>

    <% while(result.next()) { %>
        <div class="board-list">
            <span><%=result.getString("id")%></span>
            <span><%=result.getString("name")%></span>
            <span><%=result.getString("email")%></span>
        </div>
    <% } %>
    </main>


<%
// 세션값
    session = request.getSession();
    out.print("id :" + session.getAttribute("id") + "<br>" + "pw :" +session.getAttribute("pw"));

%>
    <script>
   
    </script>

</body>
