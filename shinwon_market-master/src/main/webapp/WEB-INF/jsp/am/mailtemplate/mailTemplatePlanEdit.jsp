<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
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
                <a href="#none">상품메일관리[<c:out value="${tempTitle }" />]</a>
                &gt;
                <span>견적관리</span>
            </div><!-- // breadcrumb -->
    
            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">상품메일관리[<c:out value="${tempTitle }" />]</h3>

                <h4 class="title">등록</h4>

                <p>
                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
                </p>
                
                <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
               	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                <input type="hidden" name="searchEmlMstNm" value="<c:out value="${commandMap.searchEmlMstNm }"/>"/>
                <input type="hidden" name="searchEmlMstYn" value="<c:out value="${commandMap.searchEmlMstYn }"/>"/>
                <input type="hidden" name="path" id="path" value="<c:out value="${path }"/>"/>
                </form>
                
                <form id="frm" name="frm" enctype="multipart/form-data">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
               	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                <input type="hidden" name="searchEmlMstNm" value="<c:out value="${commandMap.searchEmlMstNm }"/>"/>
                <input type="hidden" name="searchEmlMstYn" value="<c:out value="${commandMap.searchEmlMstYn }"/>"/>
                <input type="hidden" name="path" id="path" value="<c:out value="${path }"/>"/>
                <input type="hidden" name="cmmFleIdx" value=""/>
                <input type="hidden" name="cmmFleUpIdx" value=""/>
                <input type="hidden" name="cmmFleDnIdx" value=""/>
                <input type="hidden" name="EML_MST_IDX" id="EML_MST_IDX" value="<c:out value="${mailTemplatInfo.EML_MST_IDX }"/>"/>
                <input type="hidden" name="arrSearchGrpIdx" id="arrSearchGrpIdx" value="<c:out value="${commandMap.arrSearchGrpIdx }"/>"/>
                <input type="hidden" name="EML_MST_UP_CNT" id="EML_MST_UP_CNT" value="<c:out value="${mailTemplatInfo.EML_MST_UP_CNT }"/>"/>
                <input type="hidden" name="EML_MST_DW_CNT" id="EML_MST_DW_CNT" value="<c:out value="${mailTemplatInfo.EML_MST_DW_CNT }"/>"/>
	                    
				<div class="table-a"><!-- col list -->
				<table class="core tdleft">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: auto%;" />
					</colgroup>
					<tbody>
						<tr>
							<th><span>사용여부</span></th>
							<td>
								<input type="radio" class="radio" name="EML_MST_YN" id="EML_MST_YN1" value="Y" <ui:select v="${mailTemplatInfo.EML_MST_YN}" t="Y" g="checked"/> />
	                            <label for="EML_MST_YN1">사용</label>
	                            <input type="radio" class="radio" name="EML_MST_YN" id="EML_MST_YN2" value="N" <ui:select v="${mailTemplatInfo.EML_MST_YN}" t="N" g="checked"/> />
	                            <label for="EML_MST_YN1">미사용</label>
							</td>
						</tr>
						<tr>
							<th><span>메일제목 <em class="strong">*</em></span></th>
							<td><input type="text" name="EML_MST_NM" id="EML_MST_NM" class="text long" maxlength=50 value="<c:out value="${mailTemplatInfo.EML_MST_NM }" />" /></td>
						</tr>
						<tr>
							<th><span>발송예정일 <em class="strong">*</em></span></th>
							<td>
								<input type="text" class="text datepicker s-datepicker" id="EML_MST_ST_DT" name="EML_MST_ST_DT" value="<ui:formatDate value="${mailTemplatInfo.EML_MST_ST_DT }" pattern="yyyy-MM-dd"/>" />							
								<select class="select" id="EML_MST_ST_HH" name="EML_MST_ST_HH" >
								<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
								<fmt:formatNumber pattern="00" value="${i }" var="hour" />
									<option value="${hour }" <ui:select v="${mailTemplatInfo.EML_MST_ST_HH}" t="${hour }" g="selected"/>>${hour }</option>
								</c:forEach>
								</select> 시
								<select class="select" id="EML_MST_ST_MM" name="EML_MST_ST_MM" >
								<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
								<fmt:formatNumber pattern="00" value="${i }" var="minute" />
									<option value="${minute }" <ui:select v="${mailTemplatInfo.EML_MST_ST_MM}" t="${minute }" g="selected"/>>${minute }</option>
								</c:forEach>
								</select> 분
							</td>
						</tr>
						<tr>
							<th><span>수신대상 </span></th>
							<td>
								<select name="EML_MST_TGT" id="EML_MST_TGT" class="select">
									<option value="">수신대상</option>
									<c:forEach var="row" items="${targetlist }" varStatus="i">
										<option value="<c:out value="${row.TARGET_ID }" />" <ui:select v="${mailTemplatInfo.EML_MST_TGT}" t="${row.TARGET_ID }" g="selected"/>><c:out value="${row.TARGET_NM }" /></option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th><span>상단 이미지 <em class="strong">*</em></span></th>
							<td>
								<table id="fileViewUp" style="width:70%;">
									<c:if test="${not empty mailTemplatFile }">
									<c:set var="fileCnt" value="0" />
										<c:forEach items="${mailTemplatFile }" var="fileRow" varStatus="i">
											<c:if test="${fileRow.CMM_FLE_TB_TYPE eq 'U' }">
												<tr>
	                            					<td>
	                            						<i class="icon-file"></i>
	                            						<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-file_type="up" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
		                                        			<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
			                                    			</a>			 		                                    			
			                                    			<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_<c:out value="${fileRow.CMM_FLE_IDX }"/>" name="CMM_FLE_IDX" data-file_seq="<c:out value="${fileCnt }" />" data-file_type="up" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" /> 
			                         					<label for="CMM_FLE_IDX_<c:out value="${fileRow.CMM_FLE_IDX }"/>">삭제</label>
	                            					</td>			                            					
	                            				</tr>
	                            				<c:set var="fileCnt" value="${fileCnt + 1 }" />
	                            			</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${not empty mailTemplatLink }">
										<c:set var="lnkCnt" value="0" />
										<c:forEach var="lnkRow" items="${mailTemplatLink }" varStatus="i">
											<c:if test="${lnkRow.EML_LNK_TYPE eq 'U' }">
				                    			<tr>	                    				
				                    				<td id="defaultFile">	                    					
				                    					<input type="file" name="fileUp" id="fileUp<c:out value="${lnkCnt }" />" class="file" value="" />
				                    					<input type="hidden" name="EML_LNK_TYPE" id="EML_LNK_TYPE" value="U" />
				                    					<br><br>URL&nbsp;&nbsp;<input type="text" name="EML_LNK_URLs" id="EML_LNK_URLs" value="<c:out value="${lnkRow.EML_LNK_URL }" />" class="text"  style="width: 60%;" maxlength="100" />	                    						                    					                   					 					               		
				                    				</td>	
				                    				<td>
				                    					<c:choose>
				                    						<c:when test="${lnkCnt == 0 }">
				                    							<input type="button" name="addFileUp" id="addFileUp" value="+"/>
				                    						</c:when>
				                    						<c:otherwise>
				                    							<input type="button" onClick="rowDelete(this)" value="-"/>
				                    						</c:otherwise>
				                    					</c:choose>
				                    				</td>
				                    			</tr>
				                    		<c:set var="lnkCnt" value="${lnkCnt + 1 }" />
				                    		</c:if>
				                    	</c:forEach>
				                    </c:if>
	                    		</table>		                    			                    			                      		
								<small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
 	                            <small class="desc">* 업로드 용량 : 20MB</small> 
							</td>
						</tr>
					</tbody>
				</table>
				</div><!-- // col list -->
				
				<div class="title-box">
					<h4 class="title">상품구성</h4>
					<div class="right">
						<label class="label"><span><em class="strong">※ 1개 상품그룹에 상품은 3개까지 등록하셔야 합니다.</em></span></label>
						<a href="#none" id="addProductGroup"class="button button-b small addProductGroup"><span>상품그룹추가</span></a>
					</div>
   				</div>
    
				<div id="productBoxList">
    				<div id="productBox">
    					<c:if test="${not empty mailTemplatPrdGrp }">
    						<c:forEach var="prdGrpRow" items="${mailTemplatPrdGrp }" varStatus="i">
		  						<div class="section-form"><!-- section-form-a -->
		              				<input type="hidden" name="groupNum" class="groupNum" value="<c:out value="${prdGrpRow.EML_GRP_SEQ }" />"/>
		                       
		              				<div class="form-group">
										<label class="label"><span>사용상품 <em class="strong">*</em></span></label>
										<div class="field">				
											<div class="section-button"><!-- section button -->
												<a href="#none" class="button button-a small goProductDelete"><span>선택삭제</span></a>
		                       					<a href="#none" class="button button-b small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
											</div><!-- // section button -->
		
											<div class="table-a"><!-- col list -->
												<table class="core">
													<colgroup>
														<col style="width: 5%;" />
														<col style="width: 8%;" />
														<col style="width: auto;" />
														<col style="width: 10%;" />
														<col style="width: 10%;" />
														<col style="width: 10%;" />
														<col style="width: 8%;" />
														<col style="width: 8%;" />
														<col style="width: 5%;" />
														<col style="width: 5%;" />
														<col style="width: 8%;" />
													</colgroup>
													<thead>
														<tr>
															<th><input type="checkbox" class="checkbox checkAll" /></th>
															<th>상품코드</th>
															<th>상품명</th>
															<th>입점업체</th>
															<th>상품가격</th>
															<th>주문가격</th>
															<th>배송비</th>
															<th>판매상태</th>
															<th>쇼핑채널</th>
															<th>진열상태</th>
															<th>전시순서</th>
														</tr>
													</thead>
													<tbody class="applyProductList">
														<c:if test="${not empty mailTemplatPrd }">
															<c:forEach var="prdRow" items="${mailTemplatPrd}" varStatus="i">
																<c:if test="${prdGrpRow.EML_GRP_IDX eq prdRow.EML_GRP_IDX }">
																	<tr>
																		<td>
																			<input type="checkbox" class="checkbox checkRow" id="PRD_MST_CD_${prdRow.EML_PRD_CD}" name="PRD_MST_CDs" value="${prdRow.EML_PRD_CD}" />
																			<input type="hidden" name="EML_PRD_CD<c:out value="${prdGrpRow.EML_GRP_SEQ }" />" value="${prdRow.EML_PRD_CD}" />
																			
																		</td>
																		<td>
																			<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${prdRow.EML_PRD_CD }" />" target="_blank" title="새 창 으로 열립니다.">
																				<c:out value="${prdRow.EML_PRD_CD }" />
																			</a>
																		</td>
																		<td class="left">
																			<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${prdRow.EML_PRD_CD}&ADMIN=Y" target="_blank">
																				<c:out value="${prdRow.PRD_MST_NM }" />
																			</a>
																		</td>
																		<td><c:out value="${prdRow.VDR_MST_NM }" /></td>
																		<td><fmt:formatNumber value="${prdRow.PRD_MST_PRC }" groupingUsed="true" /></td>
																		<td><fmt:formatNumber value="${prdRow.PRD_MST_PRC }" groupingUsed="true" /></td>
																		<td><fmt:formatNumber value="${prdRow.PRD_MST_DLV_FEE }" groupingUsed="true" /></td>
																	 	<td>
																			<c:if test="${prdRow.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}" ><span class="label label-b">판매중</span></c:if>
																			<c:if test="${prdRow.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_READY}" ><span class="label label-a">등록대기</span></c:if>
																			<c:if test="${prdRow.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" ><span class="label label-a">품절상품</span></c:if>
																			<c:if test="${prdRow.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" ><span class="label label-a">미판매</span></c:if>
																		</td>
																		<td>
																			<c:choose>
																				<c:when test="${prdRow.PRD_MST_CNL_MB_YN eq 'Y' and prdRow.PRD_MST_CNL_PC_YN eq 'Y'}">전체
																				</c:when>
																				<c:otherwise>
																					<c:if test="${prdRow.PRD_MST_CNL_PC_YN eq 'Y'}" >PC</c:if>
																					<c:if test="${prdRow.PRD_MST_CNL_MB_YN eq 'Y'}" >MOBILE</c:if>
																				</c:otherwise>
																			</c:choose>
																		</td>
																		<td><c:out value="${prdRow.PRD_MST_DPL_STATE }" /></td>
																		<td><input type="text" name="EML_PRD_DSP_SEQ_<c:out value="${prdGrpRow.EML_GRP_SEQ }" />_<c:out value="${prdRow.EML_PRD_CD}"/>" class="text short number" value="<c:out value="${prdRow.EML_PRD_DSP_SEQ }"/>" maxlength="5"/></td>
																	</tr>
																</c:if>
															</c:forEach>
														</c:if>
													</tbody>
												</table>
											</div><!-- // col list -->
										</div>
									</div>
			               			<div class="form-group">                
										<label class="label"><span>관리</span></label>
										<div class="field">
											<a href="#none" class="button button-b small product-group-delete"><span>상품그룹 삭제</span></a>
											<a href="#none" class="button button-b small addProductGroup"><span>상품그룹추가</span></a>
										</div>
									</div>
								</div><!-- // section-form-a -->
							</c:forEach>
						</c:if>
					</div>
				</div>
				
				<div class="table-a"><!-- col list -->
				<table class="core tdleft">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: auto%;" />
					</colgroup>
					<tbody>
						<tr>
							<th><span>하단 이미지${lnkCnt } <em class="strong">*</em></span></th>
							<td>
								<table id="fileViewDn" style="width:70%;">
									<c:if test="${not empty mailTemplatFile }">
										<c:set var="fileCnt2" value="0" />
										<c:forEach items="${mailTemplatFile }" var="fileRow" varStatus="i">
											<c:if test="${fileRow.CMM_FLE_TB_TYPE eq 'D' }">
												<tr>
	                            					<td>
	                            						<i class="icon-file"></i>
	                            						<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-file_type="dn" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
		                                        			<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
			                                    			</a>			 		                                    			
			                                    			<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_<c:out value="${fileRow.CMM_FLE_IDX }"/>" name="CMM_FLE_IDX" data-file_seq="<c:out value="${fileCnt2 }" />" data-file_type="dn" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" /> 
			                         					<label for="CMM_FLE_IDX_<c:out value="${fileRow.CMM_FLE_IDX }"/>">삭제</label>
	                            					</td>			                            					
	                            				</tr>
	                            			<c:set var="fileCnt2" value="${fileCnt2 + 1 }" />
	                            			</c:if>
										</c:forEach>
									</c:if>
	                    			<c:if test="${not empty mailTemplatLink }">
										<c:set var="lnkCnt2" value="0" />
										<c:set var="lnkCnt" value="${lnkCnt - 1 }" />
										<c:set var="chkRow" value="0" />
										<c:forEach var="lnkRow" items="${mailTemplatLink }" varStatus="i">
											<c:if test="${lnkRow.EML_LNK_TYPE eq 'D' }">
				                    			<tr>	                    				
				                    				<td id="defaultFile">	                    					
				                    					<input type="file" name="fileDn" id="fileDn<c:out value="${lnkCnt2 }" />" class="file" value="" />
				                    					<input type="hidden" name="EML_LNK_TYPE" id="EML_LNK_TYPE" value="D" />
				                    					<br><br>URL&nbsp;&nbsp;<input type="text" name="EML_LNK_URLs" id="EML_LNK_URLs" value="<c:out value="${lnkRow.EML_LNK_URL }" />" class="text"  style="width: 60%;" maxlength="100" />	                    						                    					                   					 					               		
				                    				</td>	
				                    				<td>
				                    					<c:choose>
				                    						<c:when test="${lnkCnt2 == 0 }">
				                    							<input type="button" name="addFileDn" id="addFileDn" value="+"/>
				                    						</c:when>
				                    						<c:otherwise>
				                    							<input type="button" onClick="rowDelete(this)" value="-"/>
				                    						</c:otherwise>
				                    					</c:choose>
				                    				</td>
				                    			</tr>
				                    		<c:set var="lnkCnt2" value="${lnkCnt2 + 1 }" />
				                    		</c:if>
				                    	<c:set var="chkRow" value="${chkRow + 1 }" />
				                    	</c:forEach>
				                    </c:if>
	                    		</table>		                    			                    			                      		
								<small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
 	                            <small class="desc">* 업로드 용량 : 20MB</small> 
							</td>
						</tr>
						<tr>
							<th><span>발송 여부 </span></th>
							<td>2016.3.3.3</td>
						</tr>
						<tr>
							<th><span>등록일 </span></th>
							<td><c:out value="${mailTemplatInfo.EML_MST_REG_ID }" />(<c:out value="${mailTemplatInfo.EML_MST_REG_NM }" />) / <ui:formatDate value="${mailTemplatInfo.EML_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
						</tr>
					</tbody>
				</table>
				</div><!-- // col list -->
				
                </form>
                <div class="section-button"><!-- section button -->
                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
                </div><!-- // section button -->    


            </div><!-- // contents-inner -->

        </section><!-- // contents -->
        
		<!-- 파일 다운로드용 폼 -->
        <form name="fileForm" id="fileForm">
             <input type="hidden" name="CMM_FLE_IDX" value=""/>
             <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
             <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
        </form>
    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
	<td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" class="EML_PRD_CD" name="EML_PRD_CD\${NUM}" value="\${PRD_MST_CD}"/></td>
	<td class="left"> <a href="\${FRONT_URL}/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&ADMIN=Y" target="_blank">\${PRD_MST_NM}</a></td>
	<td>\${VDR_MST_NM}</td>
	<td>\${PRD_MST_PRC}</td>
	<td>\${PRD_MST_PRC}</td>
	<td>\${PRD_MST_DLV_FEE}</td>
	<td><span class="label label-\${PRD_MST_SEL_STATE_CLASS}">\${PRD_MST_SEL_STATE}</span></td>
	<td>\${PRD_MST_CHANNEL_TYPE}</td>
	<td>\${PRD_MST_DPL_STATE}</td>
	<td><input type="text" name="EML_PRD_DSP_SEQ_\${NUM}_\${PRD_MST_CD}" class="text short number PLN_DTL_ORDER" value="\${PLN_DTL_ORDER}" maxlength="5"/></td>
</tr>
</script>
<script id="productGroupTemplate" type="text/x-jquery-tmpl">
<div class="section-form" data-type="basic">
<input type="hidden" name="groupNum" class="groupNum" value="\${NUM}"/>
<div class="form-group">
    <label class="label"><span>사용상품</span></label>
    <div class="field">
        <div class="section-button">
            <a href="#none" class="button button-a small goProductDelete"><span>선택삭제</span></a>
            <a href="#none" class="button button-b small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
        </div>
        <div class="table-a">
            <table class="core">
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: 8%;" />
					<col style="width: auto;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 8%;" />
					<col style="width: 8%;" />
					<col style="width: 5%;" />
					<col style="width: 5%;" />
					<col style="width: 8%;" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" class="checkbox checkAll" /></th>
						<th>상품코드</th>
						<th>상품명</th>
						<th>입점업체</th>
						<th>상품가격</th>
						<th>주문가격</th>
						<th>배송비</th>
						<th>판매상태</th>
						<th>쇼핑채널</th>
						<th>진열상태</th>
						<th>전시순서</th>
					</tr>
				</thead>
                <tbody class="applyProductList">
                    <tr class="productNodata">
                        <td colspan="10">상품을 검색해 주세요.</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="form-group">                
    <label class="label"><span>관리</span></label>
    <div class="field">
        <a href="#none" class="button button-b small product-group-delete"><span>상품그룹 삭제</span></a>
        <a href="#none" class="button button-b small addProductGroup"><span>상품그룹추가</span></a>
    </div>
</div>
</div>

</script>

<script type="text/javascript">
$(document).ready(function () {
	
	var path = $("#path").val();
	
	// 폼체크
    $("#frm").validate({
        rules: {
        	EML_MST_NM : { required:true },  				  // 메일제목
        	EML_MST_ST_DT : { required:true }                // 발송예정일
        },
        messages: {
        	EML_MST_NM: { required: "메일제목은 필수입력입니다."},
        	EML_MST_ST_DT: { required: "발송예정일은 필수입력입니다."}
        }
    });
	
 // 파일 행 추가 클릭 이벤트
    $("#addFileUp").click(function(){
    	var fileNum = $("#fileViewUp tr").children().length;
    	var fileLen = $("input[name=fileUp]").length;
		if(fileLen == 10){
    		alert("이미지는 최대 10개까지 등록 할 수 있습니다.");
    		return;
    	}else{
	    	var fileHtml = "";
	    	fileHtml = fileHtml + '<tr><td>' + '<input type="hidden" name="EML_LNK_TYPE" id="EML_LNK_TYPE" value="U" /><input type="file" class="file" name="fileUp" id="fileUp'+ fileNum +'"/>' + '<br><br>URL&nbsp;&nbsp;<input type="text" name="EML_LNK_URLs" id="EML_LNK_URLs" class="text"  style="width: 60%;" maxlength="100" /></td><td>'+'<input type="button" onClick="rowDelete(this)" value="-"/>'+'</td></tr>';
    		$("#fileViewUp").append(fileHtml);
			// 고정 첨부파일 행 파일지우기 비활성화
    	}
    	
    });
    $("#addFileDn").click(function(){
    	var fileNum = $("#fileViewDn tr").children().length;
    	var fileLen = $("input[name=fileDn]").length;
    	if(fileLen == 10){
    		alert("이미지는 최대 10개까지 등록 할 수 있습니다.");
    		return;
    	}else{
    		var fileHtml = "";
	    	fileHtml = fileHtml + '<tr><td>' + '<input type="hidden" name="EML_LNK_TYPE" id="EML_LNK_TYPE" value="D" /><input type="file" class="file" name="fileDn" id="fileDn'+ fileNum +'"/>' + '<br><br>URL&nbsp;&nbsp;<input type="text" name="EML_LNK_URLs" id="EML_LNK_URLs" class="text"  style="width: 60%;" maxlength="100" /></td><td>'+'<input type="button" onClick="rowDelete(this)" value="-"/>'+'</td></tr>';
    		$("#fileViewDn").append(fileHtml);
			// 고정 첨부파일 행 파일지우기 비활성화
    	}
    	
    });
 	
  	//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
	$(".cmmFleIdx").each(function(){
		var fileSeq = $(this).data("file_seq");
		
		$("input[name=fileUp]").each(function(){
			$(this).prop("disabled", true);
		});
		
		$("input[name=fileDn]").each(function(){
			$(this).prop("disabled", true);
		});
		
	});
 	
  	//파일 삭제를 위한 체크박스 클릭 이벤트
	$(".cmmFleIdx").click(function(){
		var cmmFleIdx = "";
		var cmmFleUpIdx = "";
		var cmmFleDnIdx = "";
		$("input[name='CMM_FLE_IDX']:checked").each(function(){
			cmmFleIdx = cmmFleIdx + $(this).val() + ",";
			if($(this).data("file_type") == "up"){
				cmmFleUpIdx = cmmFleUpIdx + $(this).val() + ",";
			}else{
				cmmFleDnIdx = cmmFleDnIdx + $(this).val() + ",";
			}
		});
		$("input[name='cmmFleIdx']").val(cmmFleIdx);
		$("input[name='cmmFleUpIdx']").val(cmmFleUpIdx);
		$("input[name='cmmFleDnIdx']").val(cmmFleDnIdx);
		
		var $this = $(this);
		var fileSeq = $(this).data("file_seq");
		var fileType = $(this).data("file_type");
	 	
		if($this.is(":checked"))
		{
			if(fileType == "up"){
				$("input[id=fileUp"+fileSeq+"]").prop("disabled", false);
			}else{
				$("input[id=fileDn"+fileSeq+"]").prop("disabled", false);
			}
		}
		else
		{
			if(fileType == "up"){
				$("input[id=fileUp"+fileSeq+"]").val("");
				$("input[id=fileUp"+fileSeq+"]").prop("disabled", true);
			}else{
				$("input[id=fileDn"+fileSeq+"]").val("");
				$("input[id=fileDn"+fileSeq+"]").prop("disabled", true);
			}
		}
	});
  	
 	// 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        var $frm = $("#frm"); 
        if($frm.valid()){
        	
        	var fileUpLen = 0;
        	var fileUpResult = true;
        	$frm.find("input[name=fileUp]").each(function(){
				if(!$(this).is(":disabled")){
	        		if($(this).val() == "")
					{
						fileUpResult = false;
						fileUpLen ++;
					}
				}
        	});
        	
        	if($("input[name=fileUp]").length > 10){
        		alert("상단 이미지는 최대 10개까지 등록 가능합니다.");
        		return;
        	}
        	
        	if(fileUpResult == false)
        	{
        		alert("상단 이미지를 입력해주세요.");
        		return;
        	}
        	
        	var groupCheck = true;
        	var groupFoduc = "";
        	var prdFoduc = "";
        	var prdCntChk = true;
        	var prdCntChkAtr = "";
            
            $("input[name^=EML_GRP_NM]").each(function(){
            	
            	var rnum = $(this).data("rnum");
            	var type = $("input[name='PLN_GRP_TYPE"+rnum+"']:checked").val();
            	
            	if($("input[name='EML_GRP_NM"+rnum+"']").val()=="")
       		 	{
                   groupFoduc = $("input[name='EML_GRP_NM"+rnum+"']");
                   groupCheck = false;
                   return false;
				}
            });
            
            
            $(".applyProductList").each(function(){
           		if($(this).find(".checkRow").length <= 0)
                {
                    prdFoduc = $(this).find(".search-product-popup");
                    groupCheck = false;
                    return false;
                }
           		//관련상품 템플릿 상품 갯수 확인
           		if($(this).find(".checkRow").length != 3){
       				prdCntChk = false;
       				prdCntChkAtr = "등록 상품은 3개로 마춰야 합니다.";
       				return false;
       			}
            });
            
            if(prdCntChk == false && prdCntChkAtr != ""){
            	alert(prdCntChkAtr);
            	return;
            }
            
            if(groupCheck == false && prdFoduc != ""){
            	alert("[사용상품]상품을 추가해 주십시오.");
            	prdFoduc.focus();
            	return;
            }
            
            var fileDnLen = 0;
        	var fileDnResult = true;
        	$frm.find("input[name=fileDn]").each(function(){
        		if(!$(this).is(":disabled")){	
        			if($(this).val() == "")
					{
						fileDnResult = false;
						fileDnLen ++;
					}
        		}
        	});
        	
        	if($("input[name=fileDn]").length > 10){
        		alert("하단 이미지는 최대 10개까지 등록 가능합니다.");
        		return;
        	}
        	
        	if(fileDnResult == false)
        	{
        		alert("하단 이미지를 입력해주세요.");
        		return;
        	}
        	
        	var emlLnk = true;
        	$("input[name=EML_LNK_URLs]").each(function(){
        		if($(this).val() == ""){
        			emlLnk = false;
        			return false;
        		}
        	});
        	
        	if(emlLnk == false){
        		alert("이미지 URL을 입력해주세요.");
        		return;
        	}
        	
        	if(groupCheck){
	        	if (confirm( "수정 하시겠습니까?")) 
	            {
	        		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/mailtemplate/mailTemplate"+path+"Modify.do", "target":"_self", "method":"post"}).submit();
	            }
        	}
        }
    });
 	
 	
 	
 	// 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
      	var $frm = $("#searchForm"); 
      	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/mailtemplate/mailTemplate"+path+"List.do", "target":"_self", "method":"post"}).submit();
    }); 
 	
 	// 파일 다운로드
    $(document).on("click", ".file-list-title", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
 	
 // 상품 검색 버튼 클릭 이벤트
    var $productBox = null;
    $(document).on("click", "#productBox .search-product-popup", function () {
        // 해당 그룹의 최 상위 부모 Node
        $productBox = $(this).parents(".section-form");
       
        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });
    
  //상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $productBox.find(".applyProductList .EML_PRD_CD");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
    
 	// 상품구성 체크박스 클릭 이벤트
    $(document).on("change", "#productBox .form-group .checkAll", function () {
        var $this = $(this);
        var $tbody = $this.parents(".table-a").find(".applyProductList");
        var $checkbox = $tbody.find(".checkRow");
        if($checkbox.length == 0)
        {
            $this.prop("checked", false);
        }
        else
        {
            if($this.is(":checked"))
            {
                $checkbox.prop("checked", true);
            }
            else
            {
                $checkbox.prop("checked", false);    
            }
        }
    });
 	
  //상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
    	var bCheck = true;
    	//상품중복체크
    	$.each( params, function( index, el ){
    		if( !fnDuplicationChk( el.PRD_MST_CD )){
    			alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
				bCheck = false;
    			return false;
    		}
    	});
    	if( bCheck ){
        	//기본TR삭제
        	$productBox.find(".productNodata").remove();
        	//배열재정의
        	var arrayObj = new Array();
        	var len = $productBox.find(".applyProductList .EML_PRD_CD").length;
        	
    		var obj;
    		$.each(params, function(index,item){
    			len++;
    			obj = new Object();
        		obj.PRD_MST_CD 				= item.PRD_MST_CD;
        		obj.PRD_MST_NM 			= item.PRD_MST_NM;
        		obj.PRD_MST_PRC     	= setComma(item.PRD_MST_PRC);
        		obj.PRD_MST_DLV_FEE    	= setComma(item.PRD_MST_DLV_FEE);
        		obj.PRD_MST_SEL_STATE 		= item.PRD_MST_SEL_STATE;
        		obj.VDR_MST_NM            = item.VDR_MST_NM;
        		obj.PLN_DTL_ORDER            = len;
        		obj.NUM = $productBox.find(".groupNum").val();
        		if ( item.PRD_MST_SEL_STATE_CODE == '<c:out value="${Code.PRODUCT_SELL_STATE_ING}" />' )
        		{
        		    obj.PRD_MST_SEL_STATE_CLASS = "b";
        		}
        		else
        		{
        		    obj.PRD_MST_SEL_STATE_CLASS = "a";
        		}
        		
        		if ( item.PRD_MST_CNL_PC_YN == 'Y' && item.PRD_MST_CNL_MB_YN == 'Y' )
				{
					obj.PRD_MST_CHANNEL_TYPE = "전체";
				}
				else if ( item.PRD_MST_CNL_PC_YN == 'Y' )
				{
					obj.PRD_MST_CHANNEL_TYPE = "PC";
				}
				else if ( item.PRD_MST_CNL_MB_YN == 'Y' )
				{
					obj.PRD_MST_CHANNEL_TYPE = "MOBILE";
				}
        		obj.PRD_MST_DPL_STATE = item.PRD_MST_DPL_STATE;
        		
				obj.FRONT_URL = '<c:out value="${frontDomain}" />';
        		
        		obj.serverDomain 			= '<c:out value="${serverDomain}" />';
        		
        		
        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        	});
    		$( "#productTemplate" ).tmpl( arrayObj ).appendTo($productBox.find(".applyProductList"));
    	}
    	return true;
    };
    
    // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", ".goProductDelete", function () {
        
        var $topParent = $(this).parents(".section-form");
        if($topParent.find(".checkRow:checked").length == 0)
        {
            alert("삭제할 상품을 선택하여 주십시오.");
            return;
        }
        
        $topParent.find(".applyProductList").children("tr").each(function() {
            
            if($(this).find(".checkRow").is(":checked"))
            {
                $(this).remove();
            }
        });
        
        if($topParent.find(".applyProductList").children("tr").length == 0)
        {
            $topParent.find(".applyProductList").append('<tr class="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $topParent.find(".checkAll").prop("checked", false);
        
    });
    
 // 상품 그룹 추가 버튼 클릭 이벤트
    $(document).on("click", ".addProductGroup", function () {
       addProductGroup(); // 상품 그룹 추가
    });
 	
	 // 상품 그룹 추가
    function addProductGroup()
    {
        var $productBox = $("#productBox");
        var addLength = 1;
        
        var arrayObj = new Array();
        for(var i = 0 ; i < addLength ; i++)
        {
            var obj = new Object();
            obj.NUM = productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
            arrayObj.push(obj);    
        }
        $("#productGroupTemplate").tmpl(arrayObj).appendTo($productBox);
    }
	 
 	// 상품 그룹 삭제 버튼 클릭 이벤트
    $(document).on("click", "#productBox .product-group-delete", function () {
        removeProductGroup(0, $(this)); // 상품 그룹 삭제
    });
 	
	 // 상품 그룹 삭제
    removeProductGroup = function (maxLength, $obj)
    {
        if($obj != undefined)
        {
            // 상품 그룹 삭제
            var $thisSectionForm = $obj.parents(".section-form");
            var $productBox = $thisSectionForm.parent();
            $thisSectionForm.remove();
            
            // 상품 그룹 순서 정렬
            var $sectionForm = $productBox.find(".section-form");
            $sectionForm.each(function (index) {
                var $this = $(this);
                $this.find(".groupNum").val(index);
                $this.find(".EML_GRP_NM").prop("name", "EML_GRP_NM" + index);
                $this.find(".EML_PRD_CD").prop("name", "EML_PRD_CD" + index);
            });
        }
        else
        {
            var $sectionForm = $("#productBox").find(".section-form");
            $sectionForm.each(function (index) {
                if(index + 1 > maxLength)
                {
                    $(this).remove();
                }
            });
        }
    };
    
 	// 상품 구성영역 체크
    productGroupCheck = function (checkLength, type, equal)
    {
        var $productBox = $("#productBox");
        var $sectionForm = $productBox.find(".section-form");
        var groupLength = $sectionForm.length;
        if(type == "max")
        {
            if(equal == "Y")
            {
                if(groupLength >= checkLength) return true;
                else return false;
            }
            else
            {
                if(groupLength > checkLength) return true;
                else return false;
            }
        }
        else
        {
            if(equal == "Y")
            {
                if(groupLength <= checkLength) return true;
                else return false;
            }
            else
            {
                if(groupLength < checkLength) return true;
                else return false;
            }
        }
    };

});

//현재 행 삭제
function rowDelete(row)
{
	$(row).parent().parent().remove();
}
</script>
</body>
</html>