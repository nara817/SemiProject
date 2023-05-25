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
/* 8장 복사 */
  $(function(){
    fnChkAll();
    fnChkOne();
    fnRemoveList();
  })
  
  // 전체선택 체크박스
  function fnChkAll(){
    $('#chk_all').on('click', function(){
      $('.chk_one').prop('checked', $(this).prop('checked'));
    })
  }
  
  // 개별선택 체크박스
  function fnChkOne(){
    let chkOne = $('.chk_one');  // 모든 개별선택
    chkOne.on('click', function(){
      let chkCnt = 0;
      for(let i = 0; i < chkOne.length; i++){
        chkCnt += $(chkOne[i]).prop('checked');
      }
      $('#chk_all').prop('checked', chkCnt == chkOne.length);
    })
  }


  
  // 선택 항목 삭제
  function fnRemoveList(){
    $('#frm_remove_list').on('submit', function(event){
      if($('.chk_one:checked').length == 0){
        alert('선택된 게시글이 없습니다.');
        event.preventDefault();
        return;
      }
      if(confirm('선택한 게시글을 모두 삭제할까요?') == false){
        event.preventDefault();
        return;
      }
    })
  }

</script>



<style>
.seacrh{
text-align:center;
}

</style>
<!-- 8장 복사 -->
<style>
  .screen_out {
    display: none;
  }
  #lbl_chk_all:hover {
    cursor: pointer;
    color: gray;
  }
  #lbl_chk_all:active {
    color: silver;
  }
  .lbl_chk_one {
    cursor: pointer;
    padding-left: 20px;
    background-image: url('../resources/images/check1.png');
    background-size: 16px 16px;
    background-repeat: no-repeat;
    background-position: 0 3px;
  }
  .chk_one:checked + label {
    background-image: url('../resources/images/check2.png');
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

<!-- 8장 list.jsp 복사 -->

  <br>
  <!-- boardController에서 처리되는거야 -->
  <div>
    <a href="${contextPath}/notice/write.do">새글작성하기</a>
  </div>

  
  <br>
  
  <!-- 실행했을 때, 동일한파라미터가 여러개 있을떄는. request.getParameter values() ==> string 타입의 배열로 처리할수있다. String[]  -->
  <div>
    <form id="frm_remove_list" action="${contextPath}/notice/removeList.do" method="post">
      <div>
        <button>선택삭제</button>
      </div>
      <table border="1">
        <thead>
          <tr>
            <td>
              <label for="chk_all" id="lbl_chk_all">전체선택</label>
              <input type="checkbox" id="chk_all" class="screen_out">
            </td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일자</td>
          </tr>
        </thead>
      <tbody>
          <c:if test="${empty noticeList}">
            <tr>
              <td colspan="4">첫 게시글의 주인공이 되어 보세요!</td>
            </tr>
          </c:if>
          <c:if test="${not empty noticeList}">          
            <c:forEach items="${noticeList}" var="n">
              
            <!-- 제목만 클릭했을떄 상세보기로 넘어갈수 있게.  -->
            
              <!-- 삭제를 위해서 필요한 정보값을 넣어두려고 한다. boardNo  -->            
              <tr>
                <td>
                  <input type="checkbox" id="chk_one${n.noticeNo}" class="chk_one screen_out" name="noticeNoList" value="${n.noticeNo}">
                  <label for="chk_one${n.noticeNo}" class="lbl_chk_one">${n.noticeNo}</label>
                </td>
                <td><a href="${contextPath}/notice/detail.do?noticeNo=${n.noticeNo}">${n.title}</a></td>
                <td>${n.writer}</td>
                <td>${n.createdAt}</td>
              </tr>
            </c:forEach>
          </c:if>
        </tbody>
      </table>
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