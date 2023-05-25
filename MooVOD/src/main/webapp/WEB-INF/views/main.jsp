<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>
<style>
  #cs li:hover {
    background-color: beige;
    cursor: pointer;
  }
</style>
        
    <!-- Section-->

            
            <div class="card ml-7" style="width: 40rem; margin-bottom: 10rem;">
              <div class="card-header">
                고객센터
              </div>
              <ul id="cs" class="list-group list-group-flush">
                <li class="list-group-item"><a href="${contextPath}/notice/list.do">NOTICE</a></li>
                <li class="list-group-item"><a href="${contextPath}/qna/list.do">QNA</a></li>
                <li class="list-group-item"><a href="${contextPath}/faq/list.do">FAQ</a></li>
              </ul>
            </div>
            
           

<jsp:include page="layout/footer.jsp"></jsp:include>

   