<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MooVOD : 약관동의</title>
<!-- Bootstrap Checkbox -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/agree.css"/>

<script>

  // 취소하면 이전 페이지로 돌아간다.
  function fnCancel(){
	  $('#btnCancel').on('click', function(){		  
      history.back();
	  })
  }
  
	    // 전체 선택 체크박스 클릭 시
    $(document).ready(function() {
      // 전체 선택 체크박스 클릭 시
      $("#checkAll").click(function() {
        $(".checkOne").prop("checked", $(this).prop("checked"));
      });
      
      // 개별 체크박스 클릭 시
      $(".checkOne").change(function() {
          if ($(".checkOne:checked").length === $(".checkOne").length) {
            $("#checkAll").prop("checked", true);
          } else {
            $("#checkAll").prop("checked", false);
          }
        });
      });
  
  // 가입 페이지로 이동하기(frmAgree의 submit)
  function fnFrmAgreeSubmit(){
	  $('#frmAgree').on('submit', function(event){
		  if( $('#service').is(':checked') == false || $('#privacy').is(':checked') == false ){
			  alert('필수 약관에 동의해야만 가입할 수 있습니다.');
			  event.preventDefault();
			  return;
		  }
	  })
  }
  
  // 함수 호출
  $(function(){
	  fnCancel();
	  fnCheckAll();
	  fnCheckOne();
    fnFrmAgreeSubmit();
  })
  
</script>
</head>
<body>

  <div class="wrapper fadeInDown">
  <div id="formContent">
    
    <div class="loginBox_input">
       <div class="loginBoxTitle" id="loginBox_input">MooVOD 이용 약관</div>
  
  </div>
    
    <form id="frmAgree" action="${contextPath}/user/join.form">
      <div class="checkbox_group">
      <div>
        <input type="checkbox" id="checkAll" autocomplete="off">
        <label for="checkAll">모두 동의</label>
        <span class="glyphicon glyphicon-ok"></span>
      </div>
      
      <hr>
      
      <div>
<!--         <input type="checkbox" id="service" class="checkOne"> -->
        <input type="checkbox" id="service" name="check" class="checkOne">
        <label for="service" ><span>(필수)</span>이용약관 동의</label>
        <div>
<!--           <textarea>본 약관은 ...</textarea> -->
              <div class="box1">
              <h3>제 1조 (목적)</h3>
              <p>이 약관은 MooVOD 인터넷 쇼핑몰에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 쇼핑몰과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.
              PC통신, 모바일 무선 등을 이용하는 전자상거래에 대해서는 그 성질에 반하지 않는 한 이 약관을 준용합니다.</p>
              <h3>제 2조 (정의)</h3>
              <br>
              <p>01."MooVOD" 이란 회사가 재화 또는 용역(이하 "재화등"이라 한다)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
              02."이용자"란 쇼핑몰에 접속하여 이 약관에 따라 쇼핑몰이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
              03."회원"이라 함은 쇼핑몰에 개인정보를 제공하여 회원등록을 한 자로서, 쇼핑몰의 정보를 지속적으로 제공받으며, 쇼핑몰이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
              04."비회원"이라 함은 회원에 가입하지 않고 쇼핑몰이 제공하는 서비스를 이용하는 자를 말합니다.
              05.“예치금”이란 쇼핑몰이 회원과의 거래에서 주문취소 등의 결제대금 환불, 초과입금 차액 환불등으로 발생한 금액을 현금대신 임시지급(적립)하여 현금과 동일하게 사용이 가능한 것을 말합니다.</p>
              <h3>제 3조 (약관 등의 명시와 설명 및 개정)</h3>
              <br>
              <p>01.쇼핑몰은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 호스팅서비스를 제공하는 자의 상호, 통신판매업신고번호 등을 이용자가 쉽게 알 수 있도록 쇼핑몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
              02.쇼핑몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 배송책임, 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
              03.쇼핑몰은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자거래기본법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자보호법」 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
              04.쇼핑몰이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 쇼핑몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 쇼핑몰은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
              05.쇼핑몰이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 쇼핑몰에 송신하여 쇼핑몰의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
              06.이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제 등에 관한 법률」, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자보호 지침」 및 관계법령 또는 상관례에 따릅니다.
              <h3>제 4조 (서비스의 제공 및 변경)</h3>
              <br>
              <p>01.쇼핑몰은 다음과 같은 업무를 수행합니다.
              - 재화등에 대한 정보 제공 및 구매계약의 체결
              - 구매계약이 체결된 재화등의 배송
              - 기타 쇼핑몰이 정하는 업무
              02.쇼핑몰은 재화등의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화등의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화등의 내용 및 제공일자를 명시하여 현재의 재화등의 내용을 게시한 곳에 즉시 공지합니다.
              03.쇼핑몰이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
              04.전항의 경우 쇼핑몰은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, 쇼핑몰이 고의 또는 중대 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p>
              <br>
              <p>출처 : https://blog.naver.com/momo7749/222500272868
              이 약관은 이용 약관을 출처 블로그기반으로 제작되었습니다.</p>
              </div>
        </div>
      </div>
      
      <div>
        <!-- <input type="checkbox" id="privacy" class="checkOne"> -->
        <input type="checkbox" id="privacy" name="check" class="checkOne">
        <label for="privacy"><span>(필수)</span>개인정보 수집 및 이용 동의</label>
        <div>
<!--           <textarea>개인정보보호법에 따라 ...</textarea> -->
                <div class="box2">
                <h3>제1장 총칙</h3>
                <p>제 1조 수집하는 개인정보 항목 및 수집 방법
                회사는 다음의 개인정보 항목을 처리하고 있습니다.
                
                홈페이지 회원 가입 및 관리
                필수항목 : 아이디, 비밀번호, 성명, 생년월일, 이메일, 휴대폰 번호
                선택항목 : 성별, 주소
                
                인터넷 서비스 이용과정에서 아래의 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.
                IP 주소
                
                계약에 필요한 사항
                카드번호, 생년월일, 핸드폰번호
                
                회사는 다음과 같은 방법으로 개인정보를 수집하고 있습니다.
                
                이용자로부터의 제공
                본인인증 시스템으로부터의 제공 (생년월일, 이름, 중복가입 확인정보[DI])
                이용자의 인터넷 이용 시 자동으로 생성되는 정보의 수집
                예약 진행 및 예약 취소시 수집되는 카드정보 내역</p>
                </div>
        </div>
      </div>
      
      <div>
        <!--
          1. 체크한 경우     : 파라미터 location이 on값을 가지고 전달된다.
          2. 체크 안 한 경우 : 파라미터 location이 전달되지 않는다.
        -->
        <!-- <input type="checkbox" id="location" name="location" class="checkOne"> -->
        <input type="checkbox" id="location" name="check" class="checkOne">
        <label for="location"><span>(선택)</span>위치기반서비스 이용약관 동의</label>
        <div>
<!--           <textarea>위치정보 ...</textarea> -->
              <div class="box3">
              <h3>제1조(목적)</h3>
              <p>제1장 총칙
              이 약관은 MooVOD(이하 “회사”)가 제공하는 위치기반서비스(이하 ‘서비스’)에 관하여 회사와 이용계약을 체결한 고객이 서비스를 이용하는 데 필요한 회사와 고객의 권리 및 의무, 기타 제반 사항을 정함을 목적으로 합니다.</p>
              <h3>제2조 (약관의 효력 및 변경)</h3>
              <p>① 본 약관은 본 서비스를 이용하고자 하는 모든 고객을 대상으로 합니다.
              ② 본 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 고객에게 공시하고, 이에 동의한 고객이 본 서비스에 가입함으로써 효력이 발생합니다.
              ③ 회사는 필요하다고 인정되면 본 약관을 변경할 수 있으며, 회사가 약관을 변경할 때에는 적용일자와 변경사유를 구체적으로 기재하여 제2항과 같은 방법으로 그 적용일자 7일 전부터 공지합니다. 다만, 이용자에게 불리한 약관을 변경할 때에는 그 적용일자 30일 전부터 공지하며, 이메일(E-mail)을 통해 이용자에게 개별 통지합니다. 단, 이용자가 연락처를 기재하지 않았거나, 변경 후 수정하지 않아 개별 통지가 어려우면 본 항의 공지를 개별 통지한 것으로 간주합니다.
              ④ 회사가 제3항에 따라 변경 약관을 공지하거나 통지할 때 약관 변경 적용일까지 거부 의사를 표시하지 않으면 약관의 변경에 동의한 것으로 간주한다는 내용을 이용자에게 통지하였음에도 이용자가 구체적으로 약관 변경에 거부 의사를 표시하지 않으면 서비스제공자는 이용자가 변경 약관에 동의한 것으로 간주합니다. 이용자는 변경된 약관 사항에 동의하지 않으면 서비스 이용을 중단하고 이용 계약을 해지할 수 있습니다.</p>
              <h3>제3조 (약관 외 준칙)</h3>
              <p>이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률(이하 “위치정보법”), 전기통신사업법, 정보통신망 이용촉진 및 보호 등에 관한 법률(이하 “정보통신망법”), 개인정보보호법 등 관계 법령 및 회사가 정한 서비스의 세부이용지침 등의 규정을 따릅니다.
              제2장 서비스의 이용</p>
              <h3>제4조 (가입자격)</h3>
              <p>① 서비스에 가입할 수 있는 자는 위치기반서비스를 이용할 수 있는 이동전화 단말기, 기타 서비스를 이용할 수 있는 단말기(이하 “단말기”)의 소유자 본인이어야 합니다.
              ② 법인은 법인의 사업자번호를 사용하여 서비스에 가입할 수 있습니다.<p>
              <h3>5조 (서비스 가입)</h3>
              <p>회사는 다음 각 호의 고객 가입신청을 승낙하지 않을 수 있습니다.
              1. 실명이 아니거나 다른 사람의 명의를 사용하는 등 허위로 신청하는 경우
              2. 고객 등록 사항을 빠뜨리거나 잘못 기재하여 신청하는 경우
              3. 공공질서 또는 미풍양속을 해치거나 그럴 목적으로 신청한 경우
              4. 기타 회사가 정한 이용신청 요건을 충족하지 않았을 경우</p>
              <h3>제6조 (서비스의 해지)</h3>
              <p>서비스 해지를 희망하는 고객은 회사가 정한 절차(유무선 인터넷 홈페이지 등을 통해 공지합니다)를 통해 서비스 해지를 신청할 수 있습니다.</p>
              <h3>제7조 (서비스의 수준)</h3>
              <p>① 서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 단, 회사의 업무 또는 기술상의 이유로 서비스가 일시 중지될 수 있으며, 운영상의 목적으로 회사가 정한 기간에도 서비스는 일시 중지될 수 있습니다. 이때 회사는 사전 또는 사후에 이를 공지합니다.
              ② 위치정보는 관련 기술의 발전에 따라 오차가 발생할 수 있습니다.</p>
              <h3>제8조 (서비스 이용의 제한 및 정지)</h3>
              회사는 다음 각 호의 1에 해당하는 경우, 해당 고객의 서비스 이용을 제한하거나 정지시킬 수 있습니다.
              1. 다른 사람의 명의(주민등록번호) 등을 이용하여 서비스에 가입한 경우
              2. 타인의 서비스 이용을 방해하거나 타인의 개인정보를 무단으로 사용한 경우
              3. 서비스를 이용하여 법령, 공공질서, 미풍양속 등을 거스르는 행위를 한 경우</p>
              <h3>제9조 (서비스의 변경 및 중지)</h3>
              <p>① 회사는 다음 각 호의 1에 해당하면 고객에게 서비스의 전부 또는 일부를 제한·변경하거나 중지할 수 있습니다.
              
              1. 서비스용 설비의 보수 등 공사로 어쩔 수 없는 경우
              2. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우
              3. 서비스 제휴업체와의 계약 종료 등과 같은 회사의 제반 사정 또는 법률상의 장애 등으로 유지할 수 없는 경우 기타 천재지변, 국가비상사태 등 불가항력의 사유가 있는 경우
              ② 제1항에 따른 서비스 중단일 때에는 회사는 해당 사실을 인터넷 등에 공지하거나 고객에게 통지합니다. 다만, 회사가 통제할 수 없는 사유로 서비스의 중단(운영자의 고의, 과실이 없는 디스크 장애, 시스템 다운 등)으로 말미암아 미리 통지할 수 없을 때에는 사후에 통지합니다.
              회사가 제공하는 서비스의 종류와 세부내용, 이용 요금은 별표 1. 서비스의 종류를 따릅니다.</p>
              <h3>제3장 개인위치정보의 보호</h3>
              <p>제11조 (위치정보의 정의 등)
              ① 본 약관에서 사용하는 “위치정보”란 이동성이 있는 물건 또는 개인이 특정한 시간에 존재하거나 존재했던 장소에 관한 정보로서 전기통신설비 및 전기통신회선설비를 이용하여 측위된 것을 말합니다.
              ② 본 약관에서 사용하는 “개인위치정보”란 특정 개인의 위치정보(위치정보만으로는 특정 개인의 위치를 알 수 없는 경우에도 다른 정보와 용이하게 결합하여 특정 개인의 위치를 알 수 있는 것을 포함한다)를 말합니다.
              ③ 회사는 본 약관에 동의하여 개인위치정보의 이용을 승낙한 고객에 한하여 위치정보법 등 관련 법률에서 정한 바에 따라 개인위치정보를 취득하며 서비스의 목적범위 내에서 위치정보를 이용합니다.</p>
              <h3>제12조 (고객의 개인위치정보보호)</h3>
              <p>회사는 관련 법령이 정하는 바에 따라 고객의 개인위치정보를 보호하기 위해 노력합니다.</p>
              <h3>제13조 (개인위치정보의 이용 또는 제공)</h3>
              <p>① 회사는 서비스 제공을 위하여 회사가 수집한 고객의 위치정보를 이용할 수 있으며, 고객이 본 약관에 동의하면 위치정보 이용에 동의한 것으로 간주됩니다.
              ② 회사는 고객이 제공한 개인위치정보를 해당 고객의 동의 없이 서비스 제공 이외의 목적으로 이용하지 않습니다.
              ③ 회사는 아래 각호의 경우 고객이 지정한 휴대전화나 이메일(E-mail) 주소로 통보할 수 있습니다.
              
              1. 개인위치정보를 수집한 해당 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 않은 경우
              2. 개인위치정보 주체가 개인위치정보를 수집한 해당 외의 통신단말장치 또는 (E-mail) 주소 등으로 통보할 것을 요청한 경우
              ④ 회사는 개인위치정보를 회원이 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신 단말장치로 회원에게 제공받는 자, 제공일시 및 제공목적을 매회 즉시 또는 위치정보 보호법의 범위 내에서 회사가 정한 주기 중 회원이 선택한 방식으로 통보합니다.
              
              단, 회사가 제3자에 대한 정보제공 내역을 주기적으로 모아서 통보할 경우에는 아래의 내용에 대해 알리고 고객의 동의를 받습니다.
              
              1. 정보제공내역을 모아서 통보하는 횟수 또는 기간
              2. 개인위치정보주체의 요청이 있는 경우에는 즉시 통보 방법으로 변경할 수 있다는 사실 및 그 요청 방법</p>
              <h3>제14조 (개인위치정보 이용/제공사실 확인자료의 보유)</h3>
              <p>① 회사는 위치정보법 제16조 제2항에 근거하여 고객에 대한 위치정보 이용/제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 고객 불만에 응대하기 위하여 기록시점으로부터 6개월간 보존합니다.
              ② 위치정보법 제24조 제4항의 규정에 따라 고객이 동의의 전부 또는 일부를 철회하면 그 즉시 회사는 수집된 개인위치정보와 위치정보 이용제공사실 확인자료(동의의 일부를 철회할 때에는 철회하는 부분의 개인위치정보와 위치정보 이용제공사실 확인자료에 한합니다)를 파기합니다. 다만, 국세기본법, 법인세법, 부가가치세법, 기타 관계 법령의 규정에 따라 보존할 필요성이 있으면 관계 법령에 따라 보존합니다.</p>
              <h3>제15조 (개인위치정보의 보유목적 및 보유기간)</h3>
              <p>회사가 고객의 개인위치정보를 이용하였다면 회사는 위치정보법 제16조 제2항의 규정에 따라 기록·보존해야 하는 위치정보이용 제공사실 확인자료 이외의 해당 개인위치정보를 위치정보법 제23조에 따라 고객이 동의한 목적범위 내에서 이용하고 고객의 불만에 응대하기 위하여 6개월간 보유하며 6개월이 지나면 바로 파기합니다.</p>
              <h3>제16조 (법정대리인의 권리)</h3>
              <p>① 회사가 위치정보법 제18조 제1항, 제19조 제1항 및 제2항 또는 제21조의 규정에 따라 14세 미만 아동의 개인위치정보를 이용하거나 제공하고자 할 때에는 그 법정 대리인의 동의를 얻어야 합니다.</p>
              <p>② 제19조(고객의 권리)의 규정은 위치정보법 제25조 제2항의 규정에 따라 법정 대리인이 동의하는 경우에 이를 준용합니다. 이때 법정 대리인을 고객으로 봅니다.</p>
              <h3>제17조 (8세 이하의 아동 등의 보호를 위한 위치정보 이용)</h3>
              <p>① 회사는 아래 각호 1에 해당하는 자(이하 "8세 이하의 아동 등")의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 수집·이용 또는 제공에 동의하면 본인의 동의가 있는 것으로 봅니다.
              1. 8세 이하의 아동
              2. 피성년후견인
              3. 장애인복지법 제2조 제2항 제2호의 규정에 따른 정신적 장애를 가진 자로서 장애인 고용촉진 및 직업재활법 제2조 제2호의 규정에 따라 중증장애인에 해당하는 자(장애인복지법 제32조의 규정에 따라 장애인등록을 한 자에 한합니다.)
              ② 제1항의 규정에 따른 8세 이하 아동 등의 보호의무자는 해당 아동을 사실상 보호하는 자로서 다음 각 호의 1에 해당하는 자를 말합니다.
              
              1. 8세 이하의 아동의 법정 대리인 또는 보호시설에 있는 미성년자의 후견 직무에 관한 법률 제3조의 규정에 따른 후견인
              2. 피성년후견인의 법정 대리인
              3. 본 조 제1항 제3호의 자의 법정 대리인 또는 「장애인복지법」 제58조 제1항 제1호의 규정에 따른 장애인거주시설(국가 또는 지방자치단체가 설치·운영하는 시설에 한합니다)의 장, 정신건강증진 및 정신질환자 복지서비스 지원에 관한 법률 제22조의 규정에 따른 정신요양시설의 장 및 같은 법 제26조에 따른 정신재활시설(국가 또는 지방자치단체가 설치·운영하는 시설에 한합니다)의 장
              ③ 8세 이하 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 수집·이용 또는 제공에 동의하고자 하는 보호의무자는 서명동의서에 보호의무자임을 증명하는 서류를 첨부하여 회사에 제출해야 합니다.
              ④ 제19조(고객의 권리)의 규정은 위치정보법 제26조 제4항의 규정에 따라 보호의무자가 동의하는 경우에 이를 준용합니다. 이때 보호의무자를 고객으로 봅니다.
              제4장 회사와 고객의 권리 및 의무</p>
              <h3>제18조 (회사의 의무)</h3>
              <p>① 회사는 서비스와 관련한 고객의 불만사항이 접수되면 이를 신속하게 처리해야 하며, 신속한 처리가 어려우면 그 사유와 처리 일정을 고객에게 통지합니다.
              ② 회사는 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 통신비밀보호법, 전기통신사업법, 개인정보보호법 등 서비스의 운영·유지와 관련 있는 법규를 지킵니다.
              ③ 고객서비스를 더욱 활성화하여 최적화된 서비스를 제공하고 신상품이나 이벤트 정보 안내, 설문조사 등 고객 지향적인 마케팅을 수행하기 위하여 회사는 이용계약 체결 때 수집한 고객의 개인정보 및 서비스 이용과 관련한 정보를 활용할 수 있습니다. 단, 고객의 동의 범위를 초과하여 이용하거나 제3자에게 제공하고자 할 때에는 미리 해당 고객에게 동의를 받아야 합니다. 이때 고객은 회사의 동의 요청을 거절할 수 있습니다.
              ④ 회사는 요금연체와 관련하여 이용자를 신용정보의 이용 및 보호에 관한 법률 제17조의 신용정보집중기관 등 관계 기관 등에 신용 불량자로 등록 요청할 때에는 등록요청 대상자의 본인 여부 등 필요한 확인절차를 거쳐야 합니다.</p>
              <h3>제19조 (고객의 권리)</h3>
              <p>① 고객은 유무선 인터넷 등을 통해 회사의 고객 개인위치정보의 이용과 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
              ② 고객은 유무선 인터넷 등을 통해 회사의 고객 개인위치정보의 이용과 제공의 일시 중지를 요구할 수 있습니다.
              ③ 고객은 회사에 다음 각 호의 1의 자료 등의 열람 또는 고지를 요구할 수 있고, 그 자료에 오류가 있으면 정정을 요구할 수 있습니다
              
              1. 고객에 대한 위치정보 수집·이용·제공 사실 확인자료
              2. 고객의 개인위치정보가 위치정보법 또는 다른 법률의 규정에 따라 제3자에게 제공된 이유와 그 내용
              ④ 고객은 본 약관 제21조에 기재된 회사의 주소, 연락처에 우편, 전화, 이메일(E-mail) 등을 발송하는 방법으로 서비스와 관련된 문의와 불만사항을 회사에게 제기하거나 그 시정을 요구할 수 있습니다.</p>
              <h3>제20조 (고객의 의무)</h3>
              <p>① 고객은 서비스 이용계약에 따라 요금을 지정된 날짜까지 내야 하며, 회사에 알린 요금청구 주소와 연락처가 변경되었다면 해당 내용을 회사에 알려야 합니다.
              ② 고객이 서비스 이용에 필요한 제반 정보를 제공·등록할 때에는 현재의 사실과 일치하는 완전한 정보를 제공·등록해야 하며, 변경사항이 있으면 즉시 갱신해야 합니다.
              ③ 고객은 단말기가 정상 동작을 유지하도록 관리해야 하며, 단말기가 정상적으로 작동하지 않아 서비스 제공에 지장이 있을 때에는 해당 단말기의 보수, 교환 등을 신속히 처리하여 원활한 서비스가 이루어지도록 합니다.
              ④ 고객은 서비스를 이용할 때 다음 각 호의 1에 해당하는 행위를 해서는 안 됩니다.
              
              1. 가입신청 또는 변경 때 허위 사실을 기재하는 행위
              2. 타인의 명예를 손상하거나 타인에게 불이익을 주는 행위
              3. 공공질서와 미풍양속을 거스르는 내용의 정보·문장·도형·음성 등을 타인에게 유포하는 행위
              4. 서비스와 관련된 설비의 오동작이나 정보 등의 파괴·혼란을 유발하는 컴퓨터 바이러스 감염 자료를 등록 또는 유포하는 행위
              5. 타인으로 가장하는 행위 및 타인과의 관계를 허위로 명시하는 행위
              6. 자기 또는 타인에게 재산상의 이익을 주거나 타인에게 손해를 끼칠 목적으로 거짓된 정보를 유통하는 행위
              7. 서비스의 이용과 관련하여 취득한 타인의 개인위치정보를 무단으로 유용하거나 유출하는 행위
              8. 기타 불법적이거나 부당한 행위
              ⑤ 고객은 관계 법령, 이 약관의 규정, 이용안내 및 서비스상에 공지한 주의사항, 회사가 통지하는 사항 등을 지켜야 하며, 기타 회사의 업무에 방해되는 행위를 해서는 안 됩니다.
              <br>
              출처 : https://www.skplanet.com/etc/legal02
              이 약관은 SK플래닛 주식회사의 위치기반 서비스 이용 약관을 기반으로 제작되었습니다.
              <p>
              </div>
        </div>
      </div>
      </div>
      <div>
        <!--
          1. 체크한 경우     : 파라미터 event가 on값을 가지고 전달된다.
          2. 체크 안 한 경우 : 파라미터 event가 전달되지 않는다.
        -->
<!--         <input type="checkbox" id="event" name="event" class="checkOne"> -->
        <input type="checkbox" id="event" name="check" class="checkOne">
         <label for="event"><span>(선택)</span>이벤트 및 마케팅 활용 동의</label>
        <div>
          <!-- <textarea>이벤트 ...</textarea> -->
              <div class="box4">
              <h3>제 1조 (목적)</h3>
              <p>MovVOD(이하 "회사")가 제공하는 서비스(이하 "서비스")에서 보다 다양한 정보를 제공하고 서비스의 질을 향상시키기 위하여 회사의 제휴사에게 본 활용동의서에 동의한 회원의 정보(개인정보 포함)를 제공할 수 있습니다.</p>
              <br>
              <p>서비스 제공 및 이용과 관련하여 회사가 취득한 정보는 "통신비밀보호법", "전기통신사업법" 및 "정보통신망 이용촉진 및 정보보호 등에 관한 법률" 등 정보통신서비스제공자가 준수하여야 할 관련 법령상의 개인정보 보호 규정을 준수합니다.</p>
              <br>
              <p>“이용자”는 정보의 홍보∙마케팅 이용 동의를 거부하실 수 있으며, 거부시 정보의 마케팅 활용을 통하여 제공 가능한 각 종 우대 서비스, 혜택, 경품 및 이벤트 안내 등 관련 편의사항이 제한될 수 있습니다.</p>
              <br>
              <br>
              <p>1. 이용목적
              마케팅 광고에 활용
              1) 신규 서비스 개발 및 개선, 관련 문의 등에 대한 개인 맞춤 상담, 정보 제공
              2) 신규 서비스나 이벤트, 제3자의 상품 또는 "MooVOD" 관련 개인 맞춤형 광고,정보 전송
              2. 보유 및 이용기간
              1) 별도 동의 철회 시까지
              2) 단, 관련 법령의 규정에 따라 보존 할 필요가 있을 경우</p>
              <br>
              <p>출처 : https://www.productlabs.kr
              이 약관은 Product Lab 이벤트 및 마케팅 활용동의 이용 약관을 기반으로 제작되었습니다.</p>
              </div>
        </div>
      </div>
      

      <div class="formFooter">
        <input type="button" value="취소" id="btnCancel">
        <button>다음</button>
      </div>
    </form>
    </div>
    
  </div>
  
</body>
</html>