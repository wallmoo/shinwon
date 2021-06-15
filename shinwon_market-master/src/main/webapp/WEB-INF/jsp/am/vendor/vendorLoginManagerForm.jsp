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
            <div class="holder"><!-- holder -->
                <div id="lnb" class="container">
                    <div class="wrap modules"><!-- modules -->
                        <div class="title">

                        </div>
                        <div class="core"></div>
                    </div><!-- // modules -->
                </div>
            </div><!-- // holder --></div><!-- // aside -->

        <div id="wrapper"><!-- wrapper -->

            <div id="breadcrumb"></div><!-- breadcrumb -->

            <div id="contents"><!-- contents -->

                <div class="container">

                    <h2 class="title"><span>입점사업무공유관리</span></h2>

                    <h3 class="title"><span>등록</span></h3>
                    <p>
                       <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
    						<input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
    				</form>
                    <form name="frm" id="frm" enctype="multipart/form-data">
                    <div class="section-form"><!-- section-form-a -->
                        <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />

    			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
    	                    <colgroup>
    	                        <col style="width: 15%;" />
    	                        <col style="width: auto;" />
    	                    </colgroup>
    	                    <tbody>
                                <tr>
                                    <th rowspan="2"><span>공유대상<i class="require"><em>필수입력</em></i></span></th>
    	                            <td>
    	                            	<input type="radio" id="stateA" name="radio" class="radio" checked="checked" value="ALL" />
    									<label for="stateA">전체</label>
    									<input type="radio"	id="stateB" name="radio" class="radio"  value="Y" />
    									<label for="stateB">입점사 선택</label>
    	                            </td>
                                </tr>
                                <!-- 입점사 선택시 활성화 -->
                                <tr>
                                    <td class="left" id="vendorClickView">
    	                                <div id="divCategory"><!-- 스펙 -->
    	                                    <div class="grid section-button-search"><!-- section button -->
    	                                        <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small"><span>선택삭제</span></a>
    	                                        <a href="#none" id="goCategoryPopup"  class="button button-b small" title="새 창 으로 열립니다."><span>입점사 검색</span></a>
    	                                    </div><!-- // section button -->

                                            <table class="table-row table-a" id="tableCategory">
                                                <colgroup>
                                                    <col style="width: 8%;">
                                                    <col style="width: 8%;">
                                                    <col style="width: auto;">
                                                    <col style="width: 20%;">
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th><input type="checkbox" class="checkbox checkAllSpec_P"></th>
                                                        <th>NO</th>
                                                        <th>입점사명</th>
                                                        <th>브랜드</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="applySpecCategoryList_P">
                                                    
                                                    <tr id="specCategoryNodata_P"><!-- row -->
                                                        <td colspan="4">입점사를 선택해 주세요.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
    	                                </div><!-- // 스펙 -->
	                                </td>
                                </tr>
                                <!-- //입점사 선택시 활성화 -->
    	                    	<tr>
                                    <th><label class="label"><span>업무구분<i class="require"><em>필수입력</em></i></span></label></th>
    	                    		<td>
                                        <select class="select">
                                            <option value="">선택</option>
                                            <c:forEach var="list" items="${workDivisionList}" varStatus="i">
		                                        <option value="${list.CMN_COM_IDX}">${ list.CMN_COM_NM}</option>
		                                    </c:forEach>
                                            
                                        </select>
    	                    		</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
    	                    		<td>
                                        <input id="CNT_TITLE" name="CNT_TITLE" type="text" class="text xlarge" name="" value="">
    	                    		</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
    	                    		<td>
    	                    			<textarea id="CNT_CONTENTS" name="CNT_CONTENTS" rows="8" cols="80"></textarea>
    	                    		</td>
    	                        </tr>
                                <tr>
    	                    		<th rowspan="2"><label class="label"><span>첨부파일<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                        <p>
                                            <a href="javascript:;"></a>
                                            <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_PC_YN" id="del" value="Y" checked = "checked" />
                                            <label for="del" >삭제</label>
                                        </p>
                                    </td>
    	                        </tr>
                                <tr>
                                    <td>
    	                    			<table id="fileView" style="width:50%;">
    		                    			<tbody>
                                                <tr>
                                                    <td id="defaultFile">
        		                    					<input type="file" name="file" id="files[0]" class="file" value=""></td>
        		                    			    	<td>
        		                    					<input type="button" name="addFile" id="addFile" value="+">
        		                    					<input type="button" id="delFileData" value="파일 지우기">
    		                    				    </td>
    		                    		    	</tr>
    		                    	    	</tbody>
                                        </table>
    		                    		<small class="desc">* 업로드 가능 파일 : hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf</small>
     	                            	<small class="desc">* 업로드 용량 : 20MB</small>
	                    	    	</td>
                                </tr>
    	                    </tbody>
                    	</table><!-- // table -->
                    </div>
                    </form>

                    <div class="section-button"><!-- section-button -->
                        <div class="wrap text-center">
                            <a href="javascript:goRegist();" id="goRegist" class="button large primary"><span>저장</span></a>
                            <a href="javascript:goList();" id="goList" class="button large"><span>목록</span></a>
                        </div>
                    </div><!-- // section-button -->

                </div>

            </div><!-- // contents -->

        </div><!-- // wrapper -->

        <div id="quickmenu" class="aside right"><!-- quickmenu-->
            <div class="holder"><!-- holder -->

                <div id="quick" class="container">

                    <div class="wrap modules"><!-- modules -->
                        <ul class="core">
                            <li class="d2 active">
                                <a href="javascript:;" class="d2"><span>admin 님</span></a>
                                <div class="d3 show"><!-- d3 -->
                                    <ul class="d3">
                                        <li class="d3">
                                            <a href="http://bo.marketplanta.epasscni.com/am/manager/logout.do" class="d3"><span>로그아웃</span></a>
                                        </li>
                                    </ul>
                                </div><!-- // d3 -->
                            </li>
                        </ul>
                    </div><!-- // modules -->

                </div>

            </div><!-- // holder --></div><!-- // quickmenu -->

    </div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>  
  <script id="vendorTemplate" type="text/x-jquery-tmpl">
	<tr>
		<td><input type="checkbox" class="checkbox checkRow" name="VDR_MST_IDX" value="\${vdrNm}"/></td>
        <td>\${len}</td>
        <td name="VDR_MST_IDX">\${vdrNm}</td>
        <td>\${brdNM}</td>
    </tr>
</script>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:out value="${serverDomain}" />/am/css/postAddr.css">
<script src="<c:out value="${serverDomain}" />/am/js/postAddr.js"></script>   
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script>
$("#vendorClickView").hide();

	$(document).on("click", "#goCategoryPopup", function () {
	    popup("<c:out value="${serverDomain}" />//am/site/searchBrandVendorPopup.do", "900", "500", "yes");
	});
	$(document).on("click", ".radio", function () {
		if($(this).val() == "Y"){
			$("#vendorClickView").show();
		}else{
			$("#vendorClickView").hide();
		}
	});
	
	fnResultErpVendor = function(vdrNm,vdrIdx,brdNM){
		var arrayObj = new Array();
		$("#specCategoryNodata_P").remove()
        var len = $("#applySpecCategoryList_P tr").length;
        var obj;
        len++;
        obj = new Object();
        obj.vdrNm = vdrNm
        obj.vdrIdx = vdrIdx
        obj.brdNM = brdNM
        obj.len = len;
		$( "#vendorTemplate" ).tmpl( obj ).appendTo($("#applySpecCategoryList_P"));
	};
	goRegist = function(){
		
		if($(".select option:selected").text() == "선택"){
			alert("업무구분을 선택해주십시오.");
			return;
		}
		
		if($("#CNT_TITLE").val() == ""){
			alert("제목을 입력하여 주십시오.");
			$("#CNT_TITLE").focus();
			return;
		}
		if($("#CNT_CONTENTS").val() == ""){
			alert("내용을 입력하여 주십시오.");
			$("#CNT_CONTENTS").focus();
			return;
		}
		
		$(".file").each(function() {
            if($(this).val() == ""){
            	alert("파일을 입력하여 주십시오.");
    			return;
            }
        });
		alert("저장완료.");
	};
	$("#addFile").click(function(){
        var fileNum = $("#fileView tr").children().length;
        
        $("#fileView").append('<tr><td>' + '<input type="file" class="file" name="file" id="files['+ fileNum +']"/>' + '</td><td>'+'<input type="button" onClick="rowDelete(this)" value="-"/>'+'</td></tr>');
        // 고정 첨부파일 행 파일지우기 비활성화
        $("#delFileData").prop("disabled", true);
        
    });
	$("#delFileData").click(function(e){
        e.preventDefault();     
        $("#defaultFile").find("input").remove();
        $("#defaultFile").append('<input type="file" name="file" id="files[0]" class="file" value="" />');
    });
	// 현재 행 삭제
	function rowDelete(row)
	{
	    $(row).parent().parent().remove();
	    
	    // 고정 첨부파일 행 파일지우기 활성화
	    if($("input[name='file']").length == 1)
	    {
	        $("#delFileData").prop("disabled", false);
	    }
	}
	
</script>
</body>
</html>
