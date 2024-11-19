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

    //값 받아오기
    String idValue = request.getParameter("id");
    String pwValue = request.getParameter("pw");
    String nameValue = request.getParameter("name");
    String emailValue = request.getParameter("email");

    //db 통신
    // Connector파일 찾아오기, 에러가 난다면 커넥터 파일이 없음 / 디비를 설치 않았거나 / 디비 서버가 꺼져있음
    Class.forName("org.mariadb.jdbc.Driver");

    // db 서버에 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234" );

    // sql 준비
    String sql = "SELECT id FROM member";
    PreparedStatement query = connect.prepareStatement(sql);

    // sql 전송(SELECT 쓸떄는 다름)
    ResultSet result = query.executeQuery();
 




%>


<%
if(result.next()){
%>

<script>
    console.log("<%=result%>");
    alert('이미 있는 아이디');
  //  location.href="../page/signupPage.jsp";
</script>
<%
}else{
%>
<script>
    alert('성공');
    location.href="../pade/signupPage.jsp";
</script>
<%
}
%>
