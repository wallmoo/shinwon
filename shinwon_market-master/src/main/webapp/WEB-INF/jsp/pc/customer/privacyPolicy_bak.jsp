<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-helpdesk"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->

		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	         <div id="breadcrumb" class="wrap">
	             <div class="holder">
	                 <span>홈</span>
	                 <span class="gt">&gt;</span>
	                 <span>고객센터</span>
	                 <span class="gt">&gt;</span>
	                 <strong class="warning">개인정보취급방침</strong>
	             </div>
	         </div>
	    </div><!-- // breadcrumb -->

		<div class="container visual-wrap"><!-- visual -->
		    <div class="wrap">
		        <img src="<c:out value="${cdnDomain}"/>/pc/img/custom/visual_helpdesk.png" alt="" />
		    </div>
		</div><!-- // visual -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->

				<div id="lnb"><!-- lnb -->
				    <ul class="reset">
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do">FAQ</a></li>
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/inquiryMain.do">1:1문의</a></li>
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/noticeBoardList.do">공지사항</a></li>
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/membershipBenefit.do">멤버십혜택</a></li>
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/groupInquiryForm.do">단체주문문의</a></li>
				        <li><a href="<c:out value="${frontDomain}" />/pc/customer/utilAgree.do">이용약관</a></li>
					    <li class="active"><a href="<c:out value="${frontDomain}" />/pc/customer/privacyPolicy.do">개인정보취급방침</a></li>
				    </ul>
				</div><!-- // lnb -->

				<div id="internal"><!-- internal -->

					<div class="section-clause">
					    <h3 class="title liner"><span>개인정보취급방침</span></h3>   
					
					    <div id="internalLink" class="list">
					        <ol>
					            <li><a href="#clause1">총칙</a></li>
					            <li><a href="#clause2">개인정보 수집항목 및 방법 </a></li>
					            <li><a href="#clause3">개인정보의 수집 및 이용목적 </a></li>
					            <li><a href="#clause4">비회원고객 개인정보수집</a></li>
					            <li><a href="#clause5">개인정보 자동수집 장치의 설치, 운영 및 거부 </a></li>
					            <li><a href="#clause6">개인정보의 제3자 제공 </a></li>
					            <li><a href="#clause7">이용자 권리 와 그 행사방법 </a></li>
					            <li><a href="#clause8">개인정보보호를 위한 기술 및 관리적 대책 </a></li>
					            <li><a href="#clause9">링크사이트 </a></li>
					            <li><a href="#clause10">게시물 </a></li>
					            <li><a href="#clause11">개인정보 위탁처리 </a></li>
					            <li><a href="#clause12">개인정보의 보유 및 이용기간 </a></li>
					            <li><a href="#clause13">회원의 권리와 의무 </a></li>
					            <li><a href="#clause14">개인정보관련 의견수렴 및 불만처리 </a></li>
					            <li><a href="#clause15">개인정보 관리책임자 및 담당자 </a></li>
					            <li><a href="#clause16">개인정보 취급방침 변경고지의 의무 </a></li>
					        </ol>
					    </div>
					
					</div>                            

					<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

				</div><!-- internal -->

			</div><!-- wrap -->
		</div><!-- // container -->

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script>
$(function(){
	// internal link
    $('#internalLink a').on('click', function(e){
        e.preventDefault();
        $('html').addClass('sticky');
        var $target = $($(this).attr('href')),
            _margin = 100,
            _top = 0;
        if ($target.length) {
            _top = parseInt($target.offset().top, 10) - _margin;
            $('html, body').animate({
                'scrollTop': _top
            }, 130);
        }
    });
});
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>