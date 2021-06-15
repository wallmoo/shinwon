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

            <h2 class="title"><span>마이핏관리</span></h2>

            <h3 class="title"><span>수정</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
            <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
                    <input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
            </form>
            <form name="frm" id="frm" enctype="multipart/form-data">
            <div class="section-form"><!-- section-form-a -->
                <input type="hidden" id="FIT_MST_IDX" name="FIT_MST_IDX" value="<c:out value="${row.FIT_MST_IDX }" />" />
                <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />
                <input type="hidden" name="list" id="list" value="<c:out value="${allCategory}"/>" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
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
                                <select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1">
                                    <option value="">1차카테고리</option>
                                </select>
                                <select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2">
                                    <option value="">2차 카테고리</option>
                                </select>
                                <select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3">
                                    <option value="">3차 카테고리</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span>항목 분류 선택<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <select class="select" name="FIT_MST_CTG1" id="FIT_MST_CTG1" >
                                	<option value="">대분류 전체</option>
                                </select>

                                <select class="select" name="FIT_MST_CTG2" id="FIT_MST_CTG2">
                                	<option value="">중분류 전체</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>썸네일<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
								<c:forEach items="${fileList}" var="fileRow" varStatus="i">
                               		<c:if test="${fileRow.CMM_FLE_SORT == '1'}">
										<c:set var="altText1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
										<c:set var="altText1Idx" value="${fileRow.CMM_FLE_IDX}"/>
										<div class="tbl_line">
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" class="file_link">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
		                                    <input type="checkbox" name="CMM_FLE_IDX" id="CMM_FLE_IDX_1" class="checkbox cmmFleIdx" data-file_name="thumbnailFile" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>">
		                                    <label for="CMM_FLE_IDX_1">삭제</label>
	                                    </div>
										<div class="tbl_line">
		                                    <input type="file" name="thumbnailFile" id="thumbnailFile" class="file" accept=".jpg, .gif, .png" />
		                                </div>
										<div class="tbl_line">
	                                   		이미지 사이즈 : 140*140 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB
	                                	</div>
										<div class="tbl_line">
		                                    <span>대체텍스트</span>
		                                    <input type="text" value="${altText1}" name="CMN_FLE_ALT_TXT_1" id="CMN_FLE_ALT_TXT_1" class="text half" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20"/>
		                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_1_IDX" value="${altText1Idx}"/>
		                                    (<span id="byte_1">0</span><span>/20 자)</span>
		                                </div>
                               		</c:if>
                               	</c:forEach>
                            </td>
                            
                        </tr>
                        <tr>
                            <th><label class="label"><span>예시 IMG<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <c:forEach items="${fileList}" var="fileRow" varStatus="i">
                               		<c:if test="${fileRow.CMM_FLE_SORT == '2'}">
										<c:set var="altText2" value="${fileRow.CMN_FLE_ALT_TXT }"/>
										<c:set var="altText2Idx" value="${fileRow.CMM_FLE_IDX}"/>
										<div class="tbl_line">
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" class="file_link">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
		                                    <input type="checkbox" name="CMM_FLE_IDX" id="CMM_FLE_IDX_2" class="checkbox cmmFleIdx" data-file_name="guideFile" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>">
		                                    <label for="CMM_FLE_IDX_2">삭제</label>
	                                    </div>
										<div class="tbl_line">
		                                    <input type="file" name="guideFile" id="guideFile" class="file" accept=".jpg, .gif, .png" />
		                                </div>
										<div class="tbl_line">
	                                   		이미지 사이즈 : 140*140 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB
	                                	</div>
										<div class="tbl_line">
		                                    <span>대체텍스트</span>
		                                    <input type="text" value="${altText2}" name="CMN_FLE_ALT_TXT_2" id="CMN_FLE_ALT_TXT_2" class="text half" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20"/>
		                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_2_IDX" value="${altText2Idx}"/>
		                                    (<span id="byte_2">0</span><span>/20 자)</span>
		                                </div>
                               		</c:if>
                               	</c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>입력정보<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                            	<c:forEach var="row" items="${myFitInputList}" varStatus="i">
                                    <input type="checkbox" name="inputList" value="<c:out value="${row.CMN_COM_IDX}"/>" <c:if test="${row.FIT_INFO_CHECH_YN eq 'Y' }">checked="checked"</c:if>/> 
                                    <label for="">${row.CMN_COM_NM}</label>
                            	</c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>사용설정<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" id="FIT_MST_USE_YN_A" name="FIT_MST_USE_YN" class="radio"  value="Y" <c:if test="${'Y' eq row.FIT_MST_USE_YN }">checked</c:if>/>
                                <label for="FIT_MST_USE_YN_A">사용</label>
                                <input type="radio" id="FIT_MST_USE_YN_B" name="FIT_MST_USE_YN"class="radio"  value="N" <c:if test="${'N' eq row.FIT_MST_USE_YN }">checked</c:if>/>
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
	
    $(document).on("keyup","#CMN_FLE_ALT_TXT_1",function(){
    	if($(this).val().length <= 20){
    		document.getElementById('byte_1').innerHTML = $(this).val().length;	
    	}
    });
    
    $(document).on("keyup","#CMN_FLE_ALT_TXT_2",function(){
    	if($(this).val().length <= 20){
    		document.getElementById('byte_2').innerHTML = $(this).val().length;	
    	}
    });
    
    getOptionList = function(obj, upIdx, selectIdx, serverDomain){

        var title = "대분류 전체";
        if(obj.indexOf("2") > -1){
        	title = "중분류 전체";
        }
        
        $.ajax({
            type    : "POST",
            url     : serverDomain + "/am/site/myFitSubCategoryAjax.do",
            data    :  { "CMN_COM_IDX":upIdx},
            dataType : "JSON",
            async   : false,
            success : function(data)
            {
                var selected = "";
                $("#"+obj).empty().append("<option value=''>"+title+"</option>");
                $.each(data.categoryList, function(i,item) 
                {
                	if(item.CMN_COM_NM =="나의 기본정보") return true;
                    if (item.CMN_COM_IDX == selectIdx)
                    {
                        selected = "selected";
                    } 
                    else 
                    {
                        selected = "";
                    }
                    $("#"+obj).append("<option value='"+item.CMN_COM_IDX+"' "+selected+">"+item.CMN_COM_NM+"</option>");
                });

            },
            error   : function(xhr,status,error)
            { 
                alert("항목 분류 호출 중 에러가 발생하였습니다.");
                //alert("code:"+xhr.status); 
            }
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
    	
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${selectedCategoryList[0].PRD_CTG_IDX}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    	getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "<c:out value="${selectedCategoryList[1].PRD_CTG_IDX}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    	getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "<c:out value="${selectedCategoryList[2].PRD_CTG_IDX}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    	
    	getOptionList("FIT_MST_CTG1", "<c:out value="${Code.PRODUCT_GUBUN}" />", "<c:out value="${row.CMN_COM_UP_IDX}" />", "<c:out value="${serverDomain}"/>");
    	getOptionList("FIT_MST_CTG2", $("#FIT_MST_CTG1 option:selected").val() , "<c:out value="${row.CMN_COM_IDX}" />", "<c:out value="${serverDomain}"/>");
    	
    	$(document).on("change", "#searchPrdCtgDepth1", function (){
    		getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val(),list);
    		getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val(),list);
    	});
    	$(document).on("change", "#searchPrdCtgDepth2", function (){
    		getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val(),list);
    	});
    	

    	$(document).on("change", "#FIT_MST_CTG1", function (){
    		getOptionList("FIT_MST_CTG2", $("#FIT_MST_CTG1 option:selected").val(), "<c:out value="${row.CMN_COM_IDX}" />", "<c:out value="${serverDomain}"/>");

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
    		if($("#thumbnailFile").val() == "" && $("#CMM_FLE_IDX_1").val() == undefined){
    			alert("썸네일 이미지를 입력해주세요.")
    			return;	
    		}
    		if($("#guideFile").val() == "" && $("#CMM_FLE_IDX_2").val() == undefined){
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
    		var url = "<c:out value="${serverDomain}"/>/am/site/myFitManagerModify.do";
    		$("#frm").attr({"action" : url, "target" : "_self", "method" : "post"}).submit(); 
    		
    	});
    	
    	//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
    	$(".cmmFleIdx").each(function(){
    		var fileName = $(this).data("file_name");
    	    $("input[name='"+ fileName +"']").prop("disabled", true);
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
	});
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
