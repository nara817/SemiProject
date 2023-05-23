<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link href="${contextPath}/resources/css/login2.css" rel="stylesheet" />
</head>
<body>
  <div class="login-container">
    <h2>로그인</h2>
    <input type="text" id="username" placeholder="아이디">
    <input type="password" id="password" placeholder="비밀번호">
    <button id="login-button">로그인</button>
    <div class="checkbox-container">
      <label>
        <input type="checkbox" id="remember-me">
        아이디 기억
      </label>
      <label>
        <input type="checkbox" id="auto-login">
        자동 로그인
      </label>
    </div>
    <div>
      <a href="${contextPath}/user/findId.jsp">아이디 찾기</a> | 
      <a href="${contextPath}/user/findPw.jsp">비밀번호 찾기</a> |
      <a href="${contextPath}/user/agree.jsp">회원가입</a>
    </div>
  </div>

  <script src="script.js"></script>
</body>
</html>