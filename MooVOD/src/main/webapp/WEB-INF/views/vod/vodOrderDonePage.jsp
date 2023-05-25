<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp">
  <jsp:param name="title" value="VodOrderDone"/>
</jsp:include>
<style>
.order-page {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f2f2f2;
}

.order-page h1, .order-page p {
  text-align: center;
  color: #333;
}

.order-page .button-container {
  margin-top: 20px;
}

.order-page .confirm-button, .order-page .watch-movie-button {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  text-decoration: none;
  margin-right: 10px;
}

.order-page .confirm-button:hover, .order-page .watch-movie-button:hover {
  background-color: #45a049;
}

</style>
</head>
<body>
  <div class="order-page">
    <h1>주문이 완료되었습니다!</h1>
    <p>${vod.id} 회원님, 주문이 완료되었습니다.</p>
    <div class="button-container">
      <a href="${contextPath}/vod/vodList.form" class="confirm-button">확인</a>
      <c:url value="${vodYoutube.vodYoutube}" var="youtube"></c:url>    
      <a href="${youtube}" class="watch-movie-button">영화보기</a>
    </div>
  </div>

        
<jsp:include page="../layout/footer.jsp" />