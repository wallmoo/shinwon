<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

<style>
.sub #ajaxDiv { background: #fff; }
.sub #ajaxDiv #tab-guide-contents { background: #fff; }
</style>

</head>

<body class="page-helpdesk sub"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
          <div class="outer-wrap helpdesk-guide"><!-- outer wrap -->

                <div class="wrap"><!-- wrap -->
                    <%-- <div class="breadcrumbs">
                        <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="home"></a>
                        <span class="gt"></span>
                        <span class="current">고객센터</span>
                    </div> --%>
                    <h3 class="title">고객센터</h3>
		
                    <div class="tab-helpdesk js-tab-toggle-active"><!-- tab nav -->
                        <ul class="tab">
                            <li class="nth-child-1"><a href="<c:out value="${frontDomain}" />/pc/customer/noticeBoardList.do"><span>공지사항</span></a></li>
                            <li class="nth-child-2"><a href="<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do"><span>쇼핑FAQ</span></a></li>
                            <li class="nth-child-3 active"><a href="<c:out value="${frontDomain}" />/pc/customer/shoppingGuideMain.do"><span>쇼핑가이드</span></a></li>
                            <li class="nth-child-4"><a href="<c:out value="${frontDomain}" />/pc/customer/productGuideMain.do"><span>상품가이드</span></a></li>
                            <li class="nth-child-5"><a href="<c:out value="${frontDomain}" />/pc/customer/inquiryMain.do"><span>1:1문의</span></a></li>
                            <li class="nth-child-6"><a href="<c:out value="${frontDomain}" />/pc/customer/agreementBoardList.do"><span>이용약관</span></a></li>
                            <li class="nth-child-7"><a href="<c:out value="${frontDomain}" />/pc/customer/groupInquiryForm.do"><span>단체주문문의</span></a></li>
                            <li class="nth-child-8"><a href="<c:out value="${frontDomain}" />/pc/customer/sitemap.do"><span>사이트맵</span></a></li>
                        </ul>
                    </div><!-- // tab nav -->
                    
	                <h4 class="title">쇼핑 가이드</h4>
	
	                <div class="tab-guide"><!-- tab-guide -->
	                	
	                	<ul class="tab">
	                        <c:if test="${not empty shoppingGuideList }">
	                            <c:forEach var="item" items="${shoppingGuideList }" varStatus="i">
	                            	<li class="<c:if test="${i.index eq 0}">first-child </c:if> shoppingGuideListLi" id="li_${item.BRD_SHG_IDX}">
	                            		<a href="javascript:;" class="brdShgIdx" data-brd_shg_idx="<c:out value="${item.BRD_SHG_IDX }"/>">
	                            			<span><c:out value="${item.BRD_CMN_COM_NM }"/></span>
	                            		</a>
	                            	</li>
	                            </c:forEach>
	                        </c:if>
	                    </ul>
	                </div><!-- // tab-guide -->
	                
	                <div id="ajaxDiv">
	                
	                </div>

				</div><!-- // wrap -->
				
            </div><!-- // outer-wrap -->
            
            <div class="bottom-spacer" aria-hidden="true"></div><!-- bottom spacer : container 닫는 태그 상단에 위치 -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/plugins.js" charset="utf-8"></script>
<!--[if (gt IE 8)|!(IE)]> <!--> <script src="<c:out value="${cdnDomain}" />/pc/js/plugins/jquery.touchSwipe.1.3.3.min.js" charset="utf-8"></script> <!--<![endif]-->
<script src="<c:out value="${cdnDomain}" />/pc/js/base.js" charset="utf-8"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/main.js" charset="utf-8"></script> --%>
<!--
<script>document.write('<script src="<c:out value="${cdnDomain}" />/pc/js/main.js?timeStamp='+Math.floor(+new Date()/1000)+'" charset="utf-8"><\/script>');</script>
-->
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/defer.js" charset="utf-8" defer></script> --%>
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/ui.js" charset="utf-8" defer></script> --%>
<script src="<c:out value="${cdnDomain}" />/pc/js/common.js" charset="utf-8"></script>
<script type="text/javascript">
//<![CDATA[
$(function(){
	var BRD_SHG_IDX = "${commandMap.BRD_SHG_IDX}";
	if(BRD_SHG_IDX != ""){  
		getDetailAjax(BRD_SHG_IDX);
	}else{
		var firstIdx = $(".brdShgIdx").eq(0).data("brd_shg_idx");
		getDetailAjax(firstIdx);
	}
	
	// 제목 a Tag 클릭 이벤트
    $(document).on("click", ".brdShgIdx", function () {
        var brdShgIdx = $(this).data("brd_shg_idx");
        getDetailAjax(brdShgIdx);
    });
	
});

//상세 가져오기
function getDetailAjax(brdShgIdx){
	$("#ajaxDiv").load("<c:out value="${frontDomain}" />/pc/customer/shoppingGuideDetailAjax.do",{"BRD_SHG_IDX":brdShgIdx}, function(){
		$(".shoppingGuideListLi").removeClass("active");
		$("#li_"+brdShgIdx).addClass("active");
	});	
}
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>