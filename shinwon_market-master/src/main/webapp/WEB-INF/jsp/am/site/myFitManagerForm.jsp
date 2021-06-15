<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>

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

            <h2 class="title"><span>마이핏관리</span></h2>

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
				<input type="hidden" name="list" id="list" value="<c:out value="${allCategory}"/>" />
				<input type="hidden" name="searchPrdCtgDepth1" value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" />
				<input type="hidden" name="searchPrdCtgDepth2" value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" />
				<input type="hidden" name="searchPrdCtgDepth3" value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" />
				<input type="hidden" name="CATEGORY" id="CATEGORY" value="" />
				<input type="hidden" id="jsonData" name="jsonData" />
				
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>카테고리 선택<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" >
									<option value="">1차 카테고리</option>
								</select>
								<select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" >
									<option value="">2차 카테고리</option>
								</select>
								<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" >
									<option value="">3차 카테고리</option>
								</select>
                            </td>
                        </tr>
                        <tr>
                            <th><span>항목 분류 선택<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <select class="select" name="FIT_MST_CTG1" id="FIT_MST_CTG1">
                                    <option>대분류 전체</option>
                                </select>
                                <!-- 대분류 상의 선택시 -->
                                <select class="select" name="FIT_MST_CTG2" id="FIT_MST_CTG2">
                                    <option>중분류 전체</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>썸네일<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <table id="fileView" style="width:50%;">
                                    <tbody>
                                        <tr>
                                            <td id="defaultFile">
                                            	<div class="tbl_line">
                                                	<input type="file" name="thumbnailFile" id="thumbnailFile" class="file" value="" accept=".jpg, .png">
                                            	</div>
												<div class="tbl_line">
			                                   		이미지 사이즈 : 140*140 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB
			                                	</div>
												<div class="tbl_line">
				                                    <span>대체텍스트</span>
				                                    <input type="text" name="CMN_FLE_ALT_TXT_1" id="CMN_FLE_ALT_TXT_1" class="text half" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20"/>
				                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_1_IDX" />
				                                    (<span id="byte_1">0</span><span>/20 자)</span>
				                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>예시 IMG<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <table id="fileView" style="width:50%;">
                                    <tbody>
                                        <tr>
                                            <td id="defaultFile">
                                            	<div class="tbl_line">
                                                	<input type="file" name="guideFile" id="guideFile" class="file" value="" accept=".jpg, .png">
                                            	</div>
                                            	<div class="tbl_line">
			                                   		이미지 사이즈 : 550*550 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB
			                                	</div>
												<div class="tbl_line">
				                                    <span>대체텍스트</span>
				                                    <input type="text" name="CMN_FLE_ALT_TXT_2" id="CMN_FLE_ALT_TXT_2" class="text half" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20"/>
				                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_2_IDX" />
				                                    (<span id="byte_2">0</span><span>/20 자)</span>
				                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>입력정보<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                            	<c:forEach var="row" items="${inputList}" varStatus="i">
                            		<input type="checkbox" name="inputList" value="<c:out value="${row.CMN_COM_IDX }"/>"/><label for="">${row.CMN_COM_NM}</label>
                            	</c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>사용설정<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" id="FIT_MST_USE_YN_A" name="FIT_MST_USE_YN" class="radio"  value="Y" checked="checked"/>
                                <label for="FIT_MST_USE_YN_A">사용</label>
                                <input type="radio" id="FIT_MST_USE_YN_B" name="FIT_MST_USE_YN"class="radio"  value="N" />
                                <label for="FIT_MST_USE_YN_B">미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>


            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                    <a href="#none" id="goList" class="button large"><span>목록</span></a>
                </div>
            </div><!-- // section-button -->

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

<jsp:useBean id="JsonUtil" class="com.market.util.JsonUtil"/>

<input type="hidden" id="mainCategory" value='${JsonUtil.getJsonArrayFromList(mainCategory)}'>
<input type="hidden" id="topList" value='${JsonUtil.getJsonArrayFromList(top)}'>
<input type="hidden" id="bottom" value='${JsonUtil.getJsonArrayFromList(bottom)}'>
<input type="hidden" id="onepiece" value='${JsonUtil.getJsonArrayFromList(onepiece)}'>
<input type="hidden" id="outer" value='${JsonUtil.getJsonArrayFromList(outer)}'>
<input type="hidden" id="shoes" value='${JsonUtil.getJsonArrayFromList(shoes)}'>

<script>
$(function(){
	getCategoryList3 = function(obj, upIdx, selectIdx, serverDomain, env, data){
		var title = "1차 카테고리";
        if(obj.indexOf("2") > -1)
        {
            title = "2차 카테고리";
        }
        if(obj.indexOf("3") > -1)
        {
            title = "3차 카테고리";
        }
        if(env==null || env==' ') env='P';
        
        var selected = "";
        $("#"+obj).empty().append("<option value=''>"+title+"</option>");
        $.each(data, function(i,item){
        	if(item.PRD_CTG_UP_IDX == upIdx)
            	$("#"+obj).append("<option value='"+item.PRD_CTG_IDX+"' "+selected+">"+item.PRD_CTG_NM+"</option>");
        });
    };
    getOptionList = function(obj, upIdx, selectIdx,data){
        var selected = "";
        var title = upIdx==2?"대분류 전체":"중분류 전체";
        $("#"+obj).empty().append("<option value=''>"+title+"</option>");
        $.each(data, function(i,item){
        	if(item.CMN_COM_NM =="나의 기본정보") return true;
        	if (item.CMN_COM_IDX == selectIdx)
                selected = "selected";
            else
                selected = "";
            
        	if(item.CMN_COM_UP_IDX == upIdx || item.CMN_COM_LEVEL == upIdx)
            	$("#"+obj).append("<option value='"+item.CMN_COM_IDX+"' "+selected+">"+item.CMN_COM_NM+"</option>");
        });
    };
    
	var top = JSON.parse($("#topList").val());
	var highOption = JSON.parse($("#mainCategory").val());
	var bottom = JSON.parse($("#bottom").val());
	var shoes = JSON.parse($("#shoes").val());
	var onepiece = JSON.parse($("#onepiece").val());
	var outer = JSON.parse($("#outer").val());
	var list = JSON.parse($("#list").val());
	var mainOption = new Array();
	$.each(highOption, function(key, value){
	    mainOption.push(value)
	});
	$.each(bottom, function(key, value){
	    mainOption.push(value)
	});
	$.each(shoes, function(key, value){
	    mainOption.push(value)
	});
	$.each(onepiece, function(key, value){
	    mainOption.push(value)
	});
	$.each(outer, function(key, value){
	    mainOption.push(value)
	});
	$.each(top, function(key, value){
	    mainOption.push(value)
	});
	
	
	getCategoryList3("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />",list);
	getOptionList("FIT_MST_CTG1", "2", "<c:out value="${commandMap.searchHighCtgDepth}" />", mainOption);

	$(document).on("change", "#searchPrdCtgDepth1", function (){
		getCategoryList3("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val(),list);
		getCategoryList3("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val(),list);
	});
	$(document).on("change", "#searchPrdCtgDepth2", function (){
		getCategoryList3("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val(),list);
	});
	

	$(document).on("change", "#FIT_MST_CTG1", function (){
		getOptionList("FIT_MST_CTG2", $("#FIT_MST_CTG1 option:selected").val(),$("#searchPrdCtgEnv option:selected").val(),mainOption);

	});
	$(document).on("click","#goRegist",function(){
		var validation = false;
		var data =  new Array();
		if($("#searchPrdCtgDepth1").val() ==""){
			alert("카테고리를 선택해 선택해주세요.")
			return;
		}
		if($("#FIT_MST_CTG1").val() =="" ){
			alert("항목 분류를 선택해주세요.")
			return;
		}
		if($("#thumbnailFile").val() == ""){
			alert("썸네일 이미지를 입력해주세요.")
			return;	
		}
		if($("#guideFile").val() == ""){
			alert("예시 IMG를 입력해주세요.")
			return;
		}
		$("input[name=inputList]:checked").each(function(){
			var object = new Object();
			object.CMN_COM_IDX = $(this).val();
			data.push(object);
			validation = true;
		})
		if(!validation){
			alert("입력정보를 선택해주세요.")
			return;
		}
		
		if($("#searchPrdCtgDepth3").val() !=""){
			$("#CATEGORY").val($("#searchPrdCtgDepth3").val());
		}else if($("#searchPrdCtgDepth2").val() !=""){
			$("#CATEGORY").val($("#searchPrdCtgDepth2").val());
		}else{
			$("#CATEGORY").val($("#searchPrdCtgDepth1").val());
		}
		var jsonData = JSON.stringify(data);
		$("#jsonData").val(jsonData);
		var url = "<c:out value="${serverDomain}"/>/am/site/myFitManagerRegist.do";
		$("#frm").attr({"action" : url, "target" : "_self", "method" : "post"}).submit(); 
		
	})
});
//-->
</script>
<script>
	// 목록 버튼 클릭 이벤트 
	$(document).on("click", "#goList", function () {
	var $frm = $("#frmProductPlanPopup");
	   $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/myFitManagerList.do", "target":"_self", "method":"post"}).submit(); 
	});
	
</script>
</body>
</html>
