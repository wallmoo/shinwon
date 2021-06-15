<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:choose>
	<c:when test="${sessionUser.ROLE_USER eq 'user'}">
		<aside id="aside"><!-- #aside -->
			<div class="my-stage"><!-- my-stage -->
			    <div class="core">
			        <p class="hello"><span class="blind">Happy today!</span></p>
			        <p class="name"><strong><c:out value="${sessionUser.MEM_MST_MEM_ID }"/>님</strong></p>
			        <div class="benefit">
						<!-- 통합회원일 경우(platinum, vip, gold, silver, red) -->
			        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
			        		<!-- platinum -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_PLATINUM_GRADE }">
			        			<a href="#myBenefit" class="level platinum js-tooltip" data-size="180x360"></a>		
			        		</c:if>
			        		<!-- vip -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_VIP_GRADE }">
			        			<a href="#myBenefit" class="level vip js-tooltip" data-size="180x360"></a>
			        		</c:if>
			        		<!-- gold -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_GOLD_GRADE }">
			        			<a href="#myBenefit" class="level gold js-tooltip" data-size="180x360"></a>
			        		</c:if>
			        		<!-- silver -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_SILVER_GRADE }">
			        			<a href="#myBenefit" class="level silver js-tooltip" data-size="180x360"></a>
			        		</c:if>
			        		<!-- red -->
			        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_RED_GRADE }">
			        			<a href="#myBenefit" class="level red js-tooltip" data-size="180x360"></a>
			        		</c:if>
			        	</c:if>
			        	
			        	<!-- 간편회원일 경우(easy) -->
			        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE }">
			        		<a href="#myBenefit" class="level easy js-tooltip" data-size="180x360"></a>
			        	</c:if>
			        	
						<!-- 기업회원일 경우(business business-a, business business-b) -->	
						<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE }">
							<!-- 1등급 -->
							<c:if test="${summaryMap.MEM_MST_MEM_GRD ne Code.COMP_MEMBER_BASIC_GRADE }">
								<a href="#myBenefit" class="level business business-b js-tooltip" data-size="180x360"></a>
							</c:if>
							<!-- 2등급 -->
							<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.COMP_MEMBER_BASIC_GRADE }">
								<a href="#myBenefit" class="level business business-a js-tooltip" data-size="180x360"></a>
							</c:if>
						</c:if>
						     	
						<!-- 통합회원만 tooltipw 제공 -->
			            <c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
							<div id="myBenefit" class="layer-tooltip"><!-- #myBenefit -->
				                <div class="holder">
				                    <ul>
				                        <li> 
				                        	산정기간 :
				                        	<c:out value="${summaryMap.CAL_ST_DT }"/> ~ <c:out value="${summaryMap.CAL_ED_DT }"/>
				                        </li>
				                        <li>구매금액 : <fmt:formatNumber value="${not empty summaryMap.TOT_AMOUNT ? summaryMap.TOT_AMOUNT : 0 }" groupingUsed="true"/>원</li>
				                    </ul>
				                </div>
				            </div><!-- // #myBenefit -->	            
			            </c:if>
			        </div>
			        <div class="action">
			        	<!-- 통합회원 -->
			        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
							<a href="<c:out value="${frontDomain }"/>/pc/event/memberBenefit.do" class="btn_st0 btn_blk777 small"><span>나의 등급 혜택보기</span></a>
							<c:if test="${summaryMap.MEM_MST_JOI_RTE eq Code.JOIN_TYPE_ONLINE }">
								<a href="<c:out value="${serverSslDomain }"/>/pc/manager/changeOnlineMemCert.do?gubun=ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>" class="btn_st0 btn_blk777 small"><span>통합회원으로 전환하기</span></a>
							</c:if>	        	
			        	</c:if>
			        	<!-- 간편회원 -->
			        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE }">
							<a href="<c:out value="${serverSslDomain }"/>/pc/manager/changeOnlineMemCert.do?gubun=ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>" class="btn_st0 btn_blk777 small"><span>통합회원으로 전환하기</span></a>	            
			            	<p class="mt10 dotum small">통합회원으로 전환하시면<br />더 많은 혜택을 받으실 수 있습니다.</p>	        	
			        	</c:if>
			        </div>
			    </div>
			
				<c:if test="${summaryMap.MEM_MST_MEM_GBN ne Code.COMMON_COMP_MEMBER_GRADE }">
				    <div class="desc">
				        <ul class="ct">
				            <li>
		            			<a href="<c:out value="${frontDomain}" />/pc/mypage/myCouponUsableList.do">
				                    <span>쿠폰</span>
				                    <strong><c:out value="${summaryMap.MEM_CPN_CNT }"/>장</strong>
				                </a>
				            </li>
				            <li>
				                <c:choose>
				                	<c:when test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
										<a href="<c:out value="${frontDomain}" />/pc/mypage/myMileageList.do">
						                    <span>포인트</span>
						                    <strong><fmt:formatNumber value="${summaryMap.SOLUBLE_MILEAGE}" groupingUsed="true" />P</strong>
						                </a>	                		
				                	</c:when>
				                	<c:otherwise>
				                		<a href="javascript:goChangeOnline('ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>');">
						                    <span>포인트</span>
						                </a>
				                	</c:otherwise>
				                </c:choose>
				            </li>
				            <li>
				            	<c:choose>
				                	<c:when test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
						                <a href="<c:out value="${frontDomain}" />/pc/mypage/myPointList.do">
						                    <span>크라운</span>
						                    <strong><fmt:formatNumber value="${not empty summaryMap.MEM_PIT_TOT_PIT ? summaryMap.MEM_PIT_TOT_PIT : 0 }" groupingUsed="true"/>C</strong>
						                </a>
						            </c:when>
						            <c:otherwise>
						            	<a href="javascript:goChangeOnline('ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>');">
						                    <span>크라운</span>
						                </a>
						            </c:otherwise>
						        </c:choose>
				            </li>
				            <li>
				                <a href="<c:out value="${frontDomain}" />/pc/mypage/myKeepProductList.do">
				                    <span>키핑백</span>
				                    <strong><fmt:formatNumber value="${not empty summaryMap.MEM_KEP_CNT ? summaryMap.MEM_KEP_CNT : 0 }" groupingUsed="true"/>개</strong>
				                </a>
				            </li>
				        </ul>
				    </div>
				</c:if>
			</div><!-- // my-stage -->
			
			<h2 class="blind">마이페이지 메뉴</h2>
			
			<nav id="lnb"><!-- #lnb -->
			    <ul class="d1">
			        <li class="d1 nth-child-1 active">
			            <span class="d1">쇼핑내역</span>
			            <ul class="d2">
			                <li class="d2
			                	<c:if test="${(fn:indexOf(requestUrl,'/pc/mypage/myShopping') > -1 || fn:indexOf(requestUrl,'/pc/mypage/myOfflineShopping') > -1)
			                					&& commandMap.searchCancelBack ne 'Y'}"> active</c:if>">
			                	<a href="<c:out value="${serverSslDomain}" />/pc/mypage/myShoppingList.do" class="d2">
			                		<span>주문/배송 조회</span>
			                	</a>
			                </li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myOrderCancelBackList.do') > -1 || 
		                					 (fn:indexOf(requestUrl,'/pc/mypage/myShopping') > -1 && commandMap.searchCancelBack eq 'Y')}"> active</c:if>">
			                	<a href="<c:out value="${serverSslDomain}" />/pc/mypage/myOrderCancelBackList.do" class="d2">
			                		<span>취소/교환/반품 조회</span>
			                	</a>
			                </li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myReceiptIssueList.do') > -1 }"> active</c:if>">
		                		<a href="<c:out value="${serverSslDomain}" />/pc/mypage/myReceiptIssueList.do" class="d2"><span>증빙서류발급</span></a></li>
			            </ul>
			        </li>
			        <c:if test="${summaryMap.MEM_MST_MEM_GBN ne Code.COMMON_COMP_MEMBER_GRADE }">
				        <li class="d1 nth-child-2">
				            <span class="d1">쇼핑혜택</span>
				            <ul class="d2">
				                <li class="d2
				                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myCoupon') > -1}"> active</c:if>">
				                	<a href="<c:out value="${frontDomain}" />/pc/mypage/myCouponUsableList.do"  class="d2"><span>쿠폰</span></a>
				                </li>
				                <c:if test="${summaryMap.MEM_MST_MEM_GBN ne Code.MEMBER_TYPE_SIMPLE }">
					                <li class="d2
					                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myMileageList.do') > -1}"> active</c:if>">
					                	<a href="<c:out value="${frontDomain}" />/pc/mypage/myMileageList.do" class="d2"><span>포인트</span></a>
					                </li>
					                <li class="d2
					                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myPointList.do') > -1}"> active</c:if>">
					                	<a href="<c:out value="${frontDomain}" />/pc/mypage/myPointList.do" class="d2">
					                		<span>크라운</span>
					                	</a>
					                </li>
				                </c:if>
				            </ul>
				        </li>
			        </c:if>
			        <li class="d1 nth-child-3">
			            <span class="d1">쇼핑활동</span>
			            <ul class="d2">
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myKeep') > -1}"> active</c:if>">
			                	<a href="<c:out value="${frontDomain}" />/pc/mypage/myKeepProductList.do" class="d2"><span>키핑백</span></a>
			                </li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myEventList.do') > -1}"> active</c:if>">
			                	<a href="<c:out value="${frontDomain}" />/pc/mypage/myEventList.do" class="d2"><span>참여한 이벤트</span></a>
			                </li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myEstimate.do') > -1}"> active</c:if>">
			               		<a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myEstimate.do" class="d2"><span>MY 견적</span></a></li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myBuyShoppingList.do') > -1}"> active</c:if>">
			                	<a href="<c:out value="${frontDomain}" />/pc/mypage/myBuyShoppingList.do" class="d2"><span>내가 구매한 상품</span></a></li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myWritableProductCommentList.do') > -1 || fn:indexOf(requestUrl,'/pc/mypage/myWrittenProductCommentList.do') > -1}"> active</c:if>">
			                	<a href="<c:out value="${frontDomain}" />/pc/mypage/myWritableProductCommentList.do" class="d2">
			                		<span>상품후기</span>
			                	</a>
			                </li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myProductInquiryList.do') > -1}"> active</c:if>">
			                	<a href="<c:out value="${frontDomain}" />/pc/mypage/myProductInquiryList.do"  class="d2">
				                	<span>상품 Q&amp;A</span>
				                </a>
			                </li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myInquiry') > -1}"> active</c:if>">
		                		<a href="<c:out value="${frontDomain}" />/pc/mypage/myInquiryList.do" class="d2">
				                	<span>1:1문의</span>
				                </a>
				            </li>
			            </ul>
			        </li>
			        <li class="d1 nth-child-4">
			            <span class="d1">회원정보</span>
			            <ul class="d2">
<!-- 			                <li class="d2"><a href="javascript:alert('서비스 준비중입니다.');" class="d2"><span>오늘의 운세</span></a></li> -->
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myDeliveList.do') > -1}"> active</c:if>">
		                		<a href="<c:out value="${frontDomain}" />/pc/mypage/myDeliveList.do" class="d2">
			                		<span>배송지관리</span>
			                	</a>
			                </li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myInfoPasswordForm.do') > -1 || fn:indexOf(requestUrl,'/pc/mypage/myInfoEditForm.do') > -1}"> active</c:if>">
			                	<a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myInfoPasswordForm.do?returnUrl=/pc/mypage/myInfoEditForm.do" class="d2">
			                		<span>회원정보수정</span>
			                	</a>
			                </li>
			                <li class="d2
			                	<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myInfoDeleteForm.do') > -1}"> active</c:if>">
			                	<a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myInfoPasswordForm.do?returnUrl=/pc/mypage/myInfoDeleteForm.do" class="d2">
			                		<span>회원탈퇴</span>
			                	</a>
			                </li>
			            </ul>
			        </li>
			    </ul>
			</nav><!--// #lnb -->
		</aside><!-- // #aside -->
	</c:when>
	<c:otherwise>
		<aside id="aside"><!-- #aside -->
	
		<div class="my-stage"><!-- my-stage -->
		    <div class="core">
			<p class="hello"><span class="blind">Happy today!</span></p>
			<p class="name"><strong>고객님</strong></p>
			<div class="benefit">
			    <a href="#myBenefit" class="level nonmember js-tooltip" data-size="180x360"></a>
			</div>
			<div class="action">
			    <a href="<c:out value="${serverSslDomain }"/>/pc/member/joinMemType.do" class="btn_st0 btn_blk777 small"><span>신규 회원가입</span></a>
			    <p class="mt10 dotum small">회원가입하면<br />더 많은 혜택을 받으실 수 있습니다.</p>
			</div>
		    </div>
		
		    <div class="desc">
			<ul class="ct">
			    <li>
				<a href="javascript:;">
				    <span>쿠폰</span>
				</a>
			    </li>
			    <li>
				<a href="javascript:;">
				    <span>포인트</span>
				</a>
			    </li>
			    <li>
				<a href="javascript:;">
				    <span>크라운</span>
				</a>
			    </li>
			    <li>
				<a href="javascript:;">
				    <span>키핑백</span>
				</a>
			    </li>
			</ul>
		    </div>
		</div><!-- // my-stage -->
		
		<h2 class="blind">마이페이지 메뉴</h2>
		
		<nav id="lnb"><!-- #lnb -->
		    <ul class="d1">
			<li class="d1 active">
			    <span class="d1">쇼핑내역</span>
			    <ul class="d2">
				<li class="d2 <c:if test="${fn:indexOf(requestUrl,'/pc/mypage/gestDeliveryList.do') > -1 ||
						 (fn:indexOf(requestUrl,'/pc/mypage/myShopping') > -1 && commandMap.searchCancelBack ne 'Y')}"> active</c:if>"
						 ><a href="<c:out value="${serverSslDomain}" />/pc/mypage/gestDeliveryList.do" class="d2"><span>주문/배송 조회</span></a></li>
				<li class="d2 <c:if test="${fn:indexOf(requestUrl,'/pc/mypage/gestOrderCancelBackList.do') > -1 || 
						 (fn:indexOf(requestUrl,'/pc/mypage/myShopping') > -1 && commandMap.searchCancelBack eq 'Y')}"> active</c:if>"
						 ><a href="<c:out value="${serverSslDomain}" />/pc/mypage/gestOrderCancelBackList.do" class="d2"><span>취소/교환/반품 조회</span></a></li>
				<li class="d2
				<c:if test="${fn:indexOf(requestUrl,'/pc/mypage/myReceiptIssueList.do') > -1 }"> active</c:if>">
				<a href="<c:out value="${serverSslDomain}" />/pc/mypage/myReceiptIssueList.do" class="d2"><span>증빙서류발급</span></a></li>
			    </ul>
			</li>
		    </ul>
		</nav><!--// #lnb -->
		    
		</aside><!-- // #aside -->
	</c:otherwise>
</c:choose>

<script>
	$(function(){
		goChangeOnline = function(gubun){
			if(confirm("통합회원 전용혜택입니다.\n통합회원으로 전환하시겠습니까?")){
				location.href = "<c:out value="${serverSslDomain }"/>/pc/manager/changeOnlineMemCert.do?gubun=" + gubun;
			}
		}
	});
</script>