<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MooVOD : 비밀번호변경</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/login.css"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>

// 1. 변경한 새로운 비밀번호 검사 (정규식)
function fnCheckPw(){
  
  $('#uploadPw').on('keyup', function(){
  
    // 입력한 비밀번호
    let pw = $(this).val();
    
    // 길이(4~20자) 및 정규식(소문자+대문자+숫자+특수문자 사용 가능, 3개 이상 조합)
    let pwLength = pw.length;
    let validCount = /[a-z]/.test(pw)         //   소문자를 가지고 있으면 true(1), 없으면 false(0)
                   + /[A-Z]/.test(pw)         //   대문자를 가지고 있으면 true(1), 없으면 false(0)
                   + /[0-9]/.test(pw)         //     숫자를 가지고 있으면 true(1), 없으면 false(0)
                   + /[^a-zA-Z0-9]/.test(pw); // 특수문자를 가지고 있으면 true(1), 없으면 false(0)
    verifyPw = (pwLength >= 4) && (pwLength <= 20) && (validCount >= 3);
    if(verifyPw){
      $('#msguploadPw').text('사용 가능한 비밀번호입니다.');
    } else {
      $('#msguploadPw').text('4~20자, 소문자+대문자+숫자+특수문자 사용 가능, 3개 이상 조합');
    }
  
  })
  
}

// 2. 비밀번호 확인
function fnCheckPwAgain(){
  
  $('#upload2Pw').on('keyup', function(){
    
    // 입력된 비밀번호
    let uploadPw = $('#uploadPw').val();
    
    // 재입력한 비밀번호
    let upload2Pw = $(this).val();
    
    // 비밀번호와 재입력한 비밀번호 검사
    verifyRePw = (upload2Pw != '') && (upload2Pw == uploadPw);
    if(verifyRePw){
      $('#msgupload2Pw').text('');
    } else {
      $('#msgupload2Pw').text('비밀번호 입력을 확인하세요.');
    }
    
  })
  
}

// 함수 호출
$(function(){
  fnCheckPw();
  fnCheckPwAgain();
  $('#frmFindPw').on('submit', function(event){
    
  });
})
</script>
</head>
<body>
<body>

      <div class="loginBox_input">
         <div class="loginBoxTitle" id="loginBox_input">User Password</div>
  
    <hr>
    
    <form id="modifyPw" method="post" action="${contextPath}/user/modifyPw.do">
     
       <div>
        <label for="pw">비밀번호</label>
        <input type="password" name="pw" id="pw">
        <span id="msgPw"></span>
      </div> 
      
       <div>
        <label for="pw">새로운 비밀번호</label>
        <input type="password" name="uploadPw" id="uploadPw">
        <span id="msguploadPw"></span>
      </div> 
      
       <div>
        <label for="pw">비밀번호 재확인</label>
        <input type="password" name="upload2Pw" id="upload2Pw">
        <span id="msgupload2Pw"></span>
      </div> 
     
      
      <div>
        <button>수정하기</button>
      </div>
    
    </form>
  
  </div>


</body>
</html>