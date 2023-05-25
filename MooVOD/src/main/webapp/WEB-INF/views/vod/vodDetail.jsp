<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
  *, *:before, *:after {
    box-sizing: border-box;
  }
  
  
  a {
    text-decoration: none;
    color: #5C7FB8
  }
  
  a:hover {
    text-decoration: underline;
  }
  
  .movie-card {
    font: 14px/22px "Lato", Arial, sans-serif;
    color: #A9A8A3;
    padding: 40px 0;
  }
  
  
  
  .hero {
    height: 342px;  
    margin:10px;
    position: relative;
    overflow: hidden;
    z-index:1;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
      
  }
  
  .hero:before {
    content:'';
    width:100%; height:100%;
    position:absolute;
    overflow: hidden;
    top:0; left:0;
    background:red;
    background: url(${vodDetail.vodShot});
    z-index:-1;
   
    transform: skewY(-2.2deg);
    transform-origin:0 0;
    
    //chrome antialias fix
    -webkit-backface-visibility: hidden; 
    
  }
  
  .cover {
    position: absolute;
    top: 600px;
    left: 40px;
    z-index: 2;
  }
  
  .details {
    
    padding: 190px 0 0 280px;
    
    
    .title1 {
      color: #CDCDCC;
      font-size: 55px;
      margin-bottom: 15px;
      position: relative;
      
      span {
        position: absolute;
        top: 3px;
        margin-left: 12px;
        background: #C4AF3D;
        border-radius: 5px;
        color: #544C21;
        font-size: 14px;
        padding: 0px 4px;
        
      }
    }
  
    .title2 {    
      color: #C7C1BA;
      font-size: 23px;    
      font-weight: 300;
      margin-bottom: 15px;
    }
    
    
    .likes {
      margin-left: 24px;
      cursor: pointer;
      font-size: 30px;
      color: red;
    }
    
    
    .likes:before {
      content: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/icon_like.png");
      position: relative;
      top: 2px;
      padding-right: 7px;
       font-size: 100px;
    }
  
  }
  
  .description {
    
    bottom: 0px;
    height: 200px;
    font-size: 16px;
    line-height: 26px;
    color: #B1B0AC;
    
  }
  
  .column1 {
    padding-left: 50px;
    padding-top: 120px;
    width: 220px;
    float: left;
    text-align: center;
  }
  
  .tag {
    background: white;
    border-radius: 10px;
    padding: 3px 8px;
    font-size: 14px;
    margin-right: 4px;
    line-height: 35px;
    cursor: pointer;
  }
  
  .tag:hover {
    background: #ddd;
  }
  
  .column2 {
    padding-left: 41px;
    padding-top: 30px;
    margin-left: 20px;
    width: 480px;
    float: left;
  }
  
  .category {
    clor: black;
    }  
    
  .star {
    margin-top: 23px;
    color: #fffff; 
    }     
  .avatars {
    
    }

</style>
<jsp:include page="../layout/header.jsp">
  <jsp:param name="title" value="Vod"/>
</jsp:include>
  <!-- Section-->
  <section class="py-5 position-relative">
   <div class="movie-card">
    <div class="container">
      <div class="hero">
        <div class="details">
          <div class="title1">${vodDetail.vodTitle}</div>
          <c:if test="${sessionScope.loginId ne null}">
           <span class="likes" onclick="fnZzim(${vodDetail.vodNo})">찜</span>
          </c:if>
        </div> <!-- end details -->
      </div> <!-- end hero -->
      <div class="description">
        <div class="column1">
          <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
             <c:if test="${sessionScope.loginId ne null}">
              <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${contextPath}/vod/vodOrder.form?vodNo=${vodDetail.vodNo}&id=${sessionScope.loginId}">바로 구매</a></div>                              
             </c:if>  
          </div>
        </div> <!-- end column1 -->
        <div class="column2">
          <p>${vodDetail.vodContent}</p>
          <!-- 장르 -->
          <div class="category">
            <span>장르: </span> ${vodDetail.vodCategory }        
           </div> <!-- end avatars -->        
          <div class="avatars">
            <span>배우: </span> ${vodDetail.vodActor }        
          </div> <!-- end avatars -->
          <!-- 영화 평점 c:if로 해당 영화 별점 주기 -->
          
                                      <div class="d-flex justify-content-center small text-warning mb-2">
                                        <c:choose>
                                          <c:when test="${vodDetail.vodStar eq 1}">
                                            <div class="bi-star-fill"></div>
                                          </c:when>
                                          <c:when test="${vodDetail.vodStar eq 2}">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                          </c:when>
                                          <c:when test="${vodDetail.vodStar eq 3}">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                          </c:when>
                                          <c:when test="${vodDetail.vodStar eq 4}">
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
         </div> <!-- end column2 -->
       </div> <!-- end description -->
      </div> <!-- end container -->
  </div> <!-- end movie-card -->
 </section>
       
 <script>
  function fnZzim(vodNo){
    window.open('${contextPath}/vod/ZzimPop.form?vodNo=${vodDetail.vodNo}&id=${sessionScope.loginId}', 'Zzim Popup', 'width=500, height=204');
  }
	  

 </script>      
<jsp:include page="../layout/footer.jsp" />
        

</body>
</html>