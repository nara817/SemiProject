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
 <style>
    .popup {
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }
    
    .popup-message {
      font-size: 18px;
      margin-bottom: 20px;
    }
    
    .popup-buttons {
      display: flex;
      justify-content: center;
    }
    
    .popup-button {
      margin: 0 10px;
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="popup">
    <p class="popup-message">현재 VOD를 찜 하시겠습니까?</p>
    <div class="popup-buttons">
      <form method="post" action="${contextPath}/vod/ZzimYes.do">
        <button class="popup-button" onclick="fnZzimYes()">네</button>
        <input type="hidden" value="${vodNo}" name="vodNo">
        <input type="hidden" value="${id}" name="id">
      </form>
      <button class="popup-button" onclick="fnZzimNo()">아니요</button>
    </div>
  </div>

  <script>
    function fnZzimYes() {
      // 네 버튼 클릭 시 실행할 동작
      submit();
      alert("찜이 완료 됐습니다");
      window.close(); // 팝업 창 닫기
    }
    
    function fnZzimNo() {
      // 아니요 버튼 클릭 시 실행할 동작
      window.close(); // 팝업 창 닫기
    }
  </script>
  
</body>
</html>