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
  body {
    font-family: Arial, sans-serif;
    padding: 20px;
  }

  h1 {
    text-align: center;
    margin-bottom: 30px;
  }

  .movie-list {
    list-style-type: none;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
  }

  .movie-item {
    width: calc(20% - 20px);
    background-color: #f2f2f2;
    border-radius: 8px;
    margin-bottom: 20px;
    padding: 20px;
    box-sizing: border-box;
    margin-right: 20px;
  }

  .movie-name {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
  }

  .movie-info {
    margin-bottom: 10px;
  }

  .watch-movie-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    text-decoration: none;
  }

  .watch-movie-button:hover {
    background-color: #45a049;
  }

  /* 추가된 부분 */
  @media (min-width: 992px) {
    .movie-list {
      justify-content: center;
    }
    
    .movie-item {
      margin-right: 40px;
      margin-top: 10px;
    }

  }
  .buy {
      margin-top: 50px;
    }  

</style>

<body>
  <c:if test="${not empty myList}">
  <h1 class="buy">구매내역</h1>
    <ul class="movie-list">
      <!-- 구매한 영화 -->
      <c:forEach var="vod" items="${myList}">
        <li class="movie-item">
          <div class="movie-name">${vod.vodTitle}</div>
          <div class="movie-info">
            <span>구매일:</span> ${vod.purchaseDate}<br>
            <span>가격:</span> ${vod.purchaseLastPrice}원
          </div>
          <c:url value="${vod.vodYoutube}" var="youtube"></c:url>    
          <a href="${youtube}" class="watch-movie-button">영화보기</a>
        </li>
     </c:forEach>
    </ul>
  </c:if>
  <c:if test="${empty myList}">
    <hr>
    <h1>구매 한 영화가 없습니다.</h1>
  </c:if>

  <hr>
  
  <c:if test="${not empty myZzim}">
  <h1 class="buy">찜목록</h1>
    <ul class="movie-list">
      <!-- 찜한 영화 -->
      <c:forEach var="zzim" items="${myZzim}">
        <li class="movie-item">
          <div class="movie-name"><a href="${contextPath}/vod/vodDetail.form?vodNo=${zzim.vodNo}">${zzim.vodTitle}</a></div>
        </li>
     </c:forEach>
    </ul>
  </c:if>
  <c:if test="${empty myZzim}">
    <hr>
    <h1>찜한 VOD가 없습니다.</h1>
  </c:if>  


        
<jsp:include page="../layout/footer.jsp" />