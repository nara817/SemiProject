<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
  #myVod {
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
<jsp:include page="../layout/header.jsp" />

    <!-- Section-->
        <section class="py-5 position-relative"> 
              <!-- 마이페이지 -->
              <input type="button" onclick="fnMyVod()" id="myVod" value="VodMyPage" class="position-absolute top-0 end-0 mt-3 me-3">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                 <c:forEach items="${vodList}" var="vod">
                      <div class="col mb-5">
                          <div class="card h-100">
                              <!-- vod 이미지 -->
                              <a href="${contextPath}/vod/vodDetail.form?vodNo=${vod.vodNo}"><img class="card-img-top" src="${vod.vodPhoto}" alt="..." /></a>
                              <!-- 영화 상세보기-->
                              <div class="card-body p-4">
                                  <div class="text-center">
                                      <!-- 영화 보기-->
                                      <h5 class="fw-bolder"><a href="${contextPath}/vod/vodDetail.form?vodNo=${vod.vodNo}">${vod.vodTitle}</a></h5> 
                                      <!-- 영화 평점 c:if로 해당 영화 별점 주기 -->
                                      <div class="d-flex justify-content-center small text-warning mb-2">
                                          <c:choose>
                              <c:when test="${vod.vodStar eq 1}">
                                <div class="bi-star-fill"></div>
                              </c:when>
                              <c:when test="${vod.vodStar eq 2}">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                              </c:when>
                              <c:when test="${vod.vodStar eq 3}">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                              </c:when>
                              <c:when test="${vod.vodStar eq 4}">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                              </c:when>
                              <c:otherwise>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                              </c:otherwise>
                            </c:choose>
                                      </div>
                                      <!-- 영화 가격-->
                                      ${vod.vodCategory}
                                      <br>
                                      ${vod.vodPrice}
                                  </div>
                              </div>
                              <!-- 바로 구매 -->
                              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                  <!-- 바로구매에서는 파라미터가 영화번호 + 현재 로그인 된 세션 아이디가 필요 -->
                                  <c:if test="${sessionScope.loginId ne null}">          
                                  <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${contextPath}/vod/vodOrder.form?vodNo=${vod.vodNo}&id=${sessionScope.loginId}">바로 구매</a></div>     
                                  </c:if> 
                              </div>
                          </div>
                      </div>
                 </c:forEach>
                </div>
            </div>

        </section>
<script>

  // 마이페이지
  function fnMyVod(){
	  location.href="${contextPath}/vod/myVod.form?id=${sessionScope.loginId}";
  }
</script>
<jsp:include page="../layout/footer.jsp" />
