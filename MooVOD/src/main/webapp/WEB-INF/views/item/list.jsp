<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp"></jsp:include>

<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5 item">
     	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${itemList}" var="item">
             <div class="col mb-5">
                 <div class="card h-100" style="cursor: pointer;" onclick="location.href='${contextPath}/item/detail.do?itemId=' + ${item.itemId}">
                     <img class="card-img-top" src='${contextPath}/resources/images/${item.itemImg}' alt="..." />
                     <div class="card-body p-4">
                         <div class="text-center">
                             <h5 class="fw-bolder">${item.itemName}</h5>
                             ${item.itemPrice}
                         </div>
                     </div>
                 </div>
             </div>
  			</c:forEach>
        </div>
        <div>
          <button id="mycart" class="btn btn-outline-dark" type="submit" onclick="location.href='${contextPath}/item/cartlist.do'">
            <i class="bi-cart-fill me-1"></i>Cart
          </button>
        </div>
    </div>
    
</section>
<style>
#mycart {
   position: fixed;
   top: 20px;
   right: 20px;
   z-index: 9999;
   background-color: #4CAF50;
   color: #fff;
   border: none;
   border-radius: 4px;
   padding: 10px 20px;
   font-size: 16px;
   cursor: pointer;
 }
</style>
	
<jsp:include page="../layout/footer.jsp"></jsp:include>