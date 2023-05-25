<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="${contextPath}layout/header.jsp"></jsp:include>
<jsp:include page="${contextPath}layout/footer.jsp"></jsp:include> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MooVOD : 로그인</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/login.css"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
<body>
  <div class="wrapper fadeInDown">
    <div id="formContent">
    
      <div class="loginBox_input">
         <div class="loginBoxTitle" id="loginBox_input">Login Page</div>

         
         <form id="frmLogin" method="post" action="${contextPath}/user/login.do">
         
          <input type="hidden" name="url" value="${url}">
          
          <input type="text" name="id" id="id" class="fadeIn second" placeholder="아이디">
          <input type="password" name="pw" id="pw" class="fadeIn third" placeholder="비밀번호">
     
            <div class="buttons">
              <button id="login-button" class="fadeIn fourth">로그인</button>
            </div>
            
            <label>
              <input type="checkbox" id="chkRememberId">
              아이디 기억
            </label>
            <label>
              <input type="checkbox" id="auto-login">
              자동 로그인
            </label>
          </form>

  <div id="formFooter">
    <a class="underlineHover" href="${contextPath}/user/findId.form">아이디 찾기</a> | 
    <a class="underlineHover" href="${contextPath}/user/findPw.form">비밀번호 찾기</a> |
    <a class="underlineHover" href="${contextPath}/user/agree.form">회원가입</a>
   </div>
   
      </div>
      
    </div>
  </div>

</body>
</html>