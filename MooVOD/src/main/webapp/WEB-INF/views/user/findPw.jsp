<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MooVOD : 임시 비밀번호</title>
<script src="${contextPath}/resources/js/jquery-3.6.4.min.js"></script>
<script>

//   $(function(){
//    fn_findPw();
//   })
  $(document).ready(function(){
    fn_findPw2();
  });

  function fn_findPw2(){

      $('#frmFindPw').on('submit', function(event){
        
      });
  }
  
//리턴받아서 사용할경우
//   function fn_findPw(){ 
//     $('#btn_findPw').click(function(event){
// //       new Promise(function(resolve, reject){
//         if($('#id').val() == '' || $('#email').val() == ''){
//           reject('아이디와 이메일을 입력하세요.');
//           return;
//         }

//         $.ajax({
//           type: 'post',
//           url: '${contextPath}/user/findPw.do',
//            data: {
//             id: $('#id').val(),
//                email: $('#email').val()
//              },
//             dataType: 'json',
//           success: function(resData) {
//            alert("resDat"+resData);
//           }
//         });
//       });
//   }

//         $.ajax({
//           url: '${contextPath}/user/findPw',
//           type: 'post',
//           contentType: 'application/json',
//           data: JSON.stringify({
//             'id': $('#id').val(),
//             'email': $('#email').val()
//           }),
//           dataType: 'json',
//           success: function(resData){
//             if(resData.findUser != null){
//               resolve(resData.findUser);
//             } else {
//               reject('일치하는 회원 정보가 없습니다.');
//             }
//           }
//         });   
//       }).then(function(findUser){
//         $.ajax({
//           url: '${contextPath}/user/sendTemporaryPassword',
//           type: 'post',
//           data: 'userNo=' + findUser.userNo + '&email=' + findUser.email,
//           dataType: 'json',
//           success: function(resData){
//             if(resData.isSuccess){
//               alert('등록된 이메일로 임시 비밀번호가 발송되었습니다.');
//               location.href = '${contextPath}';
//             }
//           }
//         });
//       }).catch(function(msg){
//         alert(msg);
//       });

</script>
</head>
<body>
  
  <h1>비밀번호 찾기</h1>
  
  <hr>
  
  <div>
    <form id="frmFindPw" method="post" action="${contextPath}/user/findPw.do">
    
      <div>
        <label for="id">
          *아이디<br>
          <input type="text" name="id" id="id">
        </label>
      </div>
      
      <div>
        <label for="email">
          *이메일<br>
          <input type="text" name="email" id="email">
        </label>
      </div>
      
      <button>임시 비밀번호 발급</button>
<!--       <input type="button" value="임시 비밀번호 발급" id="btn_findPw"> -->
      <br><br>
      
      <div>
        <a href="${contextPath}/user/login/form">로그인</a> / 
        <a href="${contextPath}/user/findId/form">아이디 찾기</a> /
        <a href="${contextPath}/user/agree/form">회원가입</a>
      </div>
      
    </form>
  </div>
  
</body>
</html>