<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<jsp:include page="../layout/header.jsp">
  <jsp:param name="title" value="VodOrder"/>
</jsp:include>
<script>
$(function(){
	  fnCoupon();
	})
var IMP = window.IMP; // 생략 가능
IMP.init("imp60175747"); // 예: imp00000000a

function requestPay() {
    IMP.request_pay({
        pg : "kakaopay", 
          pay_method : 'card',
          merchant_uid : 'merchant_' + new Date().getTime(),
          name : '결제',
          amount : $('#salePrice').text(), 
          buyer_name : '구매자 이름',
          buyer_tel : '구매자 번호',
          buyer_addr : '구매자 주소',
          buyer_postcode : '구매자 주소',
          m_redirect_url : 'redirect url'
      }, function(rsp) {
          if ( rsp.success ) {
        	  $('#purchasLastPrice').val($('#salePrice').text());
        	  $('#payDone').submit();
          } else {
              var msg = '결제에 실패하였습니다.';
              rsp.error_msg;
              
          }
      });
}
function fnCouponUsed(){
	 var couponName = encodeURIComponent($('#couponName').val());
}
function fnCoupon(){
	$.ajax({
		type: 'get',
		url: '${contextPath}/vod/useCoupon.do',
		data: $('#frmUseCoupon').serialize(),
		dataType: 'text',
		success: function(resData){
			$('#salePrice').text(resData);
		}
	})
}


</script>
<style>
.j {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}


</style>



        
    <!-- Section-->
    <div class="j">
      <div><img src="${vodDetail.vodPhoto}" width="150px"></div>
      <div id="vodName">VOD 이름: ${vodDetail.vodTitle}</div>
      <div id="vodPrice">할인 전 가격: ${vodDetail.vodPrice}</div>
      <div>
        <form id="frmUseCoupon">
          <select name="couponName" onchange="fnCoupon()">
            <option value="쿠폰사용안함">쿠폰사용안함</option>
          <c:forEach items="${coupon}" var="coupon">
            <option value="${coupon.couponName}">${coupon.couponName}</option> 
          </c:forEach>
          </select>
          <input type="hidden" value="${vodDetail.vodPrice}" name="vodPrice">
          <input type="hidden" value="${sessionScope.loginId}" value="id" />
        </form>
      </div>
      <span>할인 후 가격 : </span><div id="salePrice"></div>
    </div>
    <form id="payDone" method="post" action="${contextPath}/vod/vodOrderDone.form">
      <input type="hidden" name="vodNo" value="${vodDetail.vodNo}" />
      <input type="hidden" name="vodPrice" value="${vodDetail.vodPrice}" />
      <input type="hidden" name="id" value="${sessionScope.loginId}"/>
      <input type="hidden" name="purchasLastPrice" id="purchasLastPrice" />
    </form>
        <section class="py-5">
          <c:if test="${sessionScope.loginId eq null}">
            로그인 해주세요 
          </c:if>
          <c:if test="${sessionScope.loginId ne null}">          
            <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
          </c:if> 
        </section>
    
<jsp:include page="../layout/footer.jsp" />
    