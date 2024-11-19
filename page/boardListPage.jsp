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
    String sql = "SELECT id, category_title, member_id, title, content, date FROM board";
    PreparedStatement query = connect.prepareStatement(sql);

    // sql 전송(SELECT 쓸떄는 다름)
    ResultSet result = query.executeQuery();

    // 세션 저장해두기
    String id = (String)session.getAttribute("id");

%>

<jsp:include page="../header.jsp"></jsp:include>
<body>

    <main class="sub">
    <h1>게시판</h1>
<%
if(id != null){
%>
        <button class="user-area" onclick="moveUserPageEvent()"><%= id %>, 님
        </button>
        <button class="btn-logout" onclick="logoutEvent()" aria-label="로그아웃"></button>
        <script>
            function moveUserPageEvent(){
                location.href = 'userPage.jsp'
            }
            function logoutEvent(){
                 location.href = '../action/logoutAction.jsp'
            }
        </script>
    <section>

    <% while(result.next()) { %>
        <div class="board-list">

            <span class="board-title"><%=result.getString("title")%></span>
            <span class="board-content"><%=result.getString("content")%></span>
            <span class="board-date"><%=result.getString("date")%></span>
            <div class="flex-box">
                <span class="board-cate" id="cate"><%=result.getString("category_title")%></span>
                <span><%=result.getString("member_id")%></span>
            </div>
        </div>
    <% } %>
<%
}else{
%>
<script>
    location.href="../index.jsp";
</script>
<%
}
%>
    </section>
    </main>
</body>
