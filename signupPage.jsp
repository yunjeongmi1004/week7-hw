<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<jsp:include page="header.jsp"></jsp:include>

<body>
    <main>
    <a href="#" onclick="history.back(); return false;" aria-label="뒤로가기" class="btn-back"></a>
    <h1>Sign Up</h1>
    <section>
        <input type="text" id="id_value" placeholder="Id">
        <input type="password" id="pw_value" placeholder="Password">
        <input type="text" id="name_value" placeholder="Name">
        <input type="text" id="email_value" placeholder="Email">
    
        <input type="button" value="Sign Up" onclick="signupEvent()" class="btn">
    
        <!-- <input type="button" value="회원목록페이지" onclick="moveAccountPageEvent()" class="btn bg-bage"> -->
    
        <input type="button" value="Log in" onclick="loginPageEvent()" class="btn bg-bage">
    </section>

    </main>
    <script>
        function signupEvent(){
             var idValue = document.getElementById('id_value').value;
             var pwValue = document.getElementById('pw_value').value;
             var nameValue = document.getElementById('name_value').value;
             var emailValue = document.getElementById('email_value').value;

            location.href = 'signupAction.jsp?id=' +  idValue + '&pw=' + pwValue  + '&name=' + nameValue + '&email=' + emailValue; 
        }

        function moveAccountPageEvent(){
            location.href = 'accountListPage.jsp'
        }

        function loginPageEvent(){
            location.href = 'loginPage.jsp'
        }
    </script>

</body>