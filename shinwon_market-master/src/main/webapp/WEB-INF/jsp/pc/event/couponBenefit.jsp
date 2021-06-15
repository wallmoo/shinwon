<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-event">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents minW"><!-- .contents S -->

			<!-- .section S -->
			<section class="event_zone">
				
				<%@ include file="/WEB-INF/jsp/pc/event/eventMenuInclude.jsp" %>
				
				<!-- .ev_con S -->
				<div class="ev_con ev_coupon"> <!-- 이벤트: ev_cons / 회원혜택: ev_member / 쿠폰혜택: ev_coupon / 카드혜택: ev_card -->
				
					<c:if test="${empty userInfo }">
					<dl class="ev_login">
						<dt>
							<div class="ti">
								<strong>회원등급별 혜택</strong>
								<hr />
							</div>
							<h3>로그인 하시면 등급별 쿠폰을 확인 하실 수 있습니다.</h3>
						</dt>
						<dd class="btn">
							<a href="javascript:goLogin();" class="btn_st0 btn_wh_l"><span>로그인하기</span></a>
							<a href="<c:out value="${frontDomain }"/>/pc/event/memberBenefit.do" class="btn_st0 btn_wh_l"><span>회원 혜택보기</span></a>
						</dd>
					</dl>
					</c:if>
					
					<!--// .ev_login E -->
					<!-- .my_class S -->
					<c:if test="${commandMap.MEM_MST_MEM_GBN ne '683'}">
					<c:if test="${not empty userInfo }">
					<dl class="my_class">
						<dt class="blind">고객님의 등급 및 혜택,쿠폰 입니다.</dt>
						<dd>
							<c:set var="lev" value="" />
							<c:choose>
								<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1833' }">
									<c:set var="lev" value="red" />
								</c:when>
								<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1834' }">
									<c:set var="lev" value="silver" />
								</c:when>
								<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1835' }">
									<c:set var="lev" value="gold" />
								</c:when>
								<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1836' }">
									<c:set var="lev" value="vip" />
								</c:when>
								<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1837' }">
									<c:set var="lev" value="platinum" />
								</c:when>
								<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1838' }">
									<c:set var="lev" value="business-a" />
								</c:when>
								<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1839' }">
									<c:set var="lev" value="business-b" />
								</c:when>
								<c:otherwise>
									<c:set var="lev" value="easy" />
								</c:otherwise>
							</c:choose>
                            <span class="level <c:out value="${lev }" />"><!-- level --></span><!--  platinum, vip, gold, silver, red, easy, business business-a, business business-b, nonmember -->
							<div class="tx">
								<strong>회원등급별 혜택</strong>
								<c:choose>
									<c:when test="${userInfo.MEM_MST_MEM_GBN eq '682' }">
										<h3><strong><c:out value="${userInfo.MEM_MST_MEM_NM }" /></strong>님의 <strong class="co_red"><c:out value="${userInfo.MEM_MST_MEM_GRD_NM }" /> 등급</strong> 쿠폰입니다.</h3>
									</c:when>
									<c:when test="${userInfo.MEM_MST_MEM_GBN eq '1961' }">
										<h3><strong><c:out value="${userInfo.MEM_MST_MEM_NM }" /></strong>님의 <strong class="co_red">간편회원</strong> 쿠폰입니다.</h3>
									</c:when>
								</c:choose>
							</div>
						</dd>
					</dl>
					
					<c:if test="${empty topList}">
					<dl>
						<dt class="cu_ti">
							<strong>사용 가능한 쿠폰</strong>
						</dt>
						<dd class="cu_list">
							<ol>
								<li class="no_list">이용 가능한 쿠폰이 없습니다.</li>
							</ol>
						</dd>
					</dl>
					</c:if>
					
					<c:if test="${not empty topList}">
					<dl>
						<dt class="cu_ti">
							<strong>사용 가능한 쿠폰</strong>
						</dt>
						<dd class="cu_list">
							<ol id="topOl">
							<c:forEach items="${topList }" var="topRow" varStatus="topSta">
								<li>
									<c:if test="${topRow.CPN_MST_GBN ne 'F' }">
										<c:choose>
											<c:when test="${topRow.CPN_MST_SAL_GBN eq 'A' }">
											<!--  img src="<c:out value="${cdnDomain}" />/pc/img/event/img_coupon_<c:out value="${topRow.CPN_MST_SAL_PRC }" />_2.gif" alt="<c:out value="${topRow.CPN_MST_SAL_PRC }" />% 할인 쿠폰" />-->
											<p class="coupon sale">
                               					<span class="tit"><strong><c:out value="${topRow.CPN_MST_SAL_PRC }" /></strong>%</span>
                               					<span class="text">할인쿠폰</span>
											</p>
											</c:when>
											<c:when test="${topRow.CPN_MST_SAL_GBN eq 'B' }">
											<!--  <img src="<c:out value="${cdnDomain}" />/pc/img/event/img_coupon_<c:out value="${topRow.CPN_MST_SAL_PRC }" />.gif" alt="<c:out value="${topRow.CPN_MST_SAL_PRC }" />원 할인 쿠폰" />-->
											<p class="coupon price">
												<span class="tit"><strong><fmt:formatNumber value="${topRow.CPN_MST_SAL_PRC}" groupingUsed="true" /></strong>원</span>
												<span class="text">할인쿠폰</span>
											</p>
											</c:when>
										</c:choose>
										<p class="ti tx_doc"><strong>쿠폰명 :</strong><c:out value="${topRow.CPN_MST_TITLE }" /></p>
										<c:choose>
											<c:when test="${topRow.CPN_MST_ISU_DAY_GBN eq 'A' }">
										<p class="tx"><span>사용기간 :</span><ui:formatDate value="${topRow.CPN_MST_USE_ST_DT }" pattern="yyyy.MM.dd"/> ~  <ui:formatDate value="${topRow.CPN_MST_USE_ED_DT }" pattern="yyyy.MM.dd"/></p>	
											</c:when>
											<c:when test="${topRow.CPN_MST_ISU_DAY_GBN eq 'B' }">
										<p class="tx"><span>사용기간 :</span>발행일로부터 <c:out value="${topRow.CPN_MST_USE_DAY }" />일</p>										
											</c:when>
											<c:when test="${topRow.CPN_MST_ISU_DAY_GBN eq 'M' }">
										<p class="tx"><span>사용기간 :</span>발행 당월말까지 사용</p>											
											</c:when>
										</c:choose>
										<p class="tx l"><span>사용조건 :</span><fmt:formatNumber value="${topRow.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시</p>
										<c:if test="${topRow.CPN_MST_TGT_GBN eq 'A' }">
											<a href="javascript:goSetCouponPopup('1','<c:out value="${topRow.CPN_MST_IDX }" />');" class="btn_bl_ev"><span>적용상품보기</span></a>
										</c:if>
										<c:if test="${topRow.CPN_MST_TGT_GBN eq 'B' }">
											<a href="javascript:void(0)" class="btn_w_ev"><span>전체상품</span></a>
										</c:if>
										<c:if test="${topRow.CPN_MST_TGT_GBN eq 'C' }">
											<a href="javascript:goSetCouponPopup('2','<c:out value="${topRow.CPN_MST_IDX }" />');" class="btn_bl_ev"><span>적용브랜드보기</span></a>
										</c:if>
										<c:if test="${topRow.CPN_MST_TGT_GBN eq 'D' }">
											<a href="javascript:goSetCouponPopup('3','<c:out value="${topRow.CPN_MST_IDX }" />');" class="btn_bl_ev"><span>적용기획전보기</span></a>
										</c:if>										
									</c:if>
									
									<c:if test="${topRow.CPN_MST_GBN eq 'F' }">
									<p class="coupon ship">
                             			<strong class="tit">무료배송</strong>
                             			<span class="text">할인쿠폰</span>
									</p>
									<p class="ti tx_doc"><strong>쿠폰명 :</strong><c:out value="${topRow.CPN_MST_TITLE }" /></p>
									<c:choose>
										<c:when test="${topRow.CPN_MST_ISU_DAY_GBN eq 'A' }">
									<p class="tx"><span>사용기간 :</span><ui:formatDate value="${topRow.CPN_MST_USE_ST_DT }" pattern="yyyy.MM.dd"/> ~  <ui:formatDate value="${topRow.CPN_MST_USE_ED_DT }" pattern="yyyy.MM.dd"/></p>	
										</c:when>
										<c:when test="${topRow.CPN_MST_ISU_DAY_GBN eq 'B' }">
									<p class="tx"><span>사용기간 :</span>발행일로부터 <c:out value="${topRow.CPN_MST_USE_DAY }" />일</p>										
										</c:when>
										<c:when test="${topRow.CPN_MST_ISU_DAY_GBN eq 'M' }">
											<p class="tx"><span>사용기간 :</span>발행 당월말까지 사용</p>											
										</c:when>
									</c:choose>
									<p class="tx l"><span>사용조건 :</span><fmt:formatNumber value="${topRow.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시</p>
									</c:if>
								</li>
							</c:forEach>								
							</ol>
						</dd>
					</dl>
					</c:if>
					
					<div class="section-pagination" style="padding: 35px 0" id="topPage">
					<c:if test="${not empty topList }" >
						<ui:frontpaging paging="${topPaging }" jsFunction="goTopPage" />
					</c:if>						
					</div>
					</c:if>
					</c:if>
					
					<c:if test="${not empty list }" >
					<dl>
						<dt class="cu_ti">
							<strong>진행중인 쿠폰</strong>
						</dt>
						<dd class="cu_list">
							<ol id="ol">
							<c:forEach items="${list }" var="row" varStatus="sta">
								<li>
									<c:choose>
										<c:when test="${row.CPN_MST_SAL_GBN eq 'B' }">
										<!--  <img src="<c:out value="${cdnDomain}" />/pc/img/event/img_coupon_<c:out value="${row.CPN_MST_SAL_PRC }" />.gif" alt="<c:out value="${row.CPN_MST_SAL_PRC }" />원 할인 쿠폰" />-->
										<p class="coupon price">
                           					<span class="tit"><strong><fmt:formatNumber value="${row.CPN_MST_SAL_PRC }" groupingUsed="true" /></strong>원</span>
                           					<span class="text">할인쿠폰</span>
										</p>
										</c:when>
										<c:when test="${row.CPN_MST_SAL_GBN eq 'A' }">
										<p class="coupon sale">
                          					<span class="tit"><strong><c:out value="${row.CPN_MST_SAL_PRC }" /></strong>%</span>
                          					<span class="text">할인쿠폰</span>
										</p>
										<!--  <img src="<c:out value="${cdnDomain}" />/pc/img/event/img_coupon_<c:out value="${row.CPN_MST_SAL_PRC }" />_2.gif" alt="<c:out value="${row.CPN_MST_SAL_PRC }" />% 할인 쿠폰" />-->
										</c:when>
									</c:choose>
									<p class="ti tx_doc"><strong>쿠폰명 :</strong><c:out value="${row.CPN_MST_TITLE }" /></p>
									<c:choose>
										<c:when test="${row.CPN_MST_ISU_DAY_GBN eq 'A' }">
									<p class="tx"><span>사용기간 :</span><ui:formatDate value="${row.CPN_MST_USE_ST_DT }" pattern="yyyy.MM.dd"/> ~  <ui:formatDate value="${row.CPN_MST_USE_ED_DT }" pattern="yyyy.MM.dd"/></p>	
										</c:when>
										<c:when test="${row.CPN_MST_ISU_DAY_GBN eq 'B' }">
									<p class="tx"><span>사용기간 :</span>발행일로부터 <c:out value="${row.CPN_MST_USE_DAY }" />일</p>										
										</c:when>
										<c:when test="${row.CPN_MST_ISU_DAY_GBN eq 'M' }">
											<p class="tx"><span>사용기간 :</span>발행 당월말까지 사용</p>											
										</c:when>
									</c:choose>
									<p class="tx l"><span>사용조건 :</span><fmt:formatNumber value="${row.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시</p>
									<c:if test="${row.CPN_MST_TGT_GBN eq 'A' }">
										<a href="javascript:goSetCouponPopup('1','<c:out value="${row.CPN_MST_IDX }" />');" class="btn_bl_ev"><span>적용상품보기</span></a>
									</c:if>
									<c:if test="${row.CPN_MST_TGT_GBN eq 'B' }">
										<a href="javascript:void(0)" class="btn_w_ev"><span>전체상품</span></a>
									</c:if>
									<c:if test="${row.CPN_MST_TGT_GBN eq 'C' }">
										<a href="javascript:goSetCouponPopup('2','<c:out value="${row.CPN_MST_IDX }" />');" class="btn_bl_ev"><span>적용브랜드보기</span></a>
									</c:if>
									<c:if test="${row.CPN_MST_TGT_GBN eq 'D' }">
										<a href="javascript:goSetCouponPopup('3','<c:out value="${row.CPN_MST_IDX }" />');" class="btn_bl_ev"><span>적용기획전보기</span></a>
									</c:if>
									
									<a href="javascript:getCouponDwn('<c:out value="${row.CPN_MST_IDX }" />', 'all');" class="btn_ld_ev"><span>다운받기</span></a>
								</li>
							</c:forEach>
							</ol>
						</dd>
					</dl>
					</c:if>
					
					
					<div class="section-pagination" style="padding: 35px 0" id="page">
					<c:if test="${not empty list }" >
						<ui:frontpaging paging="${paging }" jsFunction="goPage" />
					</c:if>
					</div>
					
					<div class="tx_ex">
						<span><i>ㆍ</i>사용 가능한 유효기간, 기준금액 등 사용조건을 꼭 확인해 보시기 바랍니다.</span>
						<span><i>ㆍ</i>결제 시 쿠폰을 선택하지 않으면, 할인금액이 적용되지 않으며 당사 사정에 의해 쿠폰조건이 변경될 수 있습니다.</span>
						<span><i>ㆍ</i>발급된 쿠폰은 마이페이지>쇼핑혜택>쿠폰에서 확인하실 수 있습니다.</span>
					</div>
				</div>
				<!--// .ev_con E -->
			</section>
			<!--// .section E -->
			<form name="frm" id="frm">
			<input type="hidden" name="CPN_MST_IDX" id="CPN_MST_IDX" />
			</form>			
			
		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	<script type="text/javascript">
	
		goPage = function (cPage){
			$.ajax({
				type	: "POST",
				url		: "/pc/event/couponBenefitListAjax.do",
				dataType: "json",
				data	: {	 "cPage"			: cPage
							},
				success : function(data) {
					var innerHtml	= "";
					
					if(data.totalCount > 0){
						var listNum		= data.listNum;
						$.each(data.list, function(i,item){
							
							innerHtml	+= "<li>";
							
							if(item.CPN_MST_SAL_GBN == 'B'){
								innerHtml	+= '<p class="coupon price">';
								innerHtml	+= '<span class="tit"><strong>'+ numberWithCommas(item.CPN_MST_SAL_PRC) +'</strong>원</span><span class="text">할인쿠폰</span>';
								innerHtml	+= '</p>';
							}
        					
							if(item.CPN_MST_SAL_GBN == 'A'){
								innerHtml	+= '<p class="coupon sale">';
								innerHtml	+= '<span class="tit"><strong>' + item.CPN_MST_SAL_PRC + '</strong>%</span><span class="text">할인쿠폰</span>';									
								innerHtml	+= '</p>';
							}
							
							innerHtml	+= '<p class="ti tx_doc"><strong>쿠폰명 :</strong>'+ item.CPN_MST_TITLE +'</p>';
							
							if(item.CPN_MST_ISU_DAY_GBN == 'A'){
								innerHtml	+= '<p class="tx"><span>사용기간 :</span>' + getDateView(item.CPN_MST_USE_ST_DT, ".") +' ~ '+ getDateView(item.CPN_MST_USE_ED_DT, ".") + '</p>';
							}
							
							if(item.CPN_MST_ISU_DAY_GBN == 'B'){
								innerHtml	+= '<p class="tx"><span>사용기간 :</span>발행일로부터 '+ item.CPN_MST_USE_DAY +'일</p>';
							}
							
							if(item.CPN_MST_ISU_DAY_GBN == 'M'){
								innerHtml	+= '<p class="tx"><span>사용기간 :</span>발행 당월말까지 사용</p>';
							}
							
							innerHtml	+= '<p class="tx l"><span>사용조건 :</span>'+ numberWithCommas(item.CPN_MST_SML_PRC) +'원 이상 구매시</p>';
							
							if (item.CPN_MST_TGT_GBN == 'A' ){
								innerHtml	+= '<a href="javascript:goSetCouponPopup("1","' + item.CPN_MST_IDX + '" class="btn_bl_ev"><span>적용상품보기</span></a>';
							}
						
							if (item.CPN_MST_TGT_GBN == 'B' ){
								innerHtml	+= '<a href="javascript:void(0)" class="btn_w_ev"><span>전체상품</span></a>';	
							}
						
							if (item.CPN_MST_TGT_GBN == 'C' ){
								innerHtml	+= '<a href="javascript:goSetCouponPopup("2","' + item.CPN_MST_IDX +'");" class="btn_bl_ev"><span>적용브랜드보기</span></a>';
							}
						
							if (item.CPN_MST_TGT_GBN == 'D' ){
								innerHtml	+= '<a href="javascript:goSetCouponPopup("3","' + item.CPN_MST_IDX +'");" class="btn_bl_ev"><span>적용기획전보기</span></a>';
							}
						
							innerHtml	+= '<a href="javascript:getCouponDwn("' + item.CPN_MST_IDX +'", "all");" class="btn_ld_ev"><span>다운받기</span></a>';
							
							innerHtml	+= '</li>';	
						});
													
						$("#ol").html(innerHtml);
						
						var firstPageNo 				= data.firstPageNo;
			            var firstPageNoOnPageList 		= data.firstPageNoOnPageList;
			            var totalPageCount 				= data.totalPageCount;
			            var lastPageNoOnPageList 		= data.lastPageNoOnPageList;
			            var cPage 						= data.cPage;
			            var lastPageNo 					= data.lastPageNo;
			            var pageSize 					= data.pageSize;
			            var pagingSize 					= data.pagingSize;

			            innerHtml 	= "";
			            
			            if(totalPageCount > pagingSize){
			            	if(firstPageNoOnPageList > pagingSize){
			            		innerHtml += '<a class="nav first" href="javascript:;" onclick="goPage(' + firstPageNo + '); return false;" ><span class="blind">처음 페이지</span></a>';
			            		innerHtml += '<a class="nav prev" href="javascript:;" onclick="goPage(' + (firstPageNoOnPageList - 1) + '); return false;" ><span class="blind">이전 페이지</span></a>';
			            	}else{
			            		innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
			            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
			            	}
			            }else{
			            	innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
		            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
			            }
			            
			            
			            if (lastPageNoOnPageList > totalPageCount){
			                lastPageNoOnPageList = totalPageCount;
			            }
		            	
		            	for(var i=firstPageNoOnPageList; i<= lastPageNoOnPageList; i++){
		            		
			                if(i==cPage){
			                	innerHtml +='<a href="javascript:;" class="num active">' + i + '</a>';
			                }else{
			                	innerHtml +='<a href="javascript:;" onclick="goPage(' + i + '); return false;" class="num">' + i + '</a>';
			                }
			            }
			            	
		            	if(totalPageCount > pagingSize){
			                if(lastPageNoOnPageList < totalPageCount){
			                	innerHtml +='<a class="nav next" href="javascript:;" onclick="goPage('+ (lastPageNoOnPageList + 1) + '); return false;"><span class="blind">다음페이지</span></a>';
			                	innerHtml +='<a class="nav last" href="javascript:;" onclick="goPage('+ lastPageNo +'); return false;" ><span class="blind">끝 페이지</span></a>';
			                }else {
			                	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
			                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
			                }
			            } else {
			            	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
		                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
			            }
		            	
		            	$("#page").html(innerHtml);
		            	
					}else{
						// 쿠폰 없을 떄?
					}
				}, error : function(err) {
					window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});
	    };
		
	    goTopPage	= function(cPage){
	    	$.ajax({
				type	: "POST",
				url		: "/pc/event/couponTopBenefitListAjax.do",
				dataType: "json",
				data	: {	 "cPage"			: cPage
							},
				success : function(data) {
					var innerHtml	= "";
					
					if(data.totalCount > 0){
						var listNum		= data.listNum;
						$.each(data.list, function(i,item){
							innerHtml	+= "<li>";
							
							if(item.CPN_MST_GBN != 'F'){
								if(item.CPN_MST_SAL_GBN == 'A'){
									innerHtml	+= '<p class="coupon sale">';
									innerHtml	+= '<span class="tit"><strong>'+ item.CPN_MST_SAL_PRC +'</strong>%</span>할인 쿠폰';
									innerHtml	+= '</p>';
								}
								
								if(item.CPN_MST_SAL_GBN == 'B'){
									innerHtml	+= '<p class="coupon price">';
									innerHtml	+= '<span class="tit"><strong>'+ numberWithCommas(item.CPN_MST_SAL_PRC) +'</strong>원</span><span class="text">할인쿠폰</span>';
									innerHtml	+= '</p>';
								}
								
								innerHtml	+= '<p class="ti tx_doc"><strong>쿠폰명 :</strong>' + item.CPN_MST_TITLE +'</p>';
								
								if(item.CPN_MST_ISU_DAY_GBN == 'A'){
									innerHtml	+= '<p class="tx"><span>사용기간 :</span>' + getDateView(item.CPN_MST_USE_ST_DT, ".") + ' ~ ' + getDateView(item.CPN_MST_USE_ED_DT, ".") + '</p>'; 
								}
								
								if(item.CPN_MST_ISU_DAY_GBN == 'B'){
									innerHtml	+= '<p class="tx"><span>사용기간 :</span>발행일로부터 '+ item.CPN_MST_USE_DAY +'일</p>';	
								}
								
								if(item.CPN_MST_ISU_DAY_GBN == 'M'){
									innerHtml	+= '<p class="tx"><span>사용기간 :</span>발행 당월말까지 사용</p>';		
								}
								
								innerHtml	+= '<p class="tx l"><span>사용조건 :</span>' + numberWithCommas(item.CPN_MST_SML_PRC) +'원 이상 구매시</p>'
								
								if (item.CPN_MST_TGT_GBN == 'A'){
									innerHtml	+= '<a href="javascript:goSetCouponPopup("1","'+ item.CPN_MST_IDX +'");" class="btn_bl_ev"><span>적용상품보기</span></a>';	
								}
								
								if (item.CPN_MST_TGT_GBN == 'B'){
									innerHtml	+= '<a href="javascript:void(0)" class="btn_w_ev"><span>전체상품</span></a>';
								}
							
								if (item.CPN_MST_TGT_GBN == 'C'){
									innerHtml	+= '<a href="javascript:goSetCouponPopup("2","'+ item.CPN_MST_IDX +'");" class="btn_bl_ev"><span>적용브랜드보기</span></a>';
								}
								
								if (item.CPN_MST_TGT_GBN == 'D'){
									innerHtml	+= '<a href="javascript:goSetCouponPopup("3","'+ item.CPN_MST_IDX +'");" class="btn_bl_ev"><span>적용기획전보기</span></a>';
								}
							
							}
					
							if (item.CPN_MST_GBN == 'F'){
								innerHtml	+= '<p class="coupon ship">';
								innerHtml	+= '<strong class="tit">무료배송</strong><span class="text">할인쿠폰</span>';
								innerHtml	+= '</p>'; 
                    			
								innerHtml	+= '<p class="ti tx_doc"><strong>쿠폰명 :</strong>'+ item.CPN_MST_TITLE +'</p>';
							
								if(item.CPN_MST_ISU_DAY_GBN == 'A'){
									innerHtml	+= '<p class="tx"><span>사용기간 :</span>'+ getDateView(item.CPN_MST_USE_ST_DT, ".") + ' ~ ' + getDateView(item.CPN_MST_USE_ED_DT, ".") +'</p>';
								}
								
								if (item.CPN_MST_ISU_DAY_GBN == 'B'){
									innerHtml	+= '<p class="tx"><span>사용기간 :</span>발행일로부터 '+ item.CPN_MST_USE_DAY + '일</p>';										
								}
								
								if (item.CPN_MST_ISU_DAY_GBN == 'M'){
									innerHtml	+= '<p class="tx"><span>사용기간 :</span>발행 당월말까지 사용</p>';											
								}
						
								innerHtml	+= '<p class="tx l"><span>사용조건 :</span>'+ numberWithCommas(item.CPN_MST_SML_PRC) +'원 이상 구매시</p>';
							}
						
							innerHtml += '</li>';
						});
						
						$("#topOl").html(innerHtml);
						
						var firstPageNo 				= data.firstPageNo;
			            var firstPageNoOnPageList 		= data.firstPageNoOnPageList;
			            var totalPageCount 				= data.totalPageCount;
			            var lastPageNoOnPageList 		= data.lastPageNoOnPageList;
			            var cPage 						= data.cPage;
			            var lastPageNo 					= data.lastPageNo;
			            var pageSize 					= data.pageSize;
			            var pagingSize 					= data.pagingSize;

			            innerHtml 	= "";
			            
			            if(totalPageCount > pagingSize){
			            	if(firstPageNoOnPageList > pagingSize){
			            		innerHtml += '<a class="nav first" href="javascript:;" onclick="goTopPage(' + firstPageNo + '); return false;" ><span class="blind">처음 페이지</span></a>';
			            		innerHtml += '<a class="nav prev" href="javascript:;" onclick="goTopPage(' + (firstPageNoOnPageList - 1) + '); return false;" ><span class="blind">이전 페이지</span></a>';
			            	}else{
			            		innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
			            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
			            	}
			            }else{
			            	innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
		            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
			            }
			            
			            
			            if (lastPageNoOnPageList > totalPageCount){
			                lastPageNoOnPageList = totalPageCount;
			            }
		            	
		            	for(var i=firstPageNoOnPageList; i<= lastPageNoOnPageList; i++){
		            		
			                if(i==cPage){
			                	innerHtml +='<a href="javascript:;" class="num active">' + i + '</a>';
			                }else{
			                	innerHtml +='<a href="javascript:;" onclick="goTopPage(' + i + '); return false;" class="num">' + i + '</a>';
			                }
			            }
			            	
		            	if(totalPageCount > pagingSize){
			                if(lastPageNoOnPageList < totalPageCount){
			                	innerHtml +='<a class="nav next" href="javascript:;" onclick="goTopPage('+ (lastPageNoOnPageList + 1) + '); return false;"><span class="blind">다음페이지</span></a>';
			                	innerHtml +='<a class="nav last" href="javascript:;" onclick="goTopPage('+ lastPageNo +'); return false;" ><span class="blind">끝 페이지</span></a>';
			                }else {
			                	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
			                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
			                }
			            } else {
			            	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
		                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
			            }
		            	
		            	$("#topPage").html(innerHtml);
					}else{
						// 이용가능한 쿠폰이 없습니다.
						$("#topOl").html("<li class='no_list'>이용 가능한 쿠폰이 없습니다.</li>");
					}
					
				}, error : function(err) {
					window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
				}
	    	});
	    };
	    
	    goLogin		= function(){
	    	var returnUrl = location.pathname + location.search;
			location.href = "${serverSslDomain}/pc/manager/login.do?url="+returnUrl;	
	    };
	    
	    
	    //쿠폰적용팝업 (1:적용상품,2:적용브랜드,3:적용기획전)
	    goSetCouponPopup = function(setGu,cpnMstIdx){
	    	var url = "";
	    	switch(setGu){
	    		case '1' : url = "<c:out value="${frontDomain}"/>/pc/mypage/myCouponProductPopup.do?CPN_MST_IDX=" + cpnMstIdx;
	    				   break;
	    		case '2' : url = "<c:out value="${frontDomain}"/>/pc/mypage/myCouponBrandPopup.do?CPN_MST_IDX=" + cpnMstIdx;
	    				   break;
	    		case '3' : url = "<c:out value="${frontDomain}"/>/pc/mypage/myCouponPlanPopup.do?CPN_MST_IDX=" + cpnMstIdx;
	    				   break;
	    	}
			//$("#CPN_MST_IDX").val(cpnMstIdx);    	
			popup(url,"1000","500","no","_CouponPopup");
	    };
	    
	    /*getCouponDwn = function(cpnMstIdx){
			var $frm = $("#frm");
			$("#CPN_MST_IDXs").val(cpnMstIdx); 
			popup('',"500","200","no","_CouponDwnPopup");
			$frm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/ProductCouponRegist.do", "target":"_CouponDwnPopup", "method":"post"}).submit();
		};*/
		
		//쿠폰 다운로드 팝업
	    getCouponDwn = function(cpnMstIdx){
	    	
	   		<c:choose>
	   			<c:when test="${commandMap.MEM_MST_MEM_GBN eq '683'}">
	   				alert("쿠폰 다운로드 대상이 아닙니다.");
	   			</c:when>
	   			<c:otherwise>
	   			
	    	if('<c:out value="${commandMap.MEM_LOGIN_YN}" />' == "N"){
				var url = location.href;
				url = encodeURIComponent(url);
	        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	        	return;
			}else{
				
				$.ajax({
					type	: "POST",
					url		: "/pc/event/couponCheckAjax.do",
					dataType: "json",
					data	: {	 "CPN_MST_IDX"			: cpnMstIdx
								},
					success : function(data) {
						
						if(data.result == 1){
							var $frm = $("#frm");
							$("#CPN_MST_IDX").val(cpnMstIdx); 
							popup('',"520","400","no","_ProductCpnPopup");
					 		$("#frm").attr({"action":"<c:out value="${frontDomain}" />/pc/event/searchProductCpnPopup.do", "target":"popup_ProductCpnPopup", "method":"post"}).submit();
						}else if (data.result == 21){
							if(confirm("마켓플랜트 통합회원 전용혜택입니다.\n통합회원으로 전환하시겠습니까?")){
								$('#couForm').attr({'action':'<c:out value="${serverSslDomain}" />/pc/manager/changeOnlineMemCert.do','method':'post'}).submit();
							}
						}else{
							alert(data.returnMsg);
						}
					}, error : function(err) {
						window.jquery
						|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}
	    		</c:otherwise>
	   		</c:choose>
	    };
	    
	    numberWithCommas	= function(x) {
    	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	};
    	
	</script>
</section>
<!--// #wrap E -->
</body>
</html>
<form name="couForm" id="couForm">
     <input type="hidden" name="gubun" id="gubun" value="ONLINE<c:out value='${userInfo.MEM_MST_MEM_GBN }'/>"/>
</form>
