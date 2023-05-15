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
<title>로그인 페이지</title>
<link rel="stylesheet" href="../resources/css/login.css">
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
</head>
<body>
	<div class="wrapper"><!-- css 각각 wrap 싸주기  -->
		<div class="logo_wrap">
			<span>임시 로고</span>
		</div>
		<div class="login_area">
		<!-- 아이디 -->
		<div class="login_wrap">
			<div class="id_wrap">
				<label for="user_id"></label>
				<div class="id_input_box">
					<input type="text" class="id_input" id="user_Id" name="user_Id" placeholder="ID" required>
				</div>
			</div>
			<!-- 비밀번호 -->
			<div class="pw_wrap">
				<div class="pw_input_box">
					<label for="user_Pw"></label>
						<input type="password" class="pw_input" id="user_Pw" name="user_Pw" placeholder="PW" required>
				</div>
			</div>
			<!-- 아이디 저장 -->
			<div class="id_checkbox_wrap">
				<div class="id_checkbox">
        		<input type="checkbox" class="id_checkbox_input"  id="save_Id" name="save_Id">
        		<label for="save_Id">아이디 저장</label>
				</div>
			</div>
			<!-- 로그인  -->
			<div class="login_button_wrap">
				<label for="login"></label>
					<input type="button" class="login_button" id="login" name="login" value="로그인">
			</div>
			<div class="link">
				<!-- 아이디/pw찾기 -->
				<div class="search_wrap">
					<a href="member_fiend" title="ID/PW찾기">ID/PW찾기</a>
				  </div>
				  
				  <span class="divider">│</span>
				  
				<!-- 회원가입 페이지로 이동 -->
				  <div class="move_join_wrap">
				    <div class="move_join_box">
						<a href="member_join" title="회원가입">회원가입</a>
				    </div>
				  </div>
			  </div>
			</div>
	</div>
</div>
<script>
  $(function() {
    // 아이디 저장 체크박스 클릭 시 쿠키 생성
    $("#save_id").on("click", function() {
      var checked = $(this).prop("checked"); // 체크 여부 확인
      var userId = $("#user_Id").val(); // 입력된 아이디 값

      if (checked) { // 체크된 경우
        // 쿠키 생성 (1주일간 유지)
        $.cookie("savedId", userId, { expires: 7, path: '/' });
      } else { // 체크 해제된 경우
        // 쿠키 삭제
        $.removeCookie("savedId", { path: '/' });
      }
    });

    // 페이지 로드 시 쿠키가 있다면 아이디 입력란에 값 설정
    var savedId = $.cookie("savedId");
    if (savedId !== undefined) {
      $("#user_Id").val(savedId);
      $("#save_id").prop("checked", true);
    }
  });
</script>


</html>
