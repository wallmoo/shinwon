<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>
</head>
<body class="basic">

	<div id="skipNavigation">
		<!-- skipNavigation -->
		<a href="#contents" class="sr-only">본문으로 바로가기</a>
	</div>
	<!-- // skipNavigation -->

	<header>
		<!-- header -->
		<%@ include file="/WEB-INF/jsp/am/include/top.jsp"%>
	</header>
	<!-- // header -->

	<div id="container" class="st-container">
		<!-- container -->
		<form id="frmTopLayout" name="frmTopLayout" method="post">
			<input type="hidden" id="selectMenuCode" name="selectMenuCode"
				value="<c:out value="${selectMenuCode }" />" />
		</form>

		<aside id="navigation">
			<!-- navigation -->
			<nav>
				<%@ include file="/WEB-INF/jsp/am/include/left.jsp"%>
			</nav>
		</aside>
		<!-- // navigation -->

		<div id="body">
			<!-- body -->

			<section id="contents"><!-- contents -->

				<div id="breadcrumb"><!-- breadcrumb -->
	                <a href="#none"><i class="icon-home em"></i> HOME</a>
	                &gt;
	                <a href="#none">전시관리</a>
	                &gt;
	                <span>브랜드전시-까사부가티</span>
	            </div><!-- // breadcrumb -->
	
	            <div class="contents-inner"><!-- contents-inner -->
	
	                <h3 class="title">브랜드전시-까사부가티</h3>
	
	                <div class="title-box">
	                    <h4 class="title">
	                    	상세/수정-ITEMS
	                    </h4>
	                </div>
	
	                <p>
	                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
	                </p>
	                <form name="searchForm" id="searchForm">
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchCbtItmDplYn" value="<c:out value="${commandMap.searchCbtItmDplYn }"/>"/>
                    	<input type="hidden" name="searchCbtItmCtg" value="<c:out value="${commandMap.searchCbtItmCtg }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                </form>
	                <form name="frm" id="frm" enctype="multipart/form-data">
	                	<input type="hidden" name="CBT_ITM_IDX"  value="<c:out value="${row.CBT_ITM_IDX }"/>" />
	                	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchCbtItmDplYn" value="<c:out value="${commandMap.searchCbtItmDplYn }"/>"/>
                    	<input type="hidden" name="searchCbtItmCtg" value="<c:out value="${commandMap.searchCbtItmCtg }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                    <double-submit:preventer/>
		                <div class="section-form"><!-- section-form-a -->
	 	                   	<div class="form-group">
		                        <label class="label"><span>상태 </span></label>
		                        <div class="field">
		                            <input type="radio" name="CBT_ITM_DPL_YN" id="stateA" class="radio" value="Y" <c:if test="${row.CBT_ITM_DPL_YN eq 'Y'}"> checked="checked" </c:if>/>
		                            <label for="stateA">전시</label>
		                            <input type="radio" name="CBT_ITM_DPL_YN" id="stateB" class="radio" value="N" <c:if test="${row.CBT_ITM_DPL_YN eq 'N'}"> checked="checked" </c:if>/>
		                            <label for="stateB">미전시</label>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>카테고리<em class="strong">*</em></span></label>
		                        <div class="field">
		                        	 <select id="CBT_ITM_CTG" name="CBT_ITM_CTG" class="select" title="카테고리">
    									<option value="">선택</option>
    									<c:forEach items="${categoryList}" var="data">
     									<option value="<c:out value="${data.CMN_COM_IDX}"/>"  <ui:select v="${data.CMN_COM_IDX}" t="${row.CBT_ITM_CTG}" g="selected"/>>
     									    <c:out value="${data.CMN_COM_NM}"/>
     									</option> 
     								</c:forEach> 
    					           </select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>상품명 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="CBT_ITM_PRD_NM" id="CBT_ITM_PRD_NM" class="text long CBT_ITM_PRD_NM" value="<c:out value="${row.CBT_ITM_PRD_NM }"/>"/>
		                            <span id="msgbyte1">0</span><span id="trMsgMaxByte">/50</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>상품코드 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="CBT_ITM_PRD_MST_CD" id="CBT_ITM_PRD_MST_CD" class="text" value="<c:out value="${row.CBT_ITM_PRD_MST_CD }"/>"/>
		                            <a href="javascript:productPop()" id="popProduct"class="button button-a small popProduct"><span>상품검색</span></a>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>사이즈 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="CBT_ITM_SIZ" id="CBT_ITM_SIZ" class="text long CBT_ITM_SIZ"  value="<c:out value="${row.CBT_ITM_SIZ }"/>"/>
		                            <span id="msgbyte2">0</span><span id="trMsgMaxByte">/50</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>무게 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="CBT_ITM_WGT" id="CBT_ITM_WGT" class="text long CBT_ITM_WGT" value="<c:out value="${row.CBT_ITM_WGT }"/>"/>
		                            <span id="msgbyte3">0</span><span id="trMsgMaxByte">/50</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>디자이너 </span></label>
		                        <div class="field">
		                        	 <select id="CBT_ITM_DSN" name="CBT_ITM_DSN" class="select" title="디자이너">
    									<option value="">선택</option>
    									<c:forEach items="${dsnList}" var="data">
     									<option value="<c:out value="${data.CMN_COM_IDX}"/>"  <ui:select v="${data.CMN_COM_IDX}" t="${row.CBT_ITM_DSN}" g="selected"/>>
     									    <c:out value="${data.CMN_COM_NM}"/>
     									</option> 
     								</c:forEach> 
    					           </select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>상품색상 </span></label>
		                        <div class="field">
		                        	 <select id="CBT_ITM_CLR" name="CBT_ITM_CLR" class="select" title="상품색상">
    									<option value="">선택</option>
    									<c:forEach items="${clrList}" var="data">
     									<option value="<c:out value="${data.CMN_COM_IDX}"/>"  <ui:select v="${data.CMN_COM_IDX}" t="${row.CBT_ITM_CLR}" g="selected"/>>
     									    <c:out value="${data.CMN_COM_NM}"/>
     									</option> 
     								</c:forEach> 
    					           </select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>마감재</span></label>
		                        <div class="field">
		                        	 <select id="CBT_ITM_FNS_MTR" name="CBT_ITM_FNS_MTR" class="select" title="마감재">
    									<option value="">선택</option>
    									<c:forEach items="${mtrList}" var="data">
     									<option value="<c:out value="${data.CMN_COM_IDX}"/>"  <ui:select v="${data.CMN_COM_IDX}" t="${row.CBT_ITM_FNS_MTR}" g="selected"/>>
     									    <c:out value="${data.CMN_COM_NM}"/>
     									</option> 
     								</c:forEach> 
    					           </select>
		                        </div>
		                    </div>
 		                    <div class="form-group">
		                        <label class="label"><span>설명서<em class="strong">*</em></span></label>
		                        <div class="field">
		                        	 <c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '0'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>이미지1(900x900)<em class="strong">*</em></span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file1" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이미지2(900x900)<em class="strong">*</em></span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '2'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file2" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file2" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이미지3(900x900)<em class="strong">*</em></span></label>
		                        <div class="field">
		                       		<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '3'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file3" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file3" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이미지4(900x900)<em class="strong">*</em></span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '4'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file4" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file4" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이미지5(900x900) </span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '5'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file5" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file5" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이미지6(900x900) </span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '6'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file6" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file6" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이미지7(900x900) </span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '7'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file7" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file7" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이미지8(900x900) </span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '8'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file8" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file8" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이미지9(900x900) </span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '9'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file9" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file9" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이미지10(900x900) </span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '10'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file10" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file10" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>제품특성<em class="strong">*</em></span></label>
		                        <div class="field">
		                        	 <textarea class="textarea CBT_ITM_PRD_FET" name="CBT_ITM_PRD_FET" id="CBT_ITM_PRD_FET" style="height: 100px;"><c:out value="${row.CBT_ITM_PRD_FET }"/></textarea>
		                        	 <span id="msgbyte4">0</span><span id="trMsgMaxByte">/500</span>&nbsp;byte
		                        </div>
		                    </div>
		                </div><!-- // section-form-a -->
	                </form>
	
	                <div class="section-button"><!-- section button -->
	                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
	                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
	                </div><!-- // section button -->
	
	            </div><!-- // contents-inner -->

			</section>
			<!-- // contents -->

		</div>
		<!-- // body -->
		<footer>
			<!-- footer -->
			<%@ include file="/WEB-INF/jsp/am/include/footer.jsp"%>
		</footer>
		<!-- // footer -->
	</div>
	<!-- // container -->
	
 
 
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<%-- <script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.extend.js"></script> --%>

 
<script type="text/javascript">
$(document).ready(function() {
	
	
	$(document).on("keyup",".CBT_ITM_PRD_NM",function(){
		getStrByte(this,'#msgbyte1', 50, 2);
	});
	$(document).on("keyup",".CBT_ITM_SIZ",function(){
		getStrByte(this,'#msgbyte2', 50, 2);
	});
	$(document).on("keyup",".CBT_ITM_WGT",function(){
		getStrByte(this,'#msgbyte3', 50, 2);
	});
	$(document).on("keyup",".CBT_ITM_PRD_FET",function(){
		getStrByte(this,'#msgbyte4', 500, 2);
	});
    
	$("#CBT_ITM_PRD_NM").trigger("keyup");
	$("#CBT_ITM_SIZ").trigger("keyup");
	$("#CBT_ITM_WGT").trigger("keyup");
	$("#CBT_ITM_PRD_FET").trigger("keyup");
	 
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/casaItemsList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
     
        if (confirm("저장 하시겠습니까?")) 
        {	 
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/casaItemsModify.do", "target" : "_self", "method" : "post"}).submit();	
        }    
         
    });
    
    $(".cmmFleIdx").each(function(){
		var fileName = $(this).data("file_name");
		$("input[name='"+ fileName +"']").prop("disabled", true);
	});
    
 	// 파일 삭제 check box 변경 이벤트
	$(document).on("change", ".cmmFleIdx", function () {
		var $this = $(this);
		var fileName = $(this).data("file_name");
	 
		if($this.is(":checked"))
		{
			$("input[name='"+ fileName +"']").prop("disabled", false);	
		}
		else
		{
			$("input[name='"+ fileName +"']").val("");
			$("input[name='"+ fileName +"']").prop("disabled", true);
		}
	}); 
   
	productPop = function (rnum) {
    	
        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    };
 	 
  //상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
    	
	  	var prd_mst_cd = params[0].PRD_MST_CD;
    	var prd_mst_erp_cd  = params[0].PRD_MST_ERP_CD;
    	var prd_mst_nm  = params[0].PRD_MST_NM;
    	
    	$("#CBT_ITM_PRD_MST_CD").val(prd_mst_cd);
    	//$("#PRD_MST_ERP_CD").text(prd_mst_erp_cd);
    	$("#CBT_ITM_PRD_NM").val(prd_mst_nm);
    	$("#CBT_ITM_PRD_NM").trigger("keyup");
    	return true;
    };
	 
    
});
</script>
</body>
</html>