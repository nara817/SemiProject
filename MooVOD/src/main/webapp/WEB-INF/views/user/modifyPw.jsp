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
<title>회원정보수정</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<link href="${contextPath}/resources/css/modifyForm.css" rel="stylesheet" />
<script>

</script>
<title>Insert title here</title>
</head>
<body>
<body>

  <div>
  
    <h1>비밀번호 변경</h1>
  
    <div>* 표시는 필수 입력사항입니다.</div>
    
    <hr>
    
    <form id="modifyInfo" method="post" action="${contextPath}/user/modifyInfo.do">
    
      <!-- agree.jsp에서 전달된 location, event 속성 -->
      <input type="hidden" name="location" value="${location}">
      <input type="hidden" name="event" value="${event}">
  
      <div>
        <label for="id">아이디*</label>
        <input type="text" name="id" id="id" value="${user.id}" readonly>
        <span id="msgId"></span>
      </div>
      
       <div>
        <label for="pw">비밀번호*</label>
        <input type="password" name="pw" id="pw" value="${user.pw}" readonly>
        <input type="password" name="pw" id="pw">
        <span id="msgPw"></span>
      </div> 
     
      
      <div>
        <label for="name">이름*</label>
        <input type="text" name="name" id="name" value="${user.name}" readonly>
      </div>
      
      <div>
        <span>성별*</span>
        <input type="radio" name="gender" id="none" value="NO" ${user.gender.equals("NO") ? "checked" : ""}>
        <label for="none">선택 안함</label>
        <input type="radio" name="gender" id="male" value="M" ${user.gender.equals("M") ? "checked" : ""}>
        <label for="male">남자</label>
        <input type="radio" name="gender" id="female" value="F" ${user.gender.equals("F") ? "checked" : ""}>
        <label for="female">여자</label>
      </div>
    
      <div>
        <label for="mobile">휴대전화*</label>
        <input type="text" name="mobile" id="mobile" value="${user.mobile}" >
        <span id="msgMobile"></span>
      </div>
    
      <div>
        <label for="birthyear">생년월일*</label>
        <select name="birthyear" id="birthyear"></select>
        <select name="birthmonth" id="birthmonth" ></select>
        <select name="birthdate" id="birthdate" ></select>
      </div>
      
      <div>
        <input type="text" onclick="execDaumPostcode()" name="postcode" id="postcode" placeholder="우편번호" value="${user.postcode}" readonly="readonly">
        <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
        <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" value="${user.roadAddress}">
        <input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소" value="${user.jibunAddress}"><br>
        <span id="guide" style="color:#999;display:none"></span>
        <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="${user.detailAddress}">
        <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" value="${user.extraAddress}">
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            // 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수
        
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }
        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('postcode').value = data.zonecode;
                        document.getElementById("roadAddress").value = roadAddr;
                        document.getElementById("jibunAddress").value = data.jibunAddress;
                        
                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if(roadAddr !== ''){
                            document.getElementById("extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("extraAddress").value = '';
                        }
        
                        var guideTextBox = document.getElementById("guide");
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if(data.autoRoadAddress) {
                            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                            guideTextBox.style.display = 'block';
        
                        } else if(data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else {
                            guideTextBox.innerHTML = '';
                            guideTextBox.style.display = 'none';
                        }
                    }
                }).open();
            }
        </script>
      </div>
      
      <div>
        <label for="email">이메일*</label>
        <input type="text" name="email" id="email" value="${user.email}">
        <input type="button" value="인증번호받기" id="btnGetCode">
        <span id="msgEmail"></span><br>
        <input type="text" id="authCode" placeholder="인증코드 입력">
        <input type="button" value="인증하기" id="btnVerifyCode">
      </div>
      
      <hr>
      
      <div>
        <button>수정하기</button>
        <input type="button" value="취소하기">
      </div>
    
    </form>
  
  </div>

    <script>
    </script>
</body>
</html>