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
    String id = "SELECT id FROM member";
    PreparedStatement query = connect.prepareStatement(id);

    // sql 전송(SELECT 쓸떄는 다름)
    ResultSet result = query.executeQuery();



%>

<jsp:include page="../header.jsp"></jsp:include>
<body>
    <main>
    <a href="#" onclick="history.back(); return false;" aria-label="뒤로가기" class="btn-back"></a>
    <h1>Sign Up</h1>
    <section>

        <form action="../action/signupAction.jsp" method="post" name="userinfo" onsubmit="return signupPageEvent()">
            <input type="text" id="id_value" name="id" placeholder="Id">
            
            <input type="password" id="pw_value" name="pw" placeholder="Password">
            <input type="text" id="name_value" name="name" placeholder="Name">
            <input type="text" id="email_value" name="email" placeholder="Email">
        
            <input type="submit" value="Sign Up" class="btn">
        </form>
    
        <!-- <input type="button" value="회원목록페이지" onclick="moveAccountPageEvent()" class="btn bg-bage"> -->
    
        <input type="button" value="Log in" onclick="loginPageEvent()" class="btn bg-bage">
        <input type="button" value="아이디중복체크" onclick="idCheckEvent()" class="btn-idchk">
    </section>

    </main>

    <script>
    
        function signupPageEvent(){
             var idValue = document.getElementById('id_value');
             var pwValue = document.getElementById('pw_value');
             var nameValue = document.getElementById('name_value');
             var emailValue = document.getElementById('email_value');
        
            if(idValue.value == ''){
                alert('아이디를 입력하세요');
                idValue.focus();
                return false
            }
            if(pwValue.value == ''){
                alert('비밀번호를 입력하세요');
                pwValue.focus();
                return false      
            }
            if(nameValue.value == ''){
                alert('이름을 입력하세요');
                nameValue.focus();
                return false      
            }
            if(emailValue.value == ''){
                alert('이메일을 입력하세요');
                emailValue.focus();
                return false      
            }
            return true
        }

        function moveAccountPageEvent(){
            location.href = 'accountListPage.jsp'
        }

        function loginPageEvent(){
            location.href = 'loginPage.jsp'
        }

        function idCheckEvent(){
           location.href = '../action/idcheckAction.jsp'
        }

        
    </script>


<script>

    console.log("<%=result%>")
</script>
  <%-- location.href = '../action/signupAction.jsp?id=' +  idValue + '&pw=' + pwValue  + '&name=' + nameValue + '&email=' + emailValue;  --%>
</body>