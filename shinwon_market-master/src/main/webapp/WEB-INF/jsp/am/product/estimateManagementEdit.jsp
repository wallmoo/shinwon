<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

            <div class="container">

                <h2 class="title"><span>견적관리</span></h2>

                <div class="push-guide instant"><!-- push-guide -->
                    <i class="icon"><!-- icon --></i>
                    <h3 class="title"><span>기본정보</span></h3>
                </div><!-- // push-guide -->
				
				<form id="searchForm" name="searchForm">
	                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" name="searchEsmMstType" value="<c:out value="${commandMap.searchEsmMstType }"/>"/>
	                <input type="hidden" name="searchEsmMstMemNm" value="<c:out value="${commandMap.searchEsmMstMemNm }"/>"/>
	                <input type="hidden" name="searchEsmMstMemId" value="<c:out value="${commandMap.searchEsmMstMemId }"/>"/>
	                <input type="hidden" name="searchEsmMstHp1" value="<c:out value="${commandMap.searchEsmMstHp1 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp2" value="<c:out value="${commandMap.searchEsmMstHp2 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp3" value="<c:out value="${commandMap.searchEsmMstHp3 }"/>"/>
	                <input type="hidden" name="searchUseYn" value="<c:out value="${commandMap.searchUseYn }"/>"/>
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>"/>
                </form>
                
                <form id="frm" name="frm">
	                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" name="searchEsmMstType" value="<c:out value="${commandMap.searchEsmMstType }"/>"/>
	                <input type="hidden" name="searchEsmMstMemNm" value="<c:out value="${commandMap.searchEsmMstMemNm }"/>"/>
	                <input type="hidden" name="searchEsmMstMemId" value="<c:out value="${commandMap.searchEsmMstMemId }"/>"/>
	                <input type="hidden" name="searchEsmMstHp1" value="<c:out value="${commandMap.searchEsmMstHp1 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp2" value="<c:out value="${commandMap.searchEsmMstHp2 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp3" value="<c:out value="${commandMap.searchEsmMstHp3 }"/>"/>
	                <input type="hidden" name="searchUseYn" value="<c:out value="${commandMap.searchUseYn }"/>"/>
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>"/>
	                <input type="hidden" name="ESM_MST_IDX" id="ESM_MST_IDX" value="<c:out value="${estimateInfo.ESM_MST_IDX }"/>" />
	                <input type="hidden" name="ESM_MST_CD" id="ESM_MST_CD" value="<c:out value="${estimateInfo.ESM_MST_CD }"/>" />
	                <input type="hidden" name="UP_ESM_PCH_MEM_BUY_YN" id="UP_ESM_PCH_MEM_BUY_YN" value="" />
	                <input type="hidden" name="UP_ESM_PCH_MD_BUY_YN" id="UP_ESM_PCH_MD_BUY_YN" value="" />
	                <input type="hidden" name="UP_ESM_PCH_EPT_ST_DT" id="UP_ESM_PCH_EPT_ST_DT" value="" />
	                <input type="hidden" name="UP_ESM_PCH_EPT_ED_DT" id="UP_ESM_PCH_EPT_ED_DT" value="" />
	                <input type="hidden" name="UP_EMS_PCH_IDX" id="UP_EMS_PCH_IDX" value="" />
	                
	                <table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%; min-width: 180px;" />
	                        <col style="width: auto;" />
	                        <col style="width: 15%; min-width: 180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr>
								<th><span>구분</span></th>
								<td><c:out value="${estimateInfo.ESM_MST_TYPE_NM }"/></td>
								<th><span>사용여부</span></th>
								<td>
									<input type="radio" class="radio" name="ESM_MST_USE_YN" id="ESM_MST_USE_YN1" value="Y" <c:if test="${estimateInfo.ESM_MST_USE_YN eq 'Y'}"> checked=true</c:if> />
		                            <label for="ESM_MST_USE_YN1">사용</label>
		                            <input type="radio" class="radio" name="ESM_MST_USE_YN" id="ESM_MST_USE_YN2" value="N" <c:if test="${estimateInfo.ESM_MST_USE_YN eq 'N'}"> checked=true</c:if> />
		                            <label for="ESM_MST_USE_YN2">미사용</label>
								</td>
							</tr>
							<tr>
								<th><span>신청자명/ID</span></th>
								<td colspan=3><c:out value="${estimateInfo.ESM_MST_MEM_NM }"/><c:if test="${estimateInfo.ESM_MST_MEM_ID ne '' && estimateInfo.ESM_MST_MEM_ID ne null }">(<c:out value="${estimateInfo.ESM_MST_MEM_ID }"/>)</c:if>
								 / Email : <c:out value="${estimateInfo.ESM_MST_MAIL }"/></td>
							</tr>
							<tr>
								<th><span>휴대폰</span></th>
								<td colspan=3><c:out value="${estimateInfo.ESM_MST_HP1 }"/>-<c:out value="${estimateInfo.ESM_MST_HP2 }"/>-<c:out value="${estimateInfo.ESM_MST_HP3 }"/>(SMS 수신여부 : <c:out value="${estimateInfo.ESM_MST_SMS_SEND_YN eq 'Y'?'YES':'NO' }"/>)
								 / 배송희망일 : <ui:formatDate value="${estimateInfo.ESM_MST_DLV_DT }" pattern="yyyy.MM.dd"/></td>
							</tr>
							<tr>
								<th><span>문의사항</span></th>
								<td colspan=3><c:out value="${estimateQstNm}"/></td>
							</tr>
							<tr>
								<th><span>내용</span></th>
								<td colspan=3><c:out value="${estimateInfo.ESM_MST_QST }"/></td>
							</tr>
							<tr>
								<th><span>상품대체</span></th>
								<td><c:out value="${estimateInfo.ESM_MST_PRD_CHANGE_YN eq 'Y'?'YES':'NO' }"/></td>
								<th><span>상담방법</span></th>
								<td><c:out value="${estimateInfo.ESM_MST_ADV_TYPE_NM }"/></td>
							</tr>
							<tr>
								<th><span>등록일</span></th>
								<td colspan=3><c:out value="${estimateInfo.ESM_MST_MEM_NM }"/><c:if test="${estimateInfo.ESM_MST_MEM_ID ne '' && estimateInfo.ESM_MST_MEM_ID ne null }">(<c:out value="${estimateInfo.ESM_MST_MEM_ID }"/>)</c:if> / <ui:formatDate value="${estimateInfo.ESM_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
							</tr>
	                    </tbody>
	                </table><!-- // table -->
	            
		            <div class="push-guide instant"><!-- push-guide -->
	                    <i class="icon"><!-- icon --></i>
	                    <h3 class="title"><span>고객 견적요청 사항</span></h3>
	                </div><!-- // push-guide -->
	                
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                    <colgroup>
                        	<col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>   
                            	<th scope="col">NO</th>                         	
                            	<th scope="col">상품코드</th>
                                <th scope="col">상품명</th>
                                <th scope="col">옵션</th>
                                <th scope="col">수량</th>
                                <th scope="col">상품가격</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty productList }">
                                	<c:set var="ESM_PRD_IDX" value="ESM_PRD_IDX" />
                                	<c:set var="rownum" value="1" />
                                    <c:forEach var="row" items="${productList }" varStatus="i">
                                        <tr>
                                        	<c:choose>
                                        		<c:when test="${row.ESM_PRD_UP_CNT > 1 }">
                                        			<td rowspan=${row.ESM_PRD_UP_CNT}><c:out value="${rownum }"/></td>
		                                        	<td rowspan=${row.ESM_PRD_UP_CNT}><c:out value="${row.PRD_MST_CD }"/></td>
					                                <td rowspan=${row.ESM_PRD_UP_CNT}><c:out value="${row.PRD_MST_NM }"/></td>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<c:if test="${row.ESM_PRD_UP_IDX eq 0 }">
	                                        			<td><c:out value="${rownum }"/></td>
			                                        	<td><c:out value="${row.PRD_MST_CD }"/></td>
						                                <td><c:out value="${row.PRD_MST_NM }"/></td>
						                            </c:if>
                                        		</c:otherwise>
                                        	</c:choose>
			                                <td>
			                                	<c:choose>
			                                		<c:when test="${row.PRD_OPT_NM eq null || row.PRD_OPT_NM eq '' }">
			                                			옵션없음.
			                                		</c:when>
			                                		<c:otherwise>
			                                			<c:out value="${row.PRD_OPT_NM }"/> : <c:out value="${row.OPT_DTL_NM }"/><br />
				                                		추가금액 : <fmt:formatNumber value="${row.OPT_DTL_ADD_PRC }" groupingUsed="true" />
			                                		</c:otherwise>
			                                	</c:choose>
			                                </td>
			                                <td><c:out value="${row.ESM_PRD_CNT }"/>개</td>
			                                <td><fmt:formatNumber value="${row.ESM_PRD_WSH_PRICE }" groupingUsed="true" /></td>
			                            </tr>
			                        <c:set var="rownum" value="${rownum + 1 }" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="6">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                        <tfoot>
                            <tr>
                            	<th scole="row" colspan="5" class="text-right pr20">합계</th>
                            	<td><fmt:formatNumber value="${estimateInfo.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" /></td>
                            </tr>
                            <tr>
                            	<th scole="row" colspan="5" class="text-right pr20">견적희망가격(할인율: <strong class="primary"><c:out value="${estimateInfo.ESM_MST_TOT_PRICE }" />%</strong>)</th>
                            	<td><fmt:formatNumber value="${estimateInfo.ESM_MST_WSH_TOT_PRICE }" groupingUsed="true" /></td>
                            </tr>
                        </tfoot>
	                </table><!-- // table -->
	                
	                <c:choose>
                		<c:when test="${not empty mdPchList }">
							<div class="push-guide instant"><!-- push-guide -->
			                    <i class="icon"><!-- icon --></i>
			                    <h3 class="title"><span>MD 견적내용</span></h3>
			                </div><!-- // push-guide -->
							<c:set var="num" value="1" />
							<c:forEach var="mdPchList" items="${mdPchList }" varStatus="i">
								<p>
				                    <strong class="strong">[견적내역-${num}]</strong>
				                </p>
			                    <table class="table-col table-b">
			                        <colgroup>
			                        	<col style="width: 5%;" />
				                        <col style="width: auto;" />
				                        <col style="width: auto;" />
				                        <col style="width: 8%;" />
				                        <col style="width: 5%;" />
				                        <col style="width: 15%;" />
				                        <col style="width: 15%;" />
				                        <col style="width: 15%;" />
			                        </colgroup>
			                        <thead>
			                            <tr>   
			                            	<th scope="col">NO</th>                         	
			                            	<th scope="col">상품코드</th>
			                                <th scope="col">상품명</th>
			                                <th scope="col">옵션</th>
                                			<th scope="col">수량</th>
                                			<th scope="col">판매가</th>
			                                <th scope="col">상품가격</th>
			                                <th scope="col">MD견적가</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <c:choose>
			                                <c:when test="${not empty mdPorductList }">
			                                	<c:set var="listnum" value="1" />
			                                    <c:forEach var="mdPorductList" items="${mdPorductList }" varStatus="i">
			                                    	<c:if test="${mdPorductList.ESM_PRD_PCH_IDX eq mdPchList.ESM_PCH_IDX }">
				                                        <tr>
				                                        	<c:choose>
				                                        		<c:when test="${mdPorductList.ESM_PRD_UP_CNT > 1 }">
				                                        			<td rowspan=${mdPorductList.ESM_PRD_UP_CNT}><c:out value="${listnum }"/></td>
						                                        	<td rowspan=${mdPorductList.ESM_PRD_UP_CNT}><c:out value="${mdPorductList.PRD_MST_CD }"/></td>
									                                <td rowspan=${mdPorductList.ESM_PRD_UP_CNT}><c:out value="${mdPorductList.PRD_MST_NM }"/></td>
				                                        		</c:when>
				                                        		<c:otherwise>
				                                        			<c:if test="${mdPorductList.ESM_PRD_UP_IDX eq 0 }">
					                                        			<td><c:out value="${listnum }"/></td>
							                                        	<td><c:out value="${mdPorductList.PRD_MST_CD }"/></td>
										                                <td><c:out value="${mdPorductList.PRD_MST_NM }"/></td>
										                            </c:if>
				                                        		</c:otherwise>
				                                        	</c:choose>
							                                <td>
							                                	<c:choose>
							                                		<c:when test="${mdPorductList.PRD_OPT_NM eq null || mdPorductList.PRD_OPT_NM eq '' }">
							                                			옵션없음.
							                                		</c:when>
							                                		<c:otherwise>
							                                			<c:out value="${mdPorductList.PRD_OPT_NM }"/> : <c:out value="${mdPorductList.OPT_DTL_NM }"/><br />
								                                		추가금액 : <fmt:formatNumber value="${mdPorductList.OPT_DTL_ADD_PRC }" groupingUsed="true" />
							                                		</c:otherwise>
							                                	</c:choose>
							                                </td>
							                                <td><fmt:formatNumber value="${mdPorductList.ESM_PRD_CNT }" groupingUsed="true" />개</td>
							                                <c:choose>
				                                        		<c:when test="${mdPorductList.ESM_PRD_UP_CNT > 1 }">
				                                        			<td rowspan=${mdPorductList.ESM_PRD_UP_CNT}><fmt:formatNumber value="${mdPorductList.PRD_MST_PRC }" groupingUsed="true" /></td>
				                                        		</c:when>
				                                        		<c:otherwise>
				                                        			<c:if test="${mdPorductList.ESM_PRD_UP_IDX eq 0 }">
					                                        			<td><fmt:formatNumber value="${mdPorductList.PRD_MST_PRC }" groupingUsed="true" /></td>
										                            </c:if>
				                                        		</c:otherwise>
				                                        	</c:choose>
							                                <td><fmt:formatNumber value="${mdPorductList.ESM_PRD_WSH_PRICE }" groupingUsed="true" /></td>
							                                <td><fmt:formatNumber value="${mdPorductList.ESM_PRD_ESM_PRICE }" groupingUsed="true" /></td>
							                            </tr>
							                    	</c:if>
							                    <c:if test="${mdPorductList.ESM_PRD_PCH_IDX eq mdPchList.ESM_PCH_IDX }">
							                    	<c:set var="listnum" value="${listnum + 1 }" />
							                    </c:if>
			                                    </c:forEach>
			                                </c:when>
			                                <c:otherwise>
			                                    <tr>
			                                        <td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
			                                    </tr>
			                                </c:otherwise>
			                            </c:choose>
			                        </tbody>
			                        <tfoot>
			                            <tr>
			                            	<th scope="row" colspan="6" class="text-right pr20">합계</th>
			                            	<td><fmt:formatNumber value="${estimateInfo.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" /></td>
			                            	<td><fmt:formatNumber value="${mdPchList.ESM_PRD_ESM_TOTO_PRICE }" groupingUsed="true" /></td>
			                            </tr>
			                            <tr>
			                            	<th scope="row" colspan="6" class="text-right pr20">견적희망가격(할인율: <strong class="primary"><c:out value="${estimateInfo.ESM_MST_TOT_PRICE }" />%</strong>)</th>
			                            	<td><fmt:formatNumber value="${estimateInfo.ESM_MST_WSH_TOT_PRICE }" groupingUsed="true" /></td>
			                            	<td> </td>
			                            </tr>
			                            <tr>
			                            	<th scope="row" colspan="6" class="text-right pr20">
			                            		MD 견적합계(할인율: <strong class="primary"><c:out value="${mdPchList.ESM_PRD_PCH_TOT_PRICE }" />%</strong> / 
			                            		<fmt:formatNumber value="${mdPchList.ESM_PRD_ESM_TOTO_PRICE - mdPchList.ESM_MST_ESM_TOT_PRICE}" groupingUsed="true" />)
			                            	</th>
			                            	<td></td>
			                            	<td><fmt:formatNumber value="${mdPchList.ESM_PRD_ESM_TOTO_PRICE }" groupingUsed="true" /></td>
			                            </tr>
			                        </tfoot>
			                    </table>
			                    
                           		<table class="table-row table-a">
			               			<col style="width: 15%;" />
			               			<col style="width: 20%;" />
			               			<col style="width: 15%;" />
			               			<col style="width: auto;" />
			               			<col style="width: 120px;" />
                           			<tbody>
                           				<tr>
                           					<th scope="row"><span>고객구매결정</span></th>
                           					<td>
                           						<input type="radio" class="radio" name="UP_ESM_PCH_MEM_BUY_YN_${num}" id="UP_ESM_PCH_MEM_BUY_YN_1_${num}" value="N" <c:if test="${mdPchList.ESM_PCH_MEM_BUY_YN eq 'N' }"> checked=true</c:if> /><label for="UP_ESM_PCH_MEM_BUY_YN_1_${num}"><span>구매 미결정</span></label>&nbsp;&nbsp;
                           						<input type="radio" class="radio" name="UP_ESM_PCH_MEM_BUY_YN_${num}" id="UP_ESM_PCH_MEM_BUY_YN_2_${num}" value="Y" <c:if test="${mdPchList.ESM_PCH_MEM_BUY_YN eq 'Y' }"> checked=true</c:if> /><label for="UP_ESM_PCH_MEM_BUY_YN_2_${num}"><span>구매 결정</span></label>
                           					</td>
                           					<th scope="row"><span>MD 구매승인</span></th>
                           					<td>
                           						<input type="radio" class="radio" name="UP_ESM_PCH_MD_BUY_YN_${num}" id="UP_ESM_PCH_MD_BUY_YN_1_${num}" value="N" onclick="getdate('${num}',$(this).val())" <c:if test="${mdPchList.ESM_PCH_MD_BUY_YN eq 'N' }"> checked=true</c:if> /><label for="UP_ESM_PCH_MD_BUY_YN_1_${num}"><span>구매 미승인</span></label>&nbsp;&nbsp;
                           						<input type="radio" class="radio" name="UP_ESM_PCH_MD_BUY_YN_${num}" id="UP_ESM_PCH_MD_BUY_YN_2_${num}" value="Y" onclick="getdate('${num}',$(this).val())" <c:if test="${mdPchList.ESM_PCH_MD_BUY_YN eq 'Y' }"> checked=true</c:if> /><label for="UP_ESM_PCH_MD_BUY_YN_2_${num}"><span>구매 승인</span></label>
                           						<c:choose>
                           							<c:when test="${mdPchList.ESM_PCH_EPT_ST_DT ne null && mdPchList.ESM_PCH_EPT_ED_DT ne null }">
                           								<ui:formatDate value="${mdPchList.ESM_PCH_EPT_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${mdPchList.ESM_PCH_EPT_ED_DT }" pattern="yyyy.MM.dd"/>
                           							</c:when>
                           							<c:otherwise>
                           								<span id="getDate_${num}" style="display:none;">
	                            							<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                            							<input type="text" name="StartDate_${num}" id="StartDate_${num}" class="text s-datepicker" value="" data-target-end="#EndDate_${num}" readonly="readonly" /> ~
                											<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
		                            						<input type="text" name="EndDate_${num}" id="EndDate_${num}" class="text e-datepicker" value="" data-target-start="#StartDate_${num}" readonly="readonly" />
	                            						</span>
                           							</c:otherwise>
                           						</c:choose>
                           					</td>
                           					<td><a href="javascript:mdDiscountChange(${num},${mdPchList.ESM_PCH_IDX});" class="button button-c"><span>승인적용</span></a></td>
                           				</tr>
                           			</tbody>
                           		</table>
                           	
				                <c:set var="num" value="${num + 1 }" />
			                </c:forEach>
			        	</c:when>
			        </c:choose>
			        
			        <div class="push-guide instant"><!-- push-guide -->
	                    <i class="icon"><!-- icon --></i>
	                    <h3 class="title"><span>MD 견적 내기</span></h3>
	                </div><!-- // push-guide -->
	                
	                <c:if test="${estimateInfo.ESM_MST_PRD_CHANGE_YN eq 'Y' }">
						<div class="grid section-button-search"><!-- 검색 하단 버튼 -->
		                    <a href="#none" id="goProductDelete" class="button small"><span>선택삭제</span></a>
							<a href="#none" id="goProductAdd" class="button small" title="새 창 으로 열립니다."><span>상품검색</span></a>
		                </div><!-- // 검색 하단 버튼 -->
					</c:if>
					
					<table class="table-col table-b">
                        <colgroup>
                        	<col style="width: 5%;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: 15%;" />
	                        <col style="width: 15%;" />
	                        <col style="width: 15%;" />
                        </colgroup>
                        <thead>
                            <tr>   
                            	<th scope="col"><input type="checkbox" class="checkbox checkAll" /></th>
                            	<th scope="col">상품코드</th>
                                <th scope="col">상품명</th>
                                <th scope="col">옵션</th>
                                <th scope="col">수량</th>
                                <th scope="col">판매가</th>
                                <th scope="col">상품가격</th>
                                <th scope="col">MD견적가</th>
                            </tr>
                        </thead>
                        <tbody id="applyProductList">
                            <c:choose>
                                <c:when test="${not empty productList }">
                                	<c:set var="rownum" value="0" />
                                	<c:set var="PRD_MST_CD" value="" />
                                	<c:set var="ESM_PRD_UP_IDX" value="0" />
                                    <c:forEach var="row" items="${productList }" varStatus="i">
                                    	<c:choose>
                                    		<c:when test="${row.ESM_PRD_UP_IDX > 0}">
                                    			<c:set var="ESM_PRD_UP_IDX" value="${row.ESM_PRD_UP_IDX }" />
                                    		</c:when>
                                    		<c:otherwise>
                                    			<c:set var="ESM_PRD_UP_IDX" value="${row.ESM_PRD_IDX }" />
                                    		</c:otherwise>
                                    	</c:choose>
                                        <tr id="productNodata_<c:out value="${ESM_PRD_UP_IDX }"/>">
                                        	<c:choose>
                                        		<c:when test="${row.ESM_PRD_UP_CNT > 1 }">
                                        			<td rowspan=${row.ESM_PRD_UP_CNT}><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="<c:out value="${row.PRD_MST_CD }"/>"/></td>
                                        			<td rowspan=${row.ESM_PRD_UP_CNT}><a href="${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=${row.PRD_MST_CD }" target="_blank" title="새 창 으로 열립니다."><c:out value="${row.PRD_MST_CD }"/></a></td>
					                                <td rowspan=${row.ESM_PRD_UP_CNT}><c:out value="${row.PRD_MST_NM }"/></td>
					                                <input type="hidden" name="ESM_PRD_UP_IDX" id="ESM_PRD_UP_IDX" value="<c:out value="${ESM_PRD_UP_IDX }"/>" />
                                        		</c:when>
                                        		<c:otherwise>
                                        			<c:if test="${row.ESM_PRD_UP_IDX eq 0 }">
                                        				<td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="<c:out value="${row.PRD_MST_CD }"/>"/></td>
	                                        			<td><a href="${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=${row.PRD_MST_CD }" target="_blank" title="새 창 으로 열립니다."><c:out value="${row.PRD_MST_CD }"/></a></td>
						                                <td><c:out value="${row.PRD_MST_NM }"/></td>
						                                <input type="hidden" name="ESM_PRD_UP_IDX" id="ESM_PRD_UP_IDX" value="<c:out value="${ESM_PRD_UP_IDX }"/>" />
						                            </c:if>
                                        		</c:otherwise>
                                        	</c:choose>
			                                <td>
			                                	<c:if test="${rownum == 0 || PRD_MST_CD != row.PRD_MST_CD }">
	                                       			<input type="hidden" name="ESM_PRD_CD" id="ESM_PRD_CD" value="<c:out value="${row.PRD_MST_CD }"/>" />
	                                       		</c:if>
	                                       		
												<c:choose>
			                                		<c:when test="${row.PRD_OPT_NM eq null || row.PRD_OPT_NM eq '' }">
			                                			옵션없음.
			                                		</c:when>
			                                		<c:otherwise>
			                                			<c:out value="${row.PRD_OPT_NM }"/> : <c:out value="${row.OPT_DTL_NM }"/><br />
				                                		추가금액 : <fmt:formatNumber value="${row.OPT_DTL_ADD_PRC }" groupingUsed="true" />
			                                		</c:otherwise>
			                                	</c:choose>
			                                	<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="<c:out value="${row.OPT_DTL_IDX }"/>" />
												<input type="hidden" name="OPT_DTL_ADD_PRCs" id="OPT_DTL_ADD_PRCs" value="<c:out value="${row.OPT_DTL_ADD_PRC }"/>" />
												<input type="hidden" name="PRD_OPT_EST_YNs" id="PRD_OPT_EST_YNs" value="<c:out value="${row.PRD_OPT_EST_YN }"/>" />
												<input type="hidden" name="PRD_MST_PRC" id="PRD_MST_PRC" value="<c:out value="${row.PRD_MST_PRC }"/>" />
												<input type="hidden" name="OPT_EST_CNTs" id="OPT_EST_CNTs" value="<c:out value="${row.OPT_EST_CNT }"/>" />
												<input type="hidden" name="ADD_PRD_MST_CDs" id="ADD_PRD_MST_CDs" value="<c:out value="${row.PRD_MST_CD }"/>" />
			                                </td>
			                                	
			                                <td>
			                                	<input type="text" class="number text" name="EMS_PRD_CNTs" id="EMS_PRD_CNTs" value="<fmt:formatNumber value="${row.ESM_PRD_CNT }" groupingUsed="true" />" maxlength=9 />
			                                </td>
			                                <c:choose>
                                        		<c:when test="${row.ESM_PRD_UP_CNT > 1 }">
					                                <td rowspan=${row.ESM_PRD_UP_CNT}><fmt:formatNumber value="${row.PRD_MST_PRC }" groupingUsed="true" /></td>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<c:if test="${row.ESM_PRD_UP_IDX eq 0 }">
	                                        			<td><fmt:formatNumber value="${row.PRD_MST_PRC }" groupingUsed="true" /></td>
						                            </c:if>
                                        		</c:otherwise>
                                        	</c:choose>
			                                <td><span id="spanPrdMstPrc_${rownum }"><fmt:formatNumber value="${row.ESM_PRD_WSH_PRICE }" groupingUsed="true" /></span></td>
			                                <td>
			                                	<input type="text" class="text wshPrice" name="ESM_PRD_ESM_PRICE" id="ESM_PRD_ESM_PRICE_${i }" value="<fmt:formatNumber value="${row.ESM_PRD_ESM_PRICE ne '' && row.ESM_PRD_ESM_PRICE ne null ? row.ESM_PRD_ESM_PRICE : row.ESM_PRD_WSH_PRICE }" groupingUsed="true" />" />
			                                	<input type="hidden" name="ESM_PRD_WSH_PRICE" id="ESM_PRD_WSH_PRICE" value="<c:out value="${row.ESM_PRD_WSH_PRICE }" />" />
			                                </td>
			                            </tr>
			                            <c:set var="rownum" value="${rownum + 1 }" />
			                            <c:set var="PRD_MST_CD" value="${row.PRD_MST_CD }" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                        <tfoot>
                            <tr>
                            	<th colspan="6" scope="col" class="text-right pr20">합계</th>
                            	<td><fmt:formatNumber value="${estimateInfo.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" /></td>
                            	<td>
                            		<input type="text" class="text" name="ESM_MST_ESM_TOT_PRICE" id="ESM_MST_ESM_TOT_PRICE" value="<fmt:formatNumber value="${estimateInfo.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" />" disabled=true />
                            	</td>
                            </tr>
                            <tr>
                            	<th colspan="6" scope="col" class="text-right pr20">견적희망가격(할인율:<strong class="primary"><c:out value="${estimateInfo.ESM_MST_TOT_PRICE }" />%</strong>)</th>
                            	<td><fmt:formatNumber value="${estimateInfo.ESM_MST_WSH_TOT_PRICE }" groupingUsed="true" /></td>
                            	<td> </td>
                            </tr>
                            <tr>
                            	<th colspan="6" scope="col" class="text-right pr20">MD 견적합계(할인율: <strong id="mdDiscount" class="primary">0%</strong>)</th>
                            	<td> </td>
                            	<td>
                            		<input type="text" class="text" name="ESM_MST_WSH_TOT_PRICE" id="ESM_MST_WSH_TOT_PRICE" value="<fmt:formatNumber value="${estimateInfo.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" />" disabled=true  />
                            	</td>
                            </tr>
                        </<tfoot>
                    </table>
                    
                  	<table class="table-row table-a">
	         			<col style="width: 15%;" />
	         			<col style="width: 20%;" />
	         			<col style="width: 15%;" />
	         			<col style="width: auto;" />
               			<tbody>
               				<tr>
               					<th scope="row"><span>고객구매결정</span></th>
               					<td>
               						<input type="radio" class="radio" name="ESM_PCH_MEM_BUY_YN" id="ESM_PCH_MEM_BUY_YN1" value="N" checked=true /><label for="ESM_PCH_MEM_BUY_YN1"><span>구매 미결정</span></label>
               						<input type="radio" class="radio" name="ESM_PCH_MEM_BUY_YN" id="ESM_PCH_MEM_BUY_YN2" value="Y" /><label for="ESM_PCH_MEM_BUY_YN2"><span>구매 결정</span></label>
               					</td>
               					<th scope="row"><span>MD구매승인a</span></th>
               					<td>
               						<input type="radio" class="radio" name="ESM_PCH_MD_BUY_YN" id="ESM_PCH_MD_BUY_YN1" value="N" checked=true /><label for="ESM_PCH_MD_BUY_YN1"><span>구매 미승인</span></label>
               						<input type="radio" class="radio" name="ESM_PCH_MD_BUY_YN" id="ESM_PCH_MD_BUY_YN2" value="Y" /><label for="ESM_PCH_MD_BUY_YN2"><span>구매 승인</span></label>
               						<span id="getDate" style="display:none;">
                						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
               							<input type="text" name="StartDate" id="StartDate" class="text datepicker s-datepicker" value="" readonly="readonly" data-target-end="#EndDate"/> ~
                						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                						<input type="text" name="EndDate" id="EndDate" class="text datepicker e-datepicker" value="" readonly="readonly" data-target-start="#StartDate"/>
               						</span>
               					</td>
               				</tr>
               			</tbody>
               		</table>
                    
                    <div class="section-button"><!-- section-button -->
	                    <div class="wrap text-center">
	                    	<a href="#none" id="mdDiscountAction" class="button large"><span>MD견적하기</span></a>
	                    	<a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
	                    	<a href="#none" id="goList" class="button large"><span>목록</span></a>
	                    </div>
	                </div><!-- // section-button -->
	                
	                <div class="push-guide instant"><!-- push-guide -->
	                    <i class="icon"><!-- icon --></i>
	                    <h3 class="title"><span>댓글</span></h3>
	                </div><!-- // push-guide -->
	                
	                <table class="table-row table-b">
						<colgroup>
							<col style="width: 15%;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr>
								<th>댓글</th>
								<td class="left">
									<table class="table-row table-b" style="border-top:0px;">
										<colgroup>
											<col style="width: auto;" />
											<col style="width: 5%;" />											
										</colgroup>
										<thead>
											<tr>
												<td class="left">
													<textarea name="ESM_REP_CTS" id="ESM_REP_CTS" style="height: 100px;width:100%;" maxlength=2000></textarea>
												</td>
												<td>
													<input type="button" value="댓글저장" style="height:110px;width:100px;" id="goRepRegist" />
												</td>
											</tr>
										</thead>
									</table>
									<table class="table-row table-b">
										<colgroup>
											<col style="width: auto;" />
										</colgroup>
										<thead id="applyEsmRepList">
											<tr id="esmRepNodata">
												<td>등록된 댓글이 없습니다.</td>
											</tr>
										</thead>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
	            </form>  

            </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
	<td>
		<input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/>
		{{if OPT_PRD_MST_CNT == 0}}
		<input type="hidden" name="ESM_PRD_CD" id="ESM_PRD_CD" value="\${PRD_MST_CD}" />
		{{/if}}
		<input type="hidden" name="PRD_MST_PRC" id="PRD_MST_PRC" value="\${PRD_MST_PRC3}" />
		<input type="hidden" name="OPT_EST_CNTs" id="OPT_EST_CNTs" value="\${OPT_EST_CNT}" />
	</td>
	<td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" name="APPLY_IDXs" value="\${PRD_MST_CD}"/></td>
	<td>
		\${PRD_MST_NM}
	</td>
	<td colspan=5>
		<table class="table-row table-a">
			<colgroup>
			<col style="width: auto%;" />
			<col style="width: auto%;" />
			<col style="width: auto%;" />
			<col style="width: auto%;" />
			<col style="width: auto%;" />
			</colgroup>
			<tbody>
				{{html OPT_LOC_TXT}}
			</tbody>
		</table>
	</td>
</tr>
</script>
<script id="esmRepListTemplate" type="text/x-jquery-tmpl">
<tr>
	<th class="left" style="padding-left:10px;">\${ESM_REP_REG_NM}(\${ESM_REP_REG_ID}) / \${ESM_REP_REG_DT}<br />\${ESM_REP_CTS}</th>
</tr>
</script>

<script>
$(function(){
	//체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");
    fnDateSet('EndDate', 'StartDate', 0, 0, 3, 0, 0, 0,  '-');
	
    $(document).on("focusout",".wshPrice",function(){
		var totalPrice = "<c:out value="${estimateInfo.ESM_MST_ESM_TOT_PRICE }" />";
		var mdPrice = 0;
		var mdDiscount = 0;
		
		$("input[name=ESM_PRD_ESM_PRICE]").each(function(){
			if(getInt($(this).val()) != "" && getInt($(this).val()) > 0){
				mdPrice = parseInt(mdPrice) + parseInt(getInt($(this).val()));
			}
		});

		$("#ESM_MST_ESM_TOT_PRICE").val(setComma(parseInt(mdPrice)));
		$("#ESM_MST_WSH_TOT_PRICE").val(setComma(parseInt(mdPrice)));
		mdDiscount = ((parseInt(totalPrice)-parseInt(mdPrice)) / parseInt(totalPrice)) * 100;
		$("#mdDiscount").html(Math.round(mdDiscount.toFixed(3)*100)/100 + "% / " + setComma(mdPrice - totalPrice) + "원");
	});
	

	// 상품검색 
    $(document).on("click", "#goProductAdd", function () 
    {	
   		popup('',"1100","900","no","_ProductPopup");
   		$("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductEsmPopup.do", "target":"popup_ProductPopup", "method":"post"}).submit();

    });	
	
  	//상품 중복체크
    fnDuplicationChk = function( selectObj , selectObjOpt ){
		var bReturn = true;
		var optChkLen = 0;
    	var $obj = $("#applyProductList input[name='PRD_MST_CDs']");
    	var $objOpt = $("#applyProductList input[name='OPT_DTL_IDXs']");
    	
    	$.each($obj, function(){
    		if( selectObj == $(this).val() ){
    			if(selectObjOpt.indexOf(",") > 0){
    				var aryObjOpt = selectObjOpt.split(",");
    				for(i = 0; i < aryObjOpt.length; i++){
    					if(aryObjOpt[i] != ""){
    						$.each($objOpt, function(){
    							if( aryObjOpt[i] == $(this).val() ){
            		    			bReturn = false;
            		    			return false;
            		    		}
            		    	});
    					}
    				}
    			}else{
    				if(selectObjOpt != ""){
        	    		$.each($objOpt, function(){
        	    			if( selectObjOpt == $(this).val() ){
        		    			bReturn = false;
        		    			return false;
        		    		}
        		    	});
        	    	}
    			}
    			
    		}
    	});
    	return bReturn;
    };
	
  	//상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
    	var bCheck = true;
    	//상품중복체크
    	$.each( params, function( index, el ){
    		if( !fnDuplicationChk( el.PRD_MST_CD , el.OPT_DTL_IDX)){
    			alert("["+el.PRD_MST_CD+"] 상품의 ["+el.PRD_OPT_NM+" : "+el.OPT_DTL_NM+"] 옵션이 있습니다.");
				bCheck = false;
    			return false;
    		}
    	});
    	if( bCheck ){
        	//기본TR삭제
        	$("#productNodata").remove();
        	//배열재정의
        	var arrayObj = new Array();
    		var obj;
    		var num = 0;
    		var totPrice = 0;
    		var trLen = $("#applyProductList").find("tr").not($("table .table-row table-a").find("tr")).length;
    		
    		$.each(params, function(index,item){
        		
    			obj = new Object();
        		obj.PRD_MST_CD 				= item.PRD_MST_CD;
        		obj.PRD_MST_NM 			= item.PRD_MST_NM;
        		obj.PRD_CTG_PATH 			= item.PRD_CTG_PATH;
        		obj.CMN_BRD_NM 				= item.CMN_BRD_NM;
        		obj.PRD_MST_PRC 	= setComma(item.PRD_MST_PRC);
        		obj.PRD_MST_SCH_PRC      = setComma(item.PRD_MST_SCH_PRC);
        		obj.PRD_MST_PRC2 	= item.PRD_MST_PRC;
        		obj.PRD_MST_SCH_PRC2      = item.PRD_MST_SCH_PRC;
        		obj.PRD_MST_SEL_STATE 		= item.PRD_MST_SEL_STATE;
        		obj.TRLEN 					= trLen;
        		if(item.PRD_MST_CNL_PC_YN == "Y" && item.PRD_MST_CNL_MB_YN == "Y")
        		{
        			obj.PRD_MST_CHANNEL_TYPE ="전체";
        		}
        		else if(item.PRD_MST_CNL_PC_YN == "Y")
        		{
        			obj.PRD_MST_CHANNEL_TYPE="PC";	
        		}
        		else if(item.PRD_MST_CNL_MB_YN == "Y")
        		{
        			obj.PRD_MST_CHANNEL_TYPE="MOBILE";	
        		}
        		
				obj.FRONT_URL = '<c:out value="${frontDomain}" />';
        		
        		obj.serverDomain 			= '<c:out value="${serverDomain}" />';
        		if ( item.PRD_MST_SEL_STATE_CODE == '<c:out value="${Code.PRODUCT_SELL_STATE_ING}" />' )
        		{
        		    obj.PRD_MST_SEL_STATE_CLASS = "b";
        		}
        		else
        		{
        		    obj.PRD_MST_SEL_STATE_CLASS = "a";
        		}
        		obj.imgpath 		        = item.PRD_IMG_THUM_URL;
				
				if($("#ESM_MST_ESM_TOT_PRICE").val() == ""){
					$("#ESM_MST_ESM_TOT_PRICE").val(obj.PRD_MST_PRC);
					$("#ESM_MST_WSH_TOT_PRICE").val(obj.PRD_MST_PRC);
				}else{
					totPrice = parseInt(removeComma($("#ESM_MST_ESM_TOT_PRICE").val())) + parseInt(item.PRD_MST_PRC);
					$("#ESM_MST_ESM_TOT_PRICE").val(setComma(totPrice));
					$("#ESM_MST_WSH_TOT_PRICE").val(setComma(totPrice));
				}
				
				//옵션추가
				obj.OPT_DTL_IDX 				= item.OPT_DTL_IDX.split(",");
				obj.EMS_PRD_CNT 				= item.EMS_PRD_CNT;
				var totalPrice = 0; //총 가격
				var opt_loc_txt_result = "";
				var optSteveHtml = "";
				var optTotalPrice = 0;
				var optEstCnt = 0;
				var optPrdMstCdCnt = 0;
				
				if(item.OPT_DTL_IDX.indexOf(",") > 0){//다중
					var OPT_DTL_IDXs = item.OPT_DTL_IDX.split(",");
					var OPT_DTL_ADD_PRCs = item.OPT_DTL_ADD_PRC.split(",");
					var EMS_PRD_CNTs = item.EMS_PRD_CNT.split(",");
					var PRD_OPT_NMs = item.PRD_OPT_NM.split(",");
					var OPT_DTL_NMs = item.OPT_DTL_NM.split(",");
					var PRD_OPT_EST_YNs = item.PRD_OPT_EST_YN.split(",");
					var OPT_DTL_STK_CNTs = item.OPT_DTL_STK_CNT.split(",");
					for(i = 0; i < OPT_DTL_IDXs.length; i++){
						if(OPT_DTL_IDXs[i] != ""){
							optSteveHtml += "<tr>";
							optTotalPrice = 0;

							if(PRD_OPT_EST_YNs[i] == "Y"){
								optTotalPrice = parseInt(item.PRD_MST_PRC);
								opt_loc_txt_result = "[필수]"
								optEstCnt ++;
							}else{
								opt_loc_txt_result = "[선택]"
							}
							opt_loc_txt_result += PRD_OPT_NMs[i] +" : "+OPT_DTL_NMs[i] ;
							
							if(OPT_DTL_ADD_PRCs[i] != ""){
								opt_loc_txt_result += "<br/>추가가격 : " + setComma(parseInt(OPT_DTL_ADD_PRCs[i]));
								if(OPT_DTL_ADD_PRCs[i] < 0){
									optTotalPrice = optTotalPrice - parseInt(Math.abs(OPT_DTL_ADD_PRCs[i]));
								}else{
									optTotalPrice = optTotalPrice + parseInt(OPT_DTL_ADD_PRCs[i]);
								}
								optSteveHtml += "<td align=center>"+opt_loc_txt_result+"</td>";
							}
							optTotalPrice = optTotalPrice * parseInt(EMS_PRD_CNTs[i]);
							optSteveHtml += "<td><input type=\"text\" class=\"number text\" name=\"EMS_PRD_CNTs\" id=\"EMS_PRD_CNTs\" value="+EMS_PRD_CNTs[i]+" maxlength=9 />";
							optSteveHtml += "<input type=\"hidden\" name=\"OPT_DTL_IDXs\" id=\"OPT_DTL_IDXs\" value="+OPT_DTL_IDXs[i]+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"OPT_DTL_STK_CNTs\"id=\"OPT_DTL_STK_CNTs\" value="+OPT_DTL_STK_CNTs[i]+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"PRD_OPT_EST_YNs\" id=\"PRD_OPT_EST_YNs\" value="+PRD_OPT_EST_YNs[i]+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"OPT_DTL_ADD_PRCs\" id=\"OPT_DTL_ADD_PRCs\" value="+OPT_DTL_ADD_PRCs[i]+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"ADD_PRD_MST_CDs\" id=\"ADD_PRD_MST_CDs\" value="+obj.PRD_MST_CD+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"ESM_PRD_WSH_PRICE\" id=\"ESM_PRD_WSH_PRICE\" value="+optTotalPrice+" />";
							optSteveHtml += "</td>";
							if(i == 0){
								optSteveHtml += "<td rowspan="+OPT_DTL_IDXs.length+">"+setComma(item.PRD_MST_PRC)+"</td>";
							}
							optSteveHtml += "<td><span id=\"spanPrdMstPrc_"+(obj.TRLEN + i)+"\">"+setComma(optTotalPrice)+"</span></td>";
							optSteveHtml += "<td><input type=\"text\" class=\"text wshPrice\" name=\"ESM_PRD_ESM_PRICE\" id=\"ESM_PRD_ESM_PRICE\" value="+setComma(optTotalPrice)+" /></td>";
						}
							
							optSteveHtml += "</tr>";
							opt_loc_txt_result = "";
							totalPrice = totalPrice + optTotalPrice;
					}
				}else{
					if(item.OPT_DTL_IDX != ""){
						if(item.PRD_OPT_EST_YN == "Y"){
							optTotalPrice = parseInt(item.PRD_MST_PRC);
							opt_loc_txt_result = "<td align=center>[필수]"
							optEstCnt ++;
						}else{
							opt_loc_txt_result = "<td align=center>[선택]"
						}
						opt_loc_txt_result += item.PRD_OPT_NM +" : "+item.OPT_DTL_NM ;
						totalPrice = parseInt(item.PRD_MST_PRC);
						if(item.OPT_DTL_ADD_PRC != ""){
							opt_loc_txt_result +="<br/>추가가격 : " + setComma(parseInt(item.OPT_DTL_ADD_PRC));
							obj.OPT_DTL_ADD_PRC = item.OPT_DTL_ADD_PRC;
							if(item.OPT_DTL_ADD_PRC < 0){
								totalPrice = totalPrice - parseInt(Math.abs(item.OPT_DTL_ADD_PRC));
							}else{
								totalPrice = totalPrice + parseInt(item.OPT_DTL_ADD_PRC);
							}
						}
						opt_loc_txt_result += "</td>";
						totalPrice = totalPrice * parseInt(item.EMS_PRD_CNT);
						opt_loc_txt_result += "<td><input type=\"text\" class=\"number text\" name=\"EMS_PRD_CNTs\" id=\"EMS_PRD_CNTs\" value="+item.EMS_PRD_CNT+" maxlength=9 />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_IDXs\" id=\"OPT_DTL_IDXs\" value="+item.OPT_DTL_IDX+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_STK_CNTs\" id=\"OPT_DTL_STK_CNTs\" value="+item.OPT_DTL_STK_CNT+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"PRD_OPT_EST_YNs\" id=\"PRD_OPT_EST_YNs\" value="+item.PRD_OPT_EST_YN+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_ADD_PRCs\" id=\"OPT_DTL_ADD_PRCs\" value="+item.OPT_DTL_ADD_PRC+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"ADD_PRD_MST_CDs\" id=\"ADD_PRD_MST_CDs\" value="+obj.PRD_MST_CD+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"ESM_PRD_WSH_PRICE\" id=\"ESM_PRD_WSH_PRICE\" value="+totalPrice+" />";
						opt_loc_txt_result += "</td>";
						opt_loc_txt_result += "<td>"+setComma(item.PRD_MST_PRC)+"</td>";
						opt_loc_txt_result += "<td><span id=\"spanPrdMstPrc_"+obj.TRLEN+"\">"+obj.PRD_MST_PRC+"</span></td>";
						opt_loc_txt_result += "<td><input type=\"text\" class=\"text wshPrice\" name=\"ESM_PRD_ESM_PRICE\" id=\"ESM_PRD_ESM_PRICE\" value="+setComma(totalPrice)+" /></td>";
					}
					else{
						opt_loc_txt_result = "<td align=center>옵션없음.</td>";
						obj.OPT_DTL_ADD_PRC = "";
						totalPrice = parseInt(item.PRD_MST_PRC);
						opt_loc_txt_result += "<td><input type=\"text\" class=\"number text\" name=\"EMS_PRD_CNTs\" id=\"EMS_PRD_CNTs\" value=1 maxlength=9 />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"PRD_OPT_EST_YNs\" id=\"PRD_OPT_EST_YNs\" value=\"N\" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_IDXs\" id=\"OPT_DTL_IDXs\" value=\"0\" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_ADD_PRCs\" id=\"OPT_DTL_ADD_PRCs\" value=\"0\" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"ADD_PRD_MST_CDs\" id=\"ADD_PRD_MST_CDs\" value="+obj.PRD_MST_CD+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"ESM_PRD_WSH_PRICE\" id=\"ESM_PRD_WSH_PRICE\" value="+totalPrice+" />";
						opt_loc_txt_result += "</td>";
						opt_loc_txt_result += "<td>"+setComma(item.PRD_MST_PRC)+"</td>";
						opt_loc_txt_result += "<td><span id=\"spanPrdMstPrc_"+obj.TRLEN+"\">"+obj.PRD_MST_PRC+"</span></td>";
						opt_loc_txt_result += "<td><input type=\"text\" class=\"text wshPrice\" name=\"ESM_PRD_ESM_PRICE\" id=\"ESM_PRD_ESM_PRICE\" value="+setComma(totalPrice)+" /></td>";
					}
					optSteveHtml += "<tr>";
					optSteveHtml += opt_loc_txt_result;
					optSteveHtml += "</tr>";
					opt_loc_txt_result = "";
				}
				
				$("input[name=ESM_PRD_CD]").each(function(){
					if($(this).val() == obj.PRD_MST_CD){
						optPrdMstCdCnt++;
					}
				});

				obj.OPT_LOC_TXT = optSteveHtml;
				obj.OPT_EST_CNT = optEstCnt;
				obj.OPT_PRD_MST_CNT = optPrdMstCdCnt;
				
				obj.PRD_MST_PRC 	= setComma(totalPrice);
				obj.PRD_MST_PRC2 	= totalPrice;
				obj.PRD_MST_SCH_PRC2      = totalPrice;
				obj.PRD_MST_PRC3      = parseInt(item.PRD_MST_PRC);
				obj.PRD_MST_PRC4      = setComma(item.PRD_MST_PRC);

        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        		trLen = trLen + 1
        	});
    		$( "#productTemplate" ).tmpl( arrayObj ).appendTo( "#applyProductList" );
    		return true;
    	}
    };

    // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", "#goProductDelete", function () 
    {
    	if( $(".checkRow:checked").length == 0 ){
    		alert("삭제할 상품을 선택하여 주십시오.");
    		return;
    	}
        $("#applyProductList").children("tr").each(function()
        {
        	if ( $(this).find("input[name='PRD_MST_CDs']").is(":checked") )
        	{
        		var esmPrdUpIDx = $(this).find("input[name=ESM_PRD_UP_IDX]").val();
        		
        		if(esmPrdUpIDx != undefined){
	        		$("#applyProductList").children("tr").each(function(){
	        			if($(this).attr("id") == "productNodata_"+esmPrdUpIDx){
	        				$(this).remove();	
	        			}
	        		});
        		}else{
        			$(this).remove();
        		}
        	}
        });
        
      	//상품가격 재 계산
        var totPrice = 0;
        $("input[name=ESM_PRD_ESM_PRICE]").each(function(){
        	totPrice = parseInt(totPrice) + parseInt(removeComma($(this).val()));
        });
        
        $("#ESM_MST_ESM_TOT_PRICE").val(setComma(totPrice));
		$("#ESM_MST_WSH_TOT_PRICE").val(setComma(totPrice));
        
        if ( $("#applyProductList").children("tr").length == 0 )
        {
        	$("#applyProductList").append('<tr id="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $(".checkAll").prop("checked", false);
        
    });
    
    $(document).on("click", "input[name=ESM_PCH_MD_BUY_YN]", function (){ 
    	if($(this).val() == "Y"){
    		$("#getDate").show();
    	}
    	else{
    		$("#getDate").hide();
    	}
    });
    //MD견적 등록
    $(document).on("click", "#mdDiscountAction", function (){ 
    	var $frm = $("#frm"); 
    	
    	var setMdPrice = true;
    	var setMdFocus = "";
    	
    	$("input[name=ESM_PRD_ESM_PRICE]").each(function(){
			if($(this).val() == "" || getInt($(this).val()) < 0){
				setMdPrice = false;
				setMdFocus = $(this).focus();
			}
		});
    	
    	if(setMdPrice == false){
    		alert("MD견적가중 잘못 된 견적가가 있습니다.\n다시 확인해주세요.");
    		setMdFocus;
    		return;
    	}
    	
    	if($(".checkRow").length <= 0)
        {
             alert("[적용상품]상품을 추가해 주십시오.");
             $("#goProductAdd").focus();
             productCheck = false;
             return false;
        }
    	
    	
        if (confirm( "MD견적을 등록 하시겠습니까?")) 
        {
        	//체크박스 전체 선택
            $(".checkAll").prop("checked", true);
            $.checkBoxAllSelect("checkAll", "checkRow");
            
            $("input[name=ESM_PRD_ESM_PRICE]").each(function(){
            	$(this).val(getInt($(this).val()));
            });
            $("#ESM_MST_ESM_TOT_PRICE").val(removeComma($("#ESM_MST_ESM_TOT_PRICE").val()));
    		$("#ESM_MST_WSH_TOT_PRICE").val(removeComma($("#ESM_MST_WSH_TOT_PRICE").val()));
    		$("#ESM_MST_ESM_TOT_PRICE").attr("disabled",false);
    		$("#ESM_MST_WSH_TOT_PRICE").attr("disabled",false);
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/estimateManagementPurchaseRegist.do", "target":"_self", "method":"post"}).submit();
        }
    	
    });
    
    getdate = function(num,obj){
    	var showId = eval($("#getDate_"+num));
		var startDate = "StartDate_"+num;
		var endDate = "EndDate_"+num;
    	
    	if(obj == "Y"){
    		showId.show();
    	}else{
    		showId.hide();
    	}
    	fnDateSet(endDate, startDate, 0, 0, 3, 0, 0, 0,  '-');
    };
    
    //MD구매승인 수정
    mdDiscountChange = function(num,esmPchIdx){
    	if(num != "" && esmPchIdx != ""){
    		var $frm = $("#frm"); 
    		var eptStDt = eval($("#StartDate_"+num));
    		var eptDtDt = eval($("#EndDate_"+num));
    		var memByYn = eval($(':radio[name="UP_ESM_PCH_MEM_BUY_YN_'+num+'"]:checked'));
    		var mdByYn = eval($(':radio[name="UP_ESM_PCH_MD_BUY_YN_'+num+'"]:checked'));
    		
    		$("#UP_EMS_PCH_IDX").val(esmPchIdx);
    		$("#UP_ESM_PCH_EPT_ST_DT").val(eptStDt.val());
    		$("#UP_ESM_PCH_EPT_ED_DT").val(eptDtDt.val());
    		$("#UP_ESM_PCH_MEM_BUY_YN").val(memByYn.val());
    		$("#UP_ESM_PCH_MD_BUY_YN").val(mdByYn.val());
    		
    		var optResult = false;
        	var optCntFocus = "";
        	
        	$("#EMS_PRD_CNT").each(function(idx){
        		alert('a');
        		if($(this).val() < 1){
        			optResult = true;
        			optCntFocus = $("#EMS_PRD_CNT").eq(idx);
        			return false;
        		}
        	});
        	
        	if(optResult){
        		alert("옵션수량이 잘못 되었습니다.");
        		optCntFocus.focus();
        		return;
        	}
    		
    		if (confirm( "해당 견적에 대해서 승인을 수정하시겠습니까?")) 
            {
            	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/estimateManagementPurchaseModify.do", "target":"_self", "method":"post"}).submit();
            }
    		
    	}else{
    		alert("승인적용에 필요한 값이 누락 되었습니다\n다시 시도해주세요.");
    		return;
    	}
    }
    
  	//MD견적 사용여부 수정
    $(document).on("click", "#goRegist", function (){ 
    	var $frm = $("#frm"); 
    	
        if (confirm( "MD견적 사용여부를 수정하시겠습니까?")) 
        {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/estimateManagementModify.do", "target":"_self", "method":"post"}).submit();
        }
    	
    });
  	
 	// 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
      	var $frm = $("#searchForm"); 
      	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/estimateManagementList.do", "target":"_self", "method":"post"}).submit();
    });    
  	
 	// 댓글 저장 이벤트
    $(document).on("click", "#goRepRegist", function () {
    	if($("#ESM_REP_CTS").val() == ""){
    		alert("댓글 내용을 입력해 주세요.");
    		$("#ESM_REP_CTS").focus();
    		return;
    	}
    	
    	$.ajax({
            type : "POST",
            async:true,
            dataType :"json",
            url : '<c:out value="${serverDomain}"/>/am/product/estimateManagementRepInsertAjax.do',
            data : {
                'ESM_REP_CTS'       : $("#ESM_REP_CTS").val().replace(/\n/g, '<br />')
                ,'ESM_MST_IDX'       : $("#ESM_MST_IDX").val()
            },        
            success : function (data){
            	if(data.result == "0000"){
            		alert("댓글이 등록 되었습니다.");
            		$("#ESM_REP_CTS").val('');
            		getRepList();
            		return;
            	}else{
            		alert("댓글 등록에 실패하였습니다\n다시 시도해주세요.");
            		return;
            	}
            },
            error : function(err){alert('error : ' + err.status ); }
        });
    });
 	
 	 //수량 변경 시 금액 변경
    $(document).on("focusout","#EMS_PRD_CNTs",function(idx){
    	var ems_prd_cnt = $(this).val();
 		var idx = $(this).parent("td").parent("tr").index();
 		var totalPrice = 0;
 		if(ems_prd_cnt < 1){
 			alert("수량이 잘못 입력 되었습니다.");
 			return;
 		}else{
 			$("input[name=EMS_PRD_CNTs]").each(function(idx2){
 				var prdMstPrc = 0;
 	 			var esmPrdCnt = 0;
 	 			var prdOptEstYn = "";
 	 			var addPrdMstCd = "";	
 				var optDtlAddPrc = 0;
 				
 	 			esmPrdCnt = $(this).val();
 				$this = $(this).parent("td").parent("tr").parent("tbody").parent("table").parent("td").parent("tr");
 				$thisTrLen = $(this).parent("td").parent("tr").parent("tbody").find("tr").length;
 				index = $this.index();

 				prdMstPrc = $this.find("input[name=PRD_MST_PRC]").val();
 				prdMstCd = $this.find("input[name=PRD_MST_CDs]").val();
 				prdOptEstYn = $("input[name=PRD_OPT_EST_YNs]").eq(idx2).val();
 				addPrdMstCd = $("input[name=ADD_PRD_MST_CDs]").eq(idx2).val();
 				
 				if($thisTrLen == 1){
 	 				totalPrice = 0;
 	 			}
 				
 				if($("input[name=OPT_DTL_ADD_PRCs]").eq(idx2).val() != 0){//옵견 추가가격
 					optDtlAddPrc = $("input[name=OPT_DTL_ADD_PRCs]").eq(idx2).val();
 				}

 				//금액 계산
 				if(prdOptEstYn == "Y"){
 					sumTotalPrice = (parseInt(prdMstPrc) + parseInt(optDtlAddPrc)) * parseInt(esmPrdCnt);
 				}else{
 					if($("input[name=OPT_DTL_IDXs]").eq(idx2).val() != 0){//옵션이 있다면
 						sumTotalPrice = parseInt(optDtlAddPrc) * parseInt(esmPrdCnt);
 	 				}else{
 	 					sumTotalPrice = parseInt(prdMstPrc) * parseInt(esmPrdCnt);
 	 				}
 				}

 				if(addPrdMstCd == prdMstCd){
 					totalPrice = totalPrice + sumTotalPrice;
 				}else{
 					totalPrice = sumTotalPrice;
 				}
 				
 				$("#spanPrdMstPrc_"+idx2).html(setComma(totalPrice));
 				$("input[name=ESM_PRD_ESM_PRICE]").eq(idx2).val(setComma(sumTotalPrice));
 	 			$("input[name=ESM_PRD_WSH_PRICE]").eq(idx2).val(sumTotalPrice);
 				
 	 			if($thisTrLen == 1){
 	 				totalPrice = 0;
 	 			}
 			});
 			$(".wshPrice").trigger('focusout');
 		}
 	});
 	
    getRepList();
});

getRepList = function(){
	
	$.ajax({
        type : "POST",
        async:true,
        dataType :"json",
        url : '<c:out value="${serverDomain}"/>/am/product/estimateManagementRepListAjax.do',
        data : {
            'ESM_MST_IDX'       : $("#ESM_MST_IDX").val()
        },        
        success : function (data){
        	if(data.esmRepList != null && data.esmRepList != "")
			{
				var arrayObj = new Array();
				
				var esmHthml = "";
				
				
				$.each(data.esmRepList, function(index,item)
				{
					esmHthml = esmHthml + "<tr>";
					esmHthml = esmHthml + "<th class=\"left\" style=\"padding-left:10px;\">"+item.ESM_REP_REG_NM+"("+item.ESM_REP_REG_ID+") / "+getDateView(item.ESM_REP_REG_DT,"-") + "<br />" + item.ESM_REP_CTS + "</th>";
					esmHthml = esmHthml + "</tr>";
				});

				$("#applyEsmRepList").find("tr").remove();
				$("#applyEsmRepList").append(esmHthml);
			}
        },
        error : function(err){alert('error : ' + err.status ); }
    });
}
//-->
</script>

</body>
</html>
