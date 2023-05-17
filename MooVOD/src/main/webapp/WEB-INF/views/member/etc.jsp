<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 페이지</title>
</head>
<body>
	<form action="/login" method="post">
		<input type="text" name="id" placeholder="아이디" />
		<input type="password" name="password" placeholder="비밀번호" />
		<button>로그인</button>
	</form>
</body>
</html>
