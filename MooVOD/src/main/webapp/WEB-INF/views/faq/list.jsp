<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp"/>


            <!-- body -->
            <!-- body -->

  <div>
    <a href="${contextPath}/faq/write.do"> 관리자가 여기서 작성하기로 쓰는게 ,, 맞나,, 삭제하는건가</a>
  </div>

<!-- 8장 list.jsp 복사 -->
  <br>
  
  <div>
    <form id="frmSearch">
      <select id="column" name="column">
        <option value="CATEGORY">문의유형</option>
        <option value="PAY">결제수단</option>
        <option value="VOD">VOD문의</option>
        <option value="STORE">STORE문의</option>
        <option value="REFUND">환불문의</option>
        <option value="DISCOUNT">할인혜택</option>
      </select>
      <input type="text" id="searchText" name="searchText">
      <input type="button" id="btnSearch" value="검색">
      <input type="button" id="btnInit" value="초기화">
    </form>
  </div>
  
    <hr>
    
  

<script>
	$(function() {
		fnInit();
		fnSearchAll();
		fnSearch();
	})
	function fnInit() {
		$('#btnInit').on('click', function() {
			fnSearchAll();
		})
	}

	function fnSearchAll() {
		$.ajax({
			type : 'get',
			url : '${contextPath}/faq/searchAllMovies',
			dataType : 'json',
			success : function(resData) { // resData = {"message:", "", "list": [{}, {}, ...], "status":200 }
				$('#faqList').empty();
				if (resData.status == 200) {
					$.each(resData.list, function(i, moovod) {
						let str = '<tr>';
						str += '<th scope="row">' + moovod.faqNo + '</th>';
						str += '<td>' + moovod.category + '</td>';
						str += '<td><a href="${contextPath}/faq/detail.do?faqNo=' + moovod.faqNo + '">' + moovod.title + '</a></td>';
						str += '<td>' + moovod.createdAt + '</td>';
						str += '<td>' + moovod.id + '</td>';
						str += '<td>' + moovod.hit + '</td>';
						str += '</tr>';
						$('#faqList').append(str);
					})
				} else if (resData.status == 500) {
					let str = '<tr>';
					str += '<th colspan="6">조회된 결과가 없습니다.';
					$('#faqList').append(str);
				}
			}
		})
	}
	  
	function fnSearch() {
		$('#btnSearch').on('click', function() {
			$.ajax({
				type : 'get',
				url : '${contextPath}/searchMovie',
				data : $('#frmSearch').serialize(),
				dataType : 'json',
				success : function(resData) {

					alert(resData.message);
					$('#faqList').empty();
					if (resData.status == 200) {
						$.each(resData.list, function(i, moovod) {
							let str = '<tr>';
							str += '<td>' + moovod.faqNo + '</td>';
							str += '<td>' + moovod.category + '</td>';
							str += '<td>' + moovod.title + '</td>';
							str += '<td>' + moovod.id + '</td>';
							str += '<td>' + moovod.hit + '</td>';
							str += '</tr>';
							$('#faqList').append(str);
						})
					} else if (resData.status == 500) {
						let str = '<tr>';
						str += '<td colspan="6">조회된 결과가 없습니다.';
						$('#faqList').append(str);
					}
				}
			})
		})
	}
</script>
<table class="table">
  <thead>
    <tr>
      <th scope="col">NO</th>
      <th scope="col">카테고리</th>
      <th scope="col">제목</th>
      <th scope="col">작성일</th>
      <th scope="col">작성자</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody id="faqList">
  </tbody>
</table>

<jsp:include page="../layout/footer.jsp"></jsp:include>
  
  
