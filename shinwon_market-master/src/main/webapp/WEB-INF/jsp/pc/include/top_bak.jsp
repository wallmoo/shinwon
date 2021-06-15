<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header id="header" class="header">
	<div class="gnb"><!-- .gnb S -->
		<div class="minW gnb_contents"><!-- .gnb_contents S -->
			<h2 class="blind">상단메뉴</h2>
			<ul class="l_links">
			</ul>
			
			<script>
	        	function bookmark()
	        	{
	    			if(navigator.userAgent.indexOf("MSIE") > -1 || navigator.userAgent.indexOf("Trident") > -1) 
	    			{
	    				//IE
	    				window.external.AddFavorite("<c:out value="${frontDomain}"/>/pc/main/index.do", "마켓플랜트");
	    			}
	    			else
	    			{
	    				alert('Ctrl+D 키를 누르면 즐겨찾기에 추가하실 수 있습니다.');
	    			} 
	        	}
        	</script>
        	<script type="text/javascript">
			$(document).ready(function() {
			  	//getPopkeyword();
			  	//getRollingPopkeyword();
			  	var searchForm = document.searchTop;
			  	//getRecommend(searchForm.query.value);
			});
			</script>
			<ul class="r_user">
				<c:choose>
					<c:when test="${not empty sessionUser.MEM_MST_MEM_ID }">
						<li class="f myid">
							<span><strong>행복한 하루입니다~! <c:out value="${sessionUser.MEM_MST_MEM_ID }"/></strong> 님</span>
						</li>
						<li><a href="<c:out value="${frontDomain }"/>/pc/manager/logout.do"><span>로그아웃</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:goLoginPopup();"><span>로그인</span></a></li>
						<li><a href="<c:out value="${frontDomain }"/>/pc/member/joinMemType.do"><span>회원가입</span></a></li>	
					</c:otherwise>
				</c:choose>
				
                <c:choose>
                    <c:when test="${sessionUser.MEM_MST_MEM_GBN ne '2952' }">    
        				<li class="myland">
        					<a href="javascript:void(0);"><span>MYPAGE</span><i class="ico_ar"></i></a>
        					<dl class="sub_lay">
        						<dt>
        							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do">MYPAGE<i class="ico_ar"></i></a>
        						</dt>
        						<dd>
        							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepProductList.do"><span>키핑백</span></a>
        							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myCouponUsableList.do"><span>쿠폰</span></a>
        							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myInfoPasswordForm.do" class="l"><span>회원정보수정</span></a>
        						</dd>
        					</dl>
        					<dl class="sub_lay">
        						<dt>
        							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do">MYPAGE<i class="ico_ar"></i></a>
        						</dt>
        						<dd>
        							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepProductList.do"><span>키핑백</span></a>
        							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myCouponUsableList.do"><span>쿠폰</span></a>
        							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myInfoPasswordForm.do"><span>회원정보수정</span></a>
        						</dd>
        					</dl>
        				</li>
                    </c:when>   
                    <c:otherwise>
                        <!-- SNS 간편로그인 시 > 주문내역 조회 상단 노출 > 클릭시 SNS회원 주문조회 페이지 이동 -->
                        <li class="myland">
                            <a href="<c:out value="${frontDomain}"/>/pc/snsMember/snsDeliveryList.do"><span>주문내역 조회</span></a>
                        </li> 
                    </c:otherwise>  
                </c:choose>    
				
				<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myShoppingList.do"><span>주문/배송</span></a></li>
				<li><a href="<c:out value="${frontDomain }"/>/pc/customer/customerMain.do"><span>고객센터</span></a></li>
				<li class="l"><a href="<c:out value="${frontDomain }"/>/pc/cart/cartlist.do" class="cart"><span><i><span class="blind">장바구니</span></i>(<strong id="topCartCnt">${cartCnt }</strong>)</span></a></li>
			</ul>
			<script>
				// LOGIN 클릭 이벤트
	        	goLoginPopup = function(){
	        		
	        		var url = location.href;
	        		
	        		//주문서에서 로그인하는 경우 장바구니로 간다.
	        		if(url.indexOf("cartpayment") > 0){
	        			url = "<c:out value="${frontDomain }"/>/pc/cart/cartlist.do";
	        		}
	        		
	        		url = encodeURIComponent(url);
	        		
	        		window.open("<c:out value="${frontDomain}"/>/pc/manager/loginPopup.do?url=" + url + "&locationProtocol=<c:out value="${locationProtocol}"/>","loginPopup","width=1030,height=680,scrollbars=no,target=_blank");
	        	};	
			</script>     
		</div><!-- .gnb_contents E -->
	</div><!--// .gnb E -->

	<div class="lnb"><!-- .lnb S -->
		<div class="minW lnb_contents"><!-- .lnb_contents S -->
			<h1><a href="<c:out value="${frontDomain }"/>/pc/main/index.do"><span class="ir">마켓플랜트 price KING</span></a></h1>
			<div class="search">
			<form name="searchTop" id="searchTop"  onsubmit="return false;" action="<c:out value="${frontDomain }"/>/pc/search/search.do" method="POST">
				<label for="inp_sh" class="inp_sh">
				<!-- <a href="#" onClick="javascript:doSearchTop();" title="검색">검색테스트</a> -->
					<!-- input type="text" id="inp_sh" name="" value="검색해바바바" /> -->
					<input name="query" id="inp_sh" type="text" placeholder="검색어를 입력하세요" autocomplete="off"/>
					<a href="#" onClick="javascript:alert('준비중입니다.');" title="검색"><span class="blind"><img src="<c:out value="${cdnDomain}" />/pc/img/lay/ico_sh.gif" alt=""></span></a>
				</label>
				 <div class="auto_keywords">
						<dl>
							<dt class="blind">연관 키워드</dt>
							 <dd id="ark_content_list">
								<!-- <a href="javascript:void(0)"><span>커피메이커</span></a>
								<a href="javascript:void(0)"><span>커피믹스</span></a>
								<a href="javascript:void(0)"><span>커피피</span></a>
								<a href="javascript:void(0)"><span>커피피피?</span></a>
								<a href="javascript:void(0)"><span>커커커커?</span></a>
								<a href="javascript:void(0)"><span>커커피?</span></a> -->
							</dd> 
						</dl>
					</div> 
			</form>
				<div class="best_key">
						<div class="best_3"  >
							<ol id="rollingPopword" >
								<c:forEach var="popRow" items="${popSearchWord }" varStatus="i">
                                    <li>
                                        <em><c:out value="${i.index+1 }" />.&emsp;</em>
                                        <a href="javascript:;" class="rollSearchWord">
                                        <c:out value="${popRow.PPL_WRD_TEXT }"/>
                                        </a>
                                        &emsp;&emsp;&emsp;
                                        <c:if test="${popRow.PPL_WRD_ICON_NEW eq 'Y'}">
                                           "NEW"
                                        </c:if>
                                        <c:if test="${popRow.PPL_WRD_ICON_HOT eq 'Y'}">
                                           "HOT"
                                        </c:if>
                                        
                                     </li>                                               
                                </c:forEach>
                            </ol>
						</div>
						<div class="best_list">
							<h2 class="best_title"><img src="<c:out value="${cdnDomain}" />/pc/img/tx/ti_hotkeyword.gif" alt="인기검색어 Top10"></h2>
							<ol id ="popword">
                                <c:choose>
                                <c:when test="${not empty popSearchWord }">                                              
                                    <c:forEach var="popRow" items="${popSearchWord }" varStatus="i">
                                        <li>
                                           <em><c:out value="${i.index+1 }" />.&emsp;</em>
                                           <a href="javascript:;" class="popSearchWord" data-ppl_wrd_idx="<c:out value="${popRow.PPL_WRD_IDX }"/>">
                                           <c:out value="${popRow.PPL_WRD_TEXT }"/>
                                           </a>
                                           &emsp;&emsp;&emsp;
                                           <c:if test="${popRow.PPL_WRD_ICON_NEW eq 'Y'}">
                                               "NEW"
                                           </c:if>
                                           <c:if test="${popRow.PPL_WRD_ICON_HOT eq 'Y'}">
                                               "HOT"
                                           </c:if>
                                         </li>                                               
                                    </c:forEach>
                                </c:when>   
                                <c:otherwise> 
                                    <c:forEach var="row" begin="1" end="10" varStatus="i">
                                                    인기검색어가 없습니다                                            
                                    </c:forEach>
                                 </c:otherwise>                                      
                            </c:choose> 
                           
							</ol>
						</div>
                    </div>
                </div>
                <script>
                
                    $(document).on("click", ".popSearchWord", function(){ 
                        var popWord;
                        $.ajax
                        ({
                            type:"POST",
                            async:false,
                            url:"<c:out value="${frontDomain}"/>/pc/search/popularSearchWordAjax.do",
                            data:{"PPL_WRD_IDX": $(this).data("ppl_wrd_idx")},
                            success:function(data)
                            {
                                if(data.resultYn == "Y")
                                {
                                    popWord = data.popWord;
                                }
                                else
                                {
                                    popWord = data.popWord;
                                }
                            },
                            error:function(err)
                            {
                                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                            }    
                        }); 
                        $("#inp_sh").val(popWord);
                    });
                </script>  
			
			<%-- <div class="weather">
				<i class="ico_<c:out value="${areaResultMap.WTH_MST_ICO_NO }" />" ><strong id="temperTxt"><c:out value="${areaResultMap.CTY_WTH_CTM }" /><span>°</span></strong></i>
				<p>
					<span id="locTxt"><c:out value="${areaResultMap.TODAY}" />&nbsp;<c:out value="${areaResultMap.CTY_GGU_NM }" /></span>
					<a href="javascript:com.laypop('show', 0)" class="btn_area" id="areaBtn">지역설정</a><br/>
					<a href="javascript:void(0)" id="btn_weather" class="btn_recom">이런날엔 이런상품 <i>></i></a>
				</p>
			</div> --%>

			<!-- .weather_pr S -->
			<div id="weather_pr" class="weather_pr">			
			</div>
			<!--// .weather_pr E -->
		</div><!--// .lnb_contents E -->
		
		<nav class="s_menu">
			<div class="minW menu_contents"><!-- .menu_contents S -->
				<div id="hmenu" class="hmenu">
						<a href="javascript:void(0)" id="btn_navOpen" class="btn_navOpen"><span class="ir">전체 카테고리</span></a>
						<ul>
							<c:if test="${empty listGnbMenu }">
								<c:set var="PRD_CTG_TOP_IDX" value="0" />
								<c:set var="PRD_CTG_UP_IDX" value="0" />
								<c:set var="PRD_CTG_LEVEL" value="1" />
								<c:set var="PRD_CTG_IDX" value="1" />
								<c:forEach var="listGnbMenu" items="${listGnbMenu }" varStatus="i">
									<c:if test="${(PRD_CTG_TOP_IDX != -1 && listGnbMenu.PRD_CTG_IDX != PRD_CTG_TOP_IDX) && (PRD_CTG_TOP_IDX != 0 && listGnbMenu.PRD_CTG_LEVEL == 1)}">
												<dd class="bg"></dd>
											</dl>
										</li>
									</c:if>
									<c:if test="${listGnbMenu.PRD_CTG_LEVEL == 1 }">
										<li ${i.first ? 'class="f"' : ''}	>
											<a href="<c:out value="${frontDomain }"/>/pc/product/productMain.do?idx=<c:out value="${listGnbMenu.PRD_CTG_IDX }" />"><span><c:out value="${listGnbMenu.PRD_CTG_NM }" /></span></a>
											<dl>
									</c:if>
												<c:if test="${listGnbMenu.PRD_CTG_LEVEL == 1 }">
												<dt>
													<strong><c:out value="${listGnbMenu.PRD_CTG_NM }" /></strong>
													<hr class="bg_line_5px_l" />
													<i></i>
												</dt>
												</c:if>
												<c:if test="${listGnbMenu.PRD_CTG_LEVEL == 2 || listGnbMenu.PRD_CTG_LEVEL == 3}">
													<c:if test="${PRD_CTG_TOP_IDX == -1 || PRD_CTG_TOP_IDX != listGnbMenu.PRD_CTG_TOP_IDX}">
														<dd class="mn">
													</c:if>
														<c:if test="${PRD_CTG_LEVEL == 3 && PRD_CTG_IDX != listGnbMenu.PRD_CTG_UP_IDX}">
															</div>
														</c:if>
														<c:if test="${listGnbMenu.PRD_CTG_LEVEL == 2 }">
															<a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${listGnbMenu.PRD_CTG_IDX }" />"><span><c:out value="${listGnbMenu.PRD_CTG_NM }" /></span></a>
														</c:if>
														
														<c:if test="${(listGnbMenu.PRD_CTG_LEVEL == 3 && PRD_CTG_IDX == listGnbMenu.PRD_CTG_UP_IDX) && PRD_CTG_LEVEL == 2}">
															<div class="ds_3">
														</c:if>
														<c:if test="${listGnbMenu.PRD_CTG_LEVEL == 3 }">
																<a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${listGnbMenu.PRD_CTG_IDX }" />"><span><c:out value="${listGnbMenu.PRD_CTG_NM }" /></span></a>
														</c:if>
													<c:if test="${(PRD_CTG_TOP_IDX != -1 && PRD_CTG_TOP_IDX != listGnbMenu.PRD_CTG_TOP_IDX) || i.last }">
														</dd>
													</c:if>
												</c:if>
									<c:if test="${i.last}">
												<dd class="bg"></dd>
											</dl>
										</li>
									</c:if>
									<c:set var="PRD_CTG_TOP_IDX" value="${listGnbMenu.PRD_CTG_TOP_IDX }" />
									<c:set var="PRD_CTG_UP_IDX" value="${listGnbMenu.PRD_CTG_UP_IDX }" />
									<c:set var="PRD_CTG_LEVEL" value="${listGnbMenu.PRD_CTG_LEVEL }" />
									<c:if test="${listGnbMenu.PRD_CTG_LEVEL == 2 }">
										<c:set var="PRD_CTG_IDX" value="${listGnbMenu.PRD_CTG_IDX }" />
									</c:if>
								</c:forEach>
							</c:if>

							<li class="l">
								<a href="javascript:void(0);" class="no_link"><span>맞춤견적</span><i></i></a>
								<dl>
									<dt>
										<strong>맞춤견적</strong>
										<hr class="bg_line_5px_l" />
										<i></i>
									</dt>
									<dd class="mn">
										<a href="<c:out value="${frontDomain}" />/pc/product/myEstimateMain.do"><span>나만의 맞춤견적</span></a>
										<a href="<c:out value="${frontDomain}" />/pc/product/estimateMain.do"><span>대량견적</span></a>
									</dd>
									<dd class="bg"></dd>
								</dl>
							</li>
						</ul>
					</div>

				<%-- <dl class="l_mn">
					<dt class="blind">마켓플랜트 메뉴</dt>
					<dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/themecategory/weddingMain.do" class="mn_wedding"><span class="ir">웨딩</span></a></dd>
<!-- 					<dd><a href="javascript:void(0);" class="mn_move"><span class="ir">이사</span></a></dd> -->
					<dd><a href="<c:out value="${frontDomain }"/>/pc/themecategory/singleMain.do" class="mn_single"><span class="ir">싱글</span></a></dd>
<!-- 					<dd><a href="javascript:void(0);" class="mn_health"><span class="ir">건강</span></a></dd> -->
					<dd><a href="<c:out value="${frontDomain }"/>/pc/themecategory/cleanKingMain.do" class="mn_cleanking"><span class="ir">클린킹</span></a></dd>
					<dd class="l"><a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineMain.do" class="mn_emagazine"><span class="ir">e매거진</span></a></dd>
				</dl> --%>
				<dl class="r_mn">
					<dt class="blind">마켓플랜트 기획전 메뉴</dt>
					<dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/event/planList.do" class="mn_exhibition"><span class="ir">쇼핑기획전</span></a></dd>
					<dd><a href="<c:out value="${frontDomain }"/>/pc/event/eventMain.do" class="mn_event"><span class="ir">이벤트</span></a></dd>
					<dd class="l"><a href="<c:out value="${frontDomain }"/>/pc/marketing/kingerMain.do" class="mn_experience"><span class="ir">고객체험단</span></a></dd>
				</dl>				
			</div><!--// .menu_contents E -->
		</nav><!--// .s_menu E -->
  
	</div><!--// .lnb E -->
</header>
<!--// #header S -->
