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

            <div class="container"><!-- container -->

                <h2 class="title"><span>리뷰어모집</span></h2>

                <div class="tab-list"><!-- tab -->
                    <ul class="tab">
                        <li class="in"><a href="#none" id="goBiasicEdit">모집관리</a></li>
                        <li><a href="javascript:;" id="goEntryList">응모자확인&당첨자 선정</a></li>
                        <!--  <li><a href="javascript:;" id="goWinnerList">당첨자 발표</a></li>-->
                        <li><a href="javascript:;" id="goReview">상품리뷰관리</a></li>
                    </ul>
                </div><!-- // tab -->

                <h3 class="title"><span>상세/수정</span></h3>

                <p>
                   	<i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form name="tabForm" id="tabForm">
                    <input type="hidden" name="EXP_MST_CD" value="<c:out value="${row.EXP_MST_CD }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
                    <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
                    <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
                    <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
                    <input type="hidden" name="searchExpMstStatus" value="<c:out value="${commandMap.searchExpMstStatus }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
                    <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
                    <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
                    <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
                    <input type="hidden" name="searchExpMstStatus" value="<c:out value="${commandMap.searchExpMstStatus }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>

                <form id="frm" name="frm" enctype="multipart/form-data">
                    <input type="hidden" name="EXP_MST_CD" value="<c:out value="${row.EXP_MST_CD }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
                    <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
                    <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
                    <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" id="removeFiles" name="removeFiles" value="" /><!-- 파일삭제관련변수 -->

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>등록일/작성자</span></th>
                                <td>
                                    <ui:formatDate value="${row.EXP_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>/<c:out value="${row.EXP_MST_REG_ID }"/>(<c:out value="${row.EXP_MST_REG_NM }"/>)
                                </td>
                                <th><span>상태</span></th>
                                <td>
                                   	<c:out value="${row.EXP_MST_STATE }"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>전시여부<i class="require"><em>필수입력</em></i></span></th>
    	                        <td>
    	                         	<input type="radio" id="stateA" name="EXP_MST_USE_YN" class="radio" <c:if test="${row.EXP_MST_USE_YN eq 'Y' }">checked</c:if> value="Y" />
    								<label for="stateA">노출</label>
    								<input type="radio"	id="stateB" name="EXP_MST_USE_YN" class="radio" <c:if test="${row.EXP_MST_USE_YN eq 'N' }">checked</c:if> value="N" />
    								<label for="stateB">미노출</label>
    	                        </td>
                                <th><span>상단노출<i class="require"><em>필수입력</em></i></span></th>
    	                        <td>
    	                         	<input type="radio" id="dspA" name="EXP_MST_TOP_DSP_YN" class="radio" <c:if test="${row.EXP_MST_TOP_DSP_YN eq 'Y' }">checked</c:if> value="Y" />
    								<label for="dspA">노출</label>
    								<input type="radio"	id="dspB" name="EXP_MST_TOP_DSP_YN" class="radio" <c:if test="${empty row.EXP_MST_TOP_DSP_YN or row.EXP_MST_TOP_DSP_YN eq 'N' }">checked</c:if> value="N" />
    								<label for="dspB">미노출</label>
    	                        </td>
                            </tr>
                            <tr>
                                <th><span>상품선택<i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <input type="text" name="PRD_MST_CD" id="PRD_MST_CD" class="text" value="<c:out value="${row.PRD_MST_CD }"/>"  readonly/>
                                    <a href="#none" class="button button-b small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>모집명<i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <input type="text" name="EXP_MST_NM" id="EXP_MST_NM" class="text" value="<c:out value="${row.EXP_MST_NM }"/>" style="width:80%;" placeholder="모집명 입력" /> (<span id="byte_2">0</span><span>/35 byte)</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span>모집내용<i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <textarea class="textarea" name="EXP_MST_DESC" id="EXP_MST_DESC" style="height: 50px; width:80%;" placeholder="모집내용 입력(최대 200byte)"><c:out value="${row.EXP_MST_DESC }"/></textarea> (<span id="byte_3">0</span><span>/200 byte)</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span>모집기간 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_RCT_ST_DT" id="EXP_MST_RCT_ST_DT" class="text" readonly="readonly" data-target-end="#EXP_MST_RCT_ED_DT" value="<ui:formatDate value="${row.EXP_MST_RCT_ST_DT }" pattern="yyyy-MM-dd"/>"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_RCT_ED_DT" id="EXP_MST_RCT_ED_DT" class="text" readonly="readonly" data-target-start="#EXP_MST_RCT_ST_DT" value="<ui:formatDate value="${row.EXP_MST_RCT_ED_DT }" pattern="yyyy-MM-dd"/>"/>
                                    <a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
									<!-- <a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a> -->
                                </td>
                            </tr>
                            <tr>
                                <th><span>활동기간 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_ATV_ST_DT" id="EXP_MST_ATV_ST_DT" class="text" readonly="readonly" data-target-end="#EXP_MST_ATV_ED_DT" value="<ui:formatDate value="${row.EXP_MST_ATV_ST_DT }" pattern="yyyy-MM-dd"/>"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_ATV_ED_DT" id="EXP_MST_ATV_ED_DT" class="text" readonly="readonly" data-target-start="#EXP_MST_ATV_ST_DT" value="<ui:formatDate value="${row.EXP_MST_ATV_ED_DT }" pattern="yyyy-MM-dd"/>" />
                                  	<a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
									<!-- <a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a> -->
                                </td>
                            </tr>
                            <tr>
                                <th><span>당첨자발표일 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_WIN_DT" id="EXP_MST_WIN_DT" class="text" data-target-start="#EXP_MST_RCT_ET_DT" readonly="readonly" value="<ui:formatDate value="${row.EXP_MST_WIN_DT }" pattern="yyyy-MM-dd"/>" />
                                </td>
                            </tr>
                            <tr>
                                <th><span>모집인원 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <input type="text" name="EXP_MST_WIN_CNT" id="EXP_MST_WIN_CNT" class="text number" value="<c:out value="${row.EXP_MST_WIN_CNT }"/>" placeholder="인원 입력"/>명
                                </td>
                            </tr>
							<tr class="normal" id="imgDiv" <c:if test="${row.EXP_MST_USE_YN ne 'Y' }">style="display: none;"</c:if>>
                                <th><span>상단노출 이미지<i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <div id="multiFile1-list">
                                    	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
											<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
												<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
												<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
												<i class="icon-file"></i>
						                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
						                        	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
						                        </a>
												<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
	                        					<label for="CMM_FLE_IDX">삭제</label>
											</c:if>
										</c:forEach>
                                    </div>
                                    <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .gif, .png"/>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"  value=""/>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                            	<th><label class="label"><span>상세내용<i class="require"><em>필수입력</em></i></span></label></th>
                           	 	<td colspan="3">
					            	<textarea class="textarea xlarge" name="EXP_MST_SCRIPT" id="EXP_MST_SCRIPT" style="width: 95%; height: 500px; display: none;"> ${row.EXP_MST_SCRIPT}</textarea>
	                    		</td>
	                     	<tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->

                <!-- 파일 다운로드용 폼 -->
                <form name="fileForm" id="fileForm">
                     <input type="hidden" name="CMM_FLE_IDX" value=""/>
                     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
                     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
                </form>

            </div><!-- // container -->

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

<ui:editor objId="#EXP_MST_SCRIPT"/>
<script>
$(function(){

    $(document).on("keyup","#EXP_MST_NM",function(){
        getStrByte(this,'#byte_2', 35, 2);
    });

    $(document).on("keyup","#EXP_MST_DESC",function(){
        getStrByte(this,'#byte_3', 200, 2);
    });

	$(document).on("keyup","#CMN_FLE_ALT_TXT_P1",function(){
        getStrByte(this,'#byte_4', 20, 1);
    });

	$(document).on("change", "input:radio[name='EXP_MST_TOP_DSP_YN']", function () {
		var topDspCnt = <c:out value="${topDspCount}"/>

		if("Y" == $(this).val()){
			$("#imgDiv").show();
			if(topDspCnt > 0){
				var result = confirm("상단노출중인 이벤트가 있습니다. 해당 이벤트로 변경하시겠습니까?");
				if(!result){
					$('input:radio[name=EXP_MST_TOP_DSP_YN]:input[value="Y"]').prop("checked", false);
					$('input:radio[name=EXP_MST_TOP_DSP_YN]:input[value="N"]').prop("checked", true);
					$("#imgDiv").hide();
				}
			}
		} else{
			$("#imgDiv").hide();
		}
    });

    //최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
    $(".cmmFleIdx").each(function(){
        var fileName = $(this).data("file_name");
        $("input[name='"+ fileName +"']").prop("disabled", true);
    });
    
    $("#EXP_MST_NM").trigger("keyup");
    $("#EXP_MST_DESC").trigger("keyup");

    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
        var cmnFleAltTxtSurvey = "";
        var cmnFleAltTxtSurveyIdx = "";

        if($.trim($("#PRD_MST_CD").val()) == ""){
            alert("상품을 입력해 주십시오.");
            $("#PRD_MST_CD").focus();
            return;
        }

        if($.trim($("#EXP_MST_NM").val()) == ""){
            alert("모집명을 입력해 주십시오.");
            $("#EXP_MST_NM").focus();
            return;
        }

        if($.trim($("#EXP_MST_DESC").val()) == ""){
            alert("모집내용을 입력해 주십시오.");
            $("#EXP_MST_DESC").focus();
            return;
        }

        if($.trim($("#EXP_MST_RCT_ST_DT").val()) == ""){
            alert("모집기간 시작일을 입력해 주십시오.");
            $("#EXP_MST_RCT_ST_DT").focus();
            return;
        }
        if($.trim($("#EXP_MST_RCT_ED_DT").val()) == ""){
            alert("모집기간 종료일을 입력해 주십시오.");
            $("#EXP_MST_RCT_ED_DT").focus();
            return;
        }

        if($.trim($("#EXP_MST_ATV_ST_DT").val()) == ""){
            alert("활동기간 시작일을 입력해 주십시오.");
            $("#EXP_MST_ATV_ST_DT").focus();
            return;
        }
        if($.trim($("#EXP_MST_ATV_ED_DT").val()) == ""){
            alert("활동기간 종료일을 입력해 주십시오.");
            $("#EXP_MST_ATV_ED_DT").focus();
            return;
        }

        if($.trim($("#EXP_MST_WIN_DT").val()) == ""){
            alert("당첨자 발표일을 입력해 주십시오.");
            $("#EXP_MST_WIN_DT").focus();
            return;
        }

        var EXP_MST_RCT_ST_DT = $.trim($("#EXP_MST_RCT_ST_DT").val());
        var EXP_MST_RCT_ED_DT = $.trim($("#EXP_MST_RCT_ED_DT").val());
        var EXP_MST_ATV_ST_DT = $.trim($("#EXP_MST_ATV_ST_DT").val());
        var EXP_MST_ATV_ED_DT = $.trim($("#EXP_MST_ATV_ED_DT").val());
        var EXP_MST_WIN_DT = $.trim($("#EXP_MST_WIN_DT").val());

        if(EXP_MST_RCT_ST_DT >= EXP_MST_RCT_ED_DT)
        {
            alert("모집종료일자가 모집시작일자이후 여야 합니다.");
            $("#EXP_MST_WIN_DT").focus();
            return;
        } 
        
        if(EXP_MST_ATV_ST_DT >= EXP_MST_ATV_ED_DT)
        {
            alert("활동종료일자가 활동시작일자이후 여야 합니다.");
            $("#EXP_MST_WIN_DT").focus();
            return;
        }

        if(EXP_MST_RCT_ED_DT >= EXP_MST_WIN_DT)
        {
            alert("당첨자발표일은 모집기간 이후여야 합니다.");
            $("#EXP_MST_WIN_DT").focus();
            return;
        }

        if(EXP_MST_WIN_DT >= EXP_MST_ATV_ST_DT)
        {
            alert("활동기간은 당첨자발표 이후여야 합니다.");
            $("#EXP_MST_ATV_ST_DT").focus();
            return;
        }

        if($.trim($("#EXP_MST_WIN_CNT").val()) == ""){
            alert("당첨인원을 입력해 주십시오.");
            $("#EXP_MST_WIN_CNT").focus();
            return;
        }

        var winCnt = $.trim($("#EXP_MST_WIN_CNT").val());
        if(parseInt(winCnt) <= 0)
        {
            alert("당첨자인원은 0 이상이어야 합니다.");
            $("#EXP_MST_WIN_CNT").focus();
            return;
        }


        // 상단 노출 시에만 
		if("Y" == $("input:radio[name='EXP_MST_TOP_DSP_YN']:checked").val()){
			//기존 첨부된 이미지
			var oldFile1 = $("#CMM_FLE_IDX_1").length;

			//새로운 첨부파일도 없고 기존 파일도 없는 경우 || 새로운 첨부파일 없는데 기존 파일 삭제한 경우
			if(( $.trim($("#multiFile1").val()) == "" == "" && oldFile1 == 0) 
					|| ($.trim($("#multiFile1").val()) == "" && oldFile1 > 0 && $("#CMM_FLE_IDX_1").is(":checked") == true)){
				
		        alert("상단노출 이미지를 등록해 주십시오.");
		        $("#multiFile1").focus();
				return;    		
			}
			
			if($.trim($("#multiFile1").val()) != "" && $.trim($("#CMN_FLE_ALT_TXT_P1").val()) == ""){//대체텍스트 체크
		        alert("상단노출 이미지 대체 텍스트를 입력해 주십시오.");
				$("#CMN_FLE_ALT_TXT_P1").focus();
				return;
			}
	    }
		
    	try { oEditors.getById["EXP_MST_SCRIPT"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ } //editor 내용을 EXP_MST_SCRIPT TEXTAREA의 VALUE 값으로 만든다.
        var CONTENTS = stringUtil.getString($.trim($("#EXP_MST_SCRIPT").val()), "");
        if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
        	 alert("[상세내용]반드시 입력해주십시오.");
            $("#EXP_MST_SCRIPT").focus();
            return;
        }

        if (confirm("저장 하시겠습니까?")) {
            $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerModify.do", "target" : "_self", "method" : "post"}).submit();
        }

    });

    // 응모자 탭 클릭 이벤트
    $(document).on("click", "#goEntryList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerEntryList.do", "target" : "_self", "method" : "post"}).submit();
    });

    $(document).on("click", "#goWinnerList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerWinList.do", "target" : "_self", "method" : "get"}).submit();
    });
    $(document).on("click", "#goReview", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerReviewList.do", "target" : "_self", "method" : "get"}).submit();
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

    //파일용량, 확장자 체크
    $('#multiFile1').bind('change', function() {
        //alert(this.files[0].size);
        var fileSise1 = this.files[0].size;
        var file1 = $("#multiFile1").val();

        var extensionF1 = file1; //파일을 추가한 input 박스의 값
        extensionF1 = extensionF1.slice(extensionF1.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.

        if(fileSise1 > 1048576){
            alert('파일 용량(1MB)만 등록 가능합니다.');
            $("#multiFile1").val('');
            return;
        }

        if(extensionF1 != "jpg" && extensionF1 != "png" &&  extensionF1 != "gif"){ //확장자를 확인합니다.
            alert('파일(jpg, png, gif)만 등록 가능합니다.');
            $("#multiFile1").val('');
            return;
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

    $(document).on("click", ".search-product-popup", function () {
        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });

    fnResultProduct = function(params){
        $.each(params, function(index,item){
            $("#PRD_MST_CD").val(item.PRD_MST_CD);
            $("#PRD_MST_ERP_CD").val(item.PRD_MST_ERP_CD);

        });

        return true;
    };

});
</script>

</body>
</html>
