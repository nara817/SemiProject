<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/home/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/home/css/styles.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>SemiProject - PLAYON</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/home/js/scripts.js"></script>

<script>

function fnEdit(){
  $('#edit_screen').show();
  $('#detail_screen').hide();
}

function fnRemove(){
  if(confirm('삭제할까요?')){
    $('#frm_remove').submit();
  }
}
  /* submit => 폼에 있는걸 가지고 액션으로 . 파리미터를 보내주는 거임 */
  
  function fnList(){
    location.href = '${contextPath}/notice/list.do';
  }
  
  function fnBack(){
    $('#edit_screen').hide();
    $('#detail_screen').show();
  }
  
  /* https://summernote.org/ 에서 가져옴  */
  $(function(){
    $('#edit_screen').hide();  // 최초 편집화면은 숨김
  })
  
  
</script>
<style>


</style>
</head>
<body>
  <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${contextPath}/">MOOVOD</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/main">고객센터</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Store</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        
        
        <!-- Header-->
        <header class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-black">
                    <h1 class="display-4 fw-bolder">MOOVOD</h1>
                    <p class="lead fw-normal text-black-50 mb-0">세상의 모든 영화를 MOOVOD 하세요</p>
                </div>
            </div>
        </header>
        <div class="seacrh">
        <input type="text" id="topSearchTxt" name="topSearchTxt"
         placeholder="작품,배우,감독명을 입력해보세요."
         value=""/>
        <label for="topSearchTxt" class="btn_search">
          <button type="button" >검색</button>
        </label>
    </div>
    <hr>
        <!-- navbar-->
        <nav>
          <div id="navbar">
            <ul class="nav justify-content-center">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${contextPath}/reviews/list.do">Review</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextPath}/reviews/buy.do">buy</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
          </li>
        </ul>
          </div>
        </nav>
        <hr>

            
            <!-- body -->
            <!-- body -->

  <section class="py-5">
    <div id="detail_screen"  class="px-4 px-lg-5 mt-5 text-center text-black">
    <h1>${n.noticeNo}번 게시글 상세보기</h1>
    <div>카테고리 : ${n.category}</div>
    <div>작성자 : ${n.writer}</div>
    <div>제목 : ${n.title}</div>
    <div>작성일 : ${n.createdAt}</div>
    <div>수정일 : ${n.modifiedAt}</div>
    <div>${n.content}</div>
    <form id="frm_remove" action="${contextPath}/notice/remove.do" method="post">
      <input type="hidden" name=noticeNo value="${n.noticeNo}">
    </form>
    <div>
      <input type="button" value="편집" onclick="fnEdit()">
      <input type="button" value="삭제" onclick="fnRemove()">
      <input type="button" value="목록" onclick="fnList()">
    </div>
  </div>
  
  <div id="edit_screen" class="px-4 px-lg-5 mt-5 text-center text-black">
    <div style="cursor: pointer;" onclick="fnBack()"><i class="fa-solid fa-arrow-left"></i> 뒤로 가기</div>
    <h1>편집화면</h1>
    <form method="post" action="${contextPath}/notice/modify.do">
      <div>
        <label for="title">제목</label>
        <input type="text" id="title" name="title" value="${n.title}">
      </div>  
      <div>
        <label for="category">카테고리</label>
        <input type="text" id="category" name="category" value="${n.category}">
      </div>
      <div>
        <div><label for="content">내용</label></div>
        <textarea id="content" name="content">${n.content}</textarea>  <!-- summernote 편집기로 바뀌는 textarea -->
      </div>
      <div>
        <input type="hidden" name="noticeNo" value="${n.noticeNo}">
        <button>수정완료</button>
        <input type="button" value="목록" onclick="fnList()">
      </div>
    </form>
  </div>
  
  
  
</section>
  
  
  
  
  
  
  
                       
      
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        

</body>
</html>