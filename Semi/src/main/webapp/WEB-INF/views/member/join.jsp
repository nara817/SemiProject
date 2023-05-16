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
<!-- 카카오 주소API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<head>
	<title>회원가입 페이지</title>
</head>
<body>
<form method="GET">
			<!-- 아이디 -->
			<div class="join_wrap">
				<div>
					<h2>회원가입</h2>
				</div>
				<label for="user_id">아이디</label>
					<input type="text" class="form-control" id="user_id" name="user_id" placeholder="영문,숫자 조합(8~12자)" required>
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- 비밀번호 -->
			<div class="join_wrap">
				<label for="user_pw">비밀번호</label>
					<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" required>
				<div class="check_font" id="pw_check"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="join_wrap">
				<label for="user_pw2">비밀번호 확인</label>
					<input type="password" class="form-control" id="user_pw2" name="user_pw2" placeholder="Confirm Password" required>
				<div class="check_font" id="pw2_check"></div>
			</div>
			<!-- 이름 -->
			<div class="join_wrap">
				<label for="user_name">이름</label>
					<input type="text" class="form-control" id="user_name" name="user_name" placeholder="Name" required>
				<div class="check_font" id="name_check"></div>
			</div>
			<!-- 생년월일 -->
			<div class="form-group required">
				<label for="user_birth">생년월일</label>
					<input type="text" class="form-control" id="user_birth" name="user_birth" placeholder="ex) 19990415" required>
				<div class="check_font" id="birth_check"></div>
			</div>
			<!-- 본인확인 이메일 -->
			<div class="join_wrap">
				<label for="user_email">이메일</label>
					<input type="text" class="form-control" name="user_email" id="user_email" placeholder="E-mail" required>
					<div class="check_font" id="email_check"></div>
			</div>
			<!-- 휴대전화 -->
			<div class="join_wrap">
				<label for="user_phone">휴대폰</label>
				<input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="'-' 없이 번호만 입력해주세요" required>
				<div class="check_font" id="phone_check"></div>
			</div>

			
	<div>
        <div>
            <label for="address">주소</label>
				<input type="text" id="address_kakao" name="address" readonly />
        </div>
    </div>
    
    <div>
        <div>
            <label for="address_detail">상세 주소</label>
            	<input type="text" name="address_detail" />
        </div>
    </div>
	<div class="reg_button">
		<button type="submit" id="submit1" class="btn btn-primary btn-lg">회원가입</button>
	</div>
		</form>
<script>

window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</body>
</html>