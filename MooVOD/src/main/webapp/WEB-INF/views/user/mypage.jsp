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
<title>MyPage</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script>

</script>
</head>
<body>

    <div>
        <h1 class="h2">마이페이지</h1>
    </div>

    <div>
    <a href="${contextPath}/user/modifyInfo.form">회원정보수정</a>
    <a href="#">비밀번호 변경</a>
    <a href="#">구매 목록</a>
    <a href="#">찜 목록</a>
    </div>


  
</body>
</html>