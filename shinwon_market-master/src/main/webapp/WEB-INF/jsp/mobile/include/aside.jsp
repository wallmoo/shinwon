<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- #left_mn S -->
	<aside id="left_mn" class="left_mn" data-role="panel" data-theme="b">
		<a href="javascript:void(0);" id="btn_mn_close" class="btn_mn_close" data-rel="close" data-role="button" data-mini="true" data-inline="true">
			<span class="blind">왼쪽 메뉴 닫기</span>
		</a>

		<!-- 로그인 전 -->
		<!-- .my_info S -->
		<c:choose>
			<c:when test="${sessionUser.ROLE_USER eq 'user'}">
				<dl class="my_info login_e">
					<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myPageMain.do','_self');" class="_pg_link" >
						<!-- 통합회원일 경우(platinum, vip, gold, silver, red) -->
			        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
							<!-- platinum -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_PLATINUM_GRADE }">
								<dt class="ico_platinum">
									<span class="blind">개인정보</span>	
								</dt>
							</c:if> 
							<!-- vip -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_VIP_GRADE }">
			        			<dt class="ico_vip">	
			        				<span class="blind">개인정보</span>	
								</dt> 
			        		</c:if>
			        		<!-- gold -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_GOLD_GRADE }">
			        			<dt class="ico_gold">
			        				<span class="blind">개인정보</span>	
								</dt>
			        		</c:if>
			        		<!-- silver -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_SILVER_GRADE }">
			        			<dt class="ico_silver">
			        				<span class="blind">개인정보</span>	
								</dt>
			        		</c:if>
			        		<!-- red -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_RED_GRADE }">
			        			<dt class="ico_red">	
			        				<span class="blind">개인정보</span>	
								</dt>
			        		</c:if>    	
			        	</c:if>
			        	
			        	<!-- 간편회원일 경우(casual) -->
			        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE }">
			        		<dt class="ico_casual">
			        			<span class="blind">개인정보</span>	
							</dt>
			        	</c:if>
			        	
						<!-- 기업회원일 경우(business1, business2) -->	
						<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE }">
							<!-- 1등급 -->
							<c:if test="${summaryMap.MEM_MST_MEM_GRD ne Code.COMP_MEMBER_BASIC_GRADE }">
								<dt class="ico_business1">
									<span class="blind">개인정보</span>	
								</dt>
							</c:if>
							<!-- 2등급 -->
							<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.COMP_MEMBER_BASIC_GRADE }">
								<dt class="ico_business2">
									<span class="blind">개인정보</span>	
								</dt>
							</c:if>
						</c:if>
					</a>
					<dd>
						<span class="tx_id">Happy today, <c:out value="${sessionUser.MEM_MST_MEM_ID }"/></span>
						<p class="tx_coupon">쿠폰  <strong><c:out value="${not empty summaryMap.MEM_CPN_CNT ? summaryMap.MEM_CPN_CNT : 0 }"/></strong> 장</p>
						<p class="tx_mileage">포인트  <strong><fmt:formatNumber value="${not empty summaryMap.SOLUBLE_MILEAGE ? summaryMap.SOLUBLE_MILEAGE : 0 }" groupingUsed="true" /></strong> P</p>
					</dd>
				</dl>
			</c:when>
			<c:otherwise>
				<dl class="my_info login_s">
					<dt>
						<h2><span class="ir">마켓플랜트</span></h2>
						<hr class="hr_7px_st0" />
						<h3>로그인 해주세요</h3>
					</dt>
					<dd class="web">
						<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/login.do" target="_self" class="btn_red _pg_link"><strong>로그인</strong></a>
						<a href="<c:out value="${mobileSslDomain }"/>/mobile/member/joinMemType.do" target="_self" class="btn_wht _pg_link"><strong>회원가입</strong></a>
					</dd>
					<dd class="app">
						<a href="javascript:callJavascriptLogin();" class="btn_red _pg_link" target="_self"><strong>로그인</strong></a>
						<a href="javascript:callJavascriptNextPage('<c:out value="${mobileSslDomain }"/>/mobile/member/joinMemType.do','_self');" class="btn_wht _pg_link"><strong>회원가입</strong></a>
					</dd>
				</dl>
			</c:otherwise>
		</c:choose>
	
		<!-- .shopping_info S -->
		<dl class="shopping_info">
			<dt class="blind">쇼핑정보</dt>
			<dd class="web">
				<ul class="ui-grid-c">
					<li class="f ui-block-a"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myShoppingList.do','_self');" class="ico_ship _pg_link"><span>주문배송</span></a></li>
					<li class="ui-block-b"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myKeepProductList.do','_self');" class="ico_keep _pg_link"><span>키핑백</span></a></li>
					<c:choose>
						<c:when test="${summaryMap.MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE }">
							<li class="ui-block-c"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myEstimate.do','_self');" class="ico_estima"><span>MY견적</span></a></li>
							<li class="l ui-block-d"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryList.do','_self');" class="ico_11"><span>1:1문의</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="ui-block-c"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myCouponUsableList.do','_self');" class="ico_coupon _pg_link" ><span>쿠폰</span></a></li>
							<c:choose>
			                	<c:when test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
									<li class="l ui-block-d"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myMileageList.do','_self');" class="ico_mileage _pg_link" ><span>포인트</span></a></li>	                		
			                	</c:when>
			                	<c:otherwise>
			                		<c:choose>
										<c:when test="${sessionUser.ROLE_USER eq 'user'}">
					                		<li class="l ui-block-d"><a href="javascript:goChangeOnline('ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>','web');" class="ico_mileage _pg_link" target="_self"><span>포인트</span></a></li>
					                	</c:when>
					                	<c:otherwise>
					                		<li class="l ui-block-d"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myMileageList.do','_self');" class="ico_mileage _pg_link" ><span>포인트</span></a></li>
					                	</c:otherwise>
					                </c:choose>
			                	</c:otherwise>
			                </c:choose>
						</c:otherwise>
					</c:choose>
				</ul>
			</dd>
			<dd class="app">
				<ul class="ui-grid-c">
					<li class="f ui-block-a"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain }"/>/mobile/mypage/myShoppingList.do','_self');" class="ico_ship _pg_link" target="_self"><span>주문배송</span></a></li>
					<li class="ui-block-b"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain }"/>/mobile/mypage/myKeepProductList.do','_self');" class="ico_keep _pg_link" target="_self"><span>키핑백</span></a></li>
					<c:choose>
						<c:when test="${summaryMap.MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE }">
							<li class="ui-block-c"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myEstimate.do','_self');" class="ico_estima"><span>MY견적</span></a></li>
							<li class="l ui-block-d"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryList.do','_self');" class="ico_11"><span>1:1문의</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="ui-block-c"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain }"/>/mobile/mypage/myCouponUsableList.do');" class="ico_coupon _pg_link" target="_self"><span>쿠폰</span></a></li>
							<c:choose>
			                	<c:when test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
									<li class="l ui-block-d"><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain }"/>/mobile/mypage/myMileageList.do');" class="ico_mileage _pg_link" target="_self"><span>포인트</span></a></li>	                		
			                	</c:when>
			                	<c:otherwise>
					                <li class="l ui-block-d"><a href="javascript:goChangeOnline('ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>','app');" class="ico_mileage _pg_link" target="_self"><span>포인트</span></a></li>
			                	</c:otherwise>
			                </c:choose>
						</c:otherwise>
					</c:choose>
				</ul>
			</dd>
		</dl>
		<!--// .shopping_info E -->
		
		<!-- .category S -->
		<dl class="category">
			<dt class="dt_ti">쇼핑 카테고리, 테마, 브랜드 메뉴</dt>
			<!-- .dd_list S -->
			<c:if test="${not empty listGnbMenu }">
			<dd class="dd_list">
				
				<ul data-role="collapsible-set">
					<c:set var="PRD_CTG_IDX" value="1" />
					<c:set var="listNum" value="1" />
					<c:forEach var="listGnbRow" items="${listGnbMenu }" varStatus="i">
						<c:if test="${listNum > 1 && listGnbRow.PRD_CTG_LEVEL == 1}">
								</dl>
							</li>
						</c:if>
						<c:if test="${listGnbRow.PRD_CTG_LEVEL eq 1 }">
							<li data-role="collapsible">
								<h3><c:out value="${listGnbRow.PRD_CTG_NM }" /><i></i></h3>
								<dl>
									<dt class="blind"><c:out value="${listGnbRow.PRD_CTG_NM }" /></dt>
						</c:if>
							<c:if test="${listGnbRow.PRD_CTG_LEVEL == 2 }">
								<c:if test="${listGnbRow.PRD_CTG_LEVEL == 2 && listGnbRow.PRD_CTG_UP_IDX == PRD_CTG_IDX}">
									<dd>
										<a href="<c:out value="${mobileDomain }"/>/mobile/product/productList.do?idx=<c:out value="${listGnbRow.PRD_CTG_IDX }" />" target="_self"><span><c:out value="${listGnbRow.PRD_CTG_NM }" /><i></i></span></a>
									</dd>
								</c:if>
							</c:if>
					<c:if test="${listGnbRow.PRD_CTG_LEVEL == 1 }">
						<c:set var="PRD_CTG_IDX" value="${listGnbRow.PRD_CTG_IDX }" />
					</c:if>
					<c:set var="listNum" value="${listNum + 1 }" />
					</c:forEach>
				</ul>
			</dd>
			</c:if>
			<!--// .dd_list E -->
			<!-- .dd_thema S -->
			<dd class="dd_thema" data-role="navbar">
				<ul>
					<li class="f"><a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/themecategory/weddingMain.do','_self');" class="_pg_link"><strong>웨딩</strong></a></li>
					<li><a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/themecategory/singleMain.do','_self');" class="_pg_link"><strong>싱글</strong></a></li>
					<li><a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/themecategory/cleankingMain.do','_self');" class="_pg_link"><strong>클린킹</strong></a></li>
					<li class="l"><a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/kinger/kingerMain.do','_self');" class="_pg_link"><strong>KINGER</strong></a></li>
				</ul>				
			</dd>
			<!--// .dd_thema E -->
			<!-- .dd_brand S -->
			<dd class="dd_brand web">
				<a href="http://anac.etland.co.kr/" target="_blank"  class="logo_anac"><span class="ir">anac</span></a>
				<a href="http://casabugatti.etland.co.kr/" target="_blank" class="logo_bugatti"><span class="ir">BUGATTI ITALY</span></a>
				<a href="http://cado.etland.co.kr/" target="_blank" class="logo_cado"><span class="ir">cado</span></a>
			</dd>
			<dd class="dd_brand app">
				<a href="javascript:callJavascriptOutlinkPage('http://anac.etland.co.kr/');"  class="logo_anac"><span class="ir">anac</span></a>
				<a href="javascript:callJavascriptOutlinkPage('http://casabugatti.etland.co.kr/');"  class="logo_bugatti"><span class="ir">BUGATTI ITALY</span></a>
				<a href="javascript:callJavascriptOutlinkPage('http://cado.etland.co.kr/');"  class="logo_cado"><span class="ir">cado</span></a>
			</dd>
			<!--// .dd_brand E -->

			<dd class="dd_csNset web">
				<a href="<c:out value="${mobileDomain }"/>/mobile/customer/customerMain.do" class="btn_cs _pg_link" target="_self"><span>CS CENTER</span></a>
			</dd>
			
			<dd class="dd_csNset app">
				<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/customer/customerMain.do','_self')" class="btn_cs _pg_link" target="_self"><span>CS CENTER</span></a>
				<a href="javascript:callJavascriptSetting();" id="setting" class="btn_set"><span>SETTING</span></a>
			</dd>
		</dl>
		<!--// .shopping_info E -->


	</aside>
	<!--// #left_mn E -->
	
<%@ include file="/WEB-INF/jsp/mobile/include/script.jsp" %>
<script>
	$(function(){
		goChangeOnline = function(gubun,type){
			if(type == "web"){	
				if(confirm("통합회원 전용혜택입니다.\n통합회원으로 전환하시겠습니까?")){
					location.href = "<c:out value="${serverSslDomain }"/>/mobile/manager/changeOnlineMemCert.do?gubun=" + gubun;
				}
			}else{
				if(confirm("통합회원 전용혜택입니다.\n통합회원으로 전환하시겠습니까?")){
					callJavascriptLoginUrl("<c:out value="${serverSslDomain }"/>/mobile/manager/changeOnlineMemCert.do?gubun=" + gubun);
				}
			}
		}
	});
</script>
