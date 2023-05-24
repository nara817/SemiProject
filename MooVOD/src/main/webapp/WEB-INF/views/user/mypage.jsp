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
<script>


  // 전역 변수 (각종 검사 통과 유무를 저장하는 변수)
  var verifyPw = false;
  var verifyRePw = false;
  var verifyName = false;
  var verifyMobile = false;
  var verifyEmail = false;
  
  
  // 함수 정의
  
  function fnEditPwInit(){
    $('#pw').val('');
    $('#rePw').val('');
    $('#msgPw').val('');
    $('#msgRePw').val('');
  }
  
  function fnToggleEditPwArea(){
    $('#editPw').hide();
    $('#btnOpenEditPw').on('click', function(){
      fnEditPwInit();
      $('#btnOpenEditPw').hide();
      $('#editPw').show();
    });
    $('#btnCloseEditPw').on('click', function(){
      fnEditPwInit();
      $('#btnOpenEditPw').show();
      $('#editPw').hide();
    });
  }
  
  // 2. 비밀번호 검사 (정규식)
  function fnCheckPw(){
    
    $('#pw').on('keyup', function(){
    
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
        $('#msgPw').text('사용 가능한 비밀번호입니다.');
      } else {
        $('#msgPw').text('4~20자, 소문자+대문자+숫자+특수문자 사용 가능, 3개 이상 조합');
      }
    
    })
    
  }
  
  // 3. 비밀번호 확인
  function fnCheckPwAgain(){
    
    $('#rePw').on('keyup', function(){
      
      // 입력된 비밀번호
      let pw = $('#pw').val();
      
      // 재입력한 비밀번호
      let rePw = $(this).val();
      
      // 비밀번호와 재입력한 비밀번호 검사
      verifyRePw = (rePw != '') && (rePw == pw);
      if(verifyRePw){
        $('#msgRePw').text('');
      } else {
        $('#msgRePw').text('비밀번호 입력을 확인하세요.');
      }
      
    })
    
  }
  
  // 4. 이름
  function fnCheckName(){
    
    $('#name').on('keyup', function(){
      verifyName = $(this).val() != '';
    })
    
  }
  
  // 5. 휴대전화
  function fnCheckMobile(){
    
    $('#mobile').on('keyup', function(){
      
      // 입력한 휴대전화
      let mobile = $(this).val();
      
      // 정규식
      let regMobile = /^010[0-9]{7,8}$/;
      
      // 정규식 검사
      verifyMobile = regMobile.test(mobile);
      if(verifyMobile){
        $('#msgMobile').text('');
      } else {
        $('#msgMobile').text('휴대전화 입력을 확인하세요.');        
      }
      
    })
    
  }
  
  // 6. 년/월/일
  function fnCreateDate(){
    
    // 년도(100년 전 ~ 1년 후)
    let year = new Date().getFullYear();
    let strYear = '<option value="">년도</option>';
    for(let y = year - 100; y <= year + 1; y++){
      strYear += '<option value="' + y + '">' + y + '</option>';
    }
    $('#birthyear').append(strYear);
    
    // 월(1 ~ 12월)
    let strMonth = '<option value="">월</option>';
    for(let m = 1; m <= 12; m++){
      if(m < 10){
        strMonth += '<option value="0' + m + '">' + m + '월</option>';
      } else {
        strMonth += '<option value="' + m + '">' + m + '월</option>';
      }
    }
    $('#birthmonth').append(strMonth);
    
    // 일(월에 따른 연동)
    $('#birthdate').append('<option value="">일</option>');
    
    $('#birthmonth').on('change', function(){
      
      $('#birthdate').empty();
      $('#birthdate').append('<option value="">일</option>');
      let endDay = 0;
      let strDay = '';
      switch($(this).val()){
      case '02':
        endDay = 29; break;
      case '04':
      case '06':
      case '09':
      case '11':
        endDay = 30; break;
      default:
        endDay = 31; break;
      }
      for(let d = 1; d <= endDay; d++){
        if(d < 10){
          strDay += '<option value="0' + d + '">' + d + '일</option>';
        } else {
          strDay += '<option value="' + d + '">' + d + '일</option>';
        }
      }
      $('#birthdate').append(strDay);
      
    });
    
  }
  
  // 7. 이메일 검사 및 인증코드 전송
  function fnCheckEmail(){
    
    $('#btnGetCode').on('click', function(){
      
      // 입력한 이메일
      let email = $('#email').val();
      
      new Promise(function(resolve, reject){
        
        // 정규식
        let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]{2,}(\.[a-zA-Z]{2,6}){1,2}$/;
        //
        //                  gt_min     @ naver         (.com)
        //                                             (.co)(.kr)
        
        // 정규식 검사
        verifyEmail = regEmail.test(email);
        if(verifyEmail == false){
          reject(1);  // catch 메소드에 정의된 function을 호출한다. 인수로 1을 전달한다.
          return;
        }
        
        // 이메일 중복 체크
        $.ajax({
          type: 'get',
          url: '${contextPath}/user/verifyEmail.do',
          data: 'email=' + email,
          dataType: 'json',
          success: function(resData){  // resData = {"enableEmail": true} 또는 {"enableEmail": false}
            if(resData.enableEmail){
              resolve();  // then 메소드에 정의된 function을 호출한다.
            } else {
              reject(2);  // catch 메소드에 정의된 function을 호출한다. 인수로 2을 전달한다.
            }
          }
        })
        
      }).then(function(){
        
        // 이메일로 인증번호를 보내는 ajax
        $.ajax({
          type: 'get',
          url: '${contextPath}/user/sendAuthCode.do',
          data: 'email=' + email,
          dataType: 'json',
          success: function(resData){  // resData = {"authCode": "6T43G9"}  사용자에게 전송한 인증코드를 의미
            
            alert(email + "으로 인증코드를 전송했습니다.");
            
            // 메일로 받은 인증코드 입력 후 인증하기 버튼을 클릭한 경우
            $('#btnVerifyCode').on('click', function(){
              
              verifyEmail = (resData.authCode == $('#authCode').val());  // 사용자에게 전송한 인증코드 == 사용자가 입력한 인증코드값
              if(verifyEmail) {
                alert('인증되었습니다.');
              } else {
                alert('인증에 실패했습니다.');
              }
              
            })
            
          },
          error: function(jqXHR){
            alert('인증번호가 발송되지 않았습니다.');
            verifyEmail = false;
          }
        })
        
      }).catch(function(number){
        
        let msg = '';
        switch(number){
        case 1:
          msg = '이메일 형식이 올바르지 않습니다.';  // 정규식 실패
          break;
        case 2:
          msg = '이미 사용 중인 이메일입니다.';      // 이메일 중복 체크 실패
          break;
        }
        $('#msgEmail').text(msg);
        verifyEmail = false;
        
      })
      
    })
    
  }
  
  // 8. submit (회원가입)
  function fnJoin(){

    $('#frmJoin').on('submit', function(event){
      
      if(verifyId == false){
        alert('아이디를 확인하세요.');
        event.preventDefault();
        return;
      } else if(verifyPw == false || verifyRePw == false){
        alert('비밀번호를 확인하세요.');
        event.preventDefault();
        return;
      } else if(verifyName == false){
        alert('이름을 확인하세요.');
        event.preventDefault();
        return;
      } else if(verifyMobile == false){
        alert('휴대전화번호를 확인하세요.');
        event.preventDefault();
        return;
      } else if($('#birthyear').val() == '' || $('#birthmonth').val() == '' || $('#birthdate').val() == ''){
        alert('생년월일을 확인하세요.');
        event.preventDefault();
        return;
      } else if(verifyEmail == false){
        alert('가입을 위해서 이메일 인증이 필요합니다.');
        event.preventDefault();
        return;
      }
      
    })
    
  }
  
  // 함수 호출
  $(function(){
    fnToggleEditPwArea();
    fnCheckPw();
    fnCheckPwAgain();
    fnCheckName();
    fnCheckMobile();
    fnCreateDate();
    fnCheckEmail();
    fnJoin();
  })

</script>
</head>
<body>

  <div>
    <h1>마이페이지</h1>
    <hr>
  
  </div>
      
      <div>
        <button>개인정보수정완료</button>
        <button type="button" onclick="location.href='modifyInfo.form' ">회원정보수정</button>
      </div>
    
    </form>
  
  </div>
  
</body>
</html>