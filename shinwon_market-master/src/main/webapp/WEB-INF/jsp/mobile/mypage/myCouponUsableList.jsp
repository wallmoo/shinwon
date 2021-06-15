<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>쿠폰</h2>
	            <a href="javascript:history.back(); return false;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="my-coupon"><!-- my-coupon -->
	            <div class="core">
	            	<!-- 통합회원일 경우(platinum, vip, gold, silver, red) -->
		        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
		        		<!-- platinum -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_PLATINUM_GRADE }">
		        			<div class="level platinum"></div>
		        		</c:if>
		        		<!-- vip -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_VIP_GRADE }">
		        			<div class="level vip"></div>
		        		</c:if>
		        		<!-- gold -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_GOLD_GRADE }">
		        			<div class="level gold"></div>
		        		</c:if>
		        		<!-- silver -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_SILVER_GRADE }">
		        			<div class="level silver"></div>
		        		</c:if>
		        		<!-- red -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_RED_GRADE }">
		        			<div class="level red"></div>
		        		</c:if>
		        	</c:if>
		        	
		        	<!-- 간편회원일 경우(easy) -->
		        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE }">
		        		<div class="level easy"></div>
		        	</c:if>
		        	
		        	<!-- 기업회원일 경우(business business-a, business business-b) -->	
					<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE }">
						<!-- 1등급 -->
						<c:if test="${summaryMap.MEM_MST_MEM_GRD ne Code.COMP_MEMBER_BASIC_GRADE }">
							<div class="level business-a"></div>
						</c:if>
						<!-- 2등급 -->
						<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.COMP_MEMBER_BASIC_GRADE }">
							<div class="level business-b"></div>
						</c:if>
					</c:if>
	
	                <p>
	                    <strong><span class="primary"><c:out value="${sessionUser.MEM_MST_MEM_NM }"/></span> 고객님의<br />
	                    현재 회원등급은 <span class="warning"><c:out value="${summaryMap.MEM_GRD_NM}" /></span>입니다.</strong>
	                </p>
	                <p class="count">
	                    등급쿠폰  <c:out value="${couponCntMap.CPN_GRB_CNT }" /> 장
	                    <span class="pipe">|</span>
	                    특별쿠폰  <c:out value="${couponCntMap.CPN_OTR_CNT }" /> 장
	                </p>
	            </div>
	            <div class="desc">
	                <a href="<c:out value="${mobileDomain }"/>/mobile/event/eventMain.do" class="button small more"><span>진행중인 이벤트</span></a>
	                <a href="<c:out value="${mobileDomain }"/>/mobile/event/planList.do" class="button small more"><span>진행중인 기획전</span></a>
	            </div>
	        </div><!-- // my-coupon -->
	
	        <div class="search-register coupon"><!-- search-register -->
	            <div class="upper section-button">
	                <a href="javascript:;" class="button primary register"><span>제휴쿠폰 등록하기</span><em class="blind">열기</em></a>
	            </div>
	
	            <div class="downer">
	                <p class="primary">
	                    제휴사에서 받으신 제휴 쿠폰을 등록해 주세요
	                </p>
	                <div class="module">
	                    <h3><span class="large">쿠폰번호등록</span></h3>
	                    <div class="form">
	                        <input type="text" class="text" id="couponNumber" name="couponNumber" maxlength=20 placeholder="하이픈(-) 포함하여 등록 가능합니다." title="하이픈(-) 포함하여 등록 가능합니다.">
	                        <a href="javascript:getShpCoupon()" class="button primary small"><span>쿠폰등록</span></a>
	                    </div>
	                    <h4><span class="warning">쿠폰  사용시 주의사항</span></h4>
	                    <p>
	                        쿠폰 유효기간을 꼭 확인해 주세요.  해당 쿠폰은 마켓플랜트 온라인 쇼핑몰에서만 사용 가능합니다
	                    </p>
	                </div>
	            </div>
	        </div><!-- // search-register -->
	
	        <div class="coupon-list-wrap"><!-- coupon-list-wrap -->
	            <h3>나의 쿠폰<span class="desc info">마감임박순입니다.</span></h3>
				<c:choose>
					<c:when test="${not empty list }">
						<ul class="coupon-list _scroll_list_ck">
						<c:forEach var="list" items="${list }" varStatus="status">
							<li>
			                    <div class="core">
			                        <p class="coupon <c:out value="${list.CPN_MST_GBN_CLASS }" />">
			                        	<c:choose>
	                                		<c:when test="${list.CPN_MST_GBN eq 'F'}">
	                                			<span>무료배송</span>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<c:choose>
	                                				<c:when test="${list.CPN_MST_SAL_GBN eq 'A' }">
	                                					<strong><c:out value="${list.CPN_MST_SAL_PRC }" /></strong><span>%할인</span>
	                                				</c:when>
	                                				<c:otherwise>
	                                					 <strong><fmt:formatNumber value="${list.CPN_MST_SAL_PRC }" groupingUsed="true" /></strong><span>원</span>
	                                				</c:otherwise>
	                                			</c:choose>
	                                		</c:otherwise>
	                                	</c:choose>
			                        </p>
			                        <div class="scale">
	                                	<c:if test="${list.CPN_MST_TGT_GBN eq 'A' }">
	                                    	<a href="javascript:goSetCouponPopup('1','<c:out value="${list.CPN_MST_IDX }" />');" class="button full primary small"><span>적용상품보기</span></a>
	                                    </c:if>
	                                    <c:if test="${list.CPN_MST_TGT_GBN eq 'B' }">
	                                    	<p class="all">전체상품</p>
	                                    </c:if>
	                                    <c:if test="${list.CPN_MST_TGT_GBN eq 'C' }">
	                                    	<a href="javascript:goSetCouponPopup('2','<c:out value="${list.CPN_MST_IDX }" />');" class="button full primary small"><span>적용브랜드보기</span></a>
	                                    </c:if>
	                                    <c:if test="${list.CPN_MST_TGT_GBN eq 'D' }">
	                                    	<a href="javascript:goSetCouponPopup('3','<c:out value="${list.CPN_MST_IDX }" />');" class="button full primary small"><span>적용기획전보기</span></a>
	                                    </c:if>
			                        </div>
			                    </div>
			                    <div class="desc">
			                        <p class="subject"><strong class="large"><c:out value="${list.CPN_MST_TITLE }" /></strong></p>
			                        <p class="date">
			                        	<c:out value="${list.CPN_MST_USE_TXT }" />
			                        </p>
			                        <p class="limit">
			                        	<fmt:formatNumber value="${list.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시
			                        	<c:if test="${list.CPN_MST_GBN ne 'F' }" >
	                                		최대 <fmt:formatNumber value="${list.CPN_MST_MXM_PRC }" groupingUsed="true" />원 할인
	                                	</c:if>
			                        </p>
			                    </div>
			                </li>
						</c:forEach>
						</ul>
					</c:when>
					<c:otherwise>
						<p class="no-more">
			                사용 가능한 쿠폰이 없습니다.
			            </p>
					</c:otherwise>
				</c:choose>
				<div id="divCouponList"></div>
	        </div><!-- // coupon-list-wrap -->
	
	        <div class="section-button"><!-- section-button -->
	            <a href="<c:out value="${mobileDomain}"/>/mobile/mypage/myCouponGradeList.do" target="_self" class="button full"><span>등급별 쿠폰혜택 보기</span></a>
	        </div><!-- // section-button -->
				
		</article>
	<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<form id="popFrm" name="popFrm">
<input type="hidden" name="cPage" id="cPage" value="1"/>
<input type="hidden" name="couponTotLen" id="couponTotLen" value="<c:out value="${totalCount }" />"/>
<input type="hidden" name="CPN_MST_IDX" id="CPN_MST_IDX" value=""/>
</form>
<script type="text/javascript">
//<![CDATA[
$(function(){
	//제휴 쿠폰 등록
    getShpCoupon = function(){
    	var couponNumber = $("#couponNumber").val();
    	
    	if(couponNumber == ""){
    		alert("제휴 쿠폰번호를 등록해주세요.");
    		$("#couponNumber").focus();
    		return;
    	}else{
    		$.ajax({
    			async : false,
    			type : "POST",
    			data : {
    				"CPN_PTN_SHP_NO" : couponNumber
    			},
    			url : "<c:out value="${mobileDomain}" />/pc/mypage/insertShpCouponAjax.do",
    			success : function(data) {
    				var result = data.result;
    				if(result == 0){
    					alert("제휴쿠폰이 등록되었습니다.");
    					location.reload();
    				}else if(result == 1){
    					alert("이미 발급받은 제휴쿠폰 입니다.");
    				}else if(result == 2 || result == 3){
    					alert("해당 제휴쿠폰은 발급수량 초과로 발급 할 수 없습니다.");
    				}else if(result == 4){
    					alert("제휴쿠폰 등록중 오류가 발생 하였습니다.\n다시 시도해주세요.");
    				}else if(result == 5){
    					alert("해당 쿠폰 번호로 등록 된 제휴쿠폰이 없습니다.\n관리자에게 문의해주세요.");
    				}else if(result == 6){
    					alert("해당 쿠폰은 이미 발급 된 제휴쿠폰입니다.");
    				}else if(result == -1){
    					alert("예상외 오류가 발생하였습니다.\n관리자에게 문의해주세요.");
    				}else{
    					alert("예상외 오류가 발생하였습니다.\n관리자에게 문의해주세요.");
    				}
    			},
    			error : function(err) {
    				alert("오류가 발생하였습니다.\n[" + err.status + "]");
    				window.jquery
    						|| console
    								.log('오류가 발생하였습니다: ' + err.status);
    			}
    		});
    	}
    };
    //쿠폰적용팝업 (1:적용상품,2:적용브랜드,3:적용기획전)
    goSetCouponPopup = function(setGu,cpnMstIdx){
    	var url = "";
    	switch(setGu){
    		case '1' : url = "<c:out value="${mobileDomain}"/>/mobile/mypage/myCouponProductPopup.do";
    				   break;
    		case '2' : url = "<c:out value="${mobileDomain}"/>/mobile/mypage/myCouponBrandPopup.do";
    				   break;
    		case '3' : url = "<c:out value="${mobileDomain}"/>/mobile/mypage/myCouponPlanPopup.do";
    				   break;
    	}
    	$("#cPage").val(1)
		$("#CPN_MST_IDX").val(cpnMstIdx);    	
 		$("#popFrm").attr({"action":url, "target":"_self", "method":"post"}).submit();
    };
});

$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
    /*
        _idx = 리스트감싸고있는 객체
        _reNum = 리턴 몇번째넘어왔는지
    */
    //myPageMileageListAjax(_reNum);
    var couponTotLen = $("#couponTotLen").val();
    var addcPage = $("#cPage").val();
    couponTotLen = Math.ceil(couponTotLen / 10);
    
    if(_reNum < 2){
		cPage = _reNum + 2;
	}else{
		cPage = parseInt(addcPage) + 1;
	}
    $("#cPage").val(cPage)
    
    if(cPage <= couponTotLen){
    	$.ajax({
            async : false,
            type : "POST",
            data : { "cPage": cPage},
            dataType : "html",
            url : "<c:out value="${mobileDomain}" />/mobile/mypage/myCouponUsableListAjax.do",
            success : function (data) 
            {
            	if(data != null)
    			{
            		_idx.append(data); 
    			}
    			else
    			{
    				alert("조회된 데이터가 없습니다.");
    			}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
            }
    	});
    }else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
}

//]]>
</script>
</body>
</html>