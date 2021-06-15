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

                <h3 class="title"><span>등록</span></h3>
                
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
                    <input type="hidden" id="brandCheckYn" value="" />
					<input type="hidden" id="checkBrand" value="" />
                    <input type="hidden" id="sellerCheckYn" value="" />
					<input type="hidden" id="checkSeller" value="" />
                    <input type="hidden" name="VDR_MST_IDX" id="VDR_MST_IDX"/>
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>입점사명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<input type="text" name="VDR_MST_NM" id="VDR_MST_NM" class="text large" placeholder="입점업체명 검색 후 선택" readonly="readonly"/>
		                            <a href="javascript:vendorSearch()" id="search" class="button small primary" ><span>검색</span></a>
                                </td>
                            </tr>  
                            <tr>
                                <th><span>브랜드명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<select class="select" name="BND_MST_BRAND_TYPE" id="BND_MST_BRAND_TYPE">
                                		<option value="">선택</option>
                                		<option value="I">자사</option>
                                		<option value="O">타사</option>
                                	</select>
                                    <input type="text" name="BND_MST_BRAND_NM" id="BND_MST_BRAND_NM" class="text large" placeholder="브랜드명 입력" />
		                            <a href="#none" id="brandCheck" class="button button-c small"><span>중복확인</span></a>
		                            <small style="margin-left:10px;">띄어쓰기를 삼가해주세요.</small>
                                </td>
                            </tr>
                            <tr>
                                <th><span>검색어(국문/영문)<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	
                                    <input type="text" name="BND_MST_SRC_KR" id="BND_MST_SRC_KR" class="text large" placeholder="국문명 입력"/> / <input type="text" name="BND_MST_SRC_EN" id="BND_MST_SRC_EN" class="text large" placeholder="영문명 입력"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>품질보증기준</span></th>
                                <td>
                                    <input type="text" name="BND_MST_QLY_ASR" id="BND_MST_QLY_ASR" class="text large" placeholder="품질보증기간 입력" maxlength="80"/>
	                            	<!-- <small class="desc">ex) 공정거래위원회 고시 소비자 분쟁해결 기준에 준함</small>  -->
                                </td>
                            </tr>
                            <tr>
                                <th><span>서비스센터</span></th>
                                <td>
                                    <input type="text" name="BND_MST_SERV" id="BND_MST_SERV" class="text large" placeholder="서비스센터 연락처 입력" maxlength="25"/>
	                            	<!--<small style="margin-left:10px;">ex) XX서비스센터 (02-000-0000)</small> -->
                                </td>  
                            </tr>
                            
                            <tr>
                                <th><span>브랜드 URL <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    http:// <input type="text" name="BND_MST_URL" id="BND_MST_URL" class="text large" placeholder="브랜드 URL 입력." maxlength="256" value=""/>
                                </td>  
                            </tr>                               
                            
                            <tr>
                                <th><span>브랜드소개<br/>(250자 이내)<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <textarea name="BND_MST_DTL" id="BND_MST_DTL" class="textarea" placeholder="브랜드소개 입력" maxlength="250"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><span>브랜드이미지 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<div id="defaultFileDiv">
	                                   	<input type="file" name="file" id="file" class="file" style="width:50%;" accept=".jpg, .png"/>
	                                   <!-- <input type="button" id="delFileData" value="파일 지우기"/> -->	
	                               	</div>	
                                </td>
                            </tr>
                            <tr>
                                <th><span>브랜드 안내 설정 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <ul class="form_radio_check_list">
                                        <li>
                                            <input type="radio" name="BND_MST_DPL_STATE" id="stateA" value="Y" class="radio" checked="checked"/>
        		                            <label for="stateA">사용</label>
                                        </li>
                                        <li>
        		                            <input type="radio" name="BND_MST_DPL_STATE" id="stateB" value="N" class="radio" />
        		                            <label for="stateB">미사용</label>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th><span>셀러명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<input type="text" name="BND_MST_SEL_NM" id="BND_MST_SEL_NM" class="text large" />
		                            <a href="#none" id="sellerCheck" class="button button-c small"><span>중복확인</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>셀러소개<br/>(250자 이내)<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <textarea name="BND_MST_SEL_DESC" id="BND_MST_SEL_DESC" class="textarea" placeholder="셀러소개 입력" maxlength="250"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><span>셀러이미지 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<div id="defaultFileDiv">
	                                   	<input type="file" name="sellerFile" id="sellerFile" class="file" style="width:50%;" accept=".jpg, .png"/>
	                                   <!--	<input type="button" id="delFileData" value="파일 지우기"/> -->	
	                               	</div>	
                                </td>
                            </tr>
                            <tr>
                                <th><span>인스타그램 URL<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<input type="text" name="BND_MST_INST_URL" id="BND_MST_INST_URL" placeholder="인스타그램 URL 입력" class="text xlarge" maxlength="256"/>
	                            </td>
                            </tr>
                            <tr>
                                <th><span>사용설정 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <ul class="form_radio_check_list">
                                        <li>
                                            <input type="radio" name="BND_MST_USE_YN" id="stateC" value="Y" class="radio" checked="checked"/>
        		                            <label for="stateC">사용</label>
                                        </li>
                                        <li>
        		                            <input type="radio" name="BND_MST_USE_YN" id="stateD" value="N" class="radio" />
        		                            <label for="stateD">미사용</label>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button"><span>목록</span></a>
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
        
	// 폼체크
    $("#frm").validate({
        rules: {
            BND_MST_BRAND_NM:{required:true} // 브랜드명
        }
    });
 	// 입점업체 검색 팝업
    vendorSearch = function(){
    	popup("<c:out value="${serverDomain}"/>/am/site/searchRegistVendorPopup.do","900","700","yes","goSearchBrandVendorPopup");	
    };
    
    // 입점업체 callback 함수
    fnResultErpVendor = function(vdrNm,vdrIdx){
    	$("#VDR_MST_NM").val(vdrNm);
    	$("#VDR_MST_IDX").val(vdrIdx);
    };
    
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/brandManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 브랜드명 중복 체크
    $(document).on("click", "#brandCheck", function () {
        var $obj = $("#BND_MST_BRAND_NM");
        var value = $.trim($obj.val());
        
        $("#checkBrand").val(value);	// 중복체크한 brand 
        
        if(value == ""){
            alert("[브랜드명] 필수입력 사항입니다.");
            $obj.focus();
            return;
        }else{
            
	        $.ajax({
	            async : false,
	            type : "POST",
	            data : {"BND_MST_BRAND_NM":$.trim($("#BND_MST_BRAND_NM").val())},
	            url : "<c:out value="${serverDomain}" />/am/site/brandManagerNmCheckAjax.do",
	            success : function (data) {
	                if(data.successYn == "Y")
	                {
	                    if(data.resultYn == "N")
	                    {
	                        alert("이미 사용중인 브랜드 입니다.");
	                    }
	                    else
	                    {
	                        alert("사용가능한 브랜드 입니다.");
	                    }
	                    
	                    $obj.focus();
	                    $("#brandCheckYn").val(data.resultYn);
	                    return;
	                }
	                else
	                {
	                    alert("데이터 전송중 데이터가 누락 되었습니다./n다시 시도해 주십시오.");
	                    return;
	                }
	            },
	            error : function () {
	                alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
	            }
	        });
        }
    });
    $(document).on("click", "#sellerCheck", function () {
        var $obj = $("#BND_MST_SEL_NM");
        var value = $.trim($obj.val());
        
        $("#checkSeller").val(value);	// 중복체크한 셀러명
        
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
	                    alert("데이터 전송중 데이터가 누락 되었습니다./n다시 시도해 주십시오.");
	                    return;
	                }
	            },
	            error : function () {
	                alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
	            }
	        });
        }
    });
    
 	// 고정 첨부 행 파일 지우기
    $(document).on("click", "#delFileData", function (e) {
    	e.preventDefault();    	
    	$("#defaultFileDiv").find("input").remove();
    	$("#defaultFileDiv").append('<input type="file" name="file" id="file" class="file" style="width:50%;"/> <input type="button" id="delFileData" value="파일 지우기"/>');
 	});
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
    	
    	$("#BND_MST_BRAND_NM").val($.trim($("#BND_MST_BRAND_NM").val()));

    	var $frm = $("#frm"); 
        
        if($frm.valid()){
        	
        	var $chkObj = $("#brandCheckYn");
            var $obj = $("#brandCheck");
            var specialPattern = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\+]{1,30}$/;
        	var korPattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        	var engPattern = /^[a-zA-Z]*$/;

            if($chkObj.val() == "Y")
            {
            	if($("#checkBrand").val() == $("#BND_MST_BRAND_NM").val()){
            				      		
            	}else{
            		alert("브랜드 중복을 확인해 주십시오.");
                    $obj.focus();
                    return;
            	}
            	
            	if($("#VDR_MST_NM").val() == "" ){
            		alert("입점사명를 확인해 주십시오.")
            		$("#VDR_MST_NM").focus()
            		return;
            	}
            	if($(".select option:selected").text() == "선택"){
            		alert("브랜드명 카테고리를 확인해 주십시오.")
            		$("#BND_MST_BRAND_TYPE").focus()
            		return;
            	}
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
            		alert("국문 검색어는 특수문자를 입력하실 수 없습니다.")
            		$("#BND_MST_SRC_KR").focus()
            		return;
            	}
            	if($("#BND_MST_SRC_EN").val() == "" ){
            		alert("영문 검색어를 확인해 주십시오.")
            		$("#BND_MST_SRC_EN").focus()
            		return;
            	}
            	if(!engPattern.test($("#BND_MST_SRC_EN").val())){
            		alert("영문 검색어는 국문을 입력할 수 없습니다.")
            		$("#BND_MST_SRC_EN").focus()
            		return;
            	}
            	if(!specialPattern.test($("#BND_MST_SRC_EN").val())){
            		alert("영문 검색어는 특수문자를 입력하실 수 없습니다.")
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
            	if($("#BND_MST_DTL").val() ==  "" ){
            		alert("브랜드 소개를 입력해주세요.")
            		$("#BND_MST_DTL").focus()
            		return;
            	}
            	if($("#BND_MST_SEL_DESC").val().length >  250 ){
            		alert("셀러 소개(250자)를 확인해 주십시오.")
            		$("#BND_MST_SEL_DESC").focus()
            		return;
            	}
            	if($("#BND_MST_SEL_DESC").val() == "" ){
            		alert("셀러 소개를 입력해주세요.")
            		$("#BND_MST_SEL_DESC").focus()
            		return;
            	}
            	
            	if($("#file").val() == "" ){
            		alert("브랜드이미지를 확인해 주십시오.")
            		$("#file").focus()
            		return;
            		
            	}
            	
            	if($("#BND_MST_SEL_NM").text() == "선택"){
            		alert("셀러명을 입력해주세요.")
            		$("#BND_MST_SEL_NM").focus()
            		return;
            	}
            	
            	if($("#sellerFile").val() == "" ){
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
                if (confirm( "저장 하시겠습니까?")) {
                	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/brandManagerRegist.do", "target":"_self", "method":"post"}).submit();
                } 
            }else if($chkObj.val() == "N") {
            	if($("#checkSeller").val() == $("#BND_MST_SEL_NM").val()){
	            	alert("이미 사용중인 브랜드 입니다.");
		            $obj2.focus();
		            return;
            	}
            	else{
            		alert("브랜드 중복을 확인해 주십시오.");
                    $obj2.focus();
                    return;	
            	}
            }else{
                alert("브랜드 중복을 확인해 주십시오.");
                $obj2.focus();
                return;
            }
        }
        
        
        
    });
    
});
</script>

</body>
</html>
