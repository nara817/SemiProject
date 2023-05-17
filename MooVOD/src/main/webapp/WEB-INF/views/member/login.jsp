<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="../resources/css/login.css">
<!-- 로그인버튼 -->
<link href="https://fonts.googleapis.com/css?family=Poppins:600" rel="stylesheet">
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<!-- css 각각 wrap 싸주기  -->
		<div class="logo_wrap">
		<!-- <span>임시 로고</span> -->
			
 			 <img src="${contextPath}/resources/images/logo.jpg" alt="로고" onclick="fnmain">
			
		</div>
		<div class="login_area">
			<!-- 아이디 -->
			<div class="login_wrap">
				<div class="id_wrap">
					<div class="id_input_box">
						<label for="user_id">
						<input type="text" class="id_input" id="user_Id" name="user_Id" placeholder="ID" required>
						</label>
					</div>
				</div>
				<!-- 비밀번호 -->
				<div class="pw_wrap">
					<div class="pw_input_box">
						<label for="user_Pw">
						<input type="password" class="pw_input" id="user_Pw" name="user_Pw" placeholder="PW" required>
						</label>
					</div>
				</div>
				<!-- 아이디 기억 -->
				<div class="id_checkbox_wrap">
					<div class="id_checkbox">
						<label for="save_Id">
						<input type="checkbox" class="id_checkbox_input" id="save_Id" name="save_Id">아이디 기억 
						</label>
					</div>
				
				<!-- 자동 로그인 
				<div class="auto_login_wrap">-->
					<div class="auto_loginbox">
						<label for="auto_login">
						<input type="checkbox" class="auto_login_input" id="auto_login" name="auto_login">자동 로그인
						</label>
					</div>
				</div>
				
				<!-- 로그인  -->
				<div class="login_button_wrap">
					<label for="login">
					<input type="button" class="login_button" id="login" name="login" value="로그인">
					</label>
				</div>
				<div class="link">
					<!-- 아이디 찾기 -->
					<div class="id_search_wrap">
						<a href="id_search" title="ID찾기">ID찾기</a>
					</div>

					<span class="divider">&nbsp;&nbsp;│&nbsp;&nbsp;</span>

					<!-- pw 찾기 -->
					<div class="pw_search_wrap">
						<a href="pw_search" title="PW찾기">PW찾기</a>
					</div>

					<span class="divider">&nbsp;&nbsp;│&nbsp;&nbsp;</span>

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
	
		$('#fnmain').on("click", function(){
			location.href = "${contextPath}/main";	
		});
	
		$(function() {
			// 아이디 저장 체크박스 클릭 시 쿠키 생성
			$("#save_id").on("click", function() {
				var checked = $(this).prop("checked"); // 체크 여부 확인
				var userId = $("#user_Id").val(); // 입력된 아이디 값

				if (checked) { // 체크된 경우
					// 쿠키 생성 (1주일간 유지)
					$.cookie("savedId", userId, {
						expires : 7,
						path : '/'
					});
				} else { // 체크 해제된 경우
					// 쿠키 삭제
					$.removeCookie("savedId", {
						path : '/'
					});
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
