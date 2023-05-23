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
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<!-- cdnjs.com 에서 jquery-cookie 검색 후 jquery-cookie 라이브러리 포함 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

  // 로그인하기
  function fnLogin(){
    
    $('#frmLogin').on('submit', function(event){
      
      // 아이디, 비밀번호 공백 검사
      if($('#id').val() == '' || $('#pw').val() == ''){
        alert('아이디와 비밀번호를 모두 입력하세요.');
        event.preventDefault();
        return;
      }
      
      // 아이디 기억을 체크하면 rememberId 쿠키에 입력된 아이디를 저장
      if($('#chkRememberId').is(':checked')){
        $.cookie('rememberId', $('#id').val());
      } else {
        $.cookie('rememberId', '');
      }
      
    });
    
  }
  
  // 쿠키에 기억된 아이디 보여주기(아이디 기억)
  function fnDisplayRememberId(){
    
    // rememberId 쿠키에 저장된 아이디를 가져와서 표시
    
    let rememberId = $.cookie('rememberId');
    if(rememberId == ''){
      $('#id').val('');
      $('#chkRememberId').prop('checked', false);
    } else {
      $('#id').val(rememberId);
      $('#chkRememberId').prop('checked', true);
    }
    
  }
  
  $(function(){
    fnLogin();
    fnDisplayRememberId();
  });
  
</script>
</head>
<!-- <body class="text-center"> -->
<body class="login-container">

<div id="loginBox">
  <div class="loginBox_input">
    <div class="loginBoxTitle">Login Page</div>
    <input type="text" id="username" placeholder="아이디">
    <input type="password" id="password" placeholder="비밀번호">
    
    <div class="buttons">
    <button id="login-button">로그인</button>
    <div class="checkbox-container">
    </div>
    
      <label>
        <input type="checkbox" id="remember-me">
        아이디 기억
      </label>
      <label>
        <input type="checkbox" id="auto-login">
        자동 로그인
      </label>
    </div>
    <div class="links">
      <div>
        <a href="${contextPath}/user/findId.jsp">아이디 찾기</a> | 
        <a href="${contextPath}/user/findPw.jsp">비밀번호 찾기</a> |
        <a href="${contextPath}/user/agree.jsp">회원가입</a>
      </div>
    </div>
  </div>
</div>

  <script src="script.js"></script>
</body>
</html>