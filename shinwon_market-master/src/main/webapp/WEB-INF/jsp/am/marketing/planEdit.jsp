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

                <h2 class="title"><span>기획전관리</span></h2>

                <h3 class="title"><span>수정</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
               <form name="searchForm" id="searchForm">
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="PLN_MST_IDX"  id="PLN_MST_IDX"  value="<c:out value="${row.PLN_MST_IDX }"/>"/>
					<input type="hidden" name="searchPlnMstShopType" value="<c:out value="${commandMap.searchPlnMstShopType }"/>"/>
					<input type="hidden" name="searchPlnMstTitle" value="<c:out value="${commandMap.searchPlnMstTitle }"/>"/>
					<input type="hidden" name="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }"/>"/>
					<input type="hidden" name="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }"/>"/>
					<input type="hidden" name="searchPlnMstStatus" value="<c:out value="${commandMap.searchPlnMstStatus }"/>"/>
					<input type="hidden" name="searchPlnMstUseYn" value="<c:out value="${commandMap.searchPlnMstUseYn }"/>"/>
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
				</form>

              	<form name="frm" id="frm" enctype="multipart/form-data">
              		<div class="section-form"><!-- section-form-a -->
					<input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="<c:out value="${row.PLN_PRD_CTG_TOP_NM }"/>" />
					<input type="hidden" name="PLN_MST_IDX"  value="<c:out value="${row.PLN_MST_IDX }"/>" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="searchPlnMstShopType" value="<c:out value="${commandMap.searchPlnMstShopType }"/>"/>
					<input type="hidden" name="searchPlnMstTitle" value="<c:out value="${commandMap.searchPlnMstTitle }"/>"/>
					<input type="hidden" name="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }"/>"/>
					<input type="hidden" name="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }"/>"/>
					<input type="hidden" name="searchPlnMstStatus" value="<c:out value="${commandMap.searchPlnMstStatus }"/>"/>
					<input type="hidden" name="searchPlnMstUseYn" value="<c:out value="${commandMap.searchPlnMstUseYn }"/>"/>
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="PLN_MST_CHANNEL_PC_YN"     value="Y"/>
                    <input type="hidden" name="PLN_MST_CHANNEL_MOBILE_YN" value="Y"/>
                       					
					<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>작성자</span></label></th>
	                    		<td>
	                    			<c:out value="${row.PLN_MST_REG_ID }"/>(<c:out value="${row.PLN_MST_REG_NM }"/>)
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>기획전 형태<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="radio" class="radio" id="planType1" name="PLN_MST_TYPE" value = "A" readonly="readonly" <c:if test="${row.PLN_MST_TYPE eq 'A' }">checked="checked"</c:if>/> <label for="planType1">일반</label>
	                    			<input type="radio" class="radio" id="planType2" name="PLN_MST_TYPE" value = "M" readonly="readonly" <c:if test="${row.PLN_MST_TYPE eq 'M' }">checked="checked"</c:if>/> <label for="planType2">매거진</label>
	                    			<!--  <input type="hidden" id="PLN_MST_TYPE_INPUT" name="PLN_MST_TYPE_INPUT" value="<c:out value="${row.PLN_MST_TYPE }"/>"/>
		                        	<select id="PLN_MST_TYPE" name="PLN_MST_TYPE" class="PLN_MST_TYPE">
                       	  				<option value="A" <c:if test="${row.PLN_MST_TYPE eq 'A'}">selected="selected"</c:if>>일반</option>
                       	  				<option value="C" <c:if test="${row.PLN_MST_TYPE eq 'C'}">selected="selected"</c:if>>폐쇄몰</option>
                       	  				<option value="S" <c:if test="${row.PLN_MST_TYPE eq 'S'}">selected="selected"</c:if>>시크릿</option>
                       	  			</select>
		                            	&nbsp;&nbsp;&nbsp;<span id="secretLabel">입장권번호</span>&nbsp;<input type="text" name="PLN_MST_SECRET" id="PLN_MST_SECRET" class="text"  value="<c:out value="${row.PLN_MST_SECRET }"/>"/> -->
	                    		</td>
	                        </tr>
	                        <tr>
	                            <th><label class="label"><span>기간<i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="PLN_MST_ST_DT" name="PLN_MST_ST_DT" readonly="readonly" data-target-end="#PLN_MST_ED_DT" value="<ui:formatDate value="${row.PLN_MST_ST_DT }" pattern="yyyy-MM-dd"/>"/>
	                               	<select id="PLN_MST_ST_HH" name="PLN_MST_ST_HH" class="PLN_MST_ST_HH">
                       	  			<option value="">시</option>
		                        	<c:forEach begin="0" end="23" step="1" varStatus="i">
		                        		<c:set var="hh" value="${i.index}"/>
		                        		<c:if test="${i.index < 10}">
		                        			<c:set var="hh" value="0${i.index}"/>
		                        		</c:if>
		                        		<option value="${hh}" <c:if test="${row.PLN_MST_ST_HH eq hh}">selected="selected"</c:if> >${hh}</option>
		                        	</c:forEach>
                        			</select>

			                        <select id="PLN_MST_ST_MI" name="PLN_MST_ST_MI" class="PLN_MST_ST_MI">
			                        	<option value="">분</option>
			                        	<c:forEach begin="0" end="59" step="1" varStatus="i">
			                        		<c:set var="mm" value="${i.index}"/>
			                        		<c:if test="${i.index < 10}">
			                        			<c:set var="mm" value="0${i.index}"/>
			                        		</c:if>
			                        		<option value="${mm}" <c:if test="${row.PLN_MST_ST_MI eq mm}">selected="selected"</c:if> >${mm}</option>
			                        	</c:forEach>
			                         </select>
									~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="PLN_MST_ED_DT" name="PLN_MST_ED_DT"  readonly="readonly" data-target-start="#PLN_MST_ST_DT" value="<ui:formatDate value="${row.PLN_MST_ED_DT }" pattern="yyyy-MM-dd"/>"/>
									<select id="PLN_MST_ED_HH" name="PLN_MST_ED_HH" class="PLN_MST_ED_HH">
                       	  			<option value="">시</option>
		                        	<c:forEach begin="0" end="23" step="1" varStatus="j">
		                        		<c:set var="hh" value="${j.index}"/>
		                        		<c:if test="${j.index < 10}">
		                        			<c:set var="hh" value="0${j.index}"/>
		                        		</c:if>
		                        		<option value="${hh}" <c:if test="${row.PLN_MST_ED_HH eq hh}">selected="selected"</c:if> >${hh}</option>

		                        	</c:forEach>
                        			</select>
			                        <select id="PLN_MST_ED_MI" name="PLN_MST_ED_MI" class="PLN_MST_ED_MI">
			                        	<option value="">분</option>
			                        	<c:forEach begin="0" end="59" step="1" varStatus="i">
			                        		<c:set var="mm" value="${i.index}"/>
			                        		<c:if test="${i.index < 10}">
			                        			<c:set var="mm" value="0${i.index}"/>
			                        		</c:if>
			                        		<option value="${mm}" <c:if test="${row.PLN_MST_ED_MI eq mm}">selected="selected"</c:if>  >${mm}</option>
			                        	</c:forEach>
			                         </select>
		                            <a href="javascript:fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
	                                <a href="javascript:fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                                <a href="javascript:fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                                <a href="javascript:fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            </td>
	                        </tr>

	                        <tr>
	                    		<th><label class="label"><span>전시여부<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="radio" name="PLN_MST_USE_YN" id="stateA" class="radio" value="Y" <c:if test="${row.PLN_MST_USE_YN eq 'Y' }">checked="checked"</c:if> />
									<label for="stateA">전시</label>
									<input type="radio" name="PLN_MST_USE_YN" id="stateB" class="radio" value="N" <c:if test="${row.PLN_MST_USE_YN eq 'N' }">checked="checked"</c:if>/>
									<label for="stateB">미전시</label>
	                    		</td>
	                        </tr>

	                        <tr>
	                    		<th><label class="label"><span>기획전명<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="PLN_MST_TITLE" id="PLN_MST_TITLE" class="text xlarge" value="<c:out value="${row.PLN_MST_TITLE }"/>"/>
	                    		</td>
	                        </tr>
							<c:if test="${row.PLN_MST_TYPE eq 'A' }">
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
										<span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
										<input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
									</p>
	                    		</td>
	                        </tr>

	                        <tr>
	                    		<th><label class="label"><span>mobile 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<div id="multiFile2-list">
										<c:forEach items="${fileList}" var="fileRow" varStatus="i">
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'M' && fileRow.CMM_FLE_SORT == '1'}">
											<c:set var="altTextP2" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP2Idx" value="${fileRow.CMM_FLE_IDX}"/>

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
										<span>대체텍스트</span> <input type="text" value="${altTextP2}" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
										<input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_M1_IDX" value="${altTextP2Idx}"/>
									</p>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>상세타입<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="radio" class="radio" id="planType3" name="PLN_MST_DETAIL_TYPE" value="I" onchange=changeDetailType(this.id) <c:if test="${row.PLN_MST_DETAIL_TYPE eq 'I' }">checked="checked"</c:if> /> <label for="planType3">이미지</label>
	                    			<input type="radio" class="radio" id="planType4" name="PLN_MST_DETAIL_TYPE" value="E" onchange=changeDetailType(this.id) <c:if test="${row.PLN_MST_DETAIL_TYPE eq 'E' }">checked="checked"</c:if> /> <label for="planType4">에디터</label>
	                    			<input type="radio" class="radio" id="planType5" name="PLN_MST_DETAIL_TYPE" value="S" onchange=changeDetailType(this.id) <c:if test="${row.PLN_MST_DETAIL_TYPE eq 'S' }">checked="checked"</c:if> /> <label for="planType5">스크립트</label>
	                    			<!--  <input type="hidden" id="PLN_MST_TYPE_INPUT" name="PLN_MST_TYPE_INPUT" value="<c:out value="${row.PLN_MST_TYPE }"/>"/>
		                        	<select id="PLN_MST_TYPE" name="PLN_MST_TYPE" class="PLN_MST_TYPE">
                       	  				<option value="A" <c:if test="${row.PLN_MST_TYPE eq 'A'}">selected="selected"</c:if>>일반</option>
                       	  				<option value="C" <c:if test="${row.PLN_MST_TYPE eq 'C'}">selected="selected"</c:if>>폐쇄몰</option>
                       	  				<option value="S" <c:if test="${row.PLN_MST_TYPE eq 'S'}">selected="selected"</c:if>>시크릿</option>
                       	  			</select>
		                            	&nbsp;&nbsp;&nbsp;<span id="secretLabel">입장권번호</span>&nbsp;<input type="text" name="PLN_MST_SECRET" id="PLN_MST_SECRET" class="text"  value="<c:out value="${row.PLN_MST_SECRET }"/>"/> -->
	                    		</td>
	                        </tr>
	                        <tr class="detailTypeImage" <c:if test="${row.PLN_MST_DETAIL_TYPE ne 'I' }">style="display:none"</c:if>>
	                    		<th><label class="label"><span>PC 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<div id="multiFile3-list">
										<c:forEach items="${fileList}" var="fileRow" varStatus="i">
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '2'}">
											<c:set var="altTextP3" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP3Idx" value="${fileRow.CMM_FLE_IDX}"/>

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
										<span>대체텍스트</span> <input type="text" value="${altTextP3}" name="CMN_FLE_ALT_TXT_P2" id="CMN_FLE_ALT_TXT_P2" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
										<input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P2_IDX" value="${altTextP3Idx}"/>
									</p>
	                    		</td>
	                        </tr>

	                        <tr class="detailTypeImage" <c:if test="${row.PLN_MST_DETAIL_TYPE ne 'I' }">style="display:none"</c:if>>
	                    		<th><label class="label"><span>MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<div id="multiFile4-list">
										<c:forEach items="${fileList}" var="fileRow" varStatus="i">
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'M' && fileRow.CMM_FLE_SORT == '2'}">
											<c:set var="altTextM1" value="${fileRow.CMN_FLE_ALT_TXT}"/>
											<c:set var="altTextM1Idx" value="${fileRow.CMM_FLE_IDX}"/>

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
										<span>대체텍스트</span> <input type="text" value="${altTextM1}" name="CMN_FLE_ALT_TXT_M2" id="CMN_FLE_ALT_TXT_M2" class="text xlarge mobileImgFile" placeholder="20자 이내로 입력하세요."/>
										<input type="hidden" class="mobileImgFile" name="CMN_FLE_ALT_TXT_M2_IDX" value="${altTextM1Idx}"/>
									</p>
	                    		</td>
	                        </tr>
	                        <tr class="detailTypeEditor normal" <c:if test="${row.PLN_MST_DETAIL_TYPE ne 'E' }">style="display:none"</c:if> >
                                <th><label class="label"><span>PC 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                     <textarea class="textarea xlarge" name="PLN_MST_PC_BANNER" id="PLN_MST_PC_BANNER" style="width: 95%; height: 500px; display: none;">${row.PLN_MST_PC_BANNER}</textarea>                                         
                                </td>
                            </tr>
                            <tr class="detailTypeEditor normal" <c:if test="${row.PLN_MST_DETAIL_TYPE ne 'E' }">style="display:none"</c:if> >
                                <th><label class="label"><span>MOBILE 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                     <textarea class="textarea xlarge" name="PLN_MST_MOBILE_BANNER" id="PLN_MST_MOBILE_BANNER" style="width: 95%; height: 500px; display: none;">${row.PLN_MST_MOBILE_BANNER}</textarea>
                                </td>
                            </tr>


                            <tr class="detailTypeScript normal" <c:if test="${row.PLN_MST_DETAIL_TYPE ne 'S' }">style="display:none"</c:if>>
                                <th><label class="label"><span>PC 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea id="PLN_MST_PC_SCRIPT" name="PLN_MST_PC_SCRIPT" rows="8" cols="80"> ${row.PLN_MST_PC_SCRIPT}</textarea>
                                </td>
                            </tr>
                            <tr class="detailTypeScript normal" <c:if test="${row.PLN_MST_DETAIL_TYPE ne 'S' }">style="display:none"</c:if>>
                                <th><label class="label"><span>MOBILE 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea id="PLN_MST_MOBILE_SCRIPT" name="PLN_MST_MOBILE_SCRIPT" rows="8" cols="80">${row.PLN_MST_MOBILE_SCRIPT}</textarea>
                                </td>
                            </tr>
	                       	</c:if>
	                    </tbody>
                	</table><!-- // table -->
                </div>
                

                <div class="grid section-button-list">
                	<h3 class="title"><span>목록</span></h3>
               	  	<div class="text-right">
                        <a href="#none" id="addProductGroup" class="button small primary addProductGroup"><span>상품그룹추가</span></a>
                    </div>
				</div>

				<div id="productBox">
					<c:choose>
						<c:when test="${not empty detailGroupList  }">
							<c:forEach var="groupRow" items="${detailGroupList }" varStatus="i">
								<c:if test="${i.index eq '0' }">
                                    <c:out value="<div id='productBox2' class='product-fomation'>" escapeXml="false"/>
                                </c:if>
                               	<c:set var="basicProductGroupCount" value="${basicProductGroupCount + 1 }"/>

								<div class="section-form addFormCon productSelectform"><!-- section-form-a --><!-- productSelectform -->
									<input type="hidden" name="groupNum" class="groupNum" value="<c:out value="${i.index }"/>"/>

				                    <table cellspacing="0" class="table-row table-a"><!-- table -->
					                    <colgroup>
					                        <col style="width: 15%;" />
					                        <col style="width: auto;" />
					                    </colgroup>
					                    <tbody>
					                    	
					                    	<c:set var="basicProductGroupCount" value="0"/>
		                                    <c:if test="${i.index eq '0' }">
		                                        <c:out value="<div id='productBox2' class='product-fomation'>" escapeXml="false"/>
		                                    </c:if>
		                                   	<c:set var="basicProductGroupCount" value="${basicProductGroupCount + 1 }"/>
					                    	<c:if test="${row.PLN_MST_TYPE eq 'A' }">
					                    	<tr>
					                    		<th><label class="label"><span>그룹명<i class="require"><em>필수입력</em></i></span></label></th>
					                    		<td>
	                                          		<input type="hidden" name="PLN_GRP_IDX<c:out value="${i.index }"/>" class="PLN_GRP_IDX" value="<c:out value="${groupRow.PLN_GRP_IDX }"/>"/>
                                                    <input type="hidden" name="DEL_YN<c:out value="${i.index }"/>"  class="DEL_YN" value="N"/>
                                                    <!-- <input type="radio" class="select PLN_GRP_TYPE PLN_GRP_TYPE_T" data-rnum="<c:out value="${i.index }"/>" data-file_name="fileGroup<c:out value="${i.index }"/>" name="PLN_GRP_TYPE<c:out value="${i.index }"/>" id="stateGroupA<c:out value="${i.index }"/>" class="radio" value="T" <c:if test="${groupRow.PLN_GRP_TYPE eq 'T' }">checked="checked"</c:if>/>
                                                    <label for="stateGroupA<c:out value="${i.index }"/>">Text등록</label> -->
                                                    <input type="text" name="PLN_GRP_TITLE<c:out value="${i.index }"/>" class="text long PLN_GRP_TITLE" value="<c:out value="${groupRow.PLN_GRP_TITLE }"/>" maxlength="66"/>
					                    		</td>
					                    	</tr>
					                    	<tr>
					                    		<th><label class="label"><span>진열개수<i class="require"><em>필수입력</em></i></span></label></th>
					                    		<td>
					                    			<!-- <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL<c:out value="${i.index }"/>" id="stateA" class="radio" value="5" <c:if test="${groupRow.PLN_GRP_COL eq '5' }">checked="checked"</c:if> />
					                            	<label for="stateA">5열</label> -->
			                                        <input type="radio" class="select PLN_GRP_COL"  name="PLN_GRP_COL<c:out value="${i.index }"/>" id="stateB" class="radio" value="4" <c:if test="${groupRow.PLN_GRP_COL eq '4' }">checked="checked"</c:if>/>
						                            <label for="stateB">4열</label>
						                            <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL<c:out value="${i.index }"/>" id="stateB" class="radio" value="3" <c:if test="${groupRow.PLN_GRP_COL eq '3' }">checked="checked"</c:if> />
						                            <label for="stateB">3열</label>
						                            <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL<c:out value="${i.index }"/>" id="stateB" class="radio" value="2" <c:if test="${groupRow.PLN_GRP_COL eq '2' }">checked="checked"</c:if>/>
						                            <label for="stateD">2열</label>
					                    		</td>
					                    	</tr>
					                    	<tr>
					                    		<th><label class="label"><span>전시순서<i class="require"><em>필수입력</em></i></span></label></th>
					                    		<td>
					                    			<input type="text" name="PLN_GRP_SORT<c:out value="${i.index }"/>" class="text short number PLN_GRP_SORT" value="<c:out value="${groupRow.PLN_GRP_SORT }"/>" maxlength="10" />
				                     			</td>
					                    	</tr>
					                    	<tr>
					                    		<th><label class="label"><span>사용상품<i class="require"><em>필수입력</em></i></span></label></th>
					                    		<td>
					                    			<div class="text-right">
														<a href="#none" class="button small goProductDelete"><span>선택삭제</span></a>
					                               		<a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
													</div>
													<table class="core" style="width:100%;">
														<colgroup>
															<col style="width: 5%;" />
															<col style="width: 8%;" />
															<col style="width: 10%;" />
															<col style="width: auto;" />
															<col style="width: auto;" />
															<col style="width: 10%;" />
															<col style="width: 10%;" />
															<col style="width: 8%;" />
															<col style="width: 8%;" />
															<col style="width: 12%;" />
														</colgroup>
														<thead>
															<tr>
																<th><input type="checkbox" class="checkbox checkAll" /></th>
																<th>상품코드</th>
																<th>이미지</th>
																<th>상품명</th>
																<th>입점업체</th>
																<th>일반가</th>
																<th>판매가</th>
																<th>배송비</th>
																<th>판매상태</th>
																<th>전시순서</th>
															</tr>
														</thead>
														<tbody class="applyProductList">
															<c:forEach var="item" items="${detailList }" varStatus="y">
																<c:if test="${groupRow.PLN_GRP_IDX eq item.PLN_GRP_IDX }">
														   			<tr>
																		<td>
																			<input type="checkbox" class="checkbox checkRow" id="PRD_MST_CD_${item.PLN_PRD_MST_CD}" name="PRD_MST_CDs" value="${item.PLN_PRD_MST_CD}" />
																			<input type="hidden" name="PLN_PRD_MST_CD<c:out value="${i.index }"/>" value="${item.PLN_PRD_MST_CD}" />
																		</td>
																		<td>
																			<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${item.PLN_PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
																				<c:out value="${item.PLN_PRD_MST_CD }" />
																			</a>
																		</td>
																		<td>
																			  <img src="${cdnDomain}${item.PRD_IMAGE }" alt="${item.PRD_IMAGE_ALT }">

																		</td>
																		<td class="left">
																			<a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=${item.PLN_PRD_MST_CD}&ADMIN=Y" target="_blank">
																				<c:out value="${item.PRD_MST_NM }" />
																			</a>
																		</td>
																		<td><c:out value="${item.VDR_MST_NM }" /></td>
																		<td><fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" /></td>
																		<td><fmt:formatNumber value="${item.PRD_NOW_DST_PRICE }" groupingUsed="true" /></td>
																		<td><fmt:formatNumber value="${item.PRD_MST_DLV_FEE }" groupingUsed="true" /></td>
																	 	<td>
																			<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}" ><span >판매중</span></c:if>
																			<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_READY}" ><span >등록대기</span></c:if>
																			<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" ><span >품절상품</span></c:if>
																			<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" ><span >미판매</span></c:if>
																		</td>

																		<td>
																		<!-- <input type="text" name="PLN_DTL_ORDER_<c:out value="${i.index }"/>_<c:out value="${item.PLN_PRD_MST_CD}"/>" class="text short number" value="<c:out value="${item.PLN_DTL_ORDER }"/>" maxlength="5"/>-->
																			<c:if test="${row.PLN_DTL_ORDER ne 1 }">
																	        <a href="javascript:;" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
																	        </c:if><c:if test="${row.PLN_DTL_ORDER ne fn:length(list) }">
																	        <a href="javascript:;" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
																	        </c:if>
																			<input type="hidden" name="PLN_DTL_ORDER_${i.index}_${item.PLN_PRD_MST_CD}" value="${item.PLN_DTL_ORDER}"></input>
																		</td>
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
													</table>
				                     			</td>
					                    	</tr>
					                    	</c:if>
                                            <!-- 매거진 -->
        									<c:if test="${row.PLN_MST_TYPE eq 'M' }">
        									
        									<tr>
        										<th><label class="label"><span>상품그룹설명<i class="require"><em>필수입력</em></i></span></label></th>
        									    <td>
	                                          		<input type="hidden" name="PLN_GRP_IDX<c:out value="${i.index }"/>" class="PLN_GRP_IDX" value="<c:out value="${groupRow.PLN_GRP_IDX }"/>"/>
                                                    <input type="hidden" name="DEL_YN<c:out value="${i.index }"/>"  class="DEL_YN" value="N"/>
                                                    <!-- <input type="radio" class="select PLN_GRP_TYPE PLN_GRP_TYPE_T" data-rnum="<c:out value="${i.index }"/>" data-file_name="fileGroup<c:out value="${i.index }"/>" name="PLN_GRP_TYPE<c:out value="${i.index }"/>" id="stateGroupA<c:out value="${i.index }"/>" class="radio" value="T" <c:if test="${groupRow.PLN_GRP_TYPE eq 'T' }">checked="checked"</c:if>/>
                                                    <label for="stateGroupA<c:out value="${i.index }"/>">Text등록</label> -->
                                                    <input type="text" name="PLN_GRP_DESC<c:out value="${i.index }"/>" class="text long PLN_GRP_DESC" value="<c:out value="${groupRow.PLN_GRP_DESC }"/>" maxlength="66"/>        									    
        									    
                                                    <!--   
        								    		<input type="text" name="PLN_GRP_TITLE\${NUM}" class="text large" />
        								    		-->
        									    </td>
        									</tr>
        									<tr>
        										<th><label class="label"><span>대표이미지<i class="require"><em>필수입력</em></i></span></label></th>
        									    <td>
        											<input type="radio" class="radio plnGrpRefType Iamge" name='PLN_GRP_REF_TYPE<c:out value="${i.index }"/>' id='PLN_GRP_REF_TYPE_P_<c:out value="${i.index }"/>'  <c:if test="${groupRow.PLN_GRP_REF_TYPE eq 'P' }">checked="checked"</c:if> value='P'  >
        											<label for="PLN_GRP_REF_TYPE_P_<c:out value="${i.index }"/>">이미지</label>
        											<input type="radio" class="radio plnGrpRefType Video" name='PLN_GRP_REF_TYPE<c:out value="${i.index }"/>' id='PLN_GRP_REF_TYPE_U_<c:out value="${i.index }"/>'  <c:if test="${groupRow.PLN_GRP_REF_TYPE eq 'U' }">checked="checked"</c:if> value='U'>
        											<label for="PLN_GRP_REF_TYPE_U_<c:out value="${i.index }"/>">영상</label><br/>
        											

				                                        <input type="text" <c:if test="${groupRow.PLN_GRP_REF_TYPE ne 'U' }">style="display:none"</c:if> name="PLN_GRP_URL<c:out value="${i.index }"/>" id="multiFileGroup_<c:out value="${i.index }"/>" class="mfile pcVideoFileGrp" value='${groupRow.PLN_GRP_URL}'  data-attach_cnt="<c:out value="${i.index }"/>"/>
                                                    <div  class='mfile pcImgFileGrp'   <c:if test="${groupRow.PLN_GRP_REF_TYPE eq 'U' }">style="display:none"</c:if>  >

				                                        <i class="icon-file"></i>
					                                    <a href="<c:out value="${cdnDomain}${groupRow.CMM_FLE_ATT_PATH}${groupRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
					                                       <c:out value="${groupRow.CMM_FLE_ORG_NM }"/>
					                                    </a>
					                                    &nbsp;&nbsp;
					                                    <input type="checkbox" class="checkbox cmmFleIdx filedeletechk" id='CMM_FLE_IDX_<c:out value="${i.index }"/>' name="CMM_FLE_IDX" data-file_name="file1" value="<c:out value="${groupRow.CMM_FLE_IDX }"/>"  data-input-id='multiFileGroup<c:out value="${i.index }"/>'  />
											            <label for='CMM_FLE_IDX_<c:out value="${i.index }"/>'/>삭제</label>
        											    <input type="file"   name='fileGroup<c:out value="${i.index }"/>' id='multiFileGroup<c:out value="${i.index }"/>' class="file  GrpImgFile "  <c:if test="${groupRow.PLN_GRP_REF_TYPE eq 'P' && groupRow.CMM_FLE_ORG_NM != null  }">disabled="disable"</c:if>    />											            
                                                    </div>					                                    

				                                     
		
        										</td>
        									</tr>
        									<tr>
        										<th><label class="label"><span>연관상품<i class="require"><em>필수입력</em></i></span></label></th>
        										<td>
        											<div class="text-right"">
        												<a href="#none" class="button small goProductDelete"><span>선택삭제</span></a>
        												<a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
        											</div>
        											<table class="core" style="width:100%;">
        												<colgroup>
        													<col style="width: 5%;" />
        													<col style="width: 8%;" />
        													<col style="width: 15%;" />
        													<col style="width: auto;" />
        													<col style="width: 10%;" />
        													<col style="width: 10%;" />
        													<col style="width: 10%;" />
        													<col style="width: 8%;" />
        													<col style="width: 8%;" />
        													<col style="width: 12%;" />
        												</colgroup>
        												<thead>
        													<tr>
        														<th><input type="checkbox" class="checkbox checkAll" /></th>
        														<th>상품코드</th>
        														<th>이미지</th>
        														<th>상품명</th>
        														<th>입점업체</th>
        														<th>일반가</th>
        														<th>판매가</th>
        														<th>배송비</th>
        														<th>판매상태</th>
        														<th>전시순서</th>
        													</tr>
        												</thead>
        												<tbody class="applyProductList">
															<c:forEach var="item" items="${detailList }" varStatus="y">
																<c:if test="${groupRow.PLN_GRP_IDX eq item.PLN_GRP_IDX }">
														   			<tr>
																		<td>
																			<input type="checkbox" class="checkbox checkRow" id="PRD_MST_CD_${item.PLN_PRD_MST_CD}" name="PRD_MST_CDs" value="${item.PLN_PRD_MST_CD}" />
																			<input type="hidden" name="PLN_PRD_MST_CD<c:out value="${i.index }"/>" value="${item.PLN_PRD_MST_CD}" />
																		</td>
																		<td>
																			<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${item.PLN_PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
																				<c:out value="${item.PLN_PRD_MST_CD }" />
																			</a>
																		</td>
																		<td>
																		    <span class="thumbnail_img">
																		      <img name="PRD_IMAGE" src="${cdnDomain}${item.PRD_IMAGE }" alt="${item.PRD_IMAGE_ALT }"> 
																		    </span>
																		</td>
																		<td class="left">
																			<a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=${item.PLN_PRD_MST_CD}&ADMIN=Y" target="_blank">
																				<c:out value="${item.PRD_MST_NM }" />
																			</a>
																		</td>
																		<td><c:out value="${item.VDR_MST_NM }" /></td>
																		<td><fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" /></td>
																		<td><fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" /></td>
																		<td><fmt:formatNumber value="${item.PRD_MST_DLV_FEE }" groupingUsed="true" /></td>
																	 	<td>
																			<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}" ><span class="label label-b">판매중</span></c:if>
																			<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_READY}" ><span class="label label-a">등록대기</span></c:if>
																			<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" ><span class="label label-a">품절상품</span></c:if>
																			<c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" ><span class="label label-a">미판매</span></c:if>
																		</td>

																		<td>
																		<!-- <input type="text" name="PLN_DTL_ORDER_<c:out value="${i.index }"/>_<c:out value="${item.PLN_PRD_MST_CD}"/>" class="text short number" value="<c:out value="${item.PLN_DTL_ORDER }"/>" maxlength="5"/>-->
																			
																			<c:if test="${row.PLN_DTL_ORDER ne 1 }">
																	        <a href="javascript:;" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
																	        </c:if><c:if test="${row.PLN_DTL_ORDER ne fn:length(list) }">
																	        <a href="javascript:;" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
																	        </c:if>
																			<input type="hidden" name="PLN_DTL_ORDER_${i.index}_${PLN_PRD_MST_CD}" value="${item.PLN_DTL_ORDER}"/>
																		</td>
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
        											</table>
        										</td>
        									</tr>
        									</c:if>
					                    	<c:if test="${basicProductGroupCount eq fn:length(detailGroupList)}">
		                                         <c:out value="</div>" escapeXml="false"/>
		                                    </c:if>
					                    </tbody>
				                    </table>
								</div>
	       					</c:forEach>
       					</c:when>
               	 	</c:choose>
       			</div>
                </div>

       			<h3 class="title"><span>태그설정</span></h3>

                
                <div class="section-form"><!-- section-form-a -->
                    <input type="hidden" name="PLN_PRD_CTG_TOP_NM" value="" />

			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>일반 TAG<i class="require"><em>필수입력</em></i></span></label></th>
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
	                    		<th><label class="label"><span>대표 TAG<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
                                    <select class="select" id="representTag" name="TAG_BND_REP_ID">
                                        <c:forEach items="${tagList}" var="tag" varStatus="i">
											<option value="${tag.TAG_MST_ID}" <ui:select v="${fn:trim(tag.TAG_BND_REP)}" t="Y" g="selected"/>><c:out value="${tag.TAG_MST_TITLE}"/></option>
										</c:forEach>
                                    </select>
	                    		</td>
	                        </tr>
	                    </tbody>
                	</table><!-- // table -->
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


<ui:editor objId="#PLN_MST_PC_BANNER" num="1"/>
<ui:editor objId="#PLN_MST_MOBILE_BANNER" num="2"/>
<%--
에디터에 num이 있는 경우에는 아래와 같이 호출한다
try { oEditors1.getById["PLN_MST_PC_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ } //editor 내용을 PLN_MST_PC_BANNER TEXTAREA의 VALUE 값으로 만든다.
try { oEditors2.getById["PLN_MST_MOBILE_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ } //editor 내용을 PLN_MST_MOBILE_BANNER TEXTAREA의 VALUE 값으로 만든다.
 --%>


<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.extend.js"></script>
<script id="categoryPcTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRowCatPc" name="CATGs" value="\${MGZ_MST_IDX}"/></td>
	<td class="left">\${CATEGORYNM}
		<input type="hidden" class="CATEGORYPCGB" name="CATEGORYPCGB" value="\${CATEGORYPCGB}"/>
		<input type="hidden" class="CATEGORYPC1" name="CATEGORYPC1" value="\${CATEGORYPC1}"/>
	</td>
</tr>
</script>

<script id="categoryMbTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRowCatMb" name="CATGs" value="\${MGZ_MST_IDX}"/></td>
	<td class="left">\${CATEGORYNM}
		<input type="hidden" class="CATEGORYMBGB" name="CATEGORYMBGB" value="\${CATEGORYMBGB}"/>
		<input type="hidden" class="CATEGORYMB1" name="CATEGORYMB1" value="\${CATEGORYMB1}"/>
	</td>
</tr>
</script>

<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
	<td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" class="PLN_PRD_MST_CD" name="PLN_PRD_MST_CD\${NUM}" value="\${PRD_MST_CD}"/></td>    
	<td><img src="\${PRD_IMAGE}" alt="\${PRD_IMAGE_ALT}"></td>
    <td class="left"> <a href="\${FRONT_URL}/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&ADMIN=Y" target="_blank">\${PRD_MST_NM}</a></td>
    <td>\${PRD_MST_VDR_NM}</td>
    <td>\${PRD_MST_PRC}</td>
    <td>\${PRD_NOW_DST_PRICE}</td>
    <td><span>\${PRD_MST_DLV_FEE}</span></td>
    <td>\${PRD_MST_SEL_STATE}</td>
  	<td>
    	<c:if test="${row.PLN_DTL_ORDER ne 1 }">
        <a href="javascript:;" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
        </c:if><c:if test="${row.PLN_DTL_ORDER ne fn:length(list) }">
        <a href="javascript:;" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
        </c:if>
		<input type="hidden" name="PLN_DTL_ORDER_\${NUM}_\${PRD_MST_CD}" value="\${PLN_DTL_ORDER}"></input>
    </td>
</tr>
</script>
<script id="productGroupTemplate" type="text/x-jquery-tmpl">
<div class="section-form addFormCon productSelectform normal" data-type="basic">
<input type="hidden" name="groupNum" class="groupNum" value="\${NUM}"/>
<table cellspacing="0" class="table-row table-a"><!-- table -->
    <colgroup>
        <col style="width: 15%;" />
        <col style="width: auto;" />
    </colgroup>
    <tbody>
        <tr>
            <th><label class="label"><span>그룹명<i class="require"><em>필수입력</em></i></span></label></th>
            <td>
                <input type="text" name="PLN_GRP_TITLE\${NUM}" class="text long PLN_GRP_TITLE" maxlength="66"/>
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>진열개수</span></label></th>
            <td>
                <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL\${NUM}" id="stateGrpB" class="radio" value="4" checked="checked"/>
                <label for="stateGrpB">4열</label>
                <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL\${NUM}" id="stateGrpC" class="radio" value="3" />
                <label for="stateGrpC">3열</label>
                <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL\${NUM}" id="stateGrpD" class="radio" value="2" />
                <label for="stateGrpD">2열</label>
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>전시순서</span></label></th>
            <td>
                <input type="text" name="PLN_GRP_SORT\${NUM}" class="text short PLN_GRP_SORT" value="1" maxlength="10" />
            </td>
        </tr>

        <tr>
            <th><label class="label"><span>사용상품<i class="require"><em>필수입력</em></i></span></label></th>
            <td>
                <div class="text-right"">
                    <a href="#none" class="button small goProductDelete"><span>선택삭제</span></a>
                    <a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                </div>
                <table class="core" style="width:100%;">
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 8%;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 12%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll" /></th>
                            <th>상품코드</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>입점업체</th>
                            <th>일반가</th>
                            <th>판매가</th>
                            <th>배송비</th>
                            <th>판매상태</th>
                            <th>전시순서</th>
                        </tr>
                    </thead>
                    <tbody class="applyProductList">
                        <tr class="productNodata"><!-- row -->
                            <td colspan="10" class="text-center">상품을 선택해 주세요.</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>

    </tbody>
</table>
</div>
</script>
<script id="productGroupMagazineTemplate" type="text/x-jquery-tmpl">
<!--매거진 -->
<div class="section-form addFormCon productSelectform magazine" data-type="basic">
<input type="hidden" name="groupNum" class="groupNum" value="\${NUM}"/>
<table cellspacing="0" class="table-row table-a"><!-- table -->
    <colgroup>
        <col style="width: 15%;" />
        <col style="width: auto;" />
    </colgroup>
    <tbody>
        <tr>
            <th><label class="label"><span>전시순서</span></label></th>
            <td>
                <input type="text" name="PLN_GRP_SORT\${NUM}" class="text short PLN_GRP_SORT" value="1" maxlength="10" />
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>상품그룹설명<i class="require"><em>필수입력</em></i></span></label></th>
            <td>

                <input type="text" name="PLN_GRP_DESC\${NUM}" class="text large PLN_GRP_DESC" />
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>대표이미지<i class="require"><em>필수입력</em></i></span></label></th>
            <td>
                <input type="radio" class="radio" name="img" checked="checked">
				<label for="">이미지</label>
				<input type="radio" class="radio video" name="img" >
				<label for="">영상</label><br/>
				<input type="text" name="fileGroup\${NUM}" id="multiFileGroup\${NUM}" class="file pcImgFile" />
				<input type="text" style="display:none" name="PLN_GRP_URL\${NUM}" id="multiFileGroup\${NUM}" class="file pcVideoFile"/>
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>연관상품<i class="require"><em>필수입력</em></i></span></label></th>
            <td>
                <div class="text-right"">
                    <a href="#none" class="button small goProductDelete"><span>선택삭제</span></a>
                    <a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                </div>
                <table class="core" style="width:100%;">
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 8%;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 12%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll" /></th>
                            <th>상품코드</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>입점업체</th>
                            <th>일반가</th>
                            <th>판매가</th>
                            <th>배송비</th>
                            <th>판매상태</th>
                            <th>전시순서</th>
                        </tr>
                    </thead>
                    <tbody class="applyProductList">
                        <tr class="productNodata"><!-- row -->
                            <td colspan="10" class="text-center">상품을 선택해 주세요.</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
	</tboby>
	</table>
</div>
</script>
<script>
function updateRplyYn(cnt){

	var PLN_RPLY_YN = $("input[name=PLN_RPLY_YN_"+cnt+"]:checked").val();
	var PLN_RPLY_IDX = $("#PLN_RPLY_IDX_"+cnt).val();
	 $.ajax
	 ({
		 async : false,
		 type : "POST",
		 data : {"PLN_RPLY_YN":PLN_RPLY_YN, "PLN_RPLY_IDX":PLN_RPLY_IDX},
		 url : "<c:out value="${serverDomain}" />/am/marketing/updateReplyYnAjax.do",
		 success : function (data) {
			 if(data.result == 0){
				 alert("저장 중 오류가 발생하였습니다. 관리자에게 문의하세요.");
			 }
		 }, error : function (err) {
			 alert("오류가 발생하였습니다.\n[" + err.status + "]");
		 }
	 });
}

$(function(){
var PLN_MST_TYPE = $("#PLN_MST_TYPE_INPUT").val();

	$("#searchPrdCtgPcEnv").hide();
	$("#searchPrdCtgPcDepth3").hide();
	$("#searchPrdCtgPcDepth4").hide();

	$("#searchPrdCtgMbEnv").hide();
	$("#searchPrdCtgMbDepth3").hide();
	$("#searchPrdCtgMbDepth4").hide();


	if(PLN_MST_TYPE!="S")
	{
		$("#PLN_MST_SECRET").hide();
   		$("#secretLabel").hide();
	}

	 // 카테고리 설정
	if( $("#frm").find("input[name='searchPrdCtgPcEnv']").val() != ""){
	 	getCategoryList("searchPrdCtgPcDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgPcDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgPcEnv}" />");
	}


	 // 카테고리 설정
	if( $("#frm").find("input[name='searchPrdCtgMbEnv']").val() != ""){
	 	getCategoryList("searchPrdCtgMbDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgMbDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgMbEnv}" />");
	}


    // 카테고리 변경 이벤트

    getCategoryList("searchPrdCtgPcDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgPcDepth1}" />", "<c:out value="${serverDomain}"/>" , $("#searchPrdCtgPcEnv option:selected").val());
   	getCategoryList("searchPrdCtgPcDepth2", "<c:out value="${commandMap.searchPrdCtgPcDepth1}" />", "<c:out value="${commandMap.searchPrdCtgPcDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
   	getCategoryList("searchPrdCtgPcDepth3", "<c:out value="${commandMap.searchPrdCtgPcDepth2}" />", "<c:out value="${commandMap.searchPrdCtgPcDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
   	getCategoryList("searchPrdCtgPcDepth4", "<c:out value="${commandMap.searchPrdCtgPcDepth3}" />", "<c:out value="${commandMap.searchPrdCtgPcDepth4}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());

   	getCategoryList("searchPrdCtgMbDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgMbDepth1}" />", "<c:out value="${serverDomain}"/>" , $("#searchPrdCtgMbEnv option:selected").val());
   	getCategoryList("searchPrdCtgMbDepth2", "<c:out value="${commandMap.searchPrdCtgMbDepth1}" />", "<c:out value="${commandMap.searchPrdCtgMbDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
   	getCategoryList("searchPrdCtgMbDepth3", "<c:out value="${commandMap.searchPrdCtgMbDepth2}" />", "<c:out value="${commandMap.searchPrdCtgMbDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
   	getCategoryList("searchPrdCtgMbDepth4", "<c:out value="${commandMap.searchPrdCtgMbDepth3}" />", "<c:out value="${commandMap.searchPrdCtgMbDepth4}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());


	$(document).on("change", "#searchPrdCtgPcDepth1", function ()
	{
	    getCategoryList("searchPrdCtgPcDepth2", $("#searchPrdCtgPcDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
	    getCategoryList("searchPrdCtgPcDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
	    getCategoryList("searchPrdCtgPcDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
	});
	$(document).on("change", "#searchPrdCtgPcDepth2", function ()
	{
	    getCategoryList("searchPrdCtgPcDepth3", $("#searchPrdCtgPcDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
	    getCategoryList("searchPrdCtgPcDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
	});
	$(document).on("change", "#searchPrdCtgPcDepth3", function ()
	{
	    getCategoryList("searchPrdCtgPcDepth4", $("#searchPrdCtgPcDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
	});

	$(document).on("click", ".goCategoryAdd", function () {
		var $topParent = $(this).parents(".section-form");

		var arrayObj = new Array();

		if($("#searchPrdCtgPcEnv").val() == ""){
			alert("PC/MOBILE 구분을 선택해 주십시오.");
			$("#searchPrdCtgPcEnv").focus();
			return;
		}
		if($("#searchPrdCtgPcDepth1").val() == ""){
			alert("카테고리1을 선택해 주십시오.");
			$("#searchPrdCtgPcDepth1").focus();
			return;
		}

		var obj = new Object();

		var CATEGORYPCGB = $("#searchPrdCtgPcEnv option:selected").val();
		var CATEGORYPC1 = $("#searchPrdCtgPcDepth1 option:selected").val();
		var CATEGORYPC2 = $("#searchPrdCtgPcDepth2 option:selected").val();
		var CATEGORYPC3 = $("#searchPrdCtgPcDepth3 option:selected").val();
		var CATEGORYPC4 = $("#searchPrdCtgPcDepth4 option:selected").val();
		var CATEGORYPCGBNM = $("#searchPrdCtgPcEnv option:selected").text();
		var CATEGORYPC1NM = $("#searchPrdCtgPcDepth1 option:selected").text();
		var CATEGORYPC2NM = $("#searchPrdCtgPcDepth2 option:selected").text();
		var CATEGORYPC3NM = $("#searchPrdCtgPcDepth3 option:selected").text();
		var CATEGORYPC4NM = $("#searchPrdCtgPcDepth4 option:selected").text();



		var CATEGORYNM = CATEGORYPC1NM;
		var CATEGORYPC = CATEGORYPC1;

		if(CATEGORYPC2 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYPC2NM;
		if(CATEGORYPC3 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYPC3NM;
		if(CATEGORYPC4 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYPC4NM;

		if(CATEGORYPC2 != "") CATEGORYPC = CATEGORYPC2;
		if(CATEGORYPC3 != "") CATEGORYPC = CATEGORYPC3;
		if(CATEGORYPC4 != "") CATEGORYPC = CATEGORYPC4;


		if(!fnCategoryPcDupChk(CATEGORYPC))
		{
			alert("이미 등록된 카테고리입니다.");
			$("#searchPrdCtgPcDepth1").focus();
			return;
		}


		obj.CATEGORYNM = CATEGORYNM;
		obj.CATEGORYPCGB = CATEGORYPCGB;
		obj.CATEGORYPC1 = CATEGORYPC;


		arrayObj.push(obj);

		$topParent.find(".categoryNodata").remove();

		$( "#categoryPcTemplate" ).tmpl( arrayObj ).appendTo($topParent.find(".applyCategoryPcList"));

    });

	$(document).on("change", "#searchPrdCtgMbDepth1", function ()
	{
	    getCategoryList("searchPrdCtgMbDepth2", $("#searchPrdCtgMbDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
		getCategoryList("searchPrdCtgMbDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
		getCategoryList("searchPrdCtgMbDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
	});
	$(document).on("change", "#searchPrdCtgMbDepth2", function ()
	{
	    getCategoryList("searchPrdCtgMbDepth3", $("#searchPrdCtgMbDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
	    getCategoryList("searchPrdCtgMbDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
	});
	$(document).on("change", "#searchPrdCtgMbDepth3", function ()
	{
	    getCategoryList("searchPrdCtgMbDepth4", $("#searchPrdCtgMbDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
	});

	$(document).on("click", ".goCategoryMbAdd", function () {
		var $topParent = $(this).parents(".section-form");

		var arrayObj = new Array();

		if($("#searchPrdCtgMbEnv").val() == ""){
			alert("Mb/MOBILE 구분을 선택해 주십시오.");
			$("#searchPrdCtgMbEnv").focus();
			return;
		}
		if($("#searchPrdCtgMbDepth1").val() == ""){
			alert("카테고리1을 선택해 주십시오.");
			$("#searchPrdCtgMbDepth1").focus();
			return;
		}

		var obj = new Object();

		var CATEGORYMBGB = $("#searchPrdCtgMbEnv option:selected").val();
		var CATEGORYMB1 = $("#searchPrdCtgMbDepth1 option:selected").val();
		var CATEGORYMB2 = $("#searchPrdCtgMbDepth2 option:selected").val();
		var CATEGORYMB3 = $("#searchPrdCtgMbDepth3 option:selected").val();
		var CATEGORYMB4 = $("#searchPrdCtgMbDepth4 option:selected").val();
		var CATEGORYMBGBNM = $("#searchPrdCtgMbEnv option:selected").text();
		var CATEGORYMB1NM = $("#searchPrdCtgMbDepth1 option:selected").text();
		var CATEGORYMB2NM = $("#searchPrdCtgMbDepth2 option:selected").text();
		var CATEGORYMB3NM = $("#searchPrdCtgMbDepth3 option:selected").text();
		var CATEGORYMB4NM = $("#searchPrdCtgMbDepth4 option:selected").text();



		var CATEGORYNM = CATEGORYMB1NM;
		var CATEGORYMB = CATEGORYMB1;
		if(CATEGORYMB2 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYMB2NM;
		if(CATEGORYMB3 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYMB3NM;
		if(CATEGORYMB4 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYMB4NM;

		if(CATEGORYMB2 != "") CATEGORYMB = CATEGORYMB2;
		if(CATEGORYMB3 != "") CATEGORYMB = CATEGORYMB3;
		if(CATEGORYMB4 != "") CATEGORYMB = CATEGORYMB4;

		if(!fnCategoryMbDupChk(CATEGORYMB))
		{
			alert("이미 등록된 카테고리입니다.");
			$("#searchPrdCtgMbDepth1").focus();
			return;
		}

		obj.CATEGORYNM = CATEGORYNM;
		obj.CATEGORYMBGB = CATEGORYMBGB;
		obj.CATEGORYMB1 = CATEGORYMB;

		arrayObj.push(obj);

		$topParent.find(".categoryMbNodata").remove();

		$( "#categoryMbTemplate" ).tmpl( arrayObj ).appendTo($topParent.find(".applyCategoryMbList"));

	});

	fnCategoryPcDupChk = function(selectObj1 ){

     	var bReturn = true;

        var $categoryBox = $("#categoryTable");


        var $obj = $categoryBox.find(".applyCategoryPcList .CATEGORYPC1");

        $.each($obj, function(){
        	if(selectObj1 == $(this).val()){

                bReturn = false;

            }
        });


        return bReturn;
    };

    fnCategoryMbDupChk = function(selectObj1 ){

    	var bReturn = true;

        var $categoryBox = $("#categoryMbTable");

        var $obj = $categoryBox.find(".applyCategoryMbList .CATEGORYMB1");

        $.each($obj, function(){
        	if(selectObj1 == $(this).val()){

                bReturn = false;
            }
        });

        return bReturn;
    };
    // 카테고리구성 체크박스 클릭 이벤트
    $(document).on("change", ".checkAllCatPc", function () {
        var $this = $(this);
        var $tbody = $this.parents(".table-a").find(".applyCategoryPcList");
        var $checkbox = $tbody.find(".checkRowCatPc");
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

    $(document).on("change", ".checkAllCatMb", function () {
        var $this = $(this);
        var $tbody = $this.parents(".table-a").find(".applyCategoryMbList");
        var $checkbox = $tbody.find(".checkRowCatMb");
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

    // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", ".goCategoryPcDelete", function () {

        var $topParent = $(this).parents(".section-form");
        if($topParent.find(".checkRowCatPc:checked").length == 0)
        {
            alert("삭제할 카테고리를 선택하여 주십시오.");
            return;
        }

        $topParent.find(".applyCategoryPcList").children("tr").each(function() {

            if($(this).find(".checkRowCatPc").is(":checked"))
            {
                $(this).remove();
            }
        });

        if($topParent.find(".applyCategoryPcList").children("tr").length == 0)
        {
            $topParent.find(".applyCategoryPcList").append('<tr class="categoryNodata"><td colspan="2">등록된 카테고리가 없습니다.</td></tr>');
        }
        //체크박스 전체 선택
        $topParent.find(".checkAllCatPc").prop("checked", false);

    });

    // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", ".goCategoryMbDelete", function () {

        var $topParent = $(this).parents(".section-form");
        if($topParent.find(".checkRowCatMb:checked").length == 0)
        {
            alert("삭제할 카테고리를 선택하여 주십시오.");
            return;
        }

        $topParent.find(".applyCategoryMbList").children("tr").each(function() {

            if($(this).find(".checkRowCatMb").is(":checked"))
            {
                $(this).remove();
            }
        });

        if($topParent.find(".applyCategoryMbList").children("tr").length == 0)
        {
            $topParent.find(".applyCategoryMbList").append('<tr class="categoryMbNodata"><td colspan="2">등록된 카테고리가 없습니다.</td></tr>');
        }
        //체크박스 전체 선택
        $topParent.find(".checkAllCatMb").prop("checked", false);

    });


	$(document).on("click", "#PLN_MST_TYPE", function ()
	{
		var type = $(this).val();

	   	if(type!="S")
	   	{
	   		$("#PLN_MST_SECRET").hide();
	   		$("#secretLabel").hide();
	   	}
	   	else
	   	{
	  		$("#PLN_MST_SECRET").show();
	   		$("#secretLabel").show();
	   	}

	});


	$(document).on("keyup",".PLN_RPLY_CONTENTS",function(){
		getStrByte(this,'#contentsByte', 1000, 3);
	});

	$(document).on("click", "#replyRegist", function () {
		var PLN_RPLY_CONTENTS = $("#PLN_RPLY_CONTENTS").val();
		var PLN_RPLY_YN = $("#PLN_RPLY_YN").val();
		var PLN_MST_IDX = $("#PLN_MST_IDX").val();
		 $.ajax({
			 async : false,
			 type : "POST",
			 data : {"PLN_RPLY_CONTENTS": PLN_RPLY_CONTENTS, "PLN_RPLY_YN":PLN_RPLY_YN, "PLN_MST_IDX":PLN_MST_IDX },
			 url : "<c:out value="${serverDomain}" />/am/marketing/replyRegistAjax.do",
			 success : function (data) {
				 if(data.result == 0){
					 alert("저장 중 오류가 발생하였습니다. 관리자에게 문의하세요.");
				 }else{
					 var $frm = $("#searchForm");
			        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/planEdit.do", "target":"_self", "method":"post"}).submit();
				 }
			 }, error : function (err) {
				 alert("오류가 발생하였습니다.\n[" + err.status + "]");
			 }
		 });
	});


	//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
	$(".PLN_GRP_TYPE_T").each(function(){
		var fileName = $(this).data("file_name");
		var type = $(this).val();

		if(type=="T")
		{

			$("input[name='"+ fileName +"']").prop("disabled", true);
			//$("#"+ fileName).prop("disabled", true);
			//$(fileName).hide();
		}
	});

	// 파일 삭제 check box 변경 이벤트
	$(document).on("change", ".PLN_GRP_TYPE", function () {
		var $this = $(this);
		var fileName = $(this).data("file_name");

	 	var type = $(this).val();
		if(type=="I")
		{
			$("input[name='"+ fileName +"']").prop("disabled", false);
		}
		else
		{
			$("input[name='"+ fileName +"']").val("");
			$("input[name='"+ fileName +"']").prop("disabled", true);
		}
	});


	//기획전 채널에 따라 초기 이미지 show/hide
	setTimeout(function(){
		if($("input:checkbox[id=PLN_MST_CHANNEL_PC_YN]").is(":checked") == false)
		{
			$(".pcImgDiv").hide();
		}
		else if($("input:checkbox[id=PLN_MST_CHANNEL_MOBILE_YN]").is(":checked") == false)
		{
			$(".mobileImgDiv").hide();
		}
	},500);

	//기획전 채널 선택
    $(document).on("click", "#PLN_MST_CHANNEL_PC_YN", function ()
    {
    	if($(this).is(":checked") == true)
    	{
    		$(".pcImgDiv").show();
    		showSmartEditor("PLN_MST_PC_BANNER", 50, 1);
    	}
    	else
    	{
    		$(".pcImgDiv").hide();
    	}
    });
    $(document).on("click", "#PLN_MST_CHANNEL_MOBILE_YN", function ()
    {
    	if($(this).is(":checked") == true)
    	{
    		$(".mobileImgDiv").show();
    		showSmartEditor("PLN_MST_MOBILE_BANNER", 50, 2);
    	}
    	else
    	{
    		$(".mobileImgDiv").hide();
    	}
    });

	 // 상품 검색 버튼 클릭 이벤트
	var $productBox = null;
	$(document).on("click", "#productBox .search-product-popup", function () {
		// 해당 그룹의 최 상위 부모 Node
		$productBox = $(this).parents(".productSelectform");	//productSelectform
		popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
	});

	fnProductPlanPop = function( PRD_MST_CD ){

		popup("<c:out value="${serverDomain}" />/am/marketing/searchProductPlanPopup.do?PRD_MST_CD="+PRD_MST_CD, "600", "600", "yes", "searchProductPlan");
	};

	//상품 중복체크
	fnDuplicationChk = function( selectObj ){
		var bReturn = true;
		var $obj = $productBox.find(".applyProductList .PLN_PRD_MST_CD");
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
		//기본TR삭제
    	$productBox.find(".productNodata").remove();
    	//배열재정의
    	var arrayObj = new Array();
    	var len = $productBox.find(".applyProductList .PLN_PRD_MST_CD").length;

		var obj;
		if( bCheck ){

			$.each(params, function(index,item){
				len++;
        		obj = new Object();
        		obj.PRD_MST_CD 			= item.PRD_MST_CD;
        		obj.PRD_MST_NM 			= item.PRD_MST_NM;
        		obj.PRD_MST_PRC     	= setComma(item.PRD_MST_PRC);
        		obj.PRD_MST_DLV_FEE    	= setComma(item.PRD_MST_DLV_FEE);
        		obj.PRD_MST_SEL_STATE	= item.PRD_MST_SEL_STATE;
        		obj.PRD_MST_VDR_NM      = item.PRD_MST_VDR_NM;
        		obj.PLN_DTL_ORDER       = len;
				obj.PRD_NOW_DST_PRICE	=	setComma(item.PRD_NOW_DST_PRICE);
				obj.PRD_IMAGE = item.PRD_IMAGE;
				obj.PRD_IMAGE_ALT = item.PRD_IMAGE_ALT;
        		obj.NUM 				= $productBox.find(".groupNum").val();
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

        		obj.serverDomain 			= '<c:out value="${serverDomain}" />';


        		arrayObj.push(obj); //만들어진  object를 배열에 추가

			});
			$( "#productTemplate" ).tmpl( arrayObj ).appendTo($productBox.find(".applyProductList"));

		}
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
        
        //사용상품 삭제시 순서 재배치
        var index = 1;
        $topParent.find(".applyProductList").children("tr").each(function() {
        	$(this).children()[9].children[2].value = index++;
        });

		if($topParent.find(".applyProductList").children("tr").length == 0)
		{
			$topParent.find(".applyProductList").append('<tr class="productNodata"><td colspan="12">상품을 검색해 주세요.</td></tr>');
		}
		//체크박스 전체 선택
		$topParent.find(".checkAll").prop("checked", false);

	});

	// 목록 버튼 클릭 이벤트
	$(document).on("click", "#goList", function() {
		$("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/planList.do", "target" : "_self", "method" : "post"}).submit();
	});

	// 등록 이벤트
    $(document).on("click", "#goRegist", function() {

    	var vaidationCheck = true
       	
        if($.trim($("#PLN_MST_ST_DT").val()) == ""){
            alert("기획전 시작일을 입력해 주십시오.");
            $("#PLN_MST_ST_DT").focus();
            return;
        }
        if($.trim($("#PLN_MST_ST_HH").val()) == ""){
            alert("기획전 시작 시간을 입력해 주십시오.");
            $("#PLN_MST_ST_HH").focus();
            return;
        }
        if($.trim($("#PLN_MST_ST_MI").val()) == ""){
            alert("기획전 시작 분을 입력해 주십시오.");
            $("#PLN_MST_ST_MI").focus();
            return;
        }


        if($.trim($("#PLN_MST_ED_DT").val()) == ""){
            alert("기획전 종료일을 입력해 주십시오.");
            $("#PLN_MST_ED_DT").focus();
            return;
        }
        if($.trim($("#PLN_MST_ED_HH").val()) == ""){
            alert("기획전 종료시간을 입력해 주십시오.");
            $("#PLN_MST_ED_HH").focus();
            return;
        }
        if($.trim($("#PLN_MST_ED_MI").val()) == ""){
            alert("기획전 종료 분을 입력해 주십시오.");
            $("#PLN_MST_ED_MI").focus();
            return;
        }
        if($.trim($("#PLN_MST_TITLE").val()) == ""){
            alert("기획전명을 입력해 주십시오.");
            $("#PLN_MST_TITLE").focus();
            return;
        }
		
        var today = getToday();
        var endDay = $.trim($("#PLN_MST_ED_DT").val()).replace(/\-/gi, "");

        if(endDay < today){
            alert("기획전 종료일은 현재 일자 이후여야 합니다.");
            $("#PLN_MST_ED_DT").focus();
            return;
        }
		
        var file1 = $("#multiFile1").val();//PC목록이미지
        var file2 = $("#multiFile2").val();//PC상세이미지
        var file4 = $("#multiFile4").val();//Mobile 목록 이미지
        var file5 = $("#multiFile5").val();//Mobile 상세 이미지

        //일반 validaation
        if($("#multiFile1").is(":visible")){
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
        	if(file4 == "" && $("#CMM_FLE_IDX_2").val() == undefined){
        		alert("MOBILE 목록 이미지를 입력해 주십시오.");
              	$("#multiFile4").focus();
              	return;    
            }
        	if($.trim($("#CMN_FLE_ALT_TXT_M1").val()) == ""){//대체텍스트 체크
                alert("MOBILE 목록 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_M1").focus();
                return;
            }
        	var type = $(":input:radio[name=_MST_DETAIL_TYPE]:checked").val()
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
 				
 				
 				if(file5 == "" && $("#CMM_FLE_IDX_4").val() == undefined){
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
 				if($('#PLN_MST_PC_BANNER').val() == ""){
 					alert('PC 에디터를 입력해 주십시오.')
 					$('textarea#PLN_MST_PC_BANNER').focus()
 					return;
 				}
 				if($('#PLN_MST_MOBILE_BANNER').val() ==""){
 					alert('PC 에디터를 입력해 주십시오.')
 					$('textarea#PLN_MST_MOBILE_BANNER').focus()
 					return;
 				}
 			}else if(type=="S"){
 				if($('textarea#PLN_MST_PC_SCRIPT').val()== ""){
 					alert('PC 스크립트를 입력해 주십시오.')
 					$('textarea#PLN_MST_PC_SCRIPT').focus()
 					return;
 				}
 				if($('textarea#PLN_MST_MOBILE_SCRIPT').val() == ""){
 					alert('MOBILE 스크립트를 입력해 주십시오.')
 					$('textarea#PLN_MST_MOBILE_SCRIPT').focus()
 					return;
 				}
 			} 
        	$(".PLN_GRP_TITLE").each(function(index,item){
            	if($(item).val() == "" ){
                	$(item).focus();
             		alert('그룹명을 입력해 주십시오.')
             		vaidationCheck = false
             		return false;
             	}
            })
			if(!vaidationCheck){ return; }
 			
             $(".applyProductList").each(function(){
                 if($(this).find(".checkRow").length <= 0 && $(this).is(":visible"))
                 {
                     alert("[사용상품]상품을 추가해 주십시오.");
                     /* $formGroup.children().eq(1).children().eq(0).find(".search-product-popup").focus(); */
                     $(this).find(".search-product-popup").focus();
              		 vaidationCheck = false;
                     groupCheck = false;
                     return false;
                 }
             });
             if(!vaidationCheck){ return; }
        }else{
        	//매거진 validation
        	$(".PLN_GRP_DESC").each(function(){
                if($(this).val() == "")
                {
                	alert("상품그룹설명을 추가해 주십시오.")
                	$(this).focus();
                	vaidationCheck = false;
                	return false;
                }
            })
            if(!vaidationCheck){ return; }
        	/*
            $(".file*").each(function(){
            	if($(this).val() == "" && $(this).is(":visible")){
            		alert("대표이미지를 추가해 주십시오.")
                	vaidationCheck = false;
					return false;
            	}
            })
            */
            if(!vaidationCheck){ return; }
        	$(".applyProductList").each(function(){
                if($(this).find(".checkRow").length <= 0 && $(this).is(":visible"))
                {
                    alert("[사용상품]상품을 추가해 주십시오.");
                    /* $formGroup.children().eq(1).children().eq(0).find(".search-product-popup").focus(); */
                    $(this).find(".search-product-popup").focus();
                    vaidationCheck = false
                    groupCheck = false;
                    return false;
                }
            })
            if(!vaidationCheck){ return; }
        }

    	if($(".tag_cloud_list").children().length<=0){
        	alert("태그를 추가해 주십시오.")
        	return;
        }
        
        var $groupTitle = $(".PLN_GRP_TITLE");
        var groupCheck = true;

         if(groupCheck)
         {
             try { oEditors1.getById["PLN_MST_PC_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);     } catch(e){ } //editor 내용을 PLN_MST_PC_BANNER TEXTAREA의 VALUE 값으로 만든다.
             try { oEditors2.getById["PLN_MST_MOBILE_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);     } catch(e){ } //editor 내용을 PLN_MST_MOBILE_BANNER TEXTAREA의 VALUE 값으로 만든다.

             if (confirm("저장 하시겠습니까?"))
             {
                 $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/planModify.do", "target" : "_self", "method" : "post"}).submit();
             }
         }
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
            var $thisSectionForm = $obj.parents(".addFormCon");
            var $productBox = $thisSectionForm.parent();
            //$thisSectionForm.remove();
            $thisSectionForm.find(".DEL_YN").val("Y");
            $thisSectionForm.hide();

            // 상품 그룹 순서 정렬
            var $sectionForm = $productBox.find(".addFormCon");
            $sectionForm.each(function (index) {
                var $this = $(this);
                $this.find(".groupNum").val(index);
                $this.find(".PLN_GRP_TITLE").prop("name", "PLN_GRP_TITLE" + index);
                $this.find(".PLN_GRP_COL").prop("name", "PLN_GRP_COL" + index);
                $this.find(".PLN_GRP_SORT").prop("name", "PLN_GRP_SORT" + index);
                $this.find(".PLN_PRD_MST_CD").prop("name", "PLN_PRD_MST_CD" + index);
            });
        }
        else
        {
            var $sectionForm = $("#productBox").find(".addFormCon");
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

    dplClick		= function(va){
    	if(va == 'Y'){
    		$("#prdTypeDiv").show();
    	}else{
    		$("#prdTypeDiv").hide();
    	}
    	return false;
    };

 	dplClick('<c:out value="${row.PLN_MST_PRD_DPL_YN}" />');
});

changeType = function(typeCode){
    
    var $productBox = $("#productBox");
    var addLength = 1;

    var arrayObj = new Array();
    $productBox.empty();
    for(var i = 0 ; i < addLength ; i++)
    {
        var obj = new Object();
        obj.NUM = productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
        arrayObj.push(obj);
    }
    if($(":input:radio[name=PLN_MST_TYPE]:checked").val() == "M"){
        $("#productGroupMagazineTemplate").tmpl(arrayObj).appendTo($productBox);
        $(".normal").hide();
    }else{
        $("#productGroupTemplate").tmpl(arrayObj).appendTo($productBox);
        $(".normal").show();
        changeDetailType("planType3")
    }
};

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
        showSmartEditor("PLN_MST_PC_BANNER", 300, 1);
        showSmartEditor("PLN_MST_MOBILE_BANNER", 300, 2);
        
    }
    else if (typeCode=="planType5"){
        $(".detailTypeScript").show();
    }
    detailType = typeCode;
};
changeMediaType = function(typeCode){
	if($(":input:file[class=pcVideoFile]:checked").val() == "on"){
        $(".pcVideoFile").hide();
    }else{
    	$(".pcImgFile").hide();
    }
};
function moveUp(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소

	var index = $(el).parent().children()[2].value
	$tr.prev().children()[9].children[2].value =index;
	$(el).parent().children()[2].value = --index;
	
	$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
}

function moveDown(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
	var index = $(el).parent().children()[2].value
	$tr.next().children()[9].children[2].value =index;
	$(el).parent().children()[2].value = ++index;
	$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
}

getToday = function ()
{
    var dateObj = new Date();
    var year = dateObj.getFullYear();
    var month = dateObj.getMonth()+1;
    if(month < 10)month = "0"+month;
    var day = dateObj.getDate();
    if(day < 10)day = "0"+day;
    var today = year + month + day;
    return today;
};

//태그 선택 버튼 클릭 이벤트
$(document).on("click", ".btn_tag_select",function() {
	popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do","900", "500", "yes");
});

fnResultTag = function(params) {
	$(".tag_cloud_list").children().remove()
	$("#representTag").find("option").remove();
	for (var i = 0; i < params.length; i++) {
		$(".tag_cloud_list").append('<li class="sel_tag_list txt" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'">' + params[i].value + '<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'"/></li>').parents('.tag_cloud_wrap_side').siblings('.txt_warnning').hide();
		$("#representTag").append('<option value="' + params[i].TAG_MST_ID + '"name="'+ params[i].TAG_MST_ID +'">'+ params[i].value + '</option>');
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


//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
$(".cmmFleIdx").each(function(){
    var fileName = $(this).data("file_name");
    console.log('file_name'  + fileName)
    $("input[name='"+ fileName +"']").prop("disabled", true);
});
//이미지 삭제 후 이벤트
$("input[name='file']").on("change",function(){
	$(this).parent().parent().children()[0].text = this.value.substring(this.value.lastIndexOf("\\")+1)
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



var $productBox = null;
$(document).on("click", "#productBox .plnGrpRefType", function () {
    // 해당 그룹의 최 상위 부모 Node
    $productBox = $(this).parents(".productSelectform*");
    if(this.classList.contains("Video")){
    	$productBox.find(".pcImgFileGrp").hide();
    	$productBox.find(".pcVideoFileGrp").show();
    }else{
    	$productBox.find(".pcVideoFileGrp").hide();
    	$productBox.find(".pcImgFileGrp").show();
    }
});


/*
$(document).on("click", "#productBox .filedeletechk", function () {
    // 해당 그룹의 최 상위 부모 Node
    $productBox = $(this).parents(".productSelectform*");
     var chkdel = $(this).is(":checked") ;


    
    //alert( '체크 여부 :  ' +   this.classList.find( ":input:radio[name=CMM_FLE_IDX]:checked" ) );


    if(chkdel){
        console.log(  '체크여부 ture' +chkdel  );    	
    	//$productBox.find(".GrpImgFile").removeAttr("disabled");
    	$productBox.find(".GrpImgFile").prop( "disabled" , false);    	


    }else{
        console.log(  '체크여부 false' +chkdel  );    	
    	$productBox.find(".GrpImgFile").prop( "disabled" , true);    	

    }

});
*/


$('.filedeletechk').on('change', function(){
    var ttt = $(this).attr('data-input-id');
    
    console.log(  '체크여부  ' +ttt  );   
    
    if($(this).is(':checked')){
        
        $('#'+ttt).prop('disabled', false)
    } else {
        $('#'+ttt).prop('disabled', true)
    }
});



//-->
</script>

</body>
</html>
