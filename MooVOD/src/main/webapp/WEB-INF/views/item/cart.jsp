<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp"></jsp:include>


	<h2>장바구니</h2>
	<c:choose>
		<c:when test="${item  .count == 0 }">
		장바구니가 비었습니다.
		</c:when>
		<c:otherwise>
			<form name="frm" method="post" action="${contextPath}/item/modify.do">
				<table border="1" style="width: 100%">
					<tr>
						<th>상품명</th>
						<th>수량</th>
						<th>가격</th>
						<th>총 금액</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach var="item" items="${itemCart}">
						<tr>
							<td>${item.itemId}</td>
							<td>${item.amount}</td>
							<td>${item.itemPrice}</td>
							<td>${item.amount * item.itemPrice}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="center">
							장바구니 금액 합계 : ${item.amount * itemPrice}<br>
							배송료					: ${item.fee}<br>
							총 합계					: ${item.sum}
						</td>
					</tr>
				</table>	
				<button id="btnUpdate">수정</button>
				<button id="btnDelete">장바구니 비우기</button>
			</form>
		</c:otherwise>
	</c:choose>
	<button id="btnList">상품목록</button>
	
<script>
	
	$(function(){
		$('#btnList').click(function(){
			location.href="${contextPath}/item/list.do";
		});
		
		$('#btnUpdate').click(function(){
			location.href="${contextPath}/item/modify.do";
		});
		
		$('#btnDelete').click(function(){
			if(confirm("장바구니를 비우시겠습니까?")){
				location.href="${contextPath}/item/removeList.do"
			}
		})
	})
	
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>