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

                <h2 class="title"><span>이벤트관리</span></h2>

                <h3 class="title"><span>수정</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
               
				<form name="tabForm" id="tabForm">
                    <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${row.EVT_MST_IDX }"/>" />
                    <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${row.EVT_MST_TYPE }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>
                <form id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>
			    <form id="frm" name="frm" enctype="multipart/form-data">
			        <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${row.EVT_MST_IDX }"/>" />
			        <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${row.EVT_MST_TYPE }"/>" />
			        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cmnFleAltTxtSurvey" value=""/>
                    <input type="hidden" name="cmnFleAltTxtSurveyIdx" value=""/>
                    <input type="hidden" name="cmmFleIdx5" value=""/>
                    <input type="hidden" id="removeFiles" name="removeFiles" value="" /><!-- 파일삭제관련변수 -->

		  			<table cellspacing="0" class="table-row table-a" id="tblDtl"><!-- table -->
	                    <colgroup>
	                        <col style="width: 170px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody id="tbdDtl">
	                    	<tr>
	                    		<th><label class="label"><span>작성자</span></label></th>
	                    		<td>
	                    			<c:out value="${row.EVT_MST_REG_ID }"/>(<c:out value="${row.EVT_MST_REG_NM }"/>) <ui:formatDate value="${row.EVT_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
	                    		</td>
	                        
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>채널<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="checkbox" class="checkbox" name="EVT_MST_PC_YN" id="EVT_MST_PC_YN" value="Y" <ui:select v="${row.EVT_MST_PC_YN }" t="Y" g="checked"/> /><label for="EVT_MST_PC_YN" > PC</label>
									<input type="checkbox" class="checkbox" name="EVT_MST_MB_YN" id="EVT_MST_MB_YN" value="Y" <ui:select v="${row.EVT_MST_MB_YN }" t="Y" g="checked"/> /><label for="EVT_MST_MB_YN" > MOBILE</label>
	                    		</td>
	                        </tr>
	                         <tr>
	                    		<th><label class="label"><span>이벤트 대상<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<select id="EVT_MST_MEM_GBN" name="EVT_MST_MEM_GBN" class="select" title="이벤트 대상">
										<option value="0">전체</option>
										<option value="1" <ui:select v="${row.EVT_MST_MEM_GBN }" t="1" g="selected"/>>일반회원</option>
										<option value="2" <ui:select v="${row.EVT_MST_MEM_GBN }" t="2" g="selected"/>>간편회원</option>
					                </select>
	                    		</td>
	                        </tr>
	                   
	                        <tr>
	                            <th><label class="label"><span>기간<i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
                            		<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="EVT_MST_ST_DT" name="EVT_MST_ST_DT" readonly="readonly" data-target-end="#EVT_MST_ED_DT" value="<ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy-MM-dd"/>"/>
	                               <select id="EVT_MST_ST_HH" name="EVT_MST_ST_HH">
		                            		<option value="">선택</option>
			                            	<c:forEach begin="0" end="23" step="1" varStatus="i">
			                            		<c:set var="hh" value="${i.index}"/>
			                            		<c:if test="${i.index < 10}">
			                            			<c:set var="hh" value="0${i.index}"/>
			                            		</c:if>
			                            		<option value="${hh}" <c:if test="${row.EVT_MST_ST_HH eq hh}">selected="selected"</c:if>>${hh}</option>
			                            	</c:forEach>
			                            </select>
			                            <select id="EVT_MST_ST_MM" name="EVT_MST_ST_MM">
			                            	<option value="">선택</option>
			                            	<c:forEach begin="0" end="59" step="1" varStatus="i">
			                            		<c:set var="mm" value="${i.index}"/>
			                            		<c:if test="${i.index < 10}">
			                            			<c:set var="mm" value="0${i.index}"/>
			                            		</c:if>
			                            		<option value="${mm}" <c:if test="${row.EVT_MST_ST_MM eq mm}">selected="selected"</c:if>>${mm}</option>
			                            	</c:forEach>
			                            </select>
			                         ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="EVT_MST_ED_DT" name="EVT_MST_ED_DT"  readonly="readonly" data-target-start="#EVT_MST_ST_DT" value="<ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy-MM-dd"/>"/>
									<select id="EVT_MST_ED_HH" name="EVT_MST_ED_HH">
	                        	    	<option value="">선택</option>
		                            	<c:forEach begin="0" end="23" step="1" varStatus="i">
		                            		<c:set var="hh" value="${i.index}"/>
		                            		<c:if test="${i.index < 10}">
		                            			<c:set var="hh" value="0${i.index}"/>
		                            		</c:if>
		                            		<option value="${hh}" <c:if test="${row.EVT_MST_ED_HH eq hh}">selected="selected"</c:if>>${hh}</option>
		                            	</c:forEach>
		                            </select>
		                            <select id="EVT_MST_AUC_MM" name="EVT_MST_ED_MM">
		                            	<option value="">선택</option>
		                            	<c:forEach begin="0" end="59" step="1" varStatus="i">
		                            		<c:set var="mm" value="${i.index}"/>
		                            		<c:if test="${i.index < 10}">
		                            			<c:set var="mm" value="0${i.index}"/>
		                            		</c:if>
		                            		<option value="${mm}" <c:if test="${row.EVT_MST_ED_MM eq mm}">selected="selected"</c:if>>${mm}</option>
		                            	</c:forEach>
		                            </select>
		                            
		                        	<a href="javascript:fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
									<a href="javascript:fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>이벤트명 <i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="EVT_MST_TITLE" id="EVT_MST_TITLE" class="text long" value="<c:out value="${row.EVT_MST_TITLE }"/>" style="width:80%;"/>
		                            (<span id="byte_title">0</span>/50 byte)
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>이벤트형태<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_NORMAL }">
										<label for="eT5">일반형</label>		                            
		                            </c:if>
	                    			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_ENTER }">
										<label for="eT1">응모형</label>
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_SURVEY }">
										<label for="eT2">설문형</label>
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_REPLY }">
										<label for="eT3">덧글형</label>
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_IMAGE }">
										<label for="eT4">이미지형</label>		                            
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_GUIDE }">
										<label for="eT4">안내</label>		                            
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_LUCKYDRAW }">
										<label for="eT4">럭키드로우</label>		                            
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_RANDOM }">
										<label for="eT4">랜덤쿠폰</label>		                            
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_ROULETTE }">
										<label for="eT4">룰렛</label>		                            
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_QUIZ }">
										<label for="eT4">퀴즈</label>		                            
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_ATTENDANCE }">
										<label for="eT4">츨석체크</label>		                            
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_GROUPBUY }">
										<label for="eT4">공동구매</label>		                            
		                            </c:if>
		                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_VOTE }">
										<label for="eT4">투표</label>		                            
		                            </c:if>
		                            <input type="checkbox" name="EVT_MST_WIN_YN" id="stateTopA" value="Y" class="checkbox" <c:if test="${not empty row.EVT_MST_WIN_DT }">checked="checked"</c:if>/>
                               		당첨자발표예정일 :
                               		<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                               		<input type="text" name="EVT_MST_WIN_DT" id="EVT_MST_WIN_DT" class="text" readonly="readonly" value="<ui:formatDate value="${row.EVT_MST_WIN_DT }" pattern="yyyy-MM-dd"/>" />
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>예상 당첨자<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
                    				<input type="text" name="EVT_MST_PRE_WIN" id="EVT_MST_PRE_WIN" class="number short" value="<c:out value="${row.EVT_MST_PRE_WIN }"/>"/>명
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>전시상태<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="radio" name="EVT_MST_USE_YN" id="stateA" class="radio" value="Y" <c:if test="${row.EVT_MST_USE_YN eq 'Y' }">checked="checked"</c:if>/>
		                            <label for="stateA">전시</label>
		                            <input type="radio" name="EVT_MST_USE_YN" id="stateB" class="radio" value="N" <c:if test="${row.EVT_MST_USE_YN eq 'N' }">checked="checked"</c:if>/>
		                            <label for="stateB">미전시</label>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>이벤트 상세 URL<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<c:if test="${(row.EVT_MST_PC_YN eq 'Y') && (row.EVT_MST_MB_YN eq 'N')}">
		                        		PC : <c:out value="${frontDomain }"/>/pc/event/eventView.do?EVT_MST_IDX=${row.EVT_MST_IDX}&EVT_MST_TYPE=${row.EVT_MST_TYPE }
		                        	</c:if>
		                        	<c:if test="${(row.EVT_MST_PC_YN eq 'N') && (row.EVT_MST_MB_YN eq 'Y')}">
		                        		MOBILE : <c:out value="${mobileDomain }"/>/mobile/event/eventView.do?EVT_MST_IDX=${row.EVT_MST_IDX}&EVT_MST_TYPE=${row.EVT_MST_TYPE }
		                        	</c:if>  
		                        	<c:if test="${(row.EVT_MST_PC_YN eq 'Y') && (row.EVT_MST_MB_YN eq 'Y')}">
		                        		PC : <c:out value="${frontDomain }"/>/pc/event/eventView.do?EVT_MST_IDX=${row.EVT_MST_IDX}&EVT_MST_TYPE=${row.EVT_MST_TYPE }<br/>
		                        		MOBILE : <c:out value="${mobileDomain }"/>/mobile/event/eventView.do?EVT_MST_IDX=${row.EVT_MST_IDX}&EVT_MST_TYPE=${row.EVT_MST_TYPE }
		                        	</c:if>	
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>PC 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<div class="form-group pcImgDiv" >
		                    			<div id="multiFile1-list">							
											<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
											<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
												<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
												<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
												<i class="icon-file"></i>
						                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
						                        	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
						                        </a>
												<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file1" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
	                        					<label for="CMM_FLE_IDX">삭제</label>
												
												<%-- <div id="file-box-${fileRow.CMM_FLE_IDX}">
													<i class="icon-file"></i>
													<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
				                                        <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
				                                    </a>
				                                    <a href="javascript:;" class="file-list-remove" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-file_input_id="multiFile1"><span class="label label-a">삭제</span></a>
												</div> --%>
											</c:if>
											</c:forEach>	
										</div>
	                                    <input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />                                    
	                                    <p class="img-text">
	                                        <span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" style="width:70%;"/>
	                                        (<span id="byte_p1">0</span>/20 byte)
	                                        <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
	                                    </p>
                                    </div>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>PC 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
                    		 		<div class="form-group pcImgDiv">
					            		<div id="multiFile2-list">							
											<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
											<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '2'}">
												<c:set var="altTextP2" value="${fileRow.CMN_FLE_ALT_TXT}"/>
												<c:set var="altTextP2Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
												<i class="icon-file"></i>
						                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
						                        	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
						                        </a>
												<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_2" name="CMM_FLE_IDX" data-file_name="file2" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
	                        					<label for="CMM_FLE_IDX">삭제</label>
												
												<%-- <div id="file-box-${fileRow.CMM_FLE_IDX}">
													<i class="icon-file"></i>
													<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
				                                        <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
				                                    </a>
				                                    <a href="javascript:;" class="file-list-remove" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-file_input_id="multiFile2"><span class="label label-a">삭제</span></a>
												</div> --%>
											</c:if>
											</c:forEach>	
										</div>
	                                    <input type="file" name="file2" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
	                                    <p class="img-text">
	                                        <span>대체텍스트</span> <input type="text" value="${altTextP2}" name="CMN_FLE_ALT_TXT_P2" id="CMN_FLE_ALT_TXT_P2" class="text pcImgFile" placeholder="20자 이내로 입력하세요." style="width:70%;"/>
	                                        (<span id="byte_p2">0</span>/20 byte)
	                                        <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P2_IDX" value="${altTextP2Idx}"/>
	                                    </p>
                                    </div>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>MOBILE 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<div class="form-group mobileImgDiv">
	                    				<div id="multiFile3-list">							
											<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
											<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'M' && fileRow.CMM_FLE_SORT == '1'}">
												<c:set var="altTextM1" value="${fileRow.CMN_FLE_ALT_TXT}"/>
												<c:set var="altTextM1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
												<i class="icon-file"></i>
						                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
						                        	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
						                        </a>
												<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_3" name="CMM_FLE_IDX" data-file_name="file3" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
	                        					<label for="CMM_FLE_IDX">삭제</label>
	                        					
	<%-- 											<div id="file-box-${fileRow.CMM_FLE_IDX}"> --%>
	<!-- 												<i class="icon-file"></i> -->
	<%-- 												<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> --%>
	<%-- 			                                        <c:out value="${fileRow.CMM_FLE_ORG_NM }"/> --%>
	<!-- 			                                    </a> -->
	<%-- 			                                    <a href="javascript:;" class="file-list-remove" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-file_input_id="multiFile3"><span class="label label-a">삭제</span></a> --%>
	<!-- 											</div> -->
											</c:if>
											</c:forEach>	
										</div>
	                                    <input type="file" name="file3" id="multiFile3" class="file mobileImgFile" data-attach_cnt="1" data-accept="img" />
	                                    <p class="img-text">
	                                        <span>대체텍스트</span> <input type="text" value="${altTextM1}" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." style="width:70%;"/>
	                                        (<span id="byte_m1">0</span>/20 byte)
	                                        <input type="hidden" class="mobileImgFile" name="CMN_FLE_ALT_TXT_M1_IDX" value="${altTextM1Idx}"/>
	                                    </p>
                                    </div>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
		                    		<div class="form-group mobileImgDiv">
	                    				<div id="multiFile4-list">							
											<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
											<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'M' && fileRow.CMM_FLE_SORT == '2'}">
												<c:set var="altTextM2" value="${fileRow.CMN_FLE_ALT_TXT}"/>
												<c:set var="altTextM2Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
												<i class="icon-file"></i>
						                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
						                        	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
						                        </a>
												<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_4" name="CMM_FLE_IDX" data-file_name="file4" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
	                        					<label for="CMM_FLE_IDX">삭제</label>
	                        					
												<%-- <div id="file-box-${fileRow.CMM_FLE_IDX}">
													<i class="icon-file"></i>
													<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
				                                        <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
				                                    </a>
				                                    <a href="javascript:;" class="file-list-remove" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-file_input_id="multiFile4"><span class="label label-a">삭제</span></a>
												</div> --%>
											</c:if>
											</c:forEach>	
										</div>
	                                    <input type="file" name="file4" id="multiFile4" class="file mobileImgFile" data-attach_cnt="1" data-accept="img" />
	                                    <p class="img-text">
	                                        <span>대체텍스트</span> <input type="text" value="${altTextM2}" name="CMN_FLE_ALT_TXT_M2" id="CMN_FLE_ALT_TXT_M2" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." style="width:70%;"/>
	                                         (<span id="byte_m2">0</span>/20 byte)
	                                        <input type="hidden" class="mobileImgFile" name="CMN_FLE_ALT_TXT_M2_IDX" value="${altTextM2Idx}"/>
	                                    </p>
                                    </div>
	                    		</td>
	                        </tr>
	                        
	                        <!--  -->
                            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_SURVEY }">
	                        <tr id="svyForm">
	                    		<th><label class="label"><span>설문<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
                    				<input type="hidden" name="MAX_NUM" id="MAX_NUM" value="<c:out value="${row.MAX_NUM }"/>"/>  
			                    	<input type="hidden" name="MAX_NUM_FILE" id="MAX_NUM_FILE" value="<c:out value="${row.MAX_NUM_FILE}"/>"/>
			                      	<div class="table-a" style="width:60%">
				                       	<table class="core" >
				                       		<colgroup>
												<col style="width: 20%;" />
												<col style="width: auto;" />
											</colgroup>
											<thead>
												<tr>
			                            			<td>
			                            				유형
			                            			</td>
			                            			<td class="left">
			                            				<c:if test="${row.EVT_MST_SVY_TYPE eq 'T' }"><span>텍스트</span></c:if>
			                            				<c:if test="${row.EVT_MST_SVY_TYPE eq 'I' }"><span>이미지</span></c:if>
			                            				<input type="hidden" name="EVT_MST_SVY_TYPE"  value="<c:out value="${row.EVT_MST_SVY_TYPE }"/>"/>
			                            			</td>
			                            		</tr>
											</thead>
											<c:if test="${row.EVT_MST_SVY_TYPE eq 'T' }">
					                            <tbody id="svyList">
					                            <c:if test="${not empty dtlList }">
                                    				<c:forEach var="dtlRow" items="${dtlList }" varStatus="i">
                                    					<c:if test="${row.MODIFY_YN eq 'Y' }">
						                                    <tr id="svyTemplate<c:out value="${i.index }"/>">
								                            	<td>항목<c:out value="${i.index + 1 }"/><input type="hidden" name="EVT_DTL_NO" id="EVT_DTL_NO<c:out value="${i.index }"/>" value="<c:out value="${dtlRow.EVT_DTL_NO }"/>"/></td>
								                            	<td class="left">
								                            		<input type="text" name="EVT_DTL_NM" id="EVT_DTL_NM<c:out value="${i.index }"/>" class="text EVT_DTL_NM" style="width:50%;" value="<c:out value="${dtlRow.EVT_DTL_NM }"/>"/>
								                            		<c:if test="${i.index eq 0 }">
								                            			<a href="javascript:rowAdd()"class="button button-a small"><span>추가</span></a>
								                            		</c:if>
								                            		<c:if test="${i.index ne 0 }">
								                            			<a href="javascript:rowDelete(<c:out value="${i.index }"/>)"class="button button-a small"><span>삭제</span></a>
								                            		</c:if>
								                            	</td>
								                            </tr>
								                        </c:if>
								                        <c:if test="${row.MODIFY_YN eq 'N' }">
						                                    <tr id="svyTemplate<c:out value="${i.index }"/>">
								                            	<td>항목<c:out value="${i.index + 1}"/><input type="hidden" name="EVT_DTL_NO" id="EVT_DTL_NO<c:out value="${i.index }"/>" value="<c:out value="${dtlRow.EVT_DTL_NO }"/>"/></td>
								                            	<td>
								                            		<span><c:out value="${dtlRow.EVT_DTL_NM }"/></span>
								                            		<input type="hidden" name="EVT_DTL_NM" id="EVT_DTL_NM<c:out value="${i.index }"/>" value="<c:out value="${dtlRow.EVT_DTL_NM }"/>"/>
								                            	</td>
								                            </tr>
								                        </c:if>
						                        	</c:forEach>
                                				</c:if>
                                				 
					                       		</tbody>
					                        </c:if>
					                        
					                        <c:if test="${row.EVT_MST_SVY_TYPE eq 'I' }">
					                            <tbody id="svyImgList">
					                            <c:if test="${not empty dtlImgList }">
                                    				<c:forEach var="dtlRow" items="${dtlImgList }" varStatus="i">
                                    					<c:if test="${row.MODIFY_YN eq 'Y' }">
						                                    <tr id="fileRow<c:out value="${i.index }"/>">
								                            	<td>항목<c:out value="${i.index + 1 }"/><input type="hidden" name="EVT_DTL_NO_F" id="EVT_DTL_NO<c:out value="${dtlRow.EVT_DTL_NO }"/>" value="<c:out value="${dtlRow.EVT_DTL_NO }"/>"/>
								                            	<input type="hidden" name="EVT_DTL_IDX_F<c:out value="${dtlRow.EVT_DTL_NO }"/>" id="EVT_DTL_IDX<c:out value="${dtlRow.EVT_DTL_NO }"/>" value="<c:out value="${dtlRow.EVT_DTL_IDX }"/>"/>
								                            	</td>
								                            	<td class="left">
								                            		<a href="javascript:;" id="fileIdx_<c:out value="${dtlRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${dtlRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${dtlRow.CMM_FLE_SAVE_PATH }"/>"> 
		                                        						<c:out value="${dtlRow.CMM_FLE_ORG_NM }"/> 
 		                                    						</a>
 		                                    						<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_SVY<c:out value="${dtlRow.EVT_DTL_NO }"/>" name="CMM_FLE_IDX_SVY" data-file_name="fileSvy<c:out value="${dtlRow.EVT_DTL_NO }"/>" value="<c:out value="${dtlRow.CMM_FLE_IDX }"/>" />
                    												<label for="CMM_FLE_IDX_SVY<c:out value="${dtlRow.EVT_DTL_NO }"/>">삭제</label>
                    												<br/>
								                            		<span id="defaultSvyFile"><input type="file" name="fileSvy<c:out value="${dtlRow.EVT_DTL_NO }"/>" id="fileSvy[<c:out value="${dtlRow.EVT_DTL_NO }"/>]" class="file EVT_DTL_NO_F" value="" style="width:50%;" /></span>
								                            	</td>
								                            </tr>
								                        </c:if>
								                        <c:if test="${row.MODIFY_YN eq 'N' }">
						                                    <tr id="fileRow<c:out value="${i.index }"/>">
								                            	<td>항목<c:out value="${i.index + 1 }"/><input type="hidden" name="EVT_DTL_NO_F" id="EVT_DTL_NO<c:out value="${dtlRow.EVT_DTL_NO }"/>" value="<c:out value="${dtlRow.EVT_DTL_NO }"/>"/></td>
								                            	<td class="left">
								                            		<a href="javascript:;" id="fileIdx_<c:out value="${dtlRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${dtlRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${dtlRow.CMM_FLE_SAVE_PATH }"/>"> 
		                                        						<c:out value="${dtlRow.CMM_FLE_ORG_NM }"/> 
 		                                    						</a>
 		                                    						<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_SVY<c:out value="${dtlRow.EVT_DTL_NO }"/>" name="CMM_FLE_IDX_SVY" data-file_name="fileSvy<c:out value="${dtlRow.EVT_DTL_NO }"/>" value="<c:out value="${dtlRow.CMM_FLE_IDX }"/>" />
                    												<label for="CMM_FLE_IDX_SVY<c:out value="${dtlRow.EVT_DTL_NO }"/>">삭제</label>
                    												<br/>
								                            		<span id="defaultSvyFile"><input type="file" name="fileSvy<c:out value="${dtlRow.EVT_DTL_NO }"/>" id="fileSvy[<c:out value="${dtlRow.EVT_DTL_NO }"/>]" class="file EVT_DTL_NO_F" value="" style="width:50%;" /></span>
								                            	</td>
								                            </tr>
								                        </c:if>
						                        	</c:forEach>
                                				</c:if>
					                       		</tbody>
					                        </c:if>
				                        </table>
			                        </div>
			                        <c:if test="${row.EVT_MST_SVY_TYPE eq 'I' }">
			                        <span><a id="rowAddFile" href="#none" class="button button-a small"><span>추가</span></a></span>
			                        </c:if>
				                </td>
                        
                       		</tr>
                            </c:if>
	                        <tr>
	                    		<th><label class="label"><span>포인트 설정<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
		                        	<select id="EVT_MST_PIT_GBN" name="EVT_MST_PIT_GBN" class="select" title="포인트 설정">
										<option value="N" <c:if test="${row.EVT_MST_PIT_GBN eq 'N' }">selected="selected"</c:if>>사용안함</option>
										<option value="Y" <c:if test="${row.EVT_MST_PIT_GBN eq 'Y' }">selected="selected"</c:if>>적립</option>
										<option value="A" <c:if test="${row.EVT_MST_PIT_GBN eq 'A' }">selected="selected"</c:if>>차감</option>
					                </select>			
					                		   
					                <span id="EVT_MST_PIT_S">
					                	<input type="text" id="EVT_MST_PIT" name="EVT_MST_PIT" class="short number" maxlength="10" value="<c:out value="${row.EVT_MST_PIT }"/>"/>점
					                </span>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>ID당 응모 중복여부</span></label></th>
	                    		<td>
	                    			 <input type="checkbox" class="checkbox" name="EVT_MST_DUP_ETR" id="EVT_MST_DUP_ETR" value="Y" <ui:select v="${row.EVT_MST_DUP_ETR }" t="Y" g="checked"/>/><label for="EVT_MST_DUP_ETR" > 중복허용</label>
	                    		</td>
	                        </tr>
	                    </tbody>
                	</table><!-- // table -->
                    <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_LUCKYDRAW }">
                    <h3 class="title"><span>상품</span></h3>
                    <table cellspacing="0" class="table-row table-a" id="tblDtl"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody id="tbdDtl">
                            <tr data-event-type="luckydraw">
                                <th><label class="label"><span>상품수량</span></label></th>
                                <td>
                                     <select id="productCount" name="EVT_PRD_COUNT" >
                                        <option value="1" <c:if test="${row.EVT_PRD_COUNT eq 1}">selected="selected"</c:if>>1</option>
                                        <option value="2" <c:if test="${row.EVT_PRD_COUNT eq 2}">selected="selected"</c:if>>2</option>
                                        <option value="3" <c:if test="${row.EVT_PRD_COUNT eq 3}">selected="selected"</c:if>>3</option>
                                     </select>
                                </td>
                            </tr>
                            <tr data-event-type="luckydraw">
                                <th><label class="label"><span>응모상품 이미지</span></label></th>
                                <td id="fileContainer" >
                                    <div class="form-group pcImgDiv" >
                                            <c:forEach items="${prdFileList}" var="prdFileRow" varStatus="i"> 
                                            <c:if test="${prdFileRow.CMM_FLE_TB_TYPE == 'P' && prdFileRow.CMM_FLE_SORT == '1'}">
                                        <div id="multiFile5-list">                          
                                                <c:set var="altTextP1" value="${prdFileRow.CMN_FLE_ALT_TXT }"/>
                                                <c:set var="altTextP1Idx" value="${prdFileRow.CMM_FLE_IDX}"/>
                                                
                                                <i class="icon-file"></i>
                                                <a href="<c:out value="${cdnDomain}${prdFileRow.CMM_FLE_ATT_PATH}${prdFileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
                                                    <c:out value="${prdFileRow.CMM_FLE_ORG_NM }"/>
                                                </a>
                                                <input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file5" value="<c:out value="${prdFileRow.CMM_FLE_IDX }"/>" />
                                                <label for="CMM_FLE_IDX">삭제</label>
                                                <input type="file" name="file5" id="multiFile5" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />                                    
                                                <p class="img-text">
                                                    <span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" style="width:70%;"/>
                                                    (<span id="byte_p1">0</span>/20 byte)
                                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
                                                </p>
                                            </c:if>
                                            </c:forEach>    
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <h3 class="title"><span>태그설정</span></h3>
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label for="">일반 TAG<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                    <p class="txt_warnning">태그 설정을 위해 '선택' 버튼을 클릭해 주세요.</p>
                                    <div class="tag_cloud_wrap_side">
                                        <div class="tag_cloud_wrap">
                                            <ul class="tag_cloud_list">
                                            </ul>
                                        </div>
                                        <button type="button" class="btn_tag_select">선택</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="">대표 TAG<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                    <select id="representTag" name="TAG_BND_REP_ID" class="select">
                                        <option value="">선택</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <h3 class="title">
                    <span>유의사항</span></h3>
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label for="">PC유의사항 이미지<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                <div id="multiFile6-list">
                                </div>
                                <input type="file" name="file6" id="multiFile6" class="file pcImgFile" data-attach_cnt="1" data-accept=".jpg, .gif, .png" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text"  name="CMN_FLE_ALT_TXT_P3" id="CMN_FLE_ALT_TXT_P3" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20"/>
                                </p>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="">MOBILE<br/>유의사항 이미지<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                <div id="multiFile7-list">
                                </div>
                                <input type="file" name="file7" id="multiFile7" class="file mobileImgFile" data-attach_cnt="1" data-accept=".jpg, .gif, .png" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M3" id="CMN_FLE_ALT_TXT_M3" class="text xlarge" placeholder="20자 이내로 입력하세요." maxlength="20"/>
                                </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </c:if>
                </form>
               	<div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
						<a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button --> 

            </div>

			<form name="fileForm" id="fileForm">
	             <input type="hidden" name="CMM_FLE_IDX" value=""/>
	             <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
	             <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
	        </form>
	        
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
<script id="svyTemplate" type="text/x-jquery-tmpl">
<tr id="svyTemplate\${NUM}">
	<td>항목\${NUMA}<input type="hidden" name="EVT_DTL_NO" id="EVT_DTL_NO\${NUM}" value="\${NUMA}"/></td>
	<td class="left">
		<input type="text" name="EVT_DTL_NM" id="EVT_DTL_NM\${NUM}" class="text EVT_DTL_NM" style="width:50%;"/>
		<a href="javascript:rowDelete('\${NUM}')"class="button button-a small"><span>삭제</span></a>
	</td>
</tr>
</script>

<script>
$(function(){
	$(document).on("keyup","#EVT_MST_TITLE",function(){
		getStrByte(this,'#byte_title', 50, 2);
	});
	$(document).on("keyup","#CMN_FLE_ALT_TXT_P1",function(){
		getStrByte(this,'#byte_p1', 20, 2);
	});
	$(document).on("keyup","#CMN_FLE_ALT_TXT_P2",function(){
		getStrByte(this,'#byte_p2', 20, 2);
	});
	$(document).on("keyup","#CMN_FLE_ALT_TXT_M1",function(){
		getStrByte(this,'#byte_m1', 20, 2);
	});
	$(document).on("keyup","#CMN_FLE_ALT_TXT_M2",function(){
		getStrByte(this,'#byte_m2', 20, 2);
	});
	
	var EVT_MST_TYPE = "${row.EVT_MST_TYPE}";
	//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
	$(".cmmFleIdx").each(function(){
        var fileName = $(this).data("file_name");
        $("input[name='"+ fileName +"']").prop("disabled", true);
	});
	
	//이벤트 형태 
// 	if(EVT_MST_TYPE == "${Code.EVENT_MASTER_TYPE_NORMAL }")//일반형인 경우
// 	{		
// 		$("input[name='EVT_MST_WIN_YN']").prop("disabled",true);
// 		$("#EVT_MST_WIN_DT").prop("disabled",true);
// 	}
// 	else if(EVT_MST_TYPE == "${Code.EVENT_MASTER_TYPE_SURVEY}")//설문형인 경우
// 	{		
// 		$("input[name='EVT_MST_WIN_YN']").prop("disabled",false);
// 		$("#EVT_MST_WIN_DT").prop("disabled",false);
// 	}
// 	else	//응모형,덧글형,경매형,게시판형
// 	{		
// 		$("input[name='EVT_MST_WIN_YN']").prop("disabled",false);
// 		$("#EVT_MST_WIN_DT").prop("disabled",false);
// 	}

	//이벤트 채널에 따라 초기 이미지 show/hide
	if($("input:checkbox[id=EVT_MST_PC_YN]").is(":checked") == false)
	{
		$(".pcImgDiv").hide();
	}
	else if($("input:checkbox[id=EVT_MST_MB_YN]").is(":checked") == false)
	{
		$(".mobileImgDiv").hide();  
	}
    	
	// 이벤트채널 변경시
    $(document).on("click", "#EVT_MST_PC_YN", function () 
    {
    	if($(this).is(":checked") == true) 
    	{
    		$(".pcImgDiv").show();
    	}
    	else
    	{
    		$(".pcImgDiv").hide();
    	}
    });   
    $(document).on("click", "#EVT_MST_MB_YN", function () 
    {
    	if($(this).is(":checked") == true) 
    	{
    		$(".mobileImgDiv").show();
    	}
    	else
    	{
    		$(".mobileImgDiv").hide();
    	}
    });
	
	 
	//당첨자 발표일 체크박스
	$(document).on("click","input[name=EVT_MST_WIN_YN]",function()
	{
		if($(this).is(":checked"))
		{
			$("#EVT_MST_WIN_DT").focus();			
		}else
		{
			$("#EVT_MST_WIN_DT").val("");		
		}
	});
	
	//당첨자 발표 캘린더 체크
	$(document).on("click","#EVT_MST_WIN_DT",function()
	{
		$("input[name=EVT_MST_WIN_YN]").prop("checked",true);
	});
    
 	// 고정 첨부 행 파일 지우기
    $("#delFileData").click(function(e){
    	e.preventDefault();
    	
    	$("#defaultFile").find("input").remove();
    	$("#defaultFile").append('<input type="file" name="file5" id="files[0]" class="file" value=""/>');
    });
 	
  	//파일 삭제를 위한 체크박스 클릭 이벤트
	$(".cmmFleIdx5").click(function(){
		var cmmFleIdx5 = "";
		$("input[name='CMM_FLE_IDX_5']:checked").each(function(){
			cmmFleIdx5 = cmmFleIdx5 + $(this).val() + ",";
		});
		$("input[name='cmmFleIdx5']").val(cmmFleIdx5);		
	});
 
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
    	var cmnFleAltTxtSurvey = "";
    	var cmnFleAltTxtSurveyIdx = "";
    	
    	$.each($("input[name='CMN_FLE_ALT_TXT_S']"),function(index, item)
		{	    		
			cmnFleAltTxtSurvey = cmnFleAltTxtSurvey + $("input[name='CMN_FLE_ALT_TXT_S']").eq(index).val() + ",";						
			$("input[name='cmnFleAltTxtSurvey']").val(cmnFleAltTxtSurvey);	
			cmnFleAltTxtSurveyIdx = cmnFleAltTxtSurveyIdx + $("input[name='CMN_FLE_ALT_TXT_S_IDX']").eq(index).val() + ",";
    		$("input[name='cmnFleAltTxtSurveyIdx']").val(cmnFleAltTxtSurveyIdx);	
		});    	    	
    	
    	
    	if(($("input:checkbox[id=EVT_MST_PC_YN]").is(":checked") == false) && ($("input:checkbox[id=EVT_MST_MB_YN]").is(":checked") == false))
    	{
    		alert("[채널] 반드시 선택해 주십시오.");
    		return;
    	}
    	
    	if($.trim($("#EVT_MST_ST_DT").val()) == ""){
			alert("이벤트 시작일을 입력해 주십시오.");
			$("#EVT_MST_ST_DT").focus();
			return;
		}
    	if($.trim($("#EVT_MST_ED_DT").val()) == ""){
			alert("이벤트 종료일을 입력해 주십시오.");
			$("#EVT_MST_ED_DT").focus();
			return;
		}
    	if($.trim($("#EVT_MST_TITLE").val()) == ""){
			alert("이벤트명을 입력해 주십시오.");
			$("#EVT_MST_TITLE").focus();
			return;
		}
    	
//     	if(EVT_MST_TYPE != "${Code.EVENT_MASTER_TYPE_NORMAL}")
//     	{
//     		if($("input[name='EVT_MST_WIN_YN']:checked").val() != "Y")
//     		{
//     			alert("당첨자 발표일을 입력해 주십시오.");
//     			$("input[name='EVT_MST_WIN_YN']").prop("checked", true);
//     			$("#EVT_MST_WIN_DT").focus();
//     			return;
//     		}
//     	}
    	
    	var $stime = parseInt($("#EVT_MST_ST_HH").val()+$("#EVT_MST_ST_MM").val());
        var $etime = parseInt($("#EVT_MST_ED_HH").val()+$("#EVT_MST_ED_MM").val());
        	
        if(($("#EVT_MST_ST_HH").val() == "") || ($("#EVT_MST_ST_MM").val() == ""))
        {
        	alert("[이벤트시작시간]을 입력해 주십시오.");
        	$("#EVT_MST_ST_HH").focus();
        	return;
        }
        
        if(($("#EVT_MST_ED_HH").val() == "") || ($("#EVT_MST_ED_MM").val() == ""))
        {
        	alert("[이벤트종료시간]을 입력해 주십시오.");
        	$("#EVT_MST_ED_HH").focus();
        	return;
        }
        
        if($.trim($("#EVT_MST_ST_DT").val()) == $.trim($("#EVT_MST_ED_DT").val()))
        {
        	if($stime > $etime)
           	{
           		alert("[이벤트시간]이 잘못 입력되었습니다. \n 다시 입력해 주십시오.");
           		$("#EVT_MST_ST_HH").focus();
           		return false;
           	}	
        }
        
        var EVT_MST_ED = $.trim($("#EVT_MST_ED_DT").val())+$.trim($("#EVT_MST_ED_HH").val()) +$.trim($("#EVT_MST_ED_MM").val());
        var EVT_MST_WIN_DT =$.trim($("#EVT_MST_WIN_DT").val()); 
    	if(EVT_MST_WIN_DT !=""){
    		if(EVT_MST_ED > EVT_MST_WIN_DT+"000000")
    		{
    			alert("당첨자 발표일은 종료일 이후여야 합니다.");
    			$("#EVT_MST_WIN_DT").focus();
    			return;
    		}
    	}
       	
    	var surveyCheckFlag = true;
    	
    	//설문형인 경우 설문항목 체크
       	if(EVT_MST_TYPE == "${Code.EVENT_MASTER_TYPE_SURVEY}")
		{
   
		} 
    	
        //var $frm = $("#frm");
        //if ($frm.valid()) {
        	
        	//이미지 첨부 체크
        	if($("input[name=EVT_MST_PC_YN]:checked").val() == "Y"){//PC
        		//새로 첨부한 이미지
        		//var fileLen = $("#multiFile1-list .MultiFile-title").length;
        		//var fileLen2 = $("#multiFile2-list .MultiFile-title").length;
        		//기존 첨부된 이미지
        		//var oldFileLen = $("#multiFile1-list .file-list-title").length;
        		//var oldFileLen2 = $("#multiFile2-list .file-list-title").length;
        		
        		//새로 첨부한 이미지
        		var file1 = $("input[name='file1']").val();
        		//기존 첨부된 이미지
        		var oldFile1 = $("#CMM_FLE_IDX_1").length;

        		//새로운 첨부파일도 없고 기존 파일도 없는 경우 || 새로운 첨부파일 없는데 기존 파일 삭제한 경우
        		if((file1 == "" && oldFile1 == 0) || (file1 == "" && oldFile1 > 0 && $("#CMM_FLE_IDX_1").is(":checked") == true)){
        			alert("PC 목록 이미지를 등록해 주십시오.");
        			return;    		
        		}else if($.trim($("#CMN_FLE_ALT_TXT_P1").val()) == ""){//대체텍스트 체크
        			alert("PC 목록 이미지 대체 텍스트를 입력해 주십시오.");
        			$("#CMN_FLE_ALT_TXT_P1").focus();
        			return;
        		}
        		
        		//새로 첨부한 이미지
        		var file2 = $("input[name='file2']").val();
        		//기존 첨부된 이미지
        		var oldFile2 = $("#CMM_FLE_IDX_2").length;

        		//새로운 첨부파일도 없고 기존 파일도 없는 경우 || 새로운 첨부파일 없는데 기존 파일 삭제한 경우
        		if((file2 == "" && oldFile2 == 0) || (file2 == "" && oldFile2 > 0 && $("#CMM_FLE_IDX_2").is(":checked") == true)){
        			alert("PC 상세 이미지를 등록해 주십시오.");
        			return;    		
        		}else if($.trim($("#CMN_FLE_ALT_TXT_P2").val()) == ""){//대체텍스트 체크
        			alert("PC 상세 이미지 대체 텍스트를 입력해 주십시오.");
        			$("#CMN_FLE_ALT_TXT_P2").focus();
        			return;
        		}
        		

        	}
        	if($("input[name=EVT_MST_MB_YN]:checked").val() == "Y"){
        		//새로 첨부한 이미지
        		//var fileLen = $("#multiFile3-list .MultiFile-title").length;
        		//var fileLen2 = $("#multiFile4-list .MultiFile-title").length;
        		//기존 첨부된 이미지
        		//var oldFileLen = $("#multiFile3-list .file-list-title").length;
        		//var oldFileLen2 = $("#multiFile4-list .file-list-title").length;
        		
        		//새로 첨부한 이미지
        		  var file3 = $("input[name='file3']").val();
        		//기존 첨부된 이미지
        		  var oldFile3 = $("#CMM_FLE_IDX_3").length;

        		//새로운 첨부파일도 없고 기존 파일도 없는 경우 || 새로운 첨부파일 없는데 기존 파일 삭제한 경우
        		if((file3 == "" && oldFile3 == 0) || (file3 == "" && oldFile3 > 0 && $("#CMM_FLE_IDX_3").is(":checked") == true)){
        			alert("MOBILE 목록 이미지를 등록해 주십시오.");
        			return;    		
        		}else if($.trim($("#CMN_FLE_ALT_TXT_M1").val()) == ""){//대체텍스트 체크
        			alert("MOBILE 목록 이미지 대체 텍스트를 입력해 주십시오.");
        			$("#CMN_FLE_ALT_TXT_M1").focus();
        			return;
        		} 
        		
        		//새로 첨부한 이미지
        		var file4 = $("input[name='file4']").val();
        		//기존 첨부된 이미지
        		var oldFile4 = $("#CMM_FLE_IDX_4").length;

        		//새로운 첨부파일도 없고 기존 파일도 없는 경우 || 새로운 첨부파일 없는데 기존 파일 삭제한 경우
        		if((file4 == "" && oldFile4 == 0) || (file4 == "" && oldFile4 > 0 && $("#CMM_FLE_IDX_4").is(":checked") == true)){
        			alert("MOBILE 상세 이미지를 등록해 주십시오.");
        			return;    		
        		}else if($.trim($("#CMN_FLE_ALT_TXT_M2").val()) == ""){//대체텍스트 체크
        			alert("MOBILE 상세 이미지 대체 텍스트를 입력해 주십시오.");
        			$("#CMN_FLE_ALT_TXT_M2").focus();
        			return;
        		}
        		

        	}
        	
        	if(surveyCheckFlag)
        	{
        		if (confirm("저장 하시겠습니까?")) {                	
                    $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventModify.do", "target" : "_self", "method" : "post"}).submit();
                }	
        	}            
        //}
    });
    
    // 응모자 탭 클릭 이벤트
    $(document).on("click", "#goEventEntryList", function () {       
    	
    	$("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target" : "_self", "method" : "post"}).submit();
    	
//         if("${row.EVT_MST_TYPE}" == "${Code.EVENT_MASTER_TYPE_NORMAL}"){
//     	//일반형
//         	$("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target" : "_self", "method" : "post"}).submit();
//     	}else if("${row.EVT_MST_TYPE}" == "${Code.EVENT_MASTER_TYPE_REPLY}"){
//     	//댓글형
//     		$("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target" : "_self", "method" : "post"}).submit();
//     	}else if("${row.EVT_MST_TYPE}" == "${Code.EVENT_MASTER_TYPE_IMAGE}"){
//     	//이미지형
//     		$("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target" : "_self", "method" : "post"}).submit();
//     	}
    
    });
    
    // 당첨자 탭 클릭 이벤트
    $(document).on("click", "#goEventEntryWinnerList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerList.do", "target" : "_self", "method" : "get"}).submit();
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
 	
    if($("#EVT_MST_PIT_GBN").val()=="N")
    {
    	$("#EVT_MST_PIT_S").hide();	
    }
    else
    {
    	$("#EVT_MST_PIT_S").show();
    }
    
    $(document).on("click", "#EVT_MST_PIT_GBN", function () 
  	{
    	
      	var gb = $(this).val();
       	
       	if(gb=="N") 
       	{
       		$("#EVT_MST_PIT_S").hide();
       	}
       	else
       	{
       		$("#EVT_MST_PIT_S").show();
       	}
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
    
    $(document).on("click", "input[name=EVT_MST_SVY_TYPE]", function () 
    {
       	var gb  =$("input[name=EVT_MST_SVY_TYPE]:checked").val();
        	    	
      	if(gb=="T") 
       	{
       		$("#svyImgList").hide();
       		$("#svyList").show();
       	}
       	else
       	{
       		$("#svyList").hide();
       		$("#svyImgList").show();
       	}
    });   
    	    
    	    
    // 파일 행 추가 클릭 이벤트
    $("#rowAddFile").click(function(){
    	var $svyImgList = $("#svyImgList");
    	var addLength = 1;
    	var arrayObj = new Array();
    	var $obj = $(".EVT_DTL_NO_F");
    	var len = $obj.length;
    	var lenM = parseInt(len);
    	 			
    	var fileNum = $("#MAX_NUM_FILE").val();
    	//if(fileNum == "1")
    	//{
    		$("#MAX_NUM_FILE").val(lenM);
    		fileNum = lenM;
    	//}
    	 		
    	fileNum = parseInt(fileNum) + 1;
    	 		
    	$("#MAX_NUM_FILE").val(fileNum);
    	 		
    	html ='<tr id="fileRow'+fileNum+'"><td>항목'+ fileNum +'<input type="hidden" name="EVT_DTL_NO_F" id="EVT_DTL_NO'+ fileNum +'" value="'+ fileNum +'"/></td>';
    	html += '<td class="left"><input type="file" class="file EVT_DTL_NO_F" name="fileSvy'+ fileNum +'" id="fileSvy['+ fileNum +']"  style="width:50%;"/> <a href="javascript:rowDelFile('+ fileNum +')" class="button button-a small"><span>삭제</span></a></td></tr>';
    	$("#svyImgList").append(html);
    	// 고정 첨부파일 행 파일지우기 비활성화
    	$("#delSvyFile").hide();
    	    	
	});
    	    
    // 고정 첨부 행 파일 지우기
    $("#delSvyFile").click(function(e){
      	e.preventDefault();   
        	
      	//$("#fileSvy[0]").empty();
       	$("#defaultSvyFile").empty();
       	$("#defaultSvyFile").append('<input type="file" name="fileSvy" id="fileSvy[0]" class="file" value="" style="width:50%;"/>');
    	    	
    });
    
    /*
     *  이벤트 타입에 따른 tr show/hide
     *  3174 : 럭키드로우
     *
     *
     *
     *
     */
     // 럭키드로우
     if(EVT_MST_TYPE == '3174')
     {
         var showBox = $()
     }
});

function rowAdd()
{
	
    var $svyList = $("#svyList");
    var addLength = 1;
    var arrayObj = new Array();
    var $obj = $(".EVT_DTL_NM");
	var len = $obj.length;
	var lenM = parseInt(len) - 1 ;
		
	var maxnum = $("#MAX_NUM").val();
	//if(maxnum == "0")
	//{
		$("#MAX_NUM").val(lenM);
		maxnum = lenM;
	//}
		
    for(var i = 0 ; i < addLength ; i++)
    {
        var obj = new Object();
        obj.NUM = parseInt(maxnum) + 1 + i;// productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
        obj.NUMA = parseInt(maxnum) + 2 + i;
        $("#MAX_NUM").val(parseInt(maxnum) + 1 + i);
        arrayObj.push(obj);    
    }
    
    $("#svyTemplate").tmpl(arrayObj).appendTo($svyList);
}
function rowDelete(rnum)
{	
 	if($("#MAX_NUM").val() == parseInt(rnum))
	{
		var temp = $("#MAX_NUM").val();
		temp = parseInt(temp) - 1;
		$("#MAX_NUM").val(temp);
	}
	
	$("#svyTemplate"+rnum).remove();
	var $obj = $(".EVT_DTL_NM");
	var len = $obj.length;
	if(len==1)$("#MAX_NUM").val("0");
	
	 
}

//현재 행 삭제
function rowDelFile(row)
{
	$("#fileRow"+row).remove();
	
	if($("#MAX_NUM_FILE").val() == row)
	{
		var temp = $("#MAX_NUM_FILE").val();
		temp = parseInt(temp) - 1;
		$("#MAX_NUM_FILE").val(temp);
	}
	
	// 고정 첨부파일 행 파일지우기 활성화
 	if($(".EVT_DTL_NO_F").length == 1)
 	{
 		$("#MAX_NUM_FILE").val("1");
		$("#delSvyFile").show();

 	}
}

//태그 선택 버튼 클릭 이벤트
$(document).on("click", ".btn_tag_select",function() {
  popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do","900", "500", "yes");
});

//태그 선택 callbackFn
fnResultTag = function(params) {
  $(".tag_cloud_list").children().remove()
  $("#representTag").find("option").remove();
  for (var i = 0; i < params.length; i++) {
      $(".tag_cloud_list").append('<li class="sel_tag_list txt" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'">' + params[i].value + '<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'"/></li>').parents('.tag_cloud_wrap_side').siblings('.txt_warnning').hide();
      $("#representTag").append('<option value="' + params[i].TAG_MST_ID + '"name="'+ params[i].TAG_MST_ID +'">'+ params[i].value + '</option>');
  }
}

//태그 삭제 이벤트
$(document).on("click", ".btn_del", function() {
    var tagLangth = $('.tag_cloud_list > li').length;
    if (tagLangth <= 1) {
        $('.tag_cloud_wrap_side').siblings('.txt_warnning').show();
        $("#representTag").append('<option value="선택" selected>선택</option>');
    }
    var origin = $(this).parent();
    $('.tag_cloud_list li').each(function(index, item) {
        if ($(this).attr('value') == origin.attr('value')) {
            $(this).remove();
            $("#representTag option:eq(" + index + ")").remove();
            return false;
        }
    })
});
//-->
</script>

</body>
</html>
