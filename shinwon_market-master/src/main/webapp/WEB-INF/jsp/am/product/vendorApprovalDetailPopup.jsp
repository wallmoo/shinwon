<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
<!-- 	    	<h2 class="title"><span>상품 상세보기</span></h2> -->
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>기본정보</span></h3>
            </div><!-- // push-guide -->
            
	        <table cellspacing="0" class="table-col table-b"><!-- table -->
	            <colgroup>
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <tbody>
					<tr>
						<th><span>온라인상품코드 </span></th>
						<td colspan="3"><c:out value="${productInfo.PRD_MST_CD }" /></td>
					</tr>
					<tr>
						<th><span>상품명 </span></th>
						<td><c:out value="${productInfo.PRD_MST_NM }" /></td>
						<th><span>상품명(서브)</span></th>
						<td><c:out value="${productInfo.PRD_MST_NM_SUB }" /></td>
					</tr>
					<tr>
						<th><span>배송비 </span></th>
						<td><fmt:formatNumber value="${productInfo.PRD_MST_DLV_FEE }" groupingUsed="true" /> 원</td>
						<th><span>담당MD </span></th>
						<td><c:out value="${productInfo.PRD_MST_MD_ID }" /></td>
					</tr>
					<tr>
						<th>비교검색여부/모델명</th>
						<td>
							<c:out value="${productInfo.PRD_MST_CPS_YN == 'Y' ? 'YES' : 'NO' }" />
							<c:if test="${productInfo.PRD_MST_CPS_YN eq 'Y' }">
								 / <c:out value="${productInfo.PRD_MST_CPS_MDL }" />
							</c:if>
						</td>
						<th><span>쿠폰적용여부 </span></th>
						<td><c:out value="${productInfo.PRD_MST_CPN_YN == 'Y' ? 'YES' : 'NO' }" /></select>
						</td>
					</tr>
					<tr>
						<th><span>판매가능수량 </span></th>
						<td><fmt:formatNumber value="${productInfo.PRD_MST_SEL_CNT }" groupingUsed="true" /> 개</td>
						<th><span>즉시쿠폰 </span></th>
						<td>
							<span style="padding-right:40px;">PC</span>
							<c:out value="${productInfo.PRD_MST_PC_CPN_UNT == 'R' ? '정율(%)' : '정액(원)' }" />
							<c:if test="${productInfo.PRD_MST_PC_CPN_PRC ne '' && productInfo.PRD_MST_PC_CPN_PRC ne null}">
								 <c:out value="${productInfo.PRD_MST_PC_CPN_PRC }" /> <c:out value="${productInfo.PRD_MST_PC_CPN_UNT == 'R' ? '%' : '원' }" />
							</c:if>
							<br />
							<span style="padding-right:10px;">MOBILE</span>
							<c:out value="${productInfo.PRD_MST_MB_CPN_UNT == 'R' ? '정율(%)' : '정액(원)' }" />
							<c:if test="${productInfo.PRD_MST_MB_CPN_PRC ne '' && productInfo.PRD_MST_MB_CPN_PRC ne null}">
								 <c:out value="${productInfo.PRD_MST_MB_CPN_PRC }" /> <c:out value="${productInfo.PRD_MST_MB_CPN_UNT == 'R' ? '%' : '원' }" />
							</c:if>
						</td>
					</tr>
					<tr>
						<th><span>검색노출여부 </span></th>
						<td><c:out value="${productInfo.PRD_MST_SRC_YN == 'Y' ? 'YES' : 'NO' }" /></td>
						<th>배송지정일 가능여부</th>
						<td>
							<c:out value="${productInfo.PRD_MST_DLV_DSN_YN == 'Y' ? 'YES' : 'NO' }" />
							<c:if test="${productInfo.PRD_MST_DLV_DSN_YN eq 'Y' }">
								 <c:out value="${productInfo.PRD_MST_DLV_DT}" /> 일
							</c:if>
						</td>
					</tr>
					<tr>
						<th>판촉쿠폰발행여부</th>
						<td>
							<c:choose>
								<c:when test="${productInfo.PRD_CPN_PC_DST_PRICE > 0 || productInfo.PRD_CPN_ML_DST_PRICE > 0 || productInfo.PRD_BRD_PC_CPN_CNT > 0 || productInfo.PRD_BRD_ML_CPN_CNT > 0}">
									YES
								</c:when>
								<c:otherwise>
									NO
								</c:otherwise>
							</c:choose>
						</td>
						<th>설치/사용 가이드</th>
						<td>
							<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
								<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
									<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
									<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
									
									<i class="icon-file"></i>
									<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
										<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
									</a>
									<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="multiFile1" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
									<label for="CMM_FLE_IDX_1">삭제</label>
								</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><c:out value="${productInfo.PRD_MST_REG_NM}" />(<c:out value="${productInfo.PRD_MST_REG_ID}" />)/<ui:formatDate value="${productInfo.PRD_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
						<th>수정일</th>
						<td>
							<c:if test="${not empty productInfo.PRD_MST_UPD_NM }">
								<c:out value="${productInfo.PRD_MST_UPD_NM}" />(<c:out value="${productInfo.PRD_MST_UPD_ID}" />)/<ui:formatDate value="${productInfo.PRD_MST_UPD_DT }" pattern="yyyy.MM.dd"/>
							</c:if>
						</td>
					</tr>  
                </tbody>
	        </table><!-- // table -->
	        
	        <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>상품가격</span></h3>
            </div><!-- // push-guide -->
            
	        <table cellspacing="0" class="table-col table-b"><!-- table -->
	            <colgroup>
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <tbody>
					<tr>
						<th><span>상품가격 </span></th>
						<td><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /> 원</td>
						<th><span>기업회원(1등급) </span></th>
						<td><fmt:formatNumber value="${productInfo.PRD_MST_CPR_PRC1 }" groupingUsed="true" /> 원</td>
					</tr>
					<tr>
						<th><span>검색가 </span></th>
						<td><fmt:formatNumber value="${productInfo.PRD_MST_SCH_PRC }" groupingUsed="true" /> 원</td>
						<th><span>기업회원(2등급) </span></th>
						<td><fmt:formatNumber value="${productInfo.PRD_MST_CPR_PRC2 }" groupingUsed="true" /> 원</td>
					</tr>
					<tr>
						<th><span>패키지 할인가 </span></th>
						<td colspan=3><fmt:formatNumber value="${productInfo.PRD_MST_PKG_PRC }" groupingUsed="true" /> 원</td>						
					</tr>
                </tbody>
	        </table><!-- // table -->
	        
	        <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>전시정보</span></h3>
            </div><!-- // push-guide -->
            
	        <table cellspacing="0" class="table-col table-b"><!-- table -->
	            <colgroup>
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <tbody>
					<tr>
						<th><span>쇼핑채널 </span></th>
						<td>
							<c:out value="${productInfo.PRD_MST_CNL_PC_YN == 'Y' ? 'PC' : '' }" />&nbsp;
							<c:out value="${productInfo.PRD_MST_CNL_MB_YN == 'Y' ? 'MOBILE' : '' }" />
						</td>
						<th><span>판매상태 </span></th>
						<td><c:out value="${productInfo.PRD_MST_SEL_STATE_NM}" /></td>
					</tr>
					<tr>
						<th><span>진열상태</span></th>
						<td><c:out value="${productInfo.PRD_MST_DPL_STATE == 'Y' ? 'YES' : 'NO' }" /></td>
						<th><span>승인상태</span></th>
						<td><c:out value="${productInfo.PRD_MST_APV_STATE_NM}" /></td>
					</tr>
					<tr>
						<th><span>품목카테고리</span></th>
						<td colspan="3"><c:out value="${productInfo.ERP_MST_CTG_GB}" /></td>
					</tr>
					<c:if test="${productInfo.PRD_MST_CNL_PC_YN eq 'Y'}">
					<tr>
						<th><span>PC카테고리 </span></th>
						<td colspan="3" class="left">
							<div id="divCategory"><!-- 카테고리 -->
								<table class="table-col table-b" id="tableCategory">
									<colgroup>
										<col style="width: auto;" />
									</colgroup>
									<thead>
										<tr>
											<th>카테고리 경로</th>
										</tr>
									</thead>
									<tbody id="applyCategoryList_${Code.CATEGORY_TYPE_PC}">
		                            <c:choose>
		                            <c:when test="${not empty categoryListP}">
    	                            <c:forEach var="item" items="${categoryListP }" varStatus="status">
									<tr>
										<td class="center"><label for="PRD_CTG_IDX_${item.DSP_CTG_IDX}"><c:out value="${item.PRD_CTG_PATH }" /></label></td>
									</tr>
                        		    </c:forEach>
                        	    	</c:when>
	                	            <c:otherwise>
   	        	                    <tr><!-- row -->
										<td>카테고리를 추가해 주세요.</td>
       	    	                    </tr>
   		            	            </c:otherwise>
   	    	            	        </c:choose>
									</tbody>
								</table>
							</div><!-- // 카테고리 -->
						</td>
					</tr>
					</c:if>
					<c:if test="${productInfo.PRD_MST_CNL_MB_YN eq 'Y'}">
					<tr>
						<th><span>모바일카테고리 </span></th>
						<td colspan="3" class="left">
							<div id="divCategory"><!-- 카테고리 -->
								<table class="table-col table-b" id="tableCategory">
									<colgroup>
										<col style="width: auto;" />
									</colgroup>
									<thead>
										<tr>
											<th>카테고리 경로</th>
										</tr>
									</thead>
									<tbod>
		                            <c:choose>
		                            <c:when test="${not empty categoryListM}">
    	                            <c:forEach var="item" items="${categoryListM }" varStatus="status">
									<tr>
										<td class="center"><label for="PRD_CTG_IDX_${item.DSP_CTG_IDX}"><c:out value="${item.PRD_CTG_PATH }" /></label></td>
									</tr>
                        		    </c:forEach>
                        	    	</c:when>
	                	            <c:otherwise>
   	        	                    <tr><!-- row -->
										<td>카테고리를 추가해 주세요.</td>
       	    	                    </tr>
   		            	            </c:otherwise>
   	    	            	        </c:choose>
									</tbody>
								</table>
							</div><!-- // 카테고리 -->	
						</td>
					</tr>
					</c:if>
					<tr>
						<th>상품아이콘</th>
						<td colspan="3" class="left">
							<!-- col list -->
							<table class="table-col table-b">
								<colgroup>
									<col style="width: 15%;" />
									<col style="width: 20%;" />
									<col style="width: auto;" />
									<col style="width: 15%;" />
								</colgroup>
								<tbody>
								<c:choose>
								<c:when test="${not empty Code.PRODUCT_ICON_NM}">
								<c:set var="iconCnt" value="1" />
									<c:if test="${fn:length(Code.PRODUCT_ICON_NM) > 0 }">
										<c:forEach var="item" items="${Code.PRODUCT_ICON_NM }" varStatus="status">
											<tr>
												<th>${Code.PRODUCT_ICON_NM[iconCnt -1]}</th>
												<td>
													<div class="field">
														<c:out value="${PRD_MST_ICN_YN[iconCnt -1] == 'Y' ? '사용' : '미사용' }" />
													</div></td>
												<td>
													<c:if test="${PRD_MST_ICN_ST_DT[iconCnt -1] ne '' && PRD_MST_ICN_ED_DT[iconCnt -1] ne ''}">
														노출기간 : 
														<c:out value="${PRD_MST_ICN_ST_DT[iconCnt -1] }" />
														 ~
														<c:out value="${PRD_MST_ICN_ED_DT[iconCnt -1] }" />
													</c:if>
												</td>
												<td><c:if test="${PRD_MST_ICN_YN[iconCnt -1] eq 'Y' && (PRD_MST_ICN_ST_DT[iconCnt -1] eq '' && PRD_MST_ICN_ED_DT[iconCnt -1] eq '' )}">제한없음</c:if></td>
											</tr>
										<c:set var="iconCnt" value="${iconCnt + 1}" />
										</c:forEach>
									</c:if>
	                            </c:when>
	                            </c:choose>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<th>검색채널<br />(가격비교용)</th>
						<td colspan="3" class="left">
							<!-- col list -->
							<table class="table-col table-b">
								<colgroup>
									<col style="width: 15%;" />
									<col style="width: auto;" />
								</colgroup>
								<tbody>
									<c:if test="${fn:length(PRD_CHN_TIT_NM) > 0 }">
									<c:set var="chnIdx" value="0" />
									<c:forEach var="PRD_CHN_TIT_NM" items="${PRD_CHN_TIT_NM }" varStatus="status">
									<tr>
										<th class="left" style="padding-left:10px;background-color:#EAEAEA;"><ui:replaceLineBreak content="${PRD_CHN_TIT_NM}"/></th>
										<td class="left">
											<table class="table-col table-b">
												<colgroup>
													<col style="width: auto;" />
												</colgroup>
												<tbody>
													<c:choose>
														<c:when test="${not empty basicChnMstList}">
															<c:forEach var="basicChnMstList" items="${basicChnMstList}" varStatus="Status">
																<c:if test="${ basicChnMstList.CHN_MST_UP_IDX eq commandMap.arrCHN_MST_UP_IDX[chnIdx]}">
																	<tr>
																		<td style="padding-left:10px;">
																			<c:out value="${basicChnMstList.CHN_MST_NM }" /> : <fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" />원
																		</td>
																	</tr>
																	<tr>
																		<td style="padding-left:20px;border-top:0px;">
																			<table class="core">
																				<colgroup>
																					<col style="width: 30%;" />
																					<col style="width: 30%;" />
																					<col style="width: 30%;" />
																				</colgroup>
																				<tbody>
																					<c:choose>
																						<c:when test="${not empty basicChnDtlList}">
																							<c:set var="chnDtlIdx" value="0" />
																							<c:forEach var="basicChnDtlList" items="${basicChnDtlList}" varStatus="Status">
																								<c:if test="${basicChnDtlList.CHN_MST_IDX eq basicChnMstList.CHN_MST_IDX }">
																									<c:if test="${chnDtlIdx eq 0 || chnDtlIdx mod 4 == 0 }">
																									<tr>
																									</c:if>
																										<td style="border-top:0px;">
																											<c:out value="${basicChnDtlList.CHN_DTL_NM }" /> : <fmt:formatNumber value="${basicChnDtlList.PRD_CHN_PRC }" groupingUsed="true" />원
																										</td>
																									<c:if test="${(chnDtlIdx + 1) mod 3 == 0 && chnDtlIdx != 0 }">
																									</tr>
																									</c:if>
																									<c:set var="chnDtlIdx" value="${chnDtlIdx + 1}" />
																								</c:if>
																							</c:forEach>
																						</c:when>
																					</c:choose>
																				</tbody>
																			</table>
																		</td>
																	</tr>
																</c:if>
															</c:forEach>
														</c:when>
													</c:choose>
												</tbody>
											</table>
										</td>
									</tr>
									<c:set var="chnIdx" value="${chnIdx + 1 }" />
									</c:forEach>
									</c:if>
									<tr>
										<th class="left" style="padding-left:10px;background-color:#EAEAEA;">제휴채널<br />(외부링크연계)</th>
										<td class="left">
											<table class="table-col table-b">
												<colgroup>
													<col style="width: auto%;" />
												</colgroup>
												<tbody>
													<c:choose>
														<c:when test="${not empty basicProductChnAlliList }" >
															<c:forEach var="basicProductChnAlliList" items="${basicProductChnAlliList }" varStatus="Status">
																<tr>
																	<td style="padding-left:20px;border-top:0px;">
																		- <c:out value="${basicProductChnAlliList.CHN_DTL_NM }" /> : <fmt:formatNumber value="${basicProductChnAlliList.PRD_CHN_PRC }" groupingUsed="true" />원
																	</td>
																</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<tr>
																<td>추가 된 제휴채널이 없습니다.</td>
															</tr>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>				
				</tbody>
	        </table><!-- // table -->
	        
	        <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>스펙</span></h3>
            </div><!-- // push-guide -->
            
	        <table cellspacing="0" class="table-col table-b"><!-- table -->
	            <colgroup>
					<col style="width: auto;" />
				</colgroup>
				<thead>
					<tr>
						<th>스펙 경로</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
                         <c:when test="${not empty specListP}">
                            <c:forEach var="item" items="${specListP }" varStatus="status">
								<tr>
									<td class="center"><label for="PRD_SPC_IDXs_${item.PRD_SPC_IDX}"><c:out value="${item.SPC_MST_PATH }" /></label></td>
								</tr>
                 		    </c:forEach>
               	    	</c:when>
       	            	<c:otherwise>
   	                    	<tr><!-- row -->
								<td>등록된 스펙이 없습니다.</td>
    	                    </tr>
       	            	</c:otherwise>
           	        </c:choose>
				</tbody>
	        </table><!-- // table -->
	        
	        <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>옵션</span></h3>
            </div><!-- // push-guide -->
            
	        <table cellspacing="0" class="table-col table-b"><!-- table -->
	            <colgroup>
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
				</colgroup>
				<thead>
					<tr>
						<th>옵션명</th>
						<th>옵션값</th>
						<th>기간계코드</th>
						<th>추가가격</th>
						<th>재고</th>
						<th>기간(시작일~종료일)</th>
						<th>사용</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody id="applyproductOptionList">
					<c:choose>
					<c:when test="${not empty optionList}">
						<c:set var="detidx" value="1" />
						<c:forEach var="optionList" items="${optionList }" varStatus="i">
                        	<tr>  
								<td><c:out value="${optionList.PRD_OPT_NM}" /></td>
								<td colspan=6>
									<table style="width:100%;">
										<colgroup>
											<col style="width: 17%;" />
											<col style="width: 9%;" />
											<col style="width: 9%;" />
											<col style="width: 9%;" />
											<col style="width: 18%;" />
											<col style="width: 5%;" />
										</colgroup>
										<tbody>
										<c:if test="${not empty optionDetailList}">
											<c:set var="subcnt" value="1" />
											<c:forEach var="optionDetailList" items="${optionDetailList }">
												<c:if test="${optionList.PRD_OPT_IDX eq optionDetailList.PRD_OPT_IDX}">
													<tr style="margin:0px; padding:0px;">
														<td>
															<c:out value="${optionDetailList.OPT_DTL_NM }" />
														</td>
														<td>
															<c:out value="${optionDetailList.OPT_DTL_ERP_CD }" />
														</td>
														<td>
															<fmt:formatNumber value="${optionDetailList.OPT_DTL_ADD_PRC }" groupingUsed="true" />
														</td>
														<td>
															<fmt:formatNumber value="${optionDetailList.OPT_DTL_STK_CNT }" groupingUsed="true" />
														</td>
														<td>
															<ui:formatDate value="${optionDetailList.OPT_DTL_ST_DT }" pattern="yyyy.MM.dd"/>
															<br />~
															<ui:formatDate value="${optionDetailList.OPT_DTL_ED_DT }" pattern="yyyy.MM.dd"/>
														</td>
														<td><c:out value="${optionDetailList.OPT_DTL_USE_YN == 'Y' ? '사용' : '미사용' }" /></td>
													</tr>
												</c:if>
											</c:forEach>
										</c:if>
										</tbody>
									</table>
								</td>
								<td>
									필수여부 : 
									<c:out value="${optionList.PRD_OPT_EST_YN == 'Y' ? '사용' : '미사용' }" />
									<br />수량선택여부 : 
									<c:out value="${optionList.PRD_OPT_CNT_YN == 'Y' ? '사용' : '미사용' }" />
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr id="productOptionNodata"><!-- row -->
							<td colspan="8">선택된 옵션이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
	        </table><!-- // table -->
	        
	        <div class="tab-list" id="menuViewTab"><!-- tab-list -->
                <ul>
                    <li class="active"><a href="#none" data-tab_no="tab1" >상품이미지 </a></li>
	                <li><a href="#none" data-tab_no="tab2" id="descTab">상품상세설명 </a></li>
	                <li><a href="#none" data-tab_no="tab4" >상품고시정보 </a></li>
	                <li><a href="#none" data-tab_no="tab6" >관련 콘텐츠</a></li>
                </ul>
            </div><!-- // tab-list -->
            
            <div id="tab1">				
				<!--// 상품 이미지 등록 관련 코드 추가, 이상준, 시작 -->
				<h3 class="title">※  상품이미지</h3>
				<div class="section-form"><!-- section-form-a -->
				
					<div class="edit-product-image"><!--  edit-product-image  -->
					
						<div class="default"><!--  default  -->
		
							<h5 class="title">대표 이미지 ( 650px * 650px )</h5>
							
							<div class="clearfix">
								<div class="fleft thumb">
									<a href="javascript:;"><img src="<c:if test="${ not empty imageList[0].PRD_IMG_URL_PATH }">${cdnDomain}${imageList[0].PRD_IMG_ATT_PATH}${imageList[0].PRD_IMG_SYS_NM}</c:if><c:if test="${ empty imageList[0].PRD_IMG_URL_PATH }"><c:out value="${serverDomain}" />/am/img/blank.png</c:if>" alt="${imageList[0].PRD_IMG_ALT_TEXT}" class="pic" id="product_pic_0" /></a>
								</div>
							</div>
						
						</div><!--  // default  -->
						
						<div class="optional"><!--  optional -->
						
							<h5 class="title">추가 이미지 ( 650px * 650px  )</h5>
							
							<div class="gridfix list">
								<c:set var="img_idx" value="0" /> 
								<c:forEach begin="1" end="10" var="env">
								<c:if test="${ env > imageList[img_idx].PRD_IMG_IDX }"><c:set var="img_idx" value="${img_idx+1}" /></c:if>
								<c:choose>
									<c:when test="${env < 6 }">
										<div class="col" style="width:17%;">
											<div class="module">
												<a href="javascript:;"><img src="<c:if test="${ env eq imageList[img_idx].PRD_IMG_IDX }">${cdnDomain}${imageList[img_idx].PRD_IMG_ATT_PATH}${imageList[img_idx].PRD_IMG_SYS_NM}</c:if><c:if test="${ empty imageList[img_idx].PRD_IMG_URL_PATH }"><c:out value="${serverDomain}" />/am/img/blank.png</c:if>" 
												alt="<c:if test="${ empty imageList[img_idx].PRD_IMG_URL_PATH }">${imageList[img_idx].PRD_IMG_ALT_TEXT}</c:if>" class="pic" id="product_pic_<c:out value="${env}"/>" /></a>
											</div>
										</div>		
									</c:when>
									<c:otherwise>
										<div class="col" style="width:17%;padding-top:10px;">
											<div class="module">
												<a href="javascript:;"><img src="<c:if test="${ env eq imageList[img_idx].PRD_IMG_IDX }">${cdnDomain}${imageList[img_idx].PRD_IMG_ATT_PATH}${imageList[img_idx].PRD_IMG_SYS_NM}</c:if><c:if test="${ empty imageList[img_idx].PRD_IMG_URL_PATH }"><c:out value="${serverDomain}" />/am/img/blank.png</c:if>" 
												alt="<c:if test="${ empty imageList[img_idx].PRD_IMG_URL_PATH }">${imageList[img_idx].PRD_IMG_ALT_TEXT}</c:if>" class="pic" id="product_pic_<c:out value="${env}"/>" /></a>
											</div>
										</div>	
									</c:otherwise>	
								</c:choose>						
								</c:forEach>
							</div>	
							
						</div><!--  // optional -->
						
					</div><!--  // edit-product-image  -->
		
				</div><!-- // section-form-a -->
			
			</div>
			
			<div id="tab2" style="display:none">
				<h3 class="title"> ※  상품 상세설명</h3>
				
				<table cellspacing="0" class="table-col table-b"><!-- table -->
		            <colgroup>
		                <col style="width: 10%;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
						<tr>
							<th><span>PC</span></th>
							<td><ui:replaceLineBreak content="${productInfo.PRD_MST_PC_DTL_DSC }"/></td>
						</tr>
						<tr>
							<th><span>MOBILE</span></th>
							<td><ui:replaceLineBreak content="${productInfo.PRD_MST_MB_DTL_DSC }"/></td>
						</tr>
	                </tbody>
		        </table><!-- // table -->
			</div>
			
			<div id="tab4" style="display:none">
				<h3 class="title"> ※  상품고시정보</h3>
					<table class="table-col table-b">
					<colgroup> 
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th><span>품목</span></th>
							<td colspan="3" class="left"><c:out value="${productInfo.PRD_MST_NFI_NM }" /></td>
						</tr>
						<tr>
							<th><span>브랜드</span></th>
							<td class="left"><c:out value="${productInfo.PRD_MST_BRAND_NM }" /></td>
							<th><span>제조사</span></th>
							<td class="left"><c:out value="${productInfo.PRD_MST_MRK_NM }" /></td>
						</tr>
						<tr>
							<td colspan="4" class="left">
								<table class="table-col table-b">
								<colgroup> 
									<col style="width: 25%;" />
									<col style="width: auto;" />
								</colgroup>
								<tbody>
									<c:choose>
										<c:when test="${not empty productNfiInfo}">
											<c:set var="infIdx" value="0" />
											<c:forEach var="productNfiInfo" items="${productNfiInfo }" varStatus="status">
												<tr>
													<th><span><c:out value="${productNfiInfo.PRD_NFI_INFO }" /></span></th>
													<td class="left">
														<c:out value="${PRD_MST_NFI_INF_ARY[infIdx] }" />
													</td>
												</tr>
											<c:set var="infIdx" value="${infIdx + 1 }" />
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div id="tab6" style="display:none">				
				
				<h3 class="title"> ※  검색엔진 최적화(SEO)</h3>
					
				<table class="table-col table-b">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th>메타태그1 : Author</th>
							<td><c:out value="${productInfo.PRD_MST_MTA_TAG1 }" /></td>
						</tr>
						<tr>
							<th>메타태그2 : Description</th>
							<td><c:out value="${productInfo.PRD_MST_MTA_TAG2 }" /></td>
						</tr>
						<tr>
							<th>메타태그3 : Keywords</th>
							<td><c:out value="${productInfo.PRD_MST_MTA_TAG3 }" /></td>
						</tr>
					</tbody>
				</table>
				
				<h3 class="title">※ 메모</h3>
				
				<table class="table-col table-b">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th>메모</th>
							<td><ui:replaceLineBreak content="${productInfo.PRD_MST_MEMO }"/></td>
						</tr>
					</tbody>
				</table>
			</div>
	
			<div class="grid section-button-search"><!-- section button -->
				<a href="#none" id="closePopup" class="button small"><span>닫기</span></a>
			</div>
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () 
{
	
 	$("#menuViewTab").on("click", "a", function () {
 		var this_tab_no = $(this).data('tab_no');
 		
 		$(this).parent().parent().find('a').each( function(i,item){
 			if( this_tab_no == $(item).data("tab_no") ){
 				$("#"+$(item).data("tab_no")).show();
 				$(item).parent().attr("class","active");	
 			}	
 			else{
 				$("#"+$(item).data("tab_no")).hide();
 				$(item).parent().attr("class","");
 			}
 		});
 	});
 	
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});
 	
});
</script>
</body>
</html>
