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

                <h2 class="title"><span>브랜드 관리</span></h2>

                <h3 class="title"><span>수정</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm">
                  	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
               		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="searchBrandNm" value="<c:out value="${commandMap.searchBrandNm }"/>"/>
              		<input type="hidden" name="searchBrandUseYn" value="<c:out value="${commandMap.searchBrandUseYn }"/>"/>
              	</form>
 
                <form id="frm" name="frm" enctype="multipart/form-data">
                	<input type="hidden" id="sellerCheckYn" value="" />
					<input type="hidden" id="checkSeller" value="" />
                	<input type="hidden" id="originalSelNm" value="<c:out value="${row.BND_MST_SEL_NM }"/>"/>
                	<input type="hidden" name="BND_MST_IDX" value="<c:out value="${row.BND_MST_IDX }"/>"/>
                	<input type="hidden" name="VDR_MST_IDX" value="<c:out value="${row.VDR_MST_IDX }"/>"/>
                	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchBrandNm" value="<c:out value="${commandMap.searchBrandNm }"/>"/>
                	<input type="hidden" name="searchBrandUseYn" value="<c:out value="${commandMap.searchBrandUseYn }"/>"/>
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                     	   <tr>
                                <th><span>입점사명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
									<c:out value="${row.VDR_MST_NM }"/>    
                                </td>
                            </tr> 
                            <tr>
                                <th><span>브랜드코드</span></th>
                                <td>
                                	<c:out value="${row.BND_MST_IDX }"/>    
                                </td>
                            </tr>  
                            <tr>
                                <th><span>브랜드명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <c:out value="${row.BND_MST_BRAND_NM }"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>검색어(국문/영문)<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="BND_MST_SRC_KR" id="BND_MST_SRC_KR" value="<c:out value="${row.BND_MST_SRC_KR }"/>" class="text large" placeholder="국문명 입력"/> / <input type="text" name="BND_MST_SRC_EN" id="BND_MST_SRC_EN" value="<c:out value="${row.BND_MST_SRC_EN }"/>" class="text large" placeholder="영문명 입력"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>품질보증기준</span></th>
                                <td>
                                    <input type="text" name="BND_MST_QLY_ASR" id="BND_MST_QLY_ASR" class="text large" placeholder="품질보증기간 입력." maxlength="80" value="<c:out value="${row.BND_MST_QLY_ASR }"/>"/>
	                            	<small class="desc">ex) 공정거래위원회 고시 소비자 분쟁해결 기준에 준함</small>
                                </td>
                            </tr>
                            <tr>
                                <th><span>서비스센터</span></th>
                                <td>
                                    <input type="text" name="BND_MST_SERV" id="BND_MST_SERV" class="text" placeholder="서비스센터 연락처 입력." maxlength="25" value="<c:out value="${row.BND_MST_SERV }"/>"/>
	                            	<small style="margin-left:10px;">ex) XX서비스센터 (02-000-0000)</small>
                                </td>  
                            </tr>
                            
                            <tr>
                                <th><span>브랜드 URL <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    http:// <input type="text" name="BND_MST_URL" id="BND_MST_URL" class="text large" placeholder="브랜드 URL 입력." maxlength="256" value="<c:out value="${row.BND_MST_URL }"/>"/>
                                </td>  
                            </tr>                            
                            
                            
                            <tr>
                                <th><span>브랜드소개<br/>(250자 이내) <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <textarea name="BND_MST_DTL" id="BND_MST_DTL" style="height: 200px;" placeholder="브랜드소개 입력." maxlength="250"><c:out value="${row.BND_MST_DTL }"/></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><span>브랜드이미지 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<div <c:if test="${empty fileList }">id="defaultFileDiv"</c:if>>
	                                   	<c:choose>
	                                   		<c:when test="${not empty fileList }">
	                                   			<c:forEach var="fileRow" items="${fileList }" varStatus="i">
	                                   				<a href="<c:out value="${cdnDomain }${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title BRD_PRE_IMG" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>" target="_blank">
	                                   					<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
	                                   				</a>
	                                   				<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" /> 
		                         					<label for="CMM_FLE_IDX">삭제</label> 
	                                   			</c:forEach>
	                                   			<div id="defaultFileDiv" style="padding-top:5px;">
													<input type="file" name="file" id="file" class="file" style="width:50%;"/>
	                                   															
												</div>
	                                   		</c:when>
	                                   		<c:otherwise>
	                                   			<input type="file" name="file" id="file" class="file" style="width:50%;"/>
	                                   			
	                                   		</c:otherwise>
	                                   </c:choose>
	                               	</div>	
                                </td>
                            </tr>
                            <tr>
                                <th><span>브랜드 안내 설정 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" name="BND_MST_DPL_STATE" id="stateA" value="Y" class="radio" <c:if test="${row.BND_MST_DPL_STATE eq 'Y' }">checked="checked"</c:if>/>
		                            <label for="stateA">노출</label>
		                            <input type="radio" name="BND_MST_DPL_STATE" id="stateB" value="N" class="radio" <c:if test="${row.BND_MST_DPL_STATE eq 'N' }">checked="checked"</c:if>/>
		                            <label for="stateB">미노출</label>
                                </td>
                            </tr>
                            <tr>
                                <th><span>셀러명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<input type="text" name="BND_MST_SEL_NM" id="BND_MST_SEL_NM" class="text large" placeholder="브랜드명 입력" value="<c:out value="${row.BND_MST_SEL_NM }"/>"/>
		                            <a href="#none" id="sellerCheck" class="button button-c small"><span>중복확인</span></a>
                                </td>
                            </tr>
                            
                            <tr>
                                <th><span>셀러소개<br/>(250자 이내)<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <textarea name="BND_MST_SEL_DESC" id="BND_MST_SEL_DESC" class="textarea" placeholder="셀러소개 입력." maxlength="250"><c:out value="${row.BND_MST_SEL_DESC }"/></textarea>
                                </td>
                            </tr>
                            
                            <tr>
                                <th><span>셀러이미지 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<div <c:if test="${empty sellerFile }">id="defaultFileDiv"</c:if>>
	                                   	<c:choose>
	                                   		<c:when test="${not empty sellerFile }">
	                                   			<c:forEach var="sellerRow" items="${sellerFile }" varStatus="i">
	                                   				<a href="<c:out value="${cdnDomain }${sellerRow.CMM_FLE_ATT_PATH}${sellerRow.CMM_FLE_SYS_NM }"/>" id="fileIdx_<c:out value="${sellerRow.CMM_FLE_IDX }"/>" class="file-list-title SEL_PRE_IMG" data-cmm_fle_idx="<c:out value="${sellerRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${sellerRow.CMM_FLE_SAVE_PATH }"/>" target="_blank">
	                                   					<c:out value="${sellerRow.CMM_FLE_ORG_NM }"/> 
	                                   				</a>
	                                   				<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX" name="CMM_FLE_IDX" data-file_name="sellerFile" value="<c:out value="${sellerRow.CMM_FLE_IDX }"/>" /> 
		                         					<label for="CMM_FLE_IDX">삭제</label> 
	                                   			</c:forEach>
	                                   			<div id="defaultFileDiv" style="padding-top:5px;">
													<input type="file" name="sellerFile" id="sellerFile" class="file" style="width:50%;"/>
	                                   															
												</div>
	                                   		</c:when>
	                                   		<c:otherwise>
	                                   			<input type="file" name="sellerFile" id="sellerFile" class="file" style="width:50%;"/>
	                                   		</c:otherwise>
	                                   </c:choose>
	                               	</div>	
                                </td>
                            </tr>
                            <tr>
                                <th><span>인스타그램 URL<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<input type="text" name="BND_MST_INST_URL" id="BND_MST_INST_URL" value="${row.BND_MST_INST_URL}" placeholder="인스타그램 URL 입력." class="text large" maxlength="256"/>
	                            </td>
                            </tr>
                            <tr>
                                <th><span>상태 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" name="BND_MST_USE_YN" id="stateC" value="Y" class="radio" <c:if test="${row.BND_MST_USE_YN eq 'Y' }">checked="checked"</c:if>/>
		                            <label for="stateC">사용</label>
		                            <input type="radio" name="BND_MST_USE_YN" id="stateD" value="N" class="radio" <c:if test="${row.BND_MST_USE_YN eq 'N' }">checked="checked"</c:if>/>
		                            <label for="stateD">미사용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->
                
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

<!-- 파일 다운로드용 폼 -->
<form name="fileForm" id="fileForm">
     <input type="hidden" name="CMM_FLE_IDX" value=""/>
     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
</form>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>

<script>    
$(function(){  

	//사이트 url 한글 입력 방지
	$("#BND_MST_INST_URL").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
            if(check.test(inputVal)){
             $(this).val("");
            }
        }
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
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/brandManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
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
  	
	// 파일 다운로드
    $(document).on("click", ".file-list-title", function () {
		 var url = $(this).data("url");
		 var name = $(this).data("name");
    	/*
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("url"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    	*/
    });
    
    // 수정 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        
        if($frm.valid()){
        	
        	var specialPattern =  /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\+]{1,30}$/;
        	var korPattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        	var engPattern = /^[a-zA-Z]*$/;
        	
        	if($("#BND_MST_SRC_KR").val() == "" ){
        		alert("국문 검색어를 확인해 주십시오.")
        		$("#BND_MST_SRC_KR").focus()
        		return;
        	}
        	if(!korPattern.test($("#BND_MST_SRC_KR").val())){
        		alert("국문 검색어는 영문을 입력할 수 없습니다.")
        		$("#BND_MST_SRC_KR").focus()
        		return;
        	}
        	if(!specialPattern.test($("#BND_MST_SRC_KR").val())){
        		alert("국문 검색어는 특수문자를 입력할 수 없습니다.")
        		$("#BND_MST_SRC_KR").focus()
        		return;
        	}
        	if($("#BND_MST_SRC_EN").val() == "" ){
        		alert("영문 검색어를 확인해 주십시오.");
        		$("#BND_MST_SRC_EN").focus();
        		return;
        	}
        	if(!engPattern.test($("#BND_MST_SRC_EN").val())){
        		alert("영문 검색어는 국문을 입력할 수 없습니다.")
        		$("#BND_MST_SRC_EN").focus()
        		return;
        	}
        	if(!specialPattern.test($("#BND_MST_SRC_EN").val())){
        		alert("영문 검색어는 특수문자를 입력할 수 없습니다.")
        		$("#BND_MST_SRC_EN").focus()
        		return;
        	}
        	
        	if($("#BND_MST_URL").val() == "" ){
        		alert("브랜드 URL을 입력하세요.");
        		$("#BND_MST_URL").focus();
        		return;
        	}
        	
        	
            var urlPattern = /(http(s)?:\/\/)([a-z0-9\w]+\.*)+[a-z0-9]{2,4}/gi
        	if($("#BND_MST_DTL").val().length >  250 ){
        		alert("브랜드 소개(250자)를 확인해 주십시오.")
        		$("#BND_MST_DTL").focus()
        		return;
        	}
        	if($("#BND_MST_SEL_DESC").val().length >  250 ){
        		alert("셀러 소개(250자)를 확인해 주십시오.")
        		$("#BND_MST_SEL_DESC").focus()
        		return;
        	}        
        	
        	if($("#file").val() == "" && $(".BRD_PRE_IMG").is(":checked")){
        		alert("브랜드이미지를 확인해 주십시오.")
        		$("#file").focus()
        		return;
        		
        	}
        	if($("#sellerFile").val() == ""&& $(".SEL_PRE_IMG").is(":checked") ){
        		alert("셀러이미지를 확인해 주십시오.")
        		$("#sellerFile").focus()
        		return;
        		
        	}
        	
        	if($("#BND_MST_INST_URL").val() == "" || !urlPattern.test($("#BND_MST_INST_URL").val()) ){
        		alert("인스타그램URL을 확인해 주십시오.")
        		$("#BND_MST_INST_URL").focus();
        		return;
        	}
        	
        	var $chkObj2 = $("#sellerCheckYn");
            var $obj2 = $("#sellerCheck");
            if($("#originalSelNm").val() != $("#BND_MST_SEL_NM").val() ){
            	if($chkObj2.val() == "Y"){
                	if($("#checkSeller").val() == $("#BND_MST_SEL_NM").val()){
                				      		
                	}else{
                		alert("샐러명 중복을 확인해 주십시오.");
                        $obj2.focus();
                        return;
                	}
                }else if($chkObj2.val() == "N"){
                	if($("#checkSeller").val() == $("#BND_MST_SEL_NM").val()){
    	            	alert("이미 사용중인 셀러명 입니다.");
    		            $obj2.focus();
    		            return;
                	}
                	else{
                		alert("셀러명 중복을 확인해 주십시오.");
                        $obj2.focus();
                        return;	
                	}
                }else{
                    alert("셀러명 중복을 확인해 주십시오.");
                    $obj2.focus();
                    return;
                }
            }
            if (confirm( "저장 하시겠습니까?")) {
            	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/brandManagerModify.do", "target":"_self", "method":"post"}).submit();
            } 
        	
        }
    });
    
    //셀러 이름 중복 확인
    $(document).on("click", "#sellerCheck", function () {
        var $obj = $("#BND_MST_SEL_NM");
        var value = $.trim($obj.val());
        
        $("#checkSeller").val(value);	// 중복체크한 brand 
        
        if(value == "")
        {
            alert("[셀러명] 필수입력 사항입니다.");
            $obj.focus();
            return;
        }
        else  {
	        $.ajax({
	            async : false,
	            type : "POST",
	            data : {"BND_MST_SEL_NM":$.trim($("#BND_MST_SEL_NM").val())},
	            url : "<c:out value="${serverDomain}" />/am/site/brandManagerSellerNmCheckAjax.do",
	            success : function (data) {
	                if(data.successYn == "Y")
	                {
	                    if(data.resultYn == "N")
	                    {
	                        alert("이미 사용중인 셀러명 입니다.");
	                    }
	                    else
	                    {
	                        alert("사용가능한 셀러명 입니다.");
	                    }
	                    
	                    $obj.focus();
	                    $("#sellerCheckYn").val(data.resultYn);
	                    return;
	                }
	                else
	                {
	                    alert("데이터 전송중 데이터가 누락 되었습니다. 다시 시도해 주십시오.");
	                    return;
	                }
	            },
	            error : function () {
	                alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
	            }
	        });
        }
    });
    
});

//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
$(".cmmFleIdx").each(function(){
    var fileName = $(this).data("file_name");
    $("input[name='"+ fileName +"']").prop("disabled", true);
});

</script>

</body>
</html>
