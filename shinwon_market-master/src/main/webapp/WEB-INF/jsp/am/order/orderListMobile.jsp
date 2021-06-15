<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<meta name="format-detection" content="telephone=no" />
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
	<a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

	<aside id="navigation"><!-- navigation -->
		<nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
		</nav>
	</aside><!-- // navigation -->

	<div id="body"><!-- body -->

		<section id="contents"><!-- contents -->

			<div id="breadcrumb"><!-- breadcrumb -->
				<a href="#none"><i class="icon-home em"></i> HOME</a>
				&gt;
				<a href="#none">주문관리</a>
				&gt;
				<span>결제완료</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">주문관리 &gt; 결제완료</h3>

				<form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
					<input type="hidden" name="searchYn" value="Y" />			
					
				 <div class="section-form"><!-- section-form-a -->
					<div class="form-group">
						<div class="col">
							<label class="label"><span>주문통합검색</span></label>
							<div class="field">
								<c:if test="${empty commandMap.ADM_MST_SUB_IDX }"><%-- 입점업체 관리자는 제외하고 버튼 생성 --%>
									<select class="select" name="searchMD" id="searchMD">
	                                   <option value="">선택</option>
	                                   <c:if test="${not empty managerMDList }">
	                                       <c:forEach var="managerMDRow" items="${managerMDList }" varStatus="i">
	                                           <option value="<c:out value="${managerMDRow.ADM_MST_ID }"/>" <c:if test="${commandMap.searchMD eq managerMDRow.ADM_MST_ID}">selected="selected"</c:if>><c:out value="${managerMDRow.ADM_MST_NM }"/></option>
	                                       </c:forEach>
	                                   </c:if>
	                                </select>	
								</c:if>
								<select class="select" id="searchDlvType" name="searchDlvType">
									<option value="">배송구분 선택</option>
	 								<c:forEach items="${codes.DLV_TYPE}" var="data">
	 									<option value="<c:out value="${data.CMN_COM_IDX}"/>" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchDlvType}" g="selected"/>>
	 									    <c:out value="${data.CMN_COM_NM}"/>
	 									</option> 
	 								</c:forEach> 
								</select>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col">
							<label class="label"><span>주문일자</span></label>
							<div class="field">
								<%-- <select class="select" name="searchDateType">
									<option value="order" <c:if test="${commandMap.searchDateType eq 'order'}">selected="selected"</c:if>>주문일</option>
									<option value="pay" <c:if test="${commandMap.searchDateType eq 'pay'}">selected="selected"</c:if>>결제일</option>
								</select> --%>
								<input type="text" class="text datepicker s-datepicker" name="searchStartDate" id="searchStartDate" value="<c:out value="${commandMap.searchStartDate}"/>" /> ~
								<input type="text" class="text datepicker e-datepicker" name="searchEndDate" id="searchEndDate" value="<c:out value="${commandMap.searchEndDate}"/>" />
								<!-- <a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a> -->
								<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
	                            (날짜형식: YYYY-MM-DD)
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col">
							<label class="label"><span>주문자/수령인명</span></label>
							<div class="field">
								<input type="text" class="text" name="searchOrderNm" value="<c:out value="${commandMap.searchOrderNm}"/>"/> 
								/
								<input type="text" class="text" name="searchDlvNm" value="<c:out value="${commandMap.searchDlvNm}"/>"/> 
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col">
							<label class="label"><span>상품코드/기간계상품코드</span></label>
							<div class="field">
								<input type="text" class="text" name="searchProductCd" value="<c:out value="${commandMap.searchProductCd}"/>"/> 
								/
								<input type="text" class="text" name="searchErpProductCd" value="<c:out value="${commandMap.searchErpProductCd}"/>"/> 
							</div>
						</div>
					</div>
										
					<div class="form-group">
						<div class="col">
							<label class="label"><span>주문번호/전표번호</span></label>
							<div class="field">
								<input type="text" class="text" name="searchOrderCd" value="<c:out value="${commandMap.searchOrderCd}"/>"/> 
								/
								<input type="text" class="text" name="searchSlipNo" value="<c:out value="${commandMap.searchSlipNo}"/>"/> 
							</div>
						</div>					
					</div>
										
					<div class="form-group">
						<div class="col">
							<label class="label"><span>상품명</span></label>
							<div class="field">
								<input type="text" class="text" name="searchProductNm" value="<c:out value="${commandMap.searchProductNm}"/>"/> 
							</div>
						</div>					
					</div>
										
					<div class="form-group">
						<div class="col" id="">
							<label class="label"><span>채널선택</span></label>
							<div class="field">
								<select class="select" id="searchChannel1" name="searchChannel1">
									<option value="">선택</option>
									<option value="sysRetail" <c:if test="${commandMap.searchChannel1 eq 'sysRetail'}">selected="selected"</c:if>>마켓플랜트</option>
									<option value="channel" <c:if test="${commandMap.searchChannel1 eq 'channel'}">selected="selected"</c:if>>채널</option>
								</select>
								
								<select class="select" id="searchChannel2" name="searchChannel2">
									<option value="">선택없음</option>
								</select>
								
								<br/>
								<c:if test="${empty commandMap.ADM_MST_SUB_IDX }"><%-- 입점업체 관리자 아닌 경우 --%>
									<input type="checkbox" id="searchSysRetailPrd" name="searchSysRetailPrd" class="checkbox" value="Y" <c:if test="${commandMap.searchSysRetailPrd eq 'Y'}">checked="checked"</c:if> />
									<label for="searchSysRetailPrd">기간계 상품 주문</label>
								</c:if>
							</div>
						</div>
					</div>
					
					<div class="form-group">
                        <div class="col">
                            <label class="label"><span>아이디</span></label>
                            <div class="field">
                                <input type="text" class="text" name="searchOrderId" value="<c:out value="${commandMap.searchOrderId}"/>"/> 
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col">
                            <label class="label"><span>연락처</span></label>
                            <div class="field">
                                <input type="text" class="text" name="searchOrderHp" value="<c:out value="${commandMap.searchOrderHp}"/>"/> 
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col">
                            <label class="label"><span>입점업체</span></label>
                            <div class="field">
                                <c:if test="${empty commandMap.ADM_MST_SUB_IDX }"><%-- 입점업체 관리자 아닌 경우 --%>
									<select class="select" id="searchVendor" name="searchVendor">
										<option value="">선택</option>
										<c:forEach var="item" items="${vendorList}">
											<option value="<c:out value="${item.VDR_MST_IDX}"/>" <c:if test="${commandMap.searchVendor eq item.VDR_MST_IDX}">selected="selected"</c:if>><c:out value="${item.VDR_MST_NM}"/></option>
										</c:forEach>
									</select>
								</c:if>
								
								<c:if test="${not empty commandMap.ADM_MST_SUB_IDX && commandMap.ADM_MST_SUB_IDX gt 0}"><%-- 입점업체 관리자인 경우 --%>
									<c:forEach var="item" items="${vendorList}">
										<c:if test="${commandMap.ADM_MST_SUB_IDX eq item.VDR_MST_IDX}"><c:out value="${item.VDR_MST_NM}"/></c:if>
									</c:forEach>
								</c:if>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col">
                            <label class="label"><span>주문매체</span></label>
                            <div class="field">
                                <label><input type="radio" id="searchOrdType1" name="searchOrdType" class="checkbox" value="" <c:if test="${empty commandMap.searchOrdType }">checked="checked"</c:if> /> 전체</label>
                                <label><input type="radio" id="searchOrdType2" name="searchOrdType" class="checkbox" value="${Code.MEMBER_JOIN_TYPE_PC }" <c:if test="${commandMap.searchOrdType eq Code.MEMBER_JOIN_TYPE_PC}">checked="checked"</c:if> /> PC</label>
                                <label><input type="radio" id="searchOrdType3" name="searchOrdType" class="checkbox" value="${Code.MEMBER_JOIN_TYPE_MOBILE }" <c:if test="${commandMap.searchOrdType eq Code.MEMBER_JOIN_TYPE_MOBILE}">checked="checked"</c:if> /> MOBILE</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col">
                            <label class="label"><span>결제수단</span></label>
                            <div class="field">
                            	<select class="select" id="searchPayType" name="searchPayType">
									<option value="">선택</option>
	 								<c:forEach items="${codes.PAY_TYPE}" var="data">
	 									<option value="<c:out value="${data.CMN_COM_IDX}"/>" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchPayType}" g="selected"/>>
	 									    <c:out value="${data.CMN_COM_NM}"/>
	 									</option> 
	 								</c:forEach> 
								</select>
                                <p>
                                    <label><input type="checkbox" id="searchCashbagUsed" name="searchCashbagUsed" class="checkbox" value="Y" <c:if test="${commandMap.searchCashbagUsed eq 'Y'}">checked="checked"</c:if> /> OK CASHBAG 사용</label>
                                </p>
                                <p>
                                    <label><input type="checkbox" id="searchMileageUsed" name="searchMileageUsed" class="checkbox" value="Y" <c:if test="${commandMap.searchMileageUsed eq 'Y'}">checked="checked"</c:if> /> 포인트 사용</label>
                                </p>
                            </div>
                        </div>
                    </div>
					
					<div class="form-group">
						<div class="col">
							<label class="label"><span>장기할부</span></label>
							<div class="field">
								<label>
									<input type="checkbox" id="searchLngDiv24" name="searchLngDiv24" class="checkbox" value="Y" <c:if test="${commandMap.searchLngDiv24 eq 'Y'}">checked="checked"</c:if> />
									24개월
								</label>
								<label>
									<input type="checkbox" id="searchLngDiv36" name="searchLngDiv36" class="checkbox" value="Y" <c:if test="${commandMap.searchLngDiv36 eq 'Y'}">checked="checked"</c:if> />
									36개월
								</label>
							</div>
						</div>
					</div>
				</div><!-- // section-form-a -->
					
				</form>
                
                <div class="section-button search">
                    <a href="javascript:search();" class="button button-b"><span>검색</span></a>
                </div>
				
				<form id="frm" name="frm">
				
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:set var="firstProd" value="Y"/>
						<c:set var="prevOrdMstCd" value=""/>
						<c:forEach items="${list}" var="data" varStatus="i">
							<c:if test="${data.ORD_MST_CD ne prevOrdMstCd}" > 
						        <c:set var="firstProd" value="Y"/>
						        <c:set var="prdNo" value="1"/>
							</c:if>
							<c:if test="${data.ORD_MST_CD eq prevOrdMstCd}" > 
								<c:set var="prdNo" value="${prdNo+1}"/>
							</c:if>
							
								<c:if test="${firstProd eq 'Y'}" > 
									<div class="title-box">
					                    <h4 class="title">NO. <c:out value="${listNum }"/></h4>
					                </div>
					                
					                <c:set var="listNum" value="${listNum-1}" />
					                <c:set var="prevOrdMstCd" value="${data.ORD_MST_CD}"/>
						            <c:set var="firstProd" value="N"/>
				                
									<div class="table-a table-row"><!-- row list -->
					                    <table class="core">
					                        <colgroup>
					                            <col style="width: 32%;" />
					                            <col style="width: auto;" />
					                        </colgroup>
					                        <tbody>
					                            <tr>
					                                <th>주문일시</th>
					                                <td><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd HH:mm"/></td>
					                            </tr>
					                            <tr>
					                                <th>주문번호</th>
					                                <td><c:out value="${data.ORD_MST_CD}"/></td>
					                            </tr>
					                            <tr>
					                                <th>주문자/수령인</th>
					                                <td>
					                                	<c:if test="${data.ORD_MST_ORD_ID ne '_GUEST_'}"><c:out value="${data.ORD_MST_ORD_NM}"/>(<c:out value="${data.ORD_MST_ORD_ID}"/>)</c:if>
					                                	<c:if test="${data.ORD_MST_ORD_ID eq '_GUEST_'}"><c:out value="${data.ORD_MST_ORD_NM}"/>(비회원)</c:if>
					                                	/ <c:out value="${data.ORD_DLV_NM}"/>
					                                </td>
					                            </tr>
					                            <tr>
					                                <th>총 주문금액</th>
					                                <td><fmt:formatNumber value="${data.ORD_PRD_ORD_PRC}" type="number"/></td>
					                            </tr>
					                            <tr>
					                                <th>총 할인금액</th>
					                                <td>- <fmt:formatNumber value="${data.TOT_DC_AMT}" type="number"/></td>
					                            </tr>
					                            <tr>
					                                <th>총 배송비</th>
					                                <td><fmt:formatNumber value="${data.TOT_PRD_DLV_CHARGE}" type="number"/></td>
					                            </tr>
					                            <tr>
					                                <th>총 결제금액</th>
					                                <td><fmt:formatNumber value="${data.CALCULATED_PAYMENT_PRICE}" type="number"/></td>
					                            </tr>
					                            <tr>
					                                <th>결제수단</th>
					                                <td><c:out value="${data.ORD_MST_PAY_TYPE_NM}"/></td>
					                            </tr>
					                        </tbody>
					                    </table>
					                </div><!-- // row list -->
			            		</c:if>
			            		
			            		<div class="table-a table-row"><!-- row list -->
				            		<table class="core">
				                        <colgroup>
				                            <col style="width: 32%;" />
				                            <col style="width: auto;" />
				                        </colgroup>
				                        <tbody>
				                            <tr>
				                                <th>주문상품/옵션<c:out value="${prdNo}"/></th>
				                                <td>
					                                <c:if test="${not empty data.ORD_PRD_ORG_IDX}" > 
											        	<img src="<c:out value="${serverDomain}"/>/am/img/ico_reply.png" alt="교환" style="width:17px;" />
											        </c:if>
				                                	<c:choose>
										    			<c:when test="${data.ORD_PRD_SLT_YN eq 'N' }"><%-- 마스터 or 필수옵션인 경우 --%>
															<c:out value="${data.PRD_MST_NM}"/>
															<c:if test="${data.ORD_PRD_OPT_DTL_IDX gt 0 }"><%-- 필수옵션인 경우 --%>
																<br/>
																(옵션)
																<c:out value="${data.OPT_DTL_NM }"/>
															</c:if>
										    			</c:when>
										    			<c:when test="${data.ORD_PRD_SLT_YN ne 'N' }"><%-- 선택옵션인 경우 --%>
										    				(옵션)
										    				<c:out value="${data.OPT_DTL_NM }"/>
										    			</c:when>
										    		</c:choose>
				                                </td>
				                            </tr>
				                        </tbody>
				                    </table>
					            </div>        
					            
						</c:forEach>
				    </c:when>
				    <c:otherwise>
				    </c:otherwise>
				</c:choose>
				
				
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="searchDateType" value="<c:out value="${commandMap.searchDateType }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                <input type="hidden" name="searchOrder" value="<c:out value="${commandMap.searchOrder }"/>"/>
                <input type="hidden" name="searchMD" value="<c:out value="${commandMap.searchMD }"/>" />
                <input type="hidden" name="searchOrdPrdOrderState" value="<c:out value="${commandMap.searchOrdPrdOrderState }"/>"/>
                <input type="hidden" name="searchDlvType" value="<c:out value="${commandMap.searchDlvType }"/>"/>
               
                <input type="hidden" name="searchOrderNm" value="<c:out value="${commandMap.searchOrderNm }"/>"/>
                <input type="hidden" name="searchDlvNm" value="<c:out value="${commandMap.searchDlvNm }"/>"/>
                <input type="hidden" name="searchOrderCd" value="<c:out value="${commandMap.searchOrderCd }"/>"/>
                <input type="hidden" name="searchSlipNo" value="<c:out value="${commandMap.searchSlipNo }"/>"/>
                <input type="hidden" name="searchProductCd" value="<c:out value="${commandMap.searchProductCd }"/>"/>
                <input type="hidden" name="searchErpProductCd" value="<c:out value="${commandMap.searchErpProductCd }"/>"/>
                <input type="hidden" name="searchProductNm" value="<c:out value="${commandMap.searchProductNm }"/>"/>
                <input type="hidden" name="searchOrderId" value="<c:out value="${commandMap.searchOrderId }"/>"/>
                <input type="hidden" name="searchOrderHp" value="<c:out value="${commandMap.searchOrderHp }"/>"/>
                
                <input type="hidden" name="searchPaymentPrice1" value="<c:out value="${commandMap.searchPaymentPrice1 }"/>"/>
                <input type="hidden" name="searchPaymentPrice2" value="<c:out value="${commandMap.searchPaymentPrice2 }"/>"/>
                <input type="hidden" name="searchProductType" value="<c:out value="${commandMap.searchProductType }"/>"/>
                <input type="hidden" name="searchProduct" value="<c:out value="${commandMap.searchProduct }"/>"/>
                
                <input type="hidden" name="searchOrdType" value="<c:out value="${commandMap.searchOrdType }"/>"/>
                <input type="hidden" name="searchPayType" value="<c:out value="${commandMap.searchPayType }"/>"/>
				<input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />		
				
				<input type="hidden" name="searchChannel1" value="<c:out value="${commandMap.searchChannel1 }"/>" />
				<input type="hidden" name="searchChannel2" value="<c:out value="${commandMap.searchChannel2 }"/>" />
				<input type="hidden" name="searchSysRetailPrd" value="<c:out value="${commandMap.searchSysRetailPrd }"/>" />
				<input type="hidden" name="searchCashbagUsed" value="<c:out value="${commandMap.searchCashbagUsed }"/>" />
				<input type="hidden" name="searchMileageUsed" value="<c:out value="${commandMap.searchMileageUsed }"/>" />
				
				<input type="hidden" name="searchLngDiv24" value="<c:out value="${commandMap.searchLngDiv24 }"/>" />
				<input type="hidden" name="searchLngDiv36" value="<c:out value="${commandMap.searchLngDiv36 }"/>" />

                <div class="pagination"><!-- pagination -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->


                <div class="bbs-status"><!-- bbs status -->
                    <div class="page">
                        총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
                    </div>
                    <div class="sort">
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
					</div>
                </div><!-- // bbs status -->

                </form>
                

            </div><!-- // contents-inner -->

		</section><!-- // contents -->
              
	</div><!-- // body -->

    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
	
    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/order/orderPayList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/orderPayList.do", "target":"_self", "method":"post"}).submit();
    };
    
});

</script>
</body>
</html>