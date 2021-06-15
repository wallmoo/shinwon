<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-detail"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
			<form id="frm" name="frm">
			<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="<c:out value="${commandMap.PRD_MST_CD }" />" />
			<input type="hidden" name="MEM_CRT_DLV_GBN" id="MEM_CRT_DLV_GBN" value="2097" /><!-- 상품유형(겟잇나우) -->
			<input type="hidden" name="searchYn" value="N"/>
			<input type="hidden" id="MEM_CRT_GET_PKU_DT" name="MEM_CRT_GET_PKU_DT" />
			<input type="hidden" id="MEM_CRT_GET_PKU_HH" name="MEM_CRT_GET_PKU_HH" />
			<input type="hidden" id="MEM_CRT_SHP_MST_IDX" name="MEM_CRT_SHP_MST_IDX" />
			<input type="hidden" id="TOT_PRD_MST_PRC" name="TOT_PRD_MST_PRC" value="<c:out value="${commandMap.TOT_PRD_MST_PRC }" />" />
			<input type="hidden" id="SHP_MST_IDX" name="SHP_MST_IDX" />
			<!-- .section-title S -->
			<div class="section-title _hd_fix">
	            <h2>픽업매장선택</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
			
			<!-- .pickup_d S -->
			<dl class="pickup_d">
				<dt class="pr_info">
					<i class="ico_getItNow"><span class="blind">Get it NOW</span></i>
					<img src="<c:out value="${cdnDomain }"/><c:out value="${productInfo.PRD_IMAGE }" />" alt="<c:out value="${productInfo.PRD_IMAGE_ALT }" />" />
					<span class="pr_ti"><c:out value="${productInfo.PRD_MST_NM }" /></span>
					<span class="pr_opt">
						<c:choose>
							<c:when test="${not empty addOptDtlList }">
								<c:forEach var="addOptDtlList" items="${addOptDtlList }" varStatus="status">
									<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="<c:out value="${addOptDtlList.OPT_DTL_IDX }" />" />
									<input type="hidden" name="REQUEST_CNT_<c:out value="${addOptDtlList.OPT_DTL_IDX }" />" id="REQUEST_CNT_<c:out value="${addOptDtlList.OPT_DTL_IDX }" />" value="<c:out value="${addOptDtlList.OPT_DTL_REQ_CNT }" />" />
									<c:out value="${addOptDtlList.OPT_DTL_ADD_PRC_NM }" /> / 수량 : <c:out value="${addOptDtlList.OPT_DTL_REQ_CNT }" />개
								</c:forEach>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="0" />
							</c:otherwise>
						</c:choose>
					</span>
					<span class="pr_sel_prc"><em >246,000</em><span class="tx_won">원</span></span>
					<strong class="pr_prc"><strong><fmt:formatNumber value="${commandMap.TOT_PRD_MST_PRC }" groupingUsed="true" /></strong><span class="tx_won">원</span></strong>
				</dt>
				<dd class="shop_type">
					<strong class="tx_ti">픽업가능한  매장정보</strong>
	
					<div class="box">
						<label for="" class="chk_box">
							<input type="checkbox" name="searchShpMstNow" id="searchShpMstNow" value="Y" <ui:select v="${commandMap.searchShpMstNow}" t="Y" g="checked"/> />
							<span>당일수령 가능한 매장만 보기</span>
						</label>
						
						<div class="sel_box">
							<label for="searchShpMstArea">
								<select name="searchShpMstArea" id="searchShpMstArea">
									<option value="">전체</option>
									<c:if test="${not empty areaCodeList }">
						               <c:forEach var="codeRow" items="${areaCodeList }" varStatus="i">
						                   <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${commandMap.searchShpMstArea eq codeRow.CMN_COM_IDX}">selected="selected"</c:if>>
						                       <c:out value="${codeRow.CMN_COM_NM }"/>
						                   </option>
						               </c:forEach>
						           </c:if>
								</select>
							</label>
						</div>
					</div>
					<p class="tx_ex">
						<span class="co_red">* 선택한 상품을 보유한 지점정보를 제공합니다.</span>
					</p>
				</dd>
				<dd class="shop_list">
					<table>
						<caption>픽업가능 매장에서 매장명, 픽업가능일, 방문예정일로 구성된 표</caption>
						<colgroup>
							<col style="width:60px" />
							<col />
							<col style="width:100px" />
						</colgroup>
						<tbody>
							<!-- 한개 S -->
							<c:choose>
				        		<c:when test="${not empty StoreList }">
				        			<c:set var="sortNum" value="0" />
					        		<c:forEach var="StoreList" items="${StoreList }" varStatus="status">
					        			<tr>
											<th class="th_ti">
												매장명
											</th>
											<th colspan="2" class="th_shop_name">
												<div>
													<i class="ico_getItNow"><span class="blind">Get it NOW</span></i>
													<strong data-lat="<c:out value="${StoreList.SHP_MST_LTTD}" />" data-lng="<c:out value="${StoreList.SHP_MST_LGTD}" />"><c:out value="${StoreList.SHP_MST_NM}" /></strong>
													<a href="javascript:goStoreInfo(<c:out value="${StoreList.SHP_MST_IDX}" />);"><strong>매장위치 및 영업시간 ></strong></a>
												</div>
											</th>
										</tr>
										<tr>
											<td class="td_ti">
												<span>픽업<br/>가능일</span>
											</td>
											<td class="td_time">
												<c:choose>
							                		<c:when test="${StoreList.SHP_MST_PIUP eq 'NOW' }">
							                			<strong><c:out value="${StoreList.SHP_MST_PIUP_DAY}" /><br/>
							                			<strong class="co_red">당일수령가능<br/>(<c:out value="${StoreList.SHP_MST_PIUP_TIME}" /> 주문까지)</strong></strong>
							                		</c:when>
							                		<c:otherwise>
							                			<strong><c:out value="${StoreList.SHP_MST_PIUP_DAY}" /></strong><br/>
							                			<span><c:out value="${StoreList.SHP_MST_PIUP_NEXT_DAY}" />부터 수령가능</span>
							                		</c:otherwise>
							                	</c:choose>
											</td>
											<td class="td_btn" rowspan="3">
												<a href="javascript:directPurchase('<c:out value="${sortNum }" />','<c:out value="${StoreList.SHP_MST_IDX }" />','<c:out value="${StoreList.SHP_MST_PIUP }" />');" class="btn_red"><strong>바로구매</strong></a>
												<a href="javascript:inertCart('<c:out value="${sortNum }" />','<c:out value="${StoreList.SHP_MST_IDX }" />','<c:out value="${StoreList.SHP_MST_NM}" />','<c:out value="${StoreList.SHP_MST_PIUP }" />');" class="btn_gre"><strong>장바구니</strong></a>
											</td>
										</tr>
										<tr>
											<td rowspan="2" class="td_ti">
												<span>방문<br/>예정일</span>
											</td>
											<td class="td_sel_date">
												<div class="sel_box">
													<label for="shpMstPkuDt">
														<c:choose>
									                		<c:when test="${StoreList.SHP_MST_PIUP eq 'NOW' }">
									                			<c:set value="${fn:split(StoreList.ST_CAL_NOW_FULL_ST_DAY,',')}" var="ST_CAL_FULL_DAY" />
									                			<c:set value="${fn:split(StoreList.ST_CAL_NOW_FULL_ST_DAY_NM,',')}" var="ST_CAL_FULL_DAY_NM" />
									                		</c:when>
									                		<c:otherwise>
									                			<c:set value="${fn:split(StoreList.ST_CAL_NEXT_FULL_ST_DAY,',')}" var="ST_CAL_FULL_DAY" />
									                			<c:set value="${fn:split(StoreList.ST_CAL_NEXT_FULL_ST_DAY_NM,',')}" var="ST_CAL_FULL_DAY_NM" />
									                		</c:otherwise>
									                	</c:choose>
														<select id="shpMstPkuDt" name="shpMstPkuDt">
															<option value="">방문일 선택</option>
															<c:forEach begin="0" end="${fn:length(ST_CAL_FULL_DAY) - 1}" step="1" var="i">
																<option value="<c:out value="${ST_CAL_FULL_DAY[i]}" />"><c:out value="${ST_CAL_FULL_DAY[i] }" />(<c:out value="${ST_CAL_FULL_DAY_NM[i] }" />)</option>
															</c:forEach>
														</select>
													</label>
												</div>
											</td>
										</tr>
										<tr>
											<td class="td_sel_time">
												<div class="sel_box">
													<label for="shpMstPkuHh">
														<select name="shpMstPkuHh" id="shpMstPkuHh">
															<option value="">방문시간선택</option>
															<c:forEach var="TIMESTR" items="${StoreList.TIMESTR }" varStatus="status">
																<option value="<c:out value="${TIMESTR }" />"><c:out value="${TIMESTR }" /></option>
															</c:forEach>
														</select>
													</label>
												</div>
											</td>
										</tr>
									<c:set var="sortNum" value="${sortNum + 1 }" />
					        		</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<th colspan=3>
											선택 가능한 매장이 없습니다.
										</th>
									</tr>
								</c:otherwise>
							</c:choose>
							<!--// 한개 E -->
						</tbody>
					</table>
			    	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			         <div class="section-pagination"><!-- section pagination -->
			             <ui:frontpaging paging="${paging }" jsFunction="goPage" />
			         </div><!-- // section pagination -->
				</dd>
			</dl>
			<!--// .pickup_d E -->
			<!-- #laypop S -->
			<%@ include file="/WEB-INF/jsp/mobile/product/productLayer.jsp" %>
			<!--// #laypop E -->
		</article>
		</form>
		<!--// #container E -->
		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<%@ include file="/WEB-INF/jsp/mobile/include/script.jsp" %>
<script type="text/javascript">
$(function(){
	
	goProduct = function(prdMstCd){
		/* window.open("<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd="+prdMstCd); */
		callJavascriptNextPage('<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd='+prdMstCd,'_blank');
		self.close();
	};
	
	goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.find("input[name='searchYn']").val("Y");
        $frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/searchProductStore.do", "target":"_self", "method":"post"}).submit();
    };
    
    //지역별 검색
    $(document).on("change", "#searchShpMstArea", function ()
    {
    	var $frm = $("#frm");
        $frm.find("input[name='searchYn']").val("Y");
        $frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/searchProductStore.do", "target":"_self", "method":"post"}).submit();
    });
    //당일수령가능 매장 검색
    $(document).on("change", "#searchShpMstNow", function ()
    {
    	var $frm = $("#frm");
        $frm.find("input[name='searchYn']").val("Y");
        $frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/searchProductStore.do", "target":"_self", "method":"post"}).submit();
    });
    
 	// 장바구니 담기
	inertCart = function(sortNum,shpMstIdx,shpMstNm,shpMstPiup){
		var now = new Date();
		var year= now.getFullYear();
		var hours = now.getHours();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
		var nowDate = year +"-"+ mon +"-"+ day;
		
 		if(shpMstIdx == ""){
 			alert("필수값이 없습니다.\n다시 시도해주세요.");
 			return;
 		}
 		//방문예정일 및 받는 시간 선택
 		if($("select[name=shpMstPkuDt]").eq(sortNum).val() == ""){
 			alert("받는날짜를 선택해주세요.");
 			$("select[name=shpMstPkuDt]").eq(sortNum).focus();
 			return;
 		}
 		
 		var piupDate = $("select[name=shpMstPkuDt]").eq(sortNum).val();
 		
 		if($("select[name=shpMstPkuHh]").eq(sortNum).val() == ""){
 			alert("받는시간을 선택해주세요.");
 			$("select[name=shpMstPkuHh]").eq(sortNum).focus();
 			return;
 		}
 		
 		var piupStTm = $("select[name=shpMstPkuHh]").eq(sortNum).val().split("~")[0];
 		var piupEdTm = $("select[name=shpMstPkuHh]").eq(sortNum).val().split("~")[1];
 		piupStTm = piupStTm.split(":")[0];
 		piupEdTm = piupEdTm.split(":")[0];
 		
 		//구매가능한 시간 체크
 		if(shpMstPiup == "NOW" && (piupDate == nowDate)){
 			
 			if((hours + 2) >= parseInt(piupStTm)){
 				alert("주문할 수 없는 시간입니다.");
 				return;
 			}
 		}
 		
 		$("#MEM_CRT_GET_PKU_DT").val($("select[name=shpMstPkuDt]").eq(sortNum).val().replace(/\-/g,""));
 		$("#MEM_CRT_GET_PKU_HH").val($("select[name=shpMstPkuHh]").eq(sortNum).val());
 		$("#MEM_CRT_SHP_MST_IDX").val(shpMstIdx);
 		
 		$.ajax
        ({
            async : false,
            type : "POST",
            data : $("#frm").serialize(),
            url : "<c:out value="${mobileDomain}" />/mobile/cart/insertCartAjax.do",
            success : function (data) 
            { 
            	// 1 : 장바구니 등록 성공
            	switch(data.result){
            	case 1:
            		//$("#topCartCnt").html(data.cartCnt);
            		$("#shpMstNmText").html(shpMstNm);
            		$.com.util.layPop('open', $('#layCartGet'));
            		break;
            	case -2:
            		$("#G020_text").html("기존에 담긴 겟잇나우 상품과 방문일자가 달라<br/> 장바구니에 담을 수 없습니다.");
            		$.com.util.layPop('open', $('#layCartGet2'));
            		break;
            	case -3:
            		$("#G020_text").html("겟잇나우 장바구니는<br/> <span class=\"co_blu\">매장별 3개</span>까지 생성 가능합니다.</br>현재 장바구니에 담긴 상품을 먼저</br> 주문해주시기 바랍니다.");
            		$.com.util.layPop('open', $('#layCartGet2'));
            		break;
            	default :
            		alert(data.resultMsg);
            		break;
            	}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
            }
		});
	};
	
	// 바로구매
	directPurchase = function(sortNum,shpMstIdx,shpMstPiup){
		var now = new Date();
		var year= now.getFullYear();
		var hours = now.getHours();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
		var nowDate = year +"-"+ mon +"-"+ day;
		
		if(shpMstIdx == ""){
 			alert("필수값이 없습니다.\n다시 시도해주세요.");
 			return;
 		}
 		//방문예정일 및 받는 시간 선택
 		if($("select[name=shpMstPkuDt]").eq(sortNum).val() == ""){
 			alert("받는날짜를 선택해주세요.");
 			$("select[name=shpMstPkuDt]").eq(sortNum).focus();
 			return;
 		}
 		
 		var piupDate = $("select[name=shpMstPkuDt]").eq(sortNum).val();
 		
 		if($("select[name=shpMstPkuHh]").eq(sortNum).val() == ""){
 			alert("받는시간을 선택해주세요.");
 			$("select[name=shpMstPkuHh]").eq(sortNum).focus();
 			return;
 		}
 		
 		var piupStTm = $("select[name=shpMstPkuHh]").eq(sortNum).val().split("~")[0];
 		var piupEdTm = $("select[name=shpMstPkuHh]").eq(sortNum).val().split("~")[1];
 		piupStTm = piupStTm.split(":")[0];
 		piupEdTm = piupEdTm.split(":")[0];
 		
 		//구매가능한 시간 체크
 		if(shpMstPiup == "NOW" && (piupDate == nowDate)){
 			
 			if((hours + 2) >= parseInt(piupStTm)){
 				alert("주문할 수 없는 시간입니다.");
 				return;
 			}
 		}
 		
 		$("#MEM_CRT_GET_PKU_DT").val($("select[name=shpMstPkuDt]").eq(sortNum).val().replace(/\-/g,""));
 		$("#MEM_CRT_GET_PKU_HH").val($("select[name=shpMstPkuHh]").eq(sortNum).val());
 		$("#MEM_CRT_SHP_MST_IDX").val(shpMstIdx);
 		
		$.ajax
        ({
            async : false,
            type : "POST",
            data : $("#frm").serialize(),
            url : "<c:out value="${mobileDomain}" />/mobile/cart/insertDirectPurchaseAjax.do",
            success : function (data) 
            { 
            	// 1 : 장바구니 등록 성공
            	switch(data.result){
            	case 1:
            		$('#_blank_form').html("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
            		$('#_blank_form').attr("method","post");	
            		<c:choose>
                    <%-- 1. 비회원 --%>
                    <c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
		        	//$('#_blank_form').attr('action','<c:out value="${mobileSslDomain}" />/mobile/cart/cartLogin.do').submit();
		        	var url = location.href;
		        	url = encodeURIComponent(url);
		        	location.target = "_self";
		        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url + "&ORD_MST_CD=" + data.ORD_MST_CD;
                    </c:when>
                    <%-- 2. 회원 --%>
                    <c:when test="${sessionUser.ROLE_USER eq 'user'}">
            		$('#_blank_form').attr({'action':'<c:out value="${mobileSslDomain}" />/mobile/cart/cartpayment.do', "target":"_self"}).submit();
                    </c:when>
                    </c:choose>
            		break;
            	default :
            		alert(data.resultMsg);
            		break;	
            	}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
            }
		});
		
		$(".selectedPrdOpt_0").prop("disabled", false);
	};
	
	//장바구니 이동
	goCartList = function(){
		/* $('#_blank_form').attr({'action':'<c:out value="${mobileSslDomain}" />/mobile/cart/cartlist.do','method':'get', "target":"_self"}).submit(); */
		callJavascriptNextPage('<c:out value="${mobileSslDomain}" />/mobile/cart/cartlist.do','_self');
	};
	
	//매장 상세 정보
	goStoreInfo = function(shpMstIdx){
		var $frm = $("#frm");
        $frm.find("input[name='SHP_MST_IDX']").val(shpMstIdx);
        $frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/searchProductStoreInfo.do", "target":"_self", "method":"post"}).submit();
	};
	
	
}); //function
</script>
</body>
</html>