<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-helpdesk blackyak">

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->

	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>개인정보취급방침</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		    <a href="#more" class="more"><span class="icon"><em>더 보기</em></span></a>
		    <div id="more" class="sub">
		        <ul class="reset">
		        	<li><a href="<c:out value="${mobileDomain}" />/mobile/customer/faqBoardList.do"><span>FAQ</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/inquiryMain.do"><span>1:1문의</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardList.do"><span>공지사항</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/membershipBenefitNormal.do"><span>멤버십혜택</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/groupInquiryForm.do"><span>단체주문문의</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/utilAgree.do"><span>이용약관</span></a></li>
		            <li class="active"><a href="javascript:;"><span>개인정보취급방침</span></a></li>
		        </ul>
		    </div>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap gutter"><!-- wrap -->

				<div class="section-clause">
				    <div class="list">
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
				
				    <div id="clause1">
				        <h4>1. 총칙 </h4>
				        <ol>
				            <li>개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 휴대폰번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다)를 말합니다. </li>
				            <li>당사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. </li>
				            <li>당사는 개인정보취급방침을 홈페이지 첫 화면을 통하여 공개함으로써 고객님께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다. </li>
				            <li>당사는 개인정보취급방침의 지속적인 개선을 위하여 개인정보취급방침을 개정하는데 필요한 절차를 정하고 있습니다. </li>
				        </ol>
				    </div>
				
				
				</div>

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // wrap -->

		</div><!-- // container -->
	</div><!-- // contents -->	
		
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
	$(function(){  
		
	});
//]]>
</script>

</body>
</html>