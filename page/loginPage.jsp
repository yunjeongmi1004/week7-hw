<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
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

<jsp:include page="../header.jsp"></jsp:include>
<body>
    <main>
        <h1>Log In</h1>
        <section>
            <form action="../action/loginAction.jsp" method="post" name="userinfo" onsubmit="return sendit()">
                <input type="text" name="id" placeholder="Id" id="userid">
                <input type="password" name="pw" placeholder="Password" id="userpw">
                <input type="submit" value="Log In" class="btn">
            </form>
           <a href="signupPage.jsp" class="btn bg-bage">Sign Up</a>
            <a href="" class="btn-text">Forgot Password?</a>
        </section>
    </main>
    <script>
        function sendit(){
            var userid = document.getElementById('userid');
            var userpw = document.getElementById('userpw');

            // 정규표현식
 
            if(userid.value == ''){
                alert('아이디를 입력하세요');
                userid.focus();
                return false
            }
            if(userpw.value == ''){
                alert('비밀번호를 입력하세요');
                userpw.focus();
                return false      
            }
        

        }
    </script>
</body>
