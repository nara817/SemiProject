<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp"></jsp:include>

<!-- Product section-->
<section class="py-5">

    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${contextPath}/resources/images/${item.itemImg}" /></div>
            <div class="col-md-6">
                <h2>${item.itemName}</h2>
   				<span class="icon">       </span>
    			<div class="xans-element- xans-product xans-product-detaildesign"><!-- 출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.-->
					<table>
						<tbody>
							<tr class=" xans-record-">
								<th scope="row"><span style="font-size:16px;color:#000000;font-weight:bold;">판매가</span></th>
		            <td><span style="font-size:16px;color:#000000;font-weight:bold;"><strong id="span_product_price_text">${item.itemPrice}</strong><input id="itemPrice" name="itemPrice" value="${item.itemPrice}" type="hidden"  /></span></td>
			        </tr>
							<tr class=" xans-record-">
								<th scope="row"><span style="font-size:15px;color:#555555;">국내·해외배송&nbsp;&nbsp;  </span></th>
		           	<td><span style="font-size:15px;color:#555555;">국내배송</span></td>
			        </tr>
						    <tr class=" xans-record-">
								<th scope="row"><span style="font-size:15px;color:#555555;">배송방법</span></th>
		            <td><span style="font-size:15px;color:#555555;">택배</span></td>
			        </tr>
							<tr class=" xans-record-">
								<th scope="row"><span style="font-size:15px;color:#555555;">배송비</span></th>
		            <td><span style="font-size:15px;color:#555555;"><span class="delv_price_B"><input id="shipFee" name="shipFee" value=3000 type="hidden"  /><strong>3,000</strong> (30,000 이상 구매 시 무료)</span></span></td>
			        </tr>
							<tr class=" xans-record-">
			        </tr>
						</tbody>
						<tbody class="displaynone">
					</table>
				</div>
           	<form name="frm_addCart" method="post" action="${contextPath}/item/addcart.do">
         			<input type="hidden" name="itemId" value="${item.itemId}">
         			<input type="hidden" name="itemPrice" value="${item.itemPrice}">
	          	<select name="amount">
	          		<c:forEach begin="1" end="10" var="i">
	          			<option value="${i}">${i}</option>
	          		</c:forEach>
	          	</select>&nbsp; 개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          	<input type="submit" id="addcart" value="장바구니">
		        </form>
           
            
            <button id="mycart" class="btn btn-outline-dark" type="submit" onclick="location.href='${contextPath}/item/cartlist.do'">
              <i class="bi-cart-fill me-1"></i>Cart
            </button>
            
      		</div>
    	</div>
    	<div style="padding:30px;"> 
		</div>

    <div class="col-md-6"><img src="${contextPath}/resources/images/9${item.itemImg}" alt="..." /></div>

</section>
<script>


</script>
<style>
 #addcart {
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