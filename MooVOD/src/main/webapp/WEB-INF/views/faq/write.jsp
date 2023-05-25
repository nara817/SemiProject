<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp"></jsp:include>
<script>

function fnList() {
    location.href = '${contextPath}/faq/list.do';
  }
  
  $(function(){
    $('#content').summernote({
      width: 640,
      height: 480,
      lang: 'ko-KR',
      toolbar: [
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough', 'superscript', 'subscript']],
        ['fontname', ['fontname']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
        ['view', ['fullscreen', 'codeview', 'help']]
      ]
    })
  })

</script>

  <div>
    <h1>작성화면</h1>
    <form method="post" action="${contextPath}/faq/add.do">
      <div>
       작성자 : ${sessionScope.loginId}
      <div>
        <label for="title">제목</label>
        <input type="text" id="title" name="title">
      </div>
      <div>
        <textarea id="content" name="content"></textarea>  <!-- summernote 편집기로 바뀌는 textarea -->
      </div>
      <div>
        <input type="hidden" name="faqNo" value="${sessionScope.loginNo}">
        <button>작성완료</button>
        <input type="button" value="목록" onclick="fnList()">
      </div>
    </form>
  </div>

    <!-- 서비스 임플에서 작업해야 el문 돌아감  -->




<jsp:include page="../layout/footer.jsp"></jsp:include>