<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-estimate">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
    <!-- #header S -->
    <%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
    <!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="minW contents"><!-- contents S -->

            <div class="section-visual bulk"><!-- section-visual -->
                <h3><span class="blind">대량구매견적</span></h3>
                <strong class="subject">대량구매 견적이란?</strong>
                <p>
                    마켓플랜트가 판매하는 다양한 상품을 대량으로 구매를 원하시거나,<br />
                    견적의뢰가 필요하실 경우 신청주시면<br />
                    견적 희망금액을 확인하여 상품 구매를 도와드리는 서비스입니다.
                </p>
				
				<p class="tx_ex">
					<strong class="ti">대량구매 견적 유의사항</strong>
                   <span>견적신청결과는 <em>마이페이지 > 쇼핑활동 > MY견적</em> 에서 확인 가능합니다.</span>
				   <span>총 구매금액 100만원 이상, 총 구매수량이 5개 이상이어야 신청이 가능합니다. <br/>해당되지 않는 경우는 일반 구매 및 “나만의 견적신청” 을 이용해 주시기 바랍니다.</span>
				   <span>대량견적을 통해 할인된 금액으로 구매시 쿠폰할인은 적용되지 않습니다.</span>
                </p>
            </div><!-- // section-visual -->
			
			<h4 class="title">대량구매 견적 신청 방법</h4>

            <ul class="ct estimate-step bulk"><!-- estimate-step -->
                <li class="nth-child-1">
                    <span class="number">01</span>
                    <strong>대량구매 견적<br />상품 검색</strong>
                    <p>
                        카테고리 검색으로 원하는 상품을<br />
                        찾아서 선택해주세요.
                    </p>
                </li>
                <li class="nth-child-2">
                    <span class="number">02</span>
                    <strong>대량구매 견적<br />상품 담기</strong>
                    <p>
                        선택하신 상품을<br />견적서에 담아주세요.
                    </p>
                </li>
                <li class="nth-child-3">
                    <span class="number">03</span>
                    <strong>희망금액 입력</strong>
                    <p>
                        구매 원하는 희망금액과 연락처를<br />
                        입력해주세요. 
                    </p>
                </li>
                <li class="nth-child-4">
                    <span class="number">04</span>
                    <strong>대량구매<br />견적 신청하기 </strong>
                    <p>
                        선택하신 상품과 가격,<br />
                        희망금액을 확인하신 후에 <br />
                        &lsquo;견적요청&rsquo;을 선택해 주세요.
                    </p>
                </li>
            </ul><!-- // estimate-step -->


            <h4 class="title">대량구매 견적 상품 선택</h4>

			<form name="frm" id="frm" method="post">
			<input type="hidden" name="ESM_MST_ESM_TOT_PRICE" id="ESM_MST_ESM_TOT_PRICE" value="" />
			<input type="hidden" name="ESM_MST_WSH_TOT_PRICE" id="ESM_MST_WSH_TOT_PRICE" value="" />
			<div class="estimate-search mt0" id="estimate-search">
				<table>
					<caption>카테고리, 상품명 검색, 상품번호 검색으로 구성된 표</caption>
					<colgroup>
					<col style="width:150px" />
					<col  />
					<col style="width:150px" />
					<col  />
					</colgroup>
					<tbody>
						<tr>
							<th>카테고리</th>
							<td colspan="3">
								<div class="module">
									<select class="sel_chg" title="대카테고리" id="category1" name="category1">
				                        <option value="">대카테고리</option>
				                    </select>
									<select class="sel_chg" title="중카테고리" id="category2" name="category2">
				                        <option value="">중카테고리</option>
				                    </select>
									<select class="sel_chg" title="소카테고리" id="category3" name="category3">
				                        <option value="">소카테고리</option>
				                    </select>
								</div>
							</td>
						</tr>
						<tr>
							<th><label for="productName">상품명 검색</label></th>
							<td><input type="text" id="productName" class="text" /></td>
							<th><label for="productNumber">상품번호 검색</label></th>
							<td><input type="text" id="productNumber" class="text" /></td>
						</tr>
					</tbody>
				</table>

                <a href="javascript:;" class="btn_st2 btn_blk555 search" id="searchBtn"><span>검색하기</span></a>
			</div>
            <div class="estimate-item-list" id="estimate-item-list"><!-- estimate-item-list -->
                <p class="message no-more">등록된 상품이 없습니다.</p>
            </div><!-- // estimate-item-list -->
			
			
            <div class="section-pagination mt10" id="pageDiv"><!-- section pagination -->
                
            </div><!-- // section pagination -->

            <div class="estimate-sheet bulk"><!-- estimate-sheet -->
                <h4>
                    <strong class="core">대량구매 견적서 </strong>
                    <span class="desc">(총 <strong><c:out value="${totalCount }" /></strong>개)</span>
                </h4>

                <div class="section-button al"><!-- section-button -->
                    <a href="javascript:;" class="btn_st0 btn_blk555 small" id="check_all"><span>전체선택</span></a>
                    <a href="javascript:;" class="btn_st0 btn_white small" id="uncheck_all"><span>전체삭제</span></a>
                    <a href="javascript:;" class="btn_st0 btn_white small" id="esmPrdDel"><span>선택상품 삭제</span></a>
                </div><!-- // section-button -->

                <div class="estimate-item-list" id="estList"><!-- estimate-item-list -->
                	<c:choose>
                		<c:when test="${empty list }">
                	<p class="message no-more">견적서에 담긴 상품이 없습니다.</p>	
                		</c:when>
                		<c:otherwise>
                	<ul class="ct">
                		<c:forEach var="row" items="${list }">
                		<c:set var="listNum" value="1" />
                		<c:set var="optPrice" value="0" />
                        <li id="<c:out value="${row.PRD_MST_CD }" />" data-esm_crt_cnt="<c:out value="${row.ESM_CRT_CNT }" />" >
                            <div class="module">
                                <div class="check">
                                	<label for="" class="inp_checkbox">
                                    	<input type="checkbox" class="checkbox" name="PRD_MST_CDs" id="PRD_MST_CDs" value="<c:out value="${row.PRD_MST_CD }" />" />
                                    </label>
                                </div>
                                <a href="javascript:;">
                                    <span class="thumb"><img src="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG }" />" class="thumb200" alt="" /></span>
                                    <span class="option">
                                    	<c:forEach var="optRow" items="${optList}">
                                    		<c:if test="${optRow.MEM_PRD_MST_CD eq row.PRD_MST_CD }">
                                    			<c:if test="${listNum > 1 }"><br/></c:if>
                                    			<c:out value="${listNum }" />.<c:out value="${optRow.OPT_DTL_NM }" /> / <c:out value="${optRow.ESM_CRT_CNT }" /> 개
                                    			<c:set var="listNum" value="${listNum + 1 }" />
                                    			<c:set var="optPrice" value="${optPrice + optRow.OPT_DTL_ADD_PRC * optRow.ESM_CRT_CNT}" />
                                    		</c:if>
                                    	</c:forEach>
                                   	    <c:if test="${listNum eq 1 }">
                                   			<c:out value="${row.PRD_MST_NM }" />
                                   		</c:if>
                                    </span>
                                </a>
                                <span class="subject" ><ui:shortTitle title="${row.PRD_MST_NM }" length="40" /></span>
                                <c:if test="${row.PRD_MST_ERP_DSP_PRC > row.PRD_MST_DSP_PRC }">
                                <p class="price-before"><span class="blind">소비자가</span><strong><fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></strong>원</p>
                                </c:if>
                                <p class="price-after" id="price<c:out value="${row.PRD_MST_CD }" />" data-price="<c:out value="${row.PRD_MST_DSP_PRC * row.ESM_CRT_CNT +  optPrice }" />"><span class="blind">판매가</span><strong><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong>원</p>
                                <div class="amount">
                                <c:choose>
                                	<c:when test="${row.ESM_CRT_CNT eq 0 and row.PRD_MST_OPT_EST_CNT > 0 }">
                                	옵션 필수 상품입니다
                                    <a href="javascript:;" class="btn_st0 btn_white xsmall" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD}" />"  id="chaBtn"><span>변경</span></a>
                                	</c:when>
                                	<c:otherwise>
									<c:if test="${row.ESM_CRT_CNT > 0}" />본품 <c:out value="${row.ESM_CRT_CNT }" />개 <c:if test="${row.ESM_CRT_SLT_CNT > 0 }">옵션 <c:out value="${row.ESM_CRT_SLT_CNT }" />개</c:if>
                                    <a href="javascript:;" class="btn_st0 btn_white xsmall" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD}" />"  id="chaBtn"><span>변경</span></a>                                	
                                	</c:otherwise>
                                </c:choose>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>	
                		</c:otherwise>
                	</c:choose>
                    
                    
                </div><!-- // estimate-item-list -->

                <div class="ct mt50">
					<p class="fl notice dotum small">
						상품대체여부를 &lsquo;YES&rsquo;로 선택하시면 품절 및 가격할인이 어려운 상품의 경우 MD가 대체상품을 추천해 드립니다
					</p>
                    <p class="fl notice dotum small">
                        &lsquo;답변 이메일로 받기&rsquo;를 선택하시면 기재하신 이메일로 견적 신청 결과를 빠르게 받아 보실 수 있습니다. 
                    </p>
                    <p class="fr guide">
                        <span class="essential co_red"><em class="blind">필수입력 표시는</em></span>
                        필수항목
                    </p>
                </div>
                            
                <table class="table-a mt10"><!-- table-a -->
                <caption>이름, 휴대폰, 상품대체, 이메일, 문의내용으로 구성된 견적신청 정보 입력 테이블입니다.</caption>
                <colgroup>
                    <col style="width: 115px;" />
                    <col style="width: 190px;" />
                    <col style="width: 115px;" />
                    <col style="width: auto;" />
                    <col style="width: 115px;" />
                    <col style="width: 120px;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><label for="name">이름<span class="essential"><em class="blind">필수입력</em></span></label></th>
                        <td>
                            <input type="text" id="ESM_MST_MEM_NM" name="ESM_MST_MEM_NM" class="text" value="<c:out value="${commandMap.MEM_MST_MEM_NM }" />" />
                        </td>
                        <th scope="row"><label for="phone">휴대폰<span class="essential"><em class="blind">필수입력</em></span></label></th>
                        <td>
                            <select class="sel_chg" id="ESM_MST_HP1" name="ESM_MST_HP1" title="휴대폰 번호 앞자리">
                                <c:forEach items="${codes.HP_CODE }" var="row" >
                            		<option value="<c:out value="${row.CMN_COM_NM}" />" <c:if test="${row.CMN_COM_NM eq commandMap.MEM_MST_HP1 }">selected</c:if> ><c:out value="${row.CMN_COM_NM}" /></option>
                            	</c:forEach>
                            </select> -
                            <input type="text" class="text small" maxlength="4" title="휴대폰 번호 중간자리" id="ESM_MST_HP2" name="ESM_MST_HP2" value="<c:out value="${commandMap.MEM_MST_HP2 }" />" /> -
                            <input type="text" class="text small"  maxlength="4" title="휴대폰 번호 끝자리" id="ESM_MST_HP3" name="ESM_MST_HP3" value="<c:out value="${commandMap.MEM_MST_HP3 }" />" />
                        </td>
                        <th scope="row"><label for="replace">상품대체<span class="essential"><em class="blind">필수입력</em></span></label></th>
                        <td>
                            <select class="sel_chg" id="ESM_MST_PRD_CHANGE_YN" name="ESM_MST_PRD_CHANGE_YN" >
                                <option value="">선택</option>
                                <option value="Y">YES</option>
                                <option value="N">NO</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="email">이메일<span class="essential"><em class="blind">필수입력</em></span></label></th>
                        <td colspan="5">
                            <input type="text" id="ESM_MST_MAIL" name="ESM_MST_MAIL" class="text large" value="<c:out value="${commandMap.MEM_MST_MAIL }" />" />&nbsp;&nbsp;
                            <input type="checkbox" id="ESM_MST_CALL_YN" name="ESM_MST_CALL_YN" value="Y" />
                            <label for="mailY" class="dotum">답변 이메일로 받기 </label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="inquiry">문의내용</label></th>
                        <td colspan="5">
                            <textarea class="textarea" id="ESM_MST_QST" name="ESM_MST_QST" placeholder="요청사항이나 문의사항이 있으신 경우 기재해주세요." title="요청사항이나 문의사항이 있으신 경우 기재해주세요."></textarea>
                        </td>
                    </tr>
                </tbody>
                </table><!-- // table-a -->

                <div class="price-wish"><!-- price-wish -->
                    <div class="ct holder">
                        <div class="total">
                            <span class="title">선택 상품 합계</span>
                            <span class="price"><strong id="priceText">0</strong><span class="won">원</span></span>
                        </div>
                        <div class="wish">
                            <div class="fl">
                                <span class="title">희망금액</span>
                                <span class="desc dotum small">견적 원하는 금액을 입력해주세요.</span>
                            </div>
                            <div class="fr">
                                <input type="text" class="text" id="ESM_MST_WSH_TOT_PRICE_INP" name="ESM_MST_WSH_TOT_PRICE_INP" />
                                <span class="won">원</span>
                            </div>
                        </div>
                    </div>
                </div><!-- // price-wish -->

                <div class="clause"><!-- clause -->
                    <div class="upper">
                        <label for="areement" class="js-checkbox">
                            <input type="checkbox" id="areement" />
                            <span class="warning">(필수)</span> 개인정보 수집/이용에 동의합니다. 
                        </label>
                        <a href="javascript:;" class="more"><span class="blind">개인정보 수집/이용약관 <em>닫기</em></span></a>
                    </div>
                    <div class="downer">
                        <div class="textarea">
                        	<pre>맞춤&대량견적 개인정보 수집ㆍ이용 동의

마켓플랜트는 고객님의 개인정보를 보호하기 위하여 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등 관련 법령상의 개인정보 보호 규정을 준수하고 있으며, 다음과 같이 개인정보를 수집ㆍ이용합니다. 보다 자세한 내용은 『개인정보 취급방침』을 확인하여 주시기 바랍니다.

1. 개인정보 수집 및 이용목적
① 게시물 작성자 정보 확보
② 견적 서비스 제공
③ 맞춤정보 제공 및 통계 분석 등

2. 개인정보 수집항목
① 필수정보 : 성명, 휴대폰 번호, 이메일, 희망금액, 상품대체 여부, 선택한 상품
② 선택정보 : 문의내용

3. 개인정보의 보유 및 이용기간
고객님의 개인정보는 수집목적 또는 제공받은 목적이 달성되거나, 마켓플랜트 쇼핑몰 이용약관에 표명한 절차에 따라 탈퇴를 요청한 경우, 지체없이 파기합니다. 단, 관련 법령에  명시된 아래의 사유에 해당하는 경우에는 해당 기간 종료시까지 개인정보를 보유합니다. 
① 계약 또는 청약철회 등에 관한 기록 : 5년
② 대금결제 및 재화 등의 공급에 관한 기록 : 5년
③ 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
④ 접속에 관한 기록보존 : 3개월

							</pre>
                        </div>
                    </div>
                </div><!-- // clause -->

                <div class="section-button mt40"><!-- section-button -->
                    <a href="javascript:;" class="btn_st2 xlarge btn_blk555" id="primary"><span>견적 신청</span></a>
                </div><!-- // section-button -->

            </div><!-- // estimate-sheet -->
			</form>
		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

    <!-- #footer S -->
    <%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <!--// #footer E -->
    <script type="text/javascript">
    $(document).ready(function (){
    	
    	goCatePage			= function(cPage){
    		
    		$.ajax({
    			async 	: false,
        		type	: "POST",
    			url		: "/pc/product/myEstimateCateSearchAjax.do",
    			dataType: "json",
    			data	: {"category1" : $("#category1").val()
    						, "category2" : $("#category2").val()
    						, "category3" : $("#category3").val()
    						, "productName" : $("#productName").val()
    						, "productNumber": $("#productNumber").val()
    						, "cPage" : cPage
    						},
    			success : function(data) {
    				if(data.MEM_LOGIN_YN == 'Y'){
    					var innerHtml		= "";
    					var pageInnerHtml	= "";
    					
    					if(data.totalCount > 0){
    						
    						innerHtml 	= '<ul class="ct">';
    						
    						$.each(data.list, function(i,item){
    							
    							innerHtml += '<li>';
    							innerHtml += '<div class="module">';
    							innerHtml += '<a href="javascript:;">';
    							innerHtml += '<span class="thumb"><img src="<c:out value="${cdnDomain}"/>'+ item.IMG_THUMBNAIL + '" class="thumb250" alt="" /></span>';
                                innerHtml += '<span class="subject">' + cutString(item.PRD_MST_NM, 40) + '</span>';
                                innerHtml += '</a>';
                                if(item.PRD_MST_ERP_DSP_PRC > item.PRD_MST_DSP_PRC){
                                	innerHtml += '<p class="price-before"><span class="blind">소비자가</span><strong>' + setComma(item.PRD_MST_ERP_DSP_PRC) + '</strong>원</p>';
                                }
                                if(item.PRD_MST_PRC == item.PRD_MST_DSP_PRC){
                            		innerHtml += '<p class="price-after"><span class="blind">판매가</span><strong>' + setComma(item.PRD_MST_DSP_PRC) + '</strong>원</p>';
                                }else{
                                	innerHtml += '<p class="price-after"><span class="blind">판매가</span><strong class="co_red">' + setComma(item.PRD_MST_DSP_PRC) + '</strong>원</p>';
                                }
                            	innerHtml += '<div class="action">';
                                innerHtml += '<a href="javascript:;" class="btn_st0 btn_blk777 small" data-prd_mst_cd="' + item.PRD_MST_CD + '" data-prd_mst_opt_est_cnt ="'+ item.PRD_MST_OPT_EST_CNT +'" id="putBtn"><span>담기</span></a>';
                                innerHtml += '</div>';
                        		innerHtml += '</div>';
    							innerHtml += '</li>';
    						});
    						
    						var firstPageNo 				= data.firstPageNo;
    			            var firstPageNoOnPageList 		= data.firstPageNoOnPageList;
    			            var totalPageCount 				= data.totalPageCount;
    			            var lastPageNoOnPageList 		= data.lastPageNoOnPageList;
    			            var cPage 						= data.cPage;
    			            var lastPageNo 					= data.lastPageNo;
    			            var pageSize 					= data.pageSize;
    			            var pagingSize 					= data.pagingSize;
    						
    			            if(totalPageCount > pagingSize){
    			            	if(firstPageNoOnPageList > pagingSize){
    			            		pageInnerHtml += '<a class="nav first" href="javascript:;" onclick="goCatePage(' + firstPageNo + '); return false;" ><span class="blind">처음 페이지</span></a>';
    			            		pageInnerHtml += '<a class="nav prev" href="javascript:;" onclick="goCatePage(' + (firstPageNoOnPageList - 1) + '); return false;" ><span class="blind">이전 페이지</span></a>';
    			            	}else{
    			            		pageInnerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
    			            		pageInnerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
    			            	}
    			            }else{
    			            	pageInnerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
    			            	pageInnerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
    			            }
    			            
    			            
    			            if (lastPageNoOnPageList > totalPageCount){
    			                lastPageNoOnPageList = totalPageCount;
    			            }
    		            	
    		            	for(var i=firstPageNoOnPageList; i<= lastPageNoOnPageList; i++){
    		            		
    			                if(i==cPage){
    			                	pageInnerHtml +='<a href="javascript:;" class="num active">' + i + '</a>';
    			                }else{
    			                	pageInnerHtml +='<a href="javascript:;" onclick="goCatePage(' + i + '); return false;" class="num">' + i + '</a>';
    			                }
    			            }
    			            	
    		            	if(totalPageCount > pagingSize){
    			                if(lastPageNoOnPageList < totalPageCount){
    			                	pageInnerHtml +='<a class="nav next" href="javascript:;" onclick="goCatePage('+ (lastPageNoOnPageList + 1) + '); return false;"><span class="blind">다음페이지</span></a>';
    			                	pageInnerHtml +='<a class="nav last" href="javascript:;" onclick="goCatePage('+ lastPageNo +'); return false;" ><span class="blind">끝 페이지</span></a>';
    			                }else {
    			                	pageInnerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
    			                	pageInnerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
    			                }
    			            } else {
    			            	pageInnerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
    			            	pageInnerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
    			            }
    		            	
    					}else{
    						innerHtml	= '<p class="message no-more">등록된 상품이 없습니다.</p>';	
    					}
    					
    					$("#estimate-item-list").html(innerHtml);
    					$("#pageDiv").html(pageInnerHtml);
    					
    				}else{
    					//로그인 팝업
    					var url = location.href;
						url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
    				}
    			}, error : function(err) {
    				window.jquery
    				|| console.log('오류가 발생하였습니다: ' + err.status);
    			}
        	});
    	};			// goCatePage
    	
    	$(document).on("click", "#category1", function(){
        	var val	= this.value;
        	$.ajax({
    			type	: "POST",
    			url		: "/pc/product/myEstimateCateAjax.do",
    			dataType: "json",
    			data	: {"PRD_CTG_IDX" : val , "PRD_CTG_ENV":"P"},
    			success : function(data) {
    				if(data.MEM_LOGIN_YN == 'Y'){
    					$("#estimate-search").show();
    					var innerHtml	= '<option value="">중카테고리</option>';
    					
    	    		 	$.each(data.categoryList, function(i,item){
    	    		 		innerHtml += '<option value="' + item.PRD_CTG_IDX + '">' + item.PRD_CTG_NM + '</option>'
    	    		 	});
    	                	
             			$("#category2").html(innerHtml);
             			$("#category3").html('<option value="">소카테고리</option>');
             			com.sel_chg($("#category2"), 'chg');
             			com.sel_chg($("#category3"), 'chg');
    	         			
    				}else{
    					//로그인 팝업
    					var url = location.href;
						url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
    				}
    			}, error : function(err) {
    				window.jquery
    				|| console.log('오류가 발생하였습니다: ' + err.status);
    			}
    		});
        });
    	    
    	$(document).on("click", "#category2", function(){
    		var val	= this.value;
        	$.ajax({
    			type	: "POST",
    			url		: "/pc/product/myEstimateCateAjax.do",
    			dataType: "json",
    			data	: {"PRD_CTG_IDX" : val , "PRD_CTG_ENV":"P"},
    			success : function(data) {
    				if(data.MEM_LOGIN_YN == 'Y'){
    					$("#estimate-search").show();
    					var innerHtml	= '<option value="">소카테고리</option>';
    					
    	    		 	$.each(data.categoryList, function(i,item){
    	    		 		innerHtml += '<option value="' + item.PRD_CTG_IDX + '">' + item.PRD_CTG_NM + '</option>'
    	    		 	});
    	                	
             			$("#category3").html(innerHtml);
             			com.sel_chg($("#category3"), 'chg');
    				}else{
    					//로그인 팝업
    					var url = location.href;
						url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
    				}
    			}, error : function(err) {
    				window.jquery
    				|| console.log('오류가 발생하였습니다: ' + err.status);
    			}
    		});
        });
        
        $(document).on("click", "#searchBtn", function(){
        	goCatePage(1);
        });
        
        $(document).on("click", "#putBtn", function(){
        	var prd_mst_idx = $(this).data("prd_mst_cd");
        	var prd_mst_opt_est_cnt = $(this).data("prd_mst_opt_est_cnt");
        	
        	if(prd_mst_opt_est_cnt > 0){
        		if(confirm("해당 상품은 필수 옵션이 있습니다\n간편보기에서 필수 옵션 선택 후 장바구니에 담을수 있습니다.\n간편보기로 이동 하시겠습니까?")){
     				goProductView(prd_mst_idx);
     				return;
     			}else{
     				return;
     			}
        	}else{
        		$.ajax({
        			async : false,
                    type : "POST",
                    data : {
                    			"PRD_MST_CD" : prd_mst_idx
                    			,"OPT_DTL_IDXs" : 0
                    			,"REQUEST_CNT_0" : 1
                    			,"MEM_CRT_DLV_GBN" : 2096
                    		},
                    url : "<c:out value="${frontDomain}" />/pc/product/insertEsmCartAjax.do",
                    success : function (data){
                    	// 1 : 장바구니 등록 성공
                    	alert("성공했습니다.");
                    	goMyEsmList();
                    }, error : function (err){
                        alert("오류가 발생하였습니다.\n[" + err.status + "]");
                        window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
                    }
            	});	
        	}
        });
        
        $(document).on("click", "#chaBtn", function(){
        	var prd_mst_idx = $(this).data("prd_mst_cd");
     		goProductView(prd_mst_idx);
        });
        
        
      	//간편보기
    	goProductView = function(prdMstCd){
    		if(prdMstCd != ""){
    			popup('<c:out value="${frontDomain}"/>/pc/product/productSimpleView.do?prdMstCd='+prdMstCd + '&esmCart=T',"1030","900","no","productViewPopup");
    		}else{
    			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
    			return;
    		}
    	};
    	
    	goMyEsmList	= function(){
    		$.ajax({
    			type	: "POST",
    			url		: "/pc/product/myEstimateListAjax.do",
    			dataType: "json",
    			success : function(data) {
    				
    				//data.totalCount;
    				var innerHtml 	= '<ul class="ct">';
   	    		 	$.each(data.list, function(i,item){
   	    		 		var listNum		= 1;
   	    		 		var optPrice	= 0;
   	    		 		
	   	    		 	innerHtml += '<li id="' + item.PRD_MST_CD +'" data-esm_crt_cnt="'+ item.ESM_CRT_CNT +'">';
	                    innerHtml += '<div class="module">';
	                    innerHtml += '<div class="check">';
	                    innerHtml += '<label for="" class="inp_checkbox">';
						innerHtml += '<input type="checkbox" class="checkbox" name="PRD_MST_CDs" id="PRD_MST_CDs" value="' + item.PRD_MST_CD + '" />';
						innerHtml += '</label>';
	                    innerHtml += '</div>';
						innerHtml += '<a href="javascript:;">'
						innerHtml += '<span class="thumb"><img src="<c:out value="${cdnDomain }" />' + item.PRODUCT_THUM_IMG + '" class="thumb200" alt="" /></span>';
						innerHtml += '<span class="option">'
						
						$.each(data.optList, function(j, optItem){
							if(item.PRD_MST_CD == optItem.MEM_PRD_MST_CD){
	                			if (listNum > 1){
	                				innerHtml +='<br/>';	
	                			}
	                			innerHtml += listNum + "." + optItem.OPT_DTL_NM + " / " + optItem.ESM_CRT_CNT + "개";
	                			listNum 	= listNum + 1;
	                			optPrice	= optPrice + optItem.OPT_DTL_ADD_PRC * optItem.ESM_CRT_CNT;
							}
						});
											
						if(listNum == 1){
							innerHtml += item.PRD_MST_NM + item.ESM_CRT_CNT + '개';
						}	
										
						innerHtml += '</span>';
	                    innerHtml += '</a>';
	                    innerHtml += '<span class="subject">' + cutString(item.PRD_MST_NM, 40) + '</span>';
	                    
	                    if(item.PRD_MST_ERP_DSP_PRC > item.PRD_MST_DSP_PRC){
	                    	innerHtml += '<p class="price-before"><span class="blind">소비자가</span><strong>' + setComma(item.PRD_MST_ERP_DSP_PRC) + '</strong>원</p>';
	                    }
	                    if(item.PRD_MST_PRC == item.PRD_MST_DSP_PRC){
	                    	innerHtml += '<p class="price-after" id="price'+ item.PRD_MST_CD +'" data-price="'+ (item.PRD_MST_DSP_PRC * item.ESM_CRT_CNT + optPrice) + '"><span class="blind">판매가</span><strong>' + setComma(item.PRD_MST_DSP_PRC) + '</strong>원</p>';
	                    }else{
	                    	innerHtml += '<p class="price-after" id="price'+ item.PRD_MST_CD +'" data-price="'+ (item.PRD_MST_DSP_PRC * item.ESM_CRT_CNT + optPrice) + '"><span class="blind">판매가</span><strong class="co_red">' + setComma(item.PRD_MST_DSP_PRC) + '</strong>원</p>';
	                    }
	                    if(item.ESM_CRT_CNT == 0 && item.PRD_MST_OPT_EST_CNT > 0){
	                    	innerHtml += '옵션 필수 상품입니다';
	                    	innerHtml += '<a href="javascript:;" class="btn_st0 btn_white xsmall" data-prd_mst_cd="' + item.PRD_MST_CD + '"  id="chaBtn"><span>변경</span></a>';
	                    }else{
	                    	if(item.ESM_CRT_CNT > 0){
								innerHtml += '본품' + item.ESM_CRT_CNT + '개';                
							}
							if(item.ESM_CRT_SLT_CNT > 0){
								innerHtml += '옵션' + item.ESM_CRT_SLT_CNT + '개';
							}
							innerHtml += '<a href="javascript:;" class="btn_st0 btn_white xsmall" data-prd_mst_cd="' + item.PRD_MST_CD + '"  id="chaBtn"><span>변경</span></a>';
	                    }
	                    
	                    innerHtml += '</div>';
	                    innerHtml += '</div>';
	                    innerHtml += '</li>';
	                    
   	    		 	});
					innerHtml += '</ul>';
					
					$(".desc").html("(총 <strong>" + data.totalCount + "</strong>개)");
   	    		 	$("#estList").html(innerHtml);
   	    		 	priceChk();
   	    		 	
    			}, error : function(err) {
    				window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
    			}
    		});
    	};
    	
    	$(document).on("click", "#check_all", function(){
    		
    		$("input[name=PRD_MST_CDs]:checkbox").each(function(){
    			var esm_crt_cnt = $('#' + $(this).val()).data('esm_crt_cnt');
        		
        		if(esm_crt_cnt < 5){
        			alert("5개 이상 구매 가능합니다.");
        			this.checked = false;
        		}else{
    				this.checked = true;
    				$(this).parents(".inp_checkbox").addClass("on");
    			}
    		});
    		priceChk();
    	});
    	
    	$(document).on("click", "#uncheck_all", function(){
    		$("input[name=PRD_MST_CDs]:checkbox").each(function(){
    			this.checked = false;
    		});
    		$(".inp_checkbox").each(function(){
    			$(this).removeClass("on");	
    		});
    		priceChk();
    	});
    	
    	$(document).on("click", ".inp_checkbox", function(){
    		
    		//var esm_crt_cnt = $('#' + $(this).val()).data('esm_crt_cnt');
    		
    		var esm_crt_cnt = $(this).parents("li").data('esm_crt_cnt');
    		
    		if(esm_crt_cnt < 5){
    			alert("5개 이상 구매 가능합니다.");
    			$(this).find(".checkbox").prop("checked", false);
    			$(this).removeClass('on');
    		}else{
    			
    			if($(this).find(".checkbox").is(":checked") ){
    				$(this).find(".checkbox").prop("checked", false);
        			$(this).removeClass('on');	
    			}else{
    				$(this).find(".checkbox").prop("checked", true);
        			$(this).addClass('on');	
    			}
    			
    			priceChk();	
    		}
			priceChk();
		});
    	
    	$(document).on("click", "#PRD_MST_CDs", function(){
    		var esm_crt_cnt = $('#' + $(this).val()).data('esm_crt_cnt');
    		
    		
    		if(esm_crt_cnt < 5){
    			alert("5개 이상 구매 가능합니다.");
    			this.checked = false;
    		}else{
    			priceChk();	
    		}
    	});
    	
    	$(document).on("click", "#esmPrdDel", function(){
    		var len = ($("input[name=PRD_MST_CDs]:checkbox:checked").length);
    		
    		var val	= $("input[name=PRD_MST_CDs]:checkbox").val();
    		
    		if(len == 0){
    			alert("선택된 상품이 없습니다.");
    		}else{
    			if(confirm("견적 장바구니의 상품을 삭제하시겠습니까?")){
    				var esmCrtIdxs	= "";
   					$("input[name=PRD_MST_CDs]:checked").each(function(i){
   						if(i == 0){
   							esmCrtIdxs = "'" +  $(this).val() + "'";		
   						}else{
   							esmCrtIdxs += ",'" +  $(this).val() + "'";	
   						}
   					});
    				
    				$.ajax({
    					type	: "POST",
    	    			url		: "/pc/product/myEstimateDelAjax.do",
    	    			data	: {"PRD_MST_CDs" : esmCrtIdxs},
    	    			dataType: "json",
    	    			success : function(data) {
    	    				alert(data.resultMsg);
    	    				goMyEsmList();
    	    			},error : function(err) {
    	    				window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
    	    			}
    				});
    			}
    		}
    	});
    
    	priceChk		= function(){
    		var realPrice	= 0;
    		var realCnt		= 0;
    		
    		$("input[name=PRD_MST_CDs]:checked").each(function(i){
    			var id = $(this).val();
    			var price = ($("#price"+id).data("price"));
    			var cnt	= ($("#cnt"+id).data("cnt"));
    			
    			realPrice	= realPrice + price;
    			realCnt		= realCnt + cnt;
    		});
    		$("#priceText").text(numberWithCommas(realPrice));
    		$("#ESM_MST_ESM_TOT_PRICE").val(realPrice);
    		$("#ESM_CRT_CNT").val(realCnt);
    	};
      	
    	numberWithCommas	= function(x) {
    	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	}
    	
    	$(document).on("click", "#primary", function(){
    		
			var len = ($("input[name=PRD_MST_CDs]:checkbox:checked").length);
    		
    		if(len == 0){
    			alert("선택된 상품이 없습니다.");
    		}else{
    			
    			if($("#ESM_MST_MEM_NM").val() == ""){
	    			alert("이름을 입력하세요.");
	    			$("#ESM_MST_MEM_NM").focus();
	    			return;
	    		}
    			
    			if($("#ESM_MST_HP2").val() == ""){
	    			alert("폰 번호를 입력하세요");
	    			$("#ESM_MST_HP2").focus();
	    			return;
	    		}
	    		
	    		if($("#ESM_MST_HP3").val() == ""){
	    			alert("폰 번호를 입력하세요");
	    			$("#ESM_MST_HP3").focus();
	    			return;
	    		}
	    		
	    		if($("#ESM_MST_PRD_CHANGE_YN").val() == ""){
	    			alert("상품대체 가능 여부를 선택하세요.");
	    			return;
	    		}
	    		
	    		if($("#ESM_MST_MAIL").val() == ""){
	    			alert("이메일을 입력하세요.");
	    			$("#ESM_MST_MAIL").focus();
	    			return;
	    		}else{
	    			if(!validateEmail($("#ESM_MST_MAIL").val())){
	    				alert("유효하지 않은 이메일입니다.");
	    				$("#ESM_MST_MAIL").focus();
	    				return;
	    			}
	    		}

	    		if($("#ESM_MST_ESM_TOT_PRICE").val() == "" || $("#ESM_MST_ESM_TOT_PRICE").val() == 0){
	    			alert("선택 된 상품의 값이 0원입니다.");
	    			return;
	    		}
	    		
	    		if($("#ESM_MST_WSH_TOT_PRICE_INP").val() == ''){
	    			alert("희망금액을 입력하세요.");
	    			$("#ESM_MST_WSH_TOT_PRICE_INP").fucus();
	    			return;
	    		}
	    		
	    		if($("#ESM_MST_WSH_TOT_PRICE").val() == 0){
	    			alert("희망금액은 0원보다 많아야 합니다.");
	    			$("#ESM_MST_WSH_TOT_PRICE").fucus();
	    			return;
	    		}
	    		
	    		if(Number($("#ESM_MST_WSH_TOT_PRICE").val()) > Number($("#ESM_MST_ESM_TOT_PRICE").val())){
	    			alert("희망금액이 선택 상품 가격보다 많습니다.");
	    			$("#ESM_MST_WSH_TOT_PRICE").fucus();
	    			return;
	    		}
	    			    		
	    		if($("input:checkbox[id='areement']").is(":checked") == false){
	    			alert("개인정보 수집에 동의 하셔야 합니다.");
	    			return;
	    		}
    		
    			$("#frm").attr("action", "/pc/product/estimateProcess.do").submit();
    		}
    
    	});
    	
    	
    	$("#ESM_MST_HP2").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
	    		var inputVal = $(this).val();
    			$(this).val(inputVal.replace(/[^0-9]/gi,''));
    		}

		});

    	$("#ESM_MST_HP3").keyup(function(event){
    		if (!(event.keyCode >=37 && event.keyCode<=40)) {
    			var inputVal = $(this).val();
    			$(this).val(inputVal.replace(/[^0-9]/gi,'')); 
    		}
		});
	
    	$("#ESM_MST_WSH_TOT_PRICE_INP").keyup(function(event){
    		if (!(event.keyCode >=37 && event.keyCode<=40)) {
    			
    			var inputVal = $(this).val();
    			var inputValRep	= inputVal.replace(/[^0-9]/gi,'');
    			
				if(inputValRep <= 0){
					$(this).val('');
	    			$("#ESM_MST_WSH_TOT_PRICE").val('');
				}else{
					$(this).val(comma(inputValRep));
	    			$("#ESM_MST_WSH_TOT_PRICE").val(inputValRep);	
				}
    		}
		});
    	
		function validateEmail(email) {
		    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    return re.test(email);
		}
		
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
    });
    
    cateSearch		= function(){
		var _this = $(this),
		_li = _this.parent('li');
		
		_li.addClass('active');
		_li.siblings().removeClass('active');
		
		$.ajax({
			type	: "POST",
			url		: "/pc/product/myEstimateCateAjax.do",
			dataType: "json",
			data	: {"PRD_CTG_IDX" : "-1", "PRD_CTG_ENV":"P"},
			success : function(data) {
				if(data.MEM_LOGIN_YN == 'Y'){
					$("#estimate-search").show();
					var innerHtml	= '<option value="">대카테고리</option>';
					
	    		 	$.each(data.categoryList, function(i,item){
	    		 		innerHtml += '<option value="' + item.PRD_CTG_IDX + '">' + item.PRD_CTG_NM + '</option>'
	    		 	});
	                	
         			$("#category1").html(innerHtml);
         			$("#estimate-item-list").html("");
         			$("#pageDiv").html("");
         			
         			com.sel_chg($("#category1"), 'chg');
	         			
				}else{
					//로그인 팝업
				}
			}, error : function(err) {
				window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	};
	
	cutString	= 	function(str, len){
		if(str.length > len && len > 0){
			return str.substring(0, len - 1) + "..";
		}else{
			return str;
		}
	}
	
    $(document).ready(function(){
    	cateSearch();
    });
    </script>
    
</section>
<!--// #wrap E -->
</body>
</html>