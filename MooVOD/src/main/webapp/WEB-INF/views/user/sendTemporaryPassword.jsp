<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MooVOD : 임시 비밀번호발송</title>
<script src="${contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<script>

</script>
</head>
<body>
  
  <h1>비밀번호 찾기</h1>
  
  <div>
    <form>
    <span>임시 비밀번호가 이메일로 발송되었습니다.</span>

      <div>
        <a href="${contextPath}/user/login.form">로그인</a>
        <a href="${contextPath}/user/modifyPw.form">비밀번호변경</a>
      </div>
      
    </form>
  </div>
  
</body>
</html>