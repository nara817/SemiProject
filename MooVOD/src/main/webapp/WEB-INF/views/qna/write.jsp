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
<script src="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.css">
<script>

function fnList() {
    location.href = '${contextPath}/qna/list.do';
  }
  
$(document).ready(function() {
    $("#reviewContent").keyup(function(event) {
        if (event.which === 13) {
            $("#submit").click();
        }
    });
 
    $("#submit").click(function() {
    })
});

</script>
<style>
.text-center {
  margin-left:auto; 
    margin-right:auto;
    margin-top: auto;
}

html, body {
     min-height: 100%;
}

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

<!-- 8장에서 가져옴 -->
  <div class="text-center">
    <h1> QNA 작성화면</h1>
    <form method="post" action="${contextPath}/qna/add.do">
  
      <div>
        <label for="category"></label>
        <input type="text" id="category" name="category" placeholder="카테고리">
      </div>
      <div>
        <label for="writer"></label>
        <input type="text" id="writer" name="writer" placeholder="작성자">
      </div>
      <div>
        <label for="title"></label>
        <input type="text" id="title" name="title" placeholder="제목">
      </div>
      <div>
        <div><label for="content">내용</label></div>
        <textarea id="content" name="content"></textarea>  <!-- summernote 편집기로 바뀌는 textarea -->
      </div>
      <div>
        <button id="submit">작성완료</button>
        <input type="button" value="목록" onclick="fnList()">
      </div>
    </form>
  </div>
  








            
                          
                       
      
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