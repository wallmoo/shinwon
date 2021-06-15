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

            <h2 class="title"><span>채널ON</span></h2>

            <h3 class="title"><span>상세수정</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
            <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
                    <input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
            </form>
            
            <form name="searchForm" id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchCntMstShopType" value="<c:out value="${commandMap.searchCntMstShopType }"/>"/>
                    <input type="hidden" name="searchCntMstTitle" value="<c:out value="${commandMap.searchCntMstTitle }"/>"/>
                    <input type="hidden" name="searchCNTMstStDt" value="<c:out value="${commandMap.searchCNTMstStDt }"/>"/>
                    <input type="hidden" name="searchCNTMstEdDt" value="<c:out value="${commandMap.searchCNTMstEdDt }"/>"/>
                    <input type="hidden" name="searchCntMstUseYn" value="<c:out value="${commandMap.searchCntMstUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.searchPlnMstUseYn }"/>" />
            </form>
            
            <form name="frm" id="frm" enctype="multipart/form-data">
            
            <div class="section-form"><!-- section-form-a -->
                <input type="hidden" name="CNT_MST_IDX" value="${row.CNT_MST_IDX }"/>
                <input type="hidden" name="CNT_MST_TYPE" value="TYPE_CHANNEL_ON"/>
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><label class="label"><span>작성자</span></label></th>
                            <td>${row.CNT_MST_REG_NM }</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>채널</span></label></th>
                            <td>
                                <input type="checkbox" class="checkbox" name="CNT_MST_CHANNEL_PC_YN" id="CNT_MST_CHANNEL_PC_YN"  <c:if test="${row.CNT_MST_CHANNEL_PC_YN eq 'Y' }">checked="checked"</c:if> /><label for="CNT_MST_CHANNEL_PC_YN" > PC</label>
                                <input type="checkbox" class="checkbox" name="CNT_MST_CHANNEL_MOBILE_YN" id="CNT_MST_CHANNEL_MOBILE_YN"  <c:if test="${row.CNT_MST_CHANNEL_MOBILE_YN eq 'Y' }">checked="checked"</c:if>/><label for="CNT_MST_CHANNEL_MOBILE_YN" > MOBILE</label>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>기간<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                               	<input type="text" class="text" id="CNT_MST_ST_DT" name="CNT_MST_ST_DT" readonly="readonly" data-target-end="#CNT_MST_ED_DT" value="<ui:formatDate value="${row.CNT_MST_ST_DT }" pattern="yyyy-MM-dd"/>"/>
                               	<select id="CNT_MST_ST_HH" name="CNT_MST_ST_HH" class="CNT_MST_ST_HH">
                      	  			<option value="">시</option>
	                        	<c:forEach begin="0" end="23" step="1" varStatus="i">
	                        		<c:set var="hh" value="${i.index}"/>
	                        		<c:if test="${i.index < 10}">
	                        			<c:set var="hh" value="0${i.index}"/>
	                        		</c:if>
	                        		<option value="${hh}" <c:if test="${row.CNT_MST_ST_HH eq hh}">selected="selected"</c:if> >${hh}</option>
	                        	</c:forEach>
                       			</select>

		                        <select id="CNT_MST_ST_MI" name="CNT_MST_ST_MI" class="CNT_MST_ST_MI">
		                        	<option value="">분</option>
		                        	<c:forEach begin="0" end="59" step="1" varStatus="i">
		                        		<c:set var="mm" value="${i.index}"/>
		                        		<c:if test="${i.index < 10}">
		                        			<c:set var="mm" value="0${i.index}"/>
		                        		</c:if>
		                        		<option value="${mm}" <c:if test="${row.CNT_MST_ST_MI eq mm}">selected="selected"</c:if> >${mm}</option>
		                        	</c:forEach>
		                         </select>
								~
								<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
								<input type="text" class="text" id="CNT_MST_ED_DT" name="CNT_MST_ED_DT"  readonly="readonly" data-target-start="#CNT_MST_ST_DT" value="<ui:formatDate value="${row.CNT_MST_ED_DT }" pattern="yyyy-MM-dd"/>"/>
								<select id="CNT_MST_ED_HH" name="CNT_MST_ED_HH" class="CNT_MST_ED_HH">
                      	  			<option value="">시</option>
	                        	<c:forEach begin="0" end="23" step="1" varStatus="j">
	                        		<c:set var="hh" value="${j.index}"/>
	                        		<c:if test="${j.index < 10}">
	                        			<c:set var="hh" value="0${j.index}"/>
	                        		</c:if>
	                        		<option value="${hh}" <c:if test="${row.CNT_MST_ED_HH eq hh}">selected="selected"</c:if> >${hh}</option>

	                        	</c:forEach>
                       			</select>
		                        <select id="CNT_MST_ED_MI" name="CNT_MST_ED_MI" class="CNT_MST_ED_MI">
		                        	<option value="">분</option>
		                        	<c:forEach begin="0" end="59" step="1" varStatus="i">
		                        		<c:set var="mm" value="${i.index}"/>
		                        		<c:if test="${i.index < 10}">
		                        			<c:set var="mm" value="0${i.index}"/>
		                        		</c:if>
		                        		<option value="${mm}" <c:if test="${row.CNT_MST_ED_MI eq mm}">selected="selected"</c:if>  >${mm}</option>
		                        	</c:forEach>
		                         </select>
	                            <a href="javascript:fnDateSet('CNT_MST_ST_DT', 'CNT_MST_ED_DT', 0, 0, 0, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
                                <a href="javascript:fnDateSet('CNT_MST_ST_DT', 'CNT_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                <a href="javascript:fnDateSet('CNT_MST_ST_DT', 'CNT_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                <a href="javascript:fnDateSet('CNT_MST_ST_DT', 'CNT_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>전시여부</span></label></th>
                            <td>
                                <input type="radio" name="CNT_MST_USE_YN" id="stateA" class="radio" value="Y" <c:if test="${row.CNT_MST_USE_YN eq 'Y'}">checked="checked"</c:if>/>
                                <label for="stateA">전시</label>
                                <input type="radio" name="CNT_MST_USE_YN" id="stateB" class="radio" value="N" <c:if test="${row.CNT_MST_USE_YN eq 'N'}">checked="checked"</c:if> />
                                <label for="stateB">미전시</label>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>유형<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <select class="select" name="PRD_CTG_IDX" id="PRD_CTG_IDX">
                                    <option value="">선택</option>
                                    <c:forEach var="category" items="${listMenuCategory }" varStatus="i">
                                        <option value="<c:out value="${category.PRD_CTG_IDX }"/>" <c:if test="${category.PRD_CTG_NM eq row.CTG_TYPE}">selected="selected"</c:if>>
                                          <c:out value="${category.PRD_CTG_NM }"/>
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>시즌<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <select class="select" name="CNT_MST_SEASON" id="CNT_MST_SEASON">
									<option value="">선택</option>
										<c:forEach var="season" items="${seasonList }" varStatus="i">
	                                        <option value="<c:out value="${season.CMN_COM_IDX }"/>" <c:if test="${season.CMN_COM_NM eq row.CMN_COM_NM}">selected="selected"</c:if>>
	                                          <c:out value="${season.CMN_COM_NM }"/>
	                                        </option>
	                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>영상 제목<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                  <input type="text" name="CNT_MST_TITLE" id="CNT_MST_TITLE" class="text xlarge" value="<c:out value="${row.CNT_MST_TITLE }"/>"/>
                            </td>
                        </tr>
                        <tr>
                            <th>상단 영상 안내 문구</th>
                            <td><textarea cols="50" rows="10" name="CNT_MST_DESC" id="CNT_MST_DESC">${row.CNT_MST_DESC }</textarea></td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>PC 상단 영상 썸네일</span></label></th>
                            <td>
                                <div id="multiFile5-list">
                                	<c:forEach items="${thumbnailFileList}" var="fileRow" varStatus="i">
									<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P'}">
										<c:set var="altTextP3" value="${fileRow.CMN_FLE_ALT_TXT }"/>
										<c:set var="altTextP3Idx" value="${fileRow.CMM_FLE_IDX}"/>

										<i class="icon-file"></i>
										<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
											<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
										</a>
										<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_5" name="CMM_FLE_IDX" data-file_name="pcThumbnailFile" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
										<label for="CMM_FLE_IDX_5">삭제</label>
									</c:if>
									</c:forEach>
                                </div>
                                <input type="file" name="pcThumbnailFile" id="pcThumbnailFile" value="${altTextP3}" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" value="${altTextP3}" name="CMN_FLE_ALT_TXT_P3" id="CMN_FLE_ALT_TXT_P3" class="text large pcImgFile subText" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" style="width:60%;" maxlength="20"/> (<em class="CMN_FLE_ALT_TXT_P3">0</em> / 20자)
									<input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P3_IDX" value="${altTextP3Idx}"/>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>MOBILE 상단 영상 썸네일 이미지</span></label></th>
                            <td>
                                <div id="multiFile6-list">
	                                <c:forEach items="${thumbnailFileList}" var="fileRow" varStatus="i">
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'M'}">
											<c:set var="altTextM3" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextM3Idx" value="${fileRow.CMM_FLE_IDX}"/>
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_6" name="CMM_FLE_IDX" data-file_name="mobileThumbnailFile" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_6">삭제</label>
										</c:if>
									</c:forEach>
                                </div>
                                <input type="file" name="mobileThumbnailFile" id="mobileThumbnailFile" value="${altTextM3}" class="file mobileImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M3" value="${altTextM3}"  id="CMN_FLE_ALT_TXT_M3" class="text large subText" placeholder="20자 이내로 입력하세요."  style="width:60%;" maxlength="20"/> (<em class="CMN_FLE_ALT_TXT_M3">0</em> / 20자)
									<input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_M3_IDX" value="${altTextM3Idx}"/>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>URL<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" name="CNT_MST_URL" id="CNT_MST_URL" class="text large" value="<c:out value="${row.CNT_MST_URL }"/>"/>
                            </td>
                        </tr>
                        <tr>
                        	<th><label class="label"><span>PC 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                    		<td>
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
										<label for="CMM_FLE_IDX_1">삭제</label>
									</c:if>
									</c:forEach>
								</div>
								<input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .png" />
								<small class="desc">PC 목록이미지 사이즈는 123 * 123 최적화 되어 있습니다.</small>
								<p class="img-text">
									<span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20"/>
									<input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
								</p>
                    		</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>MOBILE 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                    		<td>
                    			<div id="multiFile2-list">
									<c:forEach items="${fileList}" var="fileRow" varStatus="i">
									<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'M' && fileRow.CMM_FLE_SORT == '1'}">
										<c:set var="altTextM1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
										<c:set var="altTextM1Idx" value="${fileRow.CMM_FLE_IDX}"/>

										<i class="icon-file"></i>
										<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
											<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
										</a>
										<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_2" name="CMM_FLE_IDX" data-file_name="file4" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
										<label for="CMM_FLE_IDX_2">삭제</label>
									</c:if>
									</c:forEach>
								</div>
								<input type="file" name="file4" id="multiFile4" class="file mobileImgFile" data-attach_cnt="1" accept=".jpg, .png" />
								<small class="desc">mobile 목록 이미지  사이즈는 123 * 123 최적화 되어 있습니다.</small>
								<p class="img-text">
									<span>대체텍스트</span> <input type="text" value="${altTextM1}" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20"/>
									<input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_M1_IDX" value="${altTextM1Idx}"/>
								</p>
                    		</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>상세타입<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" class="radio" id="planType3" name="CNT_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="I" <c:if test="${row.CNT_MST_DETAIL_TYPE eq 'I' }">checked="checked"</c:if>> <label for="planType3">이미지</label>
                                <input type="radio" class="radio" id="planType4" name="CNT_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="E" <c:if test="${row.CNT_MST_DETAIL_TYPE eq 'E' }">checked="checked"</c:if>> <label for="planType4">에디터</label>
                                <input type="radio" class="radio" id="planType5" name="CNT_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="S" <c:if test="${row.CNT_MST_DETAIL_TYPE eq 'S' }">checked="checked"</c:if>> <label for="planType5">스크립트</label>
                            </td>
                        </tr>
                        
                       	<tr class="detailTypeImage" <c:if test="${row.CNT_MST_DETAIL_TYPE ne 'I' }">style="display:none"</c:if>>
                            <th><label class="label"><span>PC 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                    		<td>
                    			<div id="multiFile3-list">
									<c:forEach items="${fileList}" var="fileRow" varStatus="i">
									<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '2'}">
										<c:set var="altTextP2" value="${fileRow.CMN_FLE_ALT_TXT }"/>
										<c:set var="altTextP2Idx" value="${fileRow.CMM_FLE_IDX}"/>

										<i class="icon-file"></i>
										<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
											<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
										</a>
										<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_3" name="CMM_FLE_IDX" data-file_name="file2" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
										<label for="CMM_FLE_IDX_3">삭제</label>
									</c:if>
									</c:forEach>
								</div>
								<input type="file" name="file2" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .png" />
								<small class="desc">PC 목록이미지 사이즈는 123 * 123 최적화 되어 있습니다.</small>
								<p class="img-text">
									<span>대체텍스트</span> <input type="text" value="${altTextP2}" name="CMN_FLE_ALT_TXT_P2" id="CMN_FLE_ALT_TXT_P2" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20"/>
									<input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P2_IDX" value="${altTextP2Idx}"/>
								</p>
                    		</td>
                        </tr>
                        <tr class="detailTypeImage" <c:if test="${row.CNT_MST_DETAIL_TYPE ne 'I' }">style="display:none"</c:if>>
                            <th><label class="label"><span>MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                    		<td>
                    			<div id="multiFile4-list">
									<c:forEach items="${fileList}" var="fileRow" varStatus="i">
									<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'M' && fileRow.CMM_FLE_SORT == '2'}">
										<c:set var="altTextM2" value="${fileRow.CMN_FLE_ALT_TXT}"/>
										<c:set var="altTextM2Idx" value="${fileRow.CMM_FLE_IDX}"/>

										<i class="icon-file"></i>
										<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
											<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
										</a>
										<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_4" name="CMM_FLE_IDX" data-file_name="file5" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
										<label for="CMM_FLE_IDX_4">삭제</label>
									</c:if>
									</c:forEach>
								</div>
								<input type="file" name="file5" id="multiFile5" class="file mobileImgFile" data-attach_cnt="1" accept=".jpg, .png" />
								<small class="desc">MOBILE 목록이미지 사이즈는 123 * 123 최적화 되어 있습니다.</small>
								<p class="img-text">
									<span>대체텍스트</span> <input type="text" value="${altTextM2}" name="CMN_FLE_ALT_TXT_M2" id="CMN_FLE_ALT_TXT_M2" class="text xlarge mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20"/>
									<input type="hidden" class="mobileImgFile" name="CMN_FLE_ALT_TXT_M2_IDX" value="${altTextM2Idx}"/>
								</p>
                    		</td>
                        </tr>
                        

						<tr class="detailTypeEditor" <c:if test="${row.CNT_MST_DETAIL_TYPE ne 'E' }">style="display:none"</c:if>>
                            <th><label class="label"><span>PC 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                 <textarea class="textarea xlarge" name="CNT_MST_PC_BANNER" id="CNT_MST_PC_BANNER" style="width: 95%; height: 500px; display: none;">${row.CNT_MST_PC_BANNER}</textarea>
                            </td>
                        </tr>
                        <tr class="detailTypeEditor" <c:if test="${row.CNT_MST_DETAIL_TYPE ne 'E' }">style="display:none"</c:if>>
                            <th><label class="label"><span>MOBILE 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                 <textarea class="textarea xlarge" name="CNT_MST_MOBILE_BANNER" id="CNT_MST_MOBILE_BANNER" style="width: 95%; height: 500px; display: none;">${row.CNT_MST_MOBILE_BANNER}</textarea>
                            </td>
                        </tr>
                        

						<tr class="detailTypeScript" <c:if test="${row.CNT_MST_DETAIL_TYPE ne 'S' }">style="display:none"</c:if>>
                            <th><label class="label"><span>PC 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea name="CNT_MST_PC_SCRIPT" rows="8" cols="80">${row.CNT_MST_PC_SCRIPT}</textarea>
                            </td>
                        </tr>
                        <tr class="detailTypeScript" <c:if test="${row.CNT_MST_DETAIL_TYPE ne 'S' }">style="display:none"</c:if>>
                            <th><label class="label"><span>MOBILE 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea name="CNT_MST_MOBILE_SCRIPT" rows="8" cols="80">${row.CNT_MST_MOBILE_SCRIPT}</textarea>
                            </td>
                        </tr>
						<tr>
							<th><label for="">일반 TAG<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<c:if test="${fn:length(tagList) eq 0} ">
									<p class="txt_warnning">태그 설정을 위해 '선택' 버튼을 클릭해 주세요.</p>
								</c:if>
								<div class="tag_cloud_wrap_side">
									<div class="tag_cloud_wrap">
										<ul class="tag_cloud_list">
											<c:forEach var="row" items="${tagList}">
												<li class="sel_tag_list txt" name="TAG_MST_ID" value="${row.TAG_MST_ID}">${row.TAG_MST_TITLE}<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_ID" value="${row.TAG_MST_ID}"></li>
											</c:forEach>
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
									<c:forEach items="${tagList}" var="tag" varStatus="i">
										<option value="${tag.TAG_MST_ID}" <ui:select v="${fn:trim(tag.TAG_BND_REP)}" t="Y" g="selected"/>><c:out value="${tag.TAG_MST_TITLE}"/></option>
									</c:forEach>
								</select>
							</td>
						</tr>
                    </tbody>
                </table><!-- // table -->


                <div class="grid section-button-list">
                <h3 class="title"><span>상품구성</span></h3>
                </div>
                <div id="productBox">
                    <div class="section-form addFormCon productSelectform" data-type="basic">
                        <input type="hidden" name="groupNum" class="groupNum" value="0"/>

                        <table cellspacing="0" class="table-row table-a"><!-- table -->
                            <colgroup>
                                <col style="width: 20%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><label class="label"><span>관련 상품<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                        <div class="text-right">
                                            <a href="#none" class="button small goProductDelete"><span>선택삭제</span></a>
                                            <a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                                        </div>
                                        <table class="core">
                                            <colgroup>
                                                <col style="width: 5%;" />
                                                <col style="width: 8%;" />
                                                <col style="width: 10%;" />
                                                <col style="width: auto;" />
                                                <col style="width: 10%;" />
                                                <col style="width: 10%;" />
                                                <col style="width: 8%;" />
                                                <col style="width: 8%;" />
                                                <col style="width: 5%;" />
                                                <col style="width: 5%;" />
                                                <col style="width: 5%;" />
                                                <col style="width: 8%;" />
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th><input type="checkbox" class="checkbox checkAll" /></th>
                                                    <th>상품코드</th>
                                                    <!-- 수정시 노출 -->
                                                    <th>이미지</th>
                                                    <!-- // 수정시 노출 -->
                                                    <th>상품명</th>
                                                    <th>브랜드</th>
                                                    <th>판매가</th>
                                                    <th>판매상태</th>
                                                    <th>전시순서</th>
                                                </tr>
                                            </thead>
                                            <tbody class="applyProductList">
                                                <c:forEach var="item" items="${detailList }" varStatus="i">
													
										   			<tr>
														<td>
															<input type="checkbox" class="checkbox checkRow" id="PRD_MST_CD_${item.CNT_PRD_MST_CD}" name="PRD_MST_CDs" value="${item.CNT_PRD_MST_CD}" />
															<input type="hidden" name="CNT_PRD_MST_CD0" value="${item.CNT_PRD_MST_CD}" />
														</td>
														<td>
															<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${item.CNT_PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
																<c:out value="${item.CNT_PRD_MST_CD }" />
															</a>
														</td>
														<td><img src="${cdnDomain}${item.PRD_IMAGE }" alt="${item.PRD_IMAGE_ALT }"></td>
														<td class="left">
															<a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=${item.CNT_PRD_MST_CD}&ADMIN=Y" target="_blank">
																<c:out value="${item.PRD_MST_NM }" />
															</a>
														</td>
														<td><c:out value="${item.BND_MST_BRAND_NM}" /></td>
														<td>${item.PRD_MST_PRC}</td>
														<td>
															<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}" >판매중</c:if>
															<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_READY}" >등록대기</c:if>
															<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" >품절상품</c:if>
															<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" >미판매</c:if>
														</td>
														<td>
														<!-- <input type="text" name="CNT_DTL_ORDER_<c:out value="${i.index }"/>_<c:out value="${item.CNT_PRD_MST_CD}"/>" class="text short number" value="<c:out value="${item.CNT_DTL_ORDER }"/>" maxlength="5"/>-->
															<a href="javascript:;" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△</a>
                                  							<a href="javascript:;" class="row-sort" data-sort_type="down" onclick="moveDown(this)">▽</a>
															<input type="hidden" name="CNT_DTL_ORDER_${item.CNT_PRD_MST_CD}" value="${item.CNT_DTL_ORDER}"/>
														</td>
													</tr>
													
												</c:forEach>

                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div><!-- //section-form addFormCon -->
                    </div><!-- //id="product" -->
                </div>
            </form>
            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                    <a href="#none" id="goList" class="button large"><span>목록</span></a>
                </div>
            </div><!-- // section-button -->

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
<ui:editor objId="#CNT_MST_PC_BANNER" num="1"/>
<ui:editor objId="#CNT_MST_MOBILE_BANNER" num="2"/>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
    <td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" class="CNT_PRD_MST_CD" name="CNT_PRD_MST_CD\${NUM}" value="\${PRD_MST_CD}"/></td>
	<td><img src="\${PRD_IMAGE}" alt="\${PRD_IMAGE_ALT}"></td>
    <td class="left"> <a href="\${FRONT_URL}/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&ADMIN=Y" target="_blank">\${PRD_MST_NM}</a></td>
    <td>\${BND_MST_BRAND_NM}</td>
    <td>\${PRD_NOW_DST_PRICE}</td>
    <td>\${PRD_MST_SEL_STATE}</td>
    <td>
		<c:if test="${row.CNT_DTL_ORDER ne 1 }">
        <a href="#none" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
        </c:if><c:if test="${row.CNT_DTL_ORDER ne fn:length(list) }">
 		<a href="#none" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
        </c:if>
		<input type="hidden" name="CNT_DTL_ORDER_\${PRD_MST_CD}" value="\${CNT_DTL_ORDER}"></input>
    </td>
</tr>
</script>

<script>

detailType = "planType3"
$(function(){
	
	//태그 선택 버튼 클릭 이벤트
	$(document).on("click", ".btn_tag_select",function() {
		popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do","900", "500", "yes");
	});

	fnResultTag = function(params) {
		$(".tag_cloud_list").children().remove()
		$("#representTag").find("option").remove();
		for (var i = 0; i < params.length; i++) {
			$(".tag_cloud_list").append('<li class="sel_tag_list txt" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'">' + params[i].value + '<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'"/></li>').parents('.tag_cloud_wrap_side').siblings('.txt_warnning').hide();
			$("#representTag").append('<option value="' + params[i].TAG_MST_ID + '">' + params[i].value + '</option>');
		}
	}
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

    // 대체텍스트
    $(document).on( "keyup", ".subText", function() {
    	var id = $(this).prop("id");
    	$("." + id).text($(this).val().length);
	});

    // 등록 이벤트
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
        
        //사용상품 삭제시 순서 재배치
        var index = 1;
        $topParent.find(".applyProductList").children("tr").each(function() {
        	$(this).children()[7].children[2].value = index++;
        });

        if($topParent.find(".applyProductList").children("tr").length == 0)
        {
            $topParent.find(".applyProductList").append('<tr class="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $topParent.find(".checkAll").prop("checked", false);

    });
	
    $(document).on("click", "#goRegist", function() {
    	
    	if($("#CNT_MST_CHANNEL_PC_YN").is(":checked")){
    		$("#CNT_MST_CHANNEL_PC_YN").val("Y")
    	}else{
    		$("#CNT_MST_CHANNEL_PC_YN").val("N")
    	}
    	if($("#CNT_MST_CHANNEL_MOBILE_YN").is(":checked")){
    		$("#CNT_MST_CHANNEL_MOBILE_YN").val("Y")
    	}else{
    		$("#CNT_MST_CHANNEL_MOBILE_YN").val("N")
    	}
    	if($.trim($("#CNT_MST_ST_DT").val()) == ""){
            alert("기획전 시작일을 입력해 주십시오.");
            $("#CNT_MST_ST_DT").focus();
            return;
        }
        if($.trim($("#CNT_MST_ST_HH").val()) == ""){
            alert("기획전 시작 시간을 입력해 주십시오.");
            $("#CNT_MST_ST_HH").focus();
            return;
        }
        if($.trim($("#CNT_MST_ST_MI").val()) == ""){
            alert("기획전 시작 분을 입력해 주십시오.");
            $("#CNT_MST_ST_MI").focus();
            return;
        }
        if($.trim($("#CNT_MST_ED_DT").val()) == ""){
            alert("기획전 종료일을 입력해 주십시오.");
            $("#CNT_MST_ED_DT").focus();
            return;
        }
        if($.trim($("#CNT_MST_ED_HH").val()) == ""){
            alert("기획전 종료시간을 입력해 주십시오.");
            $("#CNT_MST_ED_HH").focus();
            return;
        }
        if($.trim($("#CNT_MST_ED_MI").val()) == ""){
            alert("기획전 종료 분을 입력해 주십시오.");
            $("#CNT_MST_ED_MI").focus();
            return;
        }
        if($("#CATEGORYPC1 option:selected").val() == "선택"){
        	alert("유형을 입력해 주십시오.");
        	$("#CATEGORYPC1").focus();
        	return;
        }
        
        if($.trim($("#CNT_MST_TITLE").val()) == ""){
            alert("영상 제목을 입력해 주십시오.");
            $("#CNT_MST_TITLE").focus();
            return;
        }
        var urlPattern = /(http(s)?:\/\/)([a-z0-9\w]+\.*)+[a-z0-9]{2,4}/gi
		if($("#CNT_MST_URL").val() == "" || !urlPattern.test($("#CNT_MST_URL").val())){
			alert("URL을 입력해 주십시오.");
            $("#CNT_MST_URL").focus();
            return;
		}
        //이미지 첨부 체크
        var file1 = $("#multiFile1").val();//PC목록이미지
        var file2 = $("#multiFile2").val();//PC상세이미지

        var file4 = $("#multiFile4").val();//Mobile 목록 이미지
        var file5 = $("#multiFile5").val();//Mobile 상세 이미지

        if(file1 == "" && $("#CMM_FLE_IDX_1").val() == undefined){
        	alert("PC 목록 이미지를 입력해 주십시오.");
        	$("#multiFile1").focus();
        	return;
        }
        if($.trim($("#CMN_FLE_ALT_TXT_P1").val()) == ""){//대체텍스트 체크
            alert("PC 목록 이미지 대체 텍스트를 입력해 주십시오.");
            $("#CMN_FLE_ALT_TXT_P1").focus();
            return;
        }
        
        if(file4 == ""&& $("#CMM_FLE_IDX_2").val() == undefined){
        	alert("MOBILE 목록 이미지를 입력해 주십시오.");
        	$("#multiFile4").focus();
            return;
        }
        if($.trim($("#CMN_FLE_ALT_TXT_M1").val()) == ""){//대체텍스트 체크
            alert("MOBILE 목록 이미지 대체 텍스트를 입력해 주십시오.");
            $("#CMN_FLE_ALT_TXT_M1").focus();
            return;
        }
		var type = $(":input:radio[name=CNT_MST_DETAIL_TYPE]:checked").val()
        if(type=="I"){
			if(file2 == "" && $("#CMM_FLE_IDX_3").val() == undefined){
				alert("PC 상세 이미지를 입력해 주십시오.");
		        	$("#multiFile2").focus();
		        	return;
			}
    		if($.trim($("#CMN_FLE_ALT_TXT_P2").val()) == ""){//대체텍스트 체크
                alert("PC 상세 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_P2").focus();
                return;
    		}
			if(file5 == ""&& $("#CMM_FLE_IDX_4").val() == undefined){
				alert("MOBILE 상세 이미지를 입력해 주십시오.");
	        	$("#multiFile5").focus();
	        	return;
			}
			if($.trim($("#CMN_FLE_ALT_TXT_M2").val()) == ""){//대체텍스트 체크
                alert("MOBILE 상세 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_M2").focus();
                return;
            }  
		}else if(type=="E"){
			try { oEditors1.getById["PLN_MST_PC_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);     } catch(e){ } //editor 내용을 PLN_MST_PC_BANNER TEXTAREA의 VALUE 값으로 만든다.
            try { oEditors2.getById["PLN_MST_MOBILE_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);     } catch(e){ } //editor 내용을 PLN_MST_MOBILE_BANNER TEXTAREA의 VALUE 값으로 만든다.
			if($('#PLN_MST_PC_BANNER').val() == "<p>&nbsp;</p>" ||$('#PLN_MST_PC_BANNER').val() == "&nbsp;"||$('#PLN_MST_PC_BANNER').val() == "" ){
				alert('PC 에디터를 입력해 주십시오.')
				return;
			}
			if($('#PLN_MST_MOBILE_BANNER').val() =="<p>&nbsp;</p>"||$('#PLN_MST_MOBILE_BANNER').val() == "&nbsp;"||$('#PLN_MST_MOBILE_BANNER').val() == ""){
				alert("MOBILE 에디터를 입력해 주십시오.");
				return;
			}
		}else if(type=="S"){
			if($('textarea#CNT_MST_PC_SCRIPT').val()== ""){
				alert('PC 스크립트를 입력해 주십시오.')
				$('textarea#CNT_MST_PC_SCRIPT').focus()
				return;
			}
			if($('textarea#CNT_MST_MOBILE_SCRIPT').val() == ""){
				alert('MOBILE 스크립트를 입력해 주십시오.')
				$('textarea#CNT_MST_MOBILE_SCRIPT').focus()
				return;
			}
		} 
        
        var $groupTitle = $(".CNT_GRP_TITLE");
        var groupCheck = true;
        $(".applyProductList").each(function(){
            if($(this).find(".checkRow").length <= 0 && $(this).is(":visible"))
            {
                alert("[사용상품]상품을 추가해 주십시오.");
                /* $formGroup.children().eq(1).children().eq(0).find(".search-product-popup").focus(); */
                $(this).find(".search-product-popup").focus();
                groupCheck = false;
                return false;
            }
        }) 
         if(groupCheck)
         {

             if (confirm("저장 하시겠습니까?"))
             {
                  $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/channelOnModify.do", "target" : "_self", "method" : "post"}).submit();
              }
         }
    });
	
 // 상품 검색 버튼 클릭 이벤트
    var $productBox = null;
    $(document).on("click", "#productBox .search-product-popup", function () {
        // 해당 그룹의 최 상위 부모 Node
        $productBox = $(this).parents(".productSelectform");

        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });
    
    //상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $productBox.find(".applyProductList .CNT_PRD_MST_CD");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
	
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

        //기본TR삭제
        $productBox.find(".productNodata").remove();
        //배열재정의
        var arrayObj = new Array();
        var len = $productBox.find(".applyProductList .CNT_PRD_MST_CD").length;

        var obj;
        if( bCheck ){

            $.each(params, function(index,item){
                len++;
                obj = new Object();
                obj.PRD_MST_CD              = item.PRD_MST_CD;
                obj.PRD_MST_NM          = item.PRD_MST_NM;
                obj.PRD_MST_PRC         = setComma(item.PRD_MST_PRC);
                obj.PRD_MST_DLV_FEE     = setComma(item.PRD_MST_DLV_FEE);
                obj.PRD_MST_SEL_STATE       = item.PRD_MST_SEL_STATE;
                obj.PRD_MST_VDR_NM      = item.PRD_MST_VDR_NM;
                obj.CNT_DTL_ORDER            = len;
                obj.PRD_NOW_DST_PRICE	=	setComma(item.PRD_NOW_DST_PRICE);
				obj.PRD_IMAGE = item.PRD_IMAGE;
				obj.PRD_IMAGE_ALT = item.PRD_IMAGE_ALT;
				obj.BND_MST_BRAND_NM = item.BND_MST_BRAND_NM;
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

                obj.FRONT_URL = '<c:out value="${frontDomain}" />';

                obj.serverDomain            = '<c:out value="${serverDomain}" />';


                arrayObj.push(obj); //만들어진  object를 배열에 추가
            });
            $( "#productTemplate" ).tmpl( arrayObj ).appendTo($productBox.find(".applyProductList"));
        }
        return true;
    };
    
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
            var $thisSectionForm = $obj.parents(".addFormCon");
            var $productBox = $thisSectionForm.parent();
            $thisSectionForm.remove();

            // 상품 그룹 순서 정렬
            var $sectionForm = $productBox.find(".addFormCon");
            $sectionForm.each(function (index) {
                var $this = $(this);
                $this.find(".groupNum").val(index);
                $this.find(".CNT_GRP_TITLE").prop("name", "CNT_GRP_TITLE" + index);
                $this.find(".CNT_GRP_COL").prop("name", "CNT_GRP_COL" + index);
                $this.find(".CNT_GRP_SORT").prop("name", "CNT_GRP_SORT" + index);
                $this.find(".CNT_PRD_MST_CD").prop("name", "CNT_PRD_MST_CD" + index);
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
	
});
hideDetailTypeInput = function(){
    $(".detailTypeImage").hide();
    $(".detailTypeEditor").hide();
    $(".detailTypeScript").hide();
};

changeDetailType = function(typeCode){
    hideDetailTypeInput();
    
    if(typeCode=="planType3"){
        $(".detailTypeImage").show();
    }
    else if (typeCode=="planType4"){
        $(".detailTypeEditor").show();
        showSmartEditor("CNT_MST_PC_BANNER", 300, 1);
        showSmartEditor("CNT_MST_MOBILE_BANNER", 300, 2);
        
    }
    else if (typeCode=="planType5"){
        $(".detailTypeScript").show();
    }
    detailType = typeCode;
};

;
function moveUp(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소

	var index = $(el).parent().children()[2].value
	$tr.prev().children()[7].children[2].value =index;
	$(el).parent().children()[2].value = --index;
	
	$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
}

function moveDown(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
	var index = $(el).parent().children()[2].value
	$tr.next().children()[7].children[2].value =index;
	$(el).parent().children()[2].value = ++index;
	$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
}

//목록 버튼 클릭 이벤트 
$(document).on("click", "#goList", function () {
   $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/channelOnList.do", "target":"_self", "method":"post"}).submit(); 
});

//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
$(".cmmFleIdx").each(function(){
    var fileName = $(this).data("file_name");
    $("input[name='"+ fileName +"']").prop("disabled", true);
});
//이미지 삭제 후 이벤트
$("input[name='file']").on("change",function(){
	//$(this).parent().parent().children()[0].text = this.value.substring(this.value.lastIndexOf("\\")+1)
})

	// 고정 첨부 행 파일 지우기
$(document).on("click", "#delFileData", function (e) {
	e.preventDefault();    	
	$("#defaultFileDiv").find("input").remove();
	$("#defaultFileDiv").append('<input type="file" name="file" id="file" class="file" style="width:50%;"/> <input type="button" id="delFileData" value="파일 지우기"/>');
	});
	
	//파일 삭제를 위한 체크박스 클릭 이벤트
$(".cmmFleIdx").click(function(){
	var cmmFleIdx = "";
	$("input[name='CMM_FLE_IDX']:checked").each(function(){
		cmmFleIdx = cmmFleIdx + $(this).val() + ",";
	});
	$("input[name='cmmFleIdx']").val(cmmFleIdx);		
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

//-->
</script>

</body>
</html>
