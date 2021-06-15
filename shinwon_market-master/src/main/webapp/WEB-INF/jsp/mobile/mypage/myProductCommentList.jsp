<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-basket blackyak"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title-->
			<h3><span>상품평</span></h3>
			<a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
			<a href="#more" class="more"><span class="icon"><em>더 보기</em></span></a>
			<div id="more" class="sub">
			    <ul class="reset">
			        <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myShoppingList.do','_self');"><span>쇼핑내역</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myCouponUsableList.do"><span>쿠폰</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myPointList.do"><span>크라운</span></a></li>
			        <li class="active"><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myProductCommentList.do"><span>상품평</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myProductInquiryList.do"><span>상품 Q&amp;A</span></a></li>
			        <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryList.do','_self');"><span>1:1 문의</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/todayViewProductList.do"><span>오늘 본 상품</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myDeliveList.do"><span>배송주소록</span></a></li>
			        <li><a href="javascript:memberInfoModify();"><span>회원정보수정</span></a></li>
				    <li><a href="javascript:memberInfoDelete();"><span>회원탈퇴</span></a></li>
			    </ul>
			</div>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap gutter"><!-- wrap -->

				<ul class="list list-a">
				    <li>최근 3개월간의 상품평만 조회 가능합니다.</li>
				    <li>이전 내역은 PC 버전에서 확인해주시기 바랍니다.</li>
				</ul>

				<c:choose>
					<c:when test="${not empty list}">
						<div id="bbsReview" class="bbs-review js-bbs-collapse"><!-- bbs-qna -->
							<c:forEach var="data" items="${list }" varStatus="status">
								<div class="item-bbs"><!-- item -->
									<div class="head">
									    <div class="table">
									        <div class="cell pic">
									            <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${data.PRD_PRD_MST_CD }">
									            	<img src="<c:out value="${cdnDomain }${data.PRD_MST_IMG_URL_PATH }"/>" alt="${data.PRD_MST_NM}" class="thumb99"/>
									            </a>
									        </div>
									        <div class="cell desc">
									            <p class="name">
									                <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${data.PRD_PRD_MST_CD }">
									                	<c:out value="${data.PRD_MST_NM}" />
									                </a>
									            </p>
									            <p class="status">작성일: <strong><ui:formatDate value="${data.PRD_REV_REG_DT}" pattern="yyyy.MM.dd"/></strong></p>
									            <p class="point">만족도: <span class="star star-<c:out value="${data.PRD_REV_SCORE_STAR }"/>"><em></em></span></p>
									            <div class="action">
									                <a href="javascript:;" class="button small primary" data-prd_rev_idx="${data.PRD_REV_IDX}" data-prd_prd_mst_cd="${data.PRD_PRD_MST_CD}">
									                	<span>수정</span>
									                </a>
									                <a href="javascript:;" class="button small warning" data-prd_rev_idx="${data.PRD_REV_IDX}">
									                	<span>삭제</span>
									                </a>
									            </div>
									        </div>
									    </div>
									</div>
									<div class="grid subject"><!-- 배송 상태 -->
									    <div class="col-1-1">
									        <a href="javascript:;" class="toggler">
									            <span class="icon pic"><em>사진첨부</em></span>
									            <c:out value="${data.PRD_REV_TITLE}" />
									        </a>
									    </div>
									</div>
									<div class="toggle body"><!-- body -->
									    <div class="pic">
									        <c:if test="${not empty data.fileList }">
								            	<c:forEach var="fileRow" items="${data.fileList }" varStatus="i">
						                    		<img src="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH }${fileRow.CMM_FLE_SYS_NM }" alt="${fileRow.CMN_FLE_ALT_TXT}" />
						                    	</c:forEach>
						                    </c:if>
									    </div>
									    <div class="grid options">
									        <div class="col-1-2">
									            <span>SIZE:</span>
									            <strong><c:out value="${Code.PRODUCT_REV_SIZE_NM[data.PRD_REV_SIZE_STAR]}"/></strong>
									        </div>
									        <div class="col-1-2">
									            <span>COLOR:</span>
									            <strong><c:out value="${Code.PRODUCT_REV_COLOR_NM[data.PRD_REV_COLOR_STAR]}"/></strong>
									        </div>
									    </div>
									    <div class="texts">
									        <ui:replaceLineBreak content="${data.PRD_REV_CONTENTS}"/>
									    </div>
									</div><!-- // body -->
								</div><!-- // item -->
							</c:forEach>
						</div><!-- // bbs-qna -->
					</c:when>
					<c:otherwise>
						<div class="section-message message">
						    <p>작성한 상품평이 없습니다.</p>
						</div>
					</c:otherwise>
				</c:choose>
				
				<form id="frm" name="frm">
				    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
				    <input type="hidden" name="writableYn" value="<c:out value="${commandMap.writableYn }"/>"/>
				    <input type="hidden" name="PRD_REV_IDX" value=""/>
				    <input type="hidden" name="PRD_PRD_MST_CD" value=""/>
				    <input type="hidden" name="pageStatus" value=""/>
				    <double-submit:preventer/>
				    
				    <div class="section-pagination"><!-- section pagination -->
			  			<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			        </div><!-- // section pagination -->
				</form>

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
	    // 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductCommentList.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    //상품평 수정 버튼 클릭
	    $('.primary').on('click', function(e)
	    {
	    	var $frm = $("#frm");
	    	$("#frm input[name='PRD_REV_IDX']").val($(this).data("prd_rev_idx"));
	    	$("#frm input[name='PRD_PRD_MST_CD']").val($(this).data("prd_prd_mst_cd"));
	    	$("#frm input[name='pageStatus']").val("M");
   			$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductCommentPopup.do", "target":"_self", "method":"post"}).submit();    	
	    });
	    
	    //상품평 삭제 버튼 클릭
	    $('.warning').on('click', function(e)
	    {
	    	var prd_rev_idx = $(this).data("prd_rev_idx");
	    	if(confirm("삭제하시겠습니까?"))
			{
				$("#frm input[name='cPage']").val("1");
				$("#frm input[name='PRD_REV_IDX']").val(prd_rev_idx);
				$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductCommentRemove.do", "target":"_self", "method":"post"}).submit();
			}
	    });
	});
//]]>
</script>

</body>
</html>