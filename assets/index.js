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