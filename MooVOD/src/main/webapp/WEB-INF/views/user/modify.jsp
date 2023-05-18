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
<title>회원정보수정</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="/mvc/memberUpdate.do" method="post">
<input type="hidden" name="num" value="${vo.num }">
  <table class="table table-borderd" width: 628px">
    <colgroup>
      <col style="width: 105px">
      <col style="width: 523px">
    </colgroup>
    <thead>
      <tr>
        <th>번호</th>
        <th>${vo.num }</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>아이디</td>
        <td>${vo.id }</td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td>${vo.pass }</td>
      </tr>
      <tr>
        <td>이름</td>
        <td>${vo.name }</td>
      </tr>
      <tr>
        <td>나이</td>
        <td><input type="text" name="age" value="${vo.age }"></td>
      </tr>
      <tr>
        <td>전화번호</td>
        <td><input type="text" name="phone" value="${vo.phone }"></td>
      </tr>
      <tr>
        <td>이메일</td>
        <td><input type="text" name="email" value="${vo.email }"></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="수정하기 ">
          <input type="reset" value="취소">
          <input type="button" value="리스트">
        </td>
      </tr>
    </tbody>
  </table>
</form>
</body>
</html>