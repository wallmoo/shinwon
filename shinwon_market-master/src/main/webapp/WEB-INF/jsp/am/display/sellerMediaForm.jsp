\<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <h2 class="title"><span>미디어관리</span></h2>
                    <h3 class="title"><span>등록</span></h3>
                    <form name="frm" id="frm" enctype="multipart/form-data" novalidate="novalidate">
                    <table class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;">
                            <col style="width: 85%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>매장명<i class="require"><em>필수입력</em></i></span></th>
                                <td><c:out value="${sessionAdmin.ADM_MST_ID }"/>(<c:out value="${sessionAdmin.ADM_MST_NM }"/>)</td>
                            </tr>
                            <tr>
                                <th><span>전시여부<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                
                                    <ul class="form_radio_check_list">
                                        <li>
                                            <input type="radio" name="CNT_MST_USE_YN" id="CNT_MST_USE_YN" class="radio" value="Y" checked>
                                            <label for="">전시</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="CNT_MST_USE_YN" id="CNT_MST_USE_YN" class="radio" value="N">
                                            <label for="">미전시</label>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="">영상 제목<i class="require"><em>필수입력</em></i></label></th>
                                <td><input type="text" name="CNT_MST_TITLE" id="CNT_MST_TITLE" class="text xlarge"></td>
                            </tr>
                            <tr>
                                <th><label for="">유투브URL<i class="require"><em>필수입력</em></i></label></th>
                                <td><input type="text" name="CNT_MST_URL" id="CNT_MST_URL" class="text xlarge"></td>
                            </tr>
                            <tr>
                                <th><label for="">PC 목록 이미지<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                    <div class="tbl_line">
                                        <input type="file" name="pcFile" id="pcFile" class="file">
                                    </div>
                                    <div class="tbl_line">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</div>
                                    <div class="tbl_line">
                                        <span>대체텍스트</span>
                                        <input type="text" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text half length_chk">
                                        <span>(0/20자)</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="">MOBILE 목록 이미지<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                    <div class="tbl_line">
                                        <input type="file" name="mobileFile" id="mobileFile" class="file">
                                    </div>
                                    <div class="tbl_line">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</div>
                                    <div class="tbl_line">
                                        <span>대체텍스트</span>
                                        <input type="text" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text half length_chk">
                                        <span>(0/20자)</span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                    <div class="section-button">
                        <div class="wrap text-center">
                            <a href="javascript:;" id="goList" class="button"><span>목록</span></a>
                            <a href="javascript:;" id="goRegist" class="button primary"><span>저장</span></a>
                        </div>
                    </div>
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

<script>

$(function(){
	
	var renderCountTxt = function($pElem) {
		var inputLength = $pElem.val().length;
		$pElem.next().text("(" + inputLength +  '/20자)');
	}
	$('.length_chk').on('keyup', function(){
		renderCountTxt($(this));
	})
	function hasExtension(inputID, exts) {
	    var fileName = document.getElementById(inputID).value;
	    return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
	}
	
    $(document).on("click", "#goRegist", function() {
        if($.trim($("#CNT_MST_TITLE").val()) == ""){
            alert("제목을 입력해 주십시오.");
            $("#CNT_MST_TITLE").focus();
            return;
        }
        if($.trim($("#CNT_MST_URL").val()) == ""){
            alert("유투브URL을 입력해주세요.");
            $("#CNT_MST_URL").focus();
            return;
        }
        
        
        if($.trim($("#CMN_FLE_ALT_TXT_P1").val()) == ""){
            alert("PC 대체 텍스트를 입력해주세요.");
            $("#CMN_FLE_ALT_TXT_P1").focus();
            return;
        }
        if($.trim($("#CMN_FLE_ALT_TXT_P1").val()).length > 20){
            alert("PC 대체 텍스트는 최대 20자까지 입력하셔야 합니다.");
            $("#CMN_FLE_ALT_TXT_P1").focus();
            return;
        }
        if($.trim($("#CMN_FLE_ALT_TXT_M1").val()) == ""){
        	alert("MOBILE 대체 텍스트를 입력해주세요.");
            $("#CMN_FLE_ALT_TXT_M1").focus();
            return;
        }
        if($.trim($("#CMN_FLE_ALT_TXT_M1").val()).length > 20){
        	alert("MOBILE 대체 텍스트는 최대 20자까지 입력하셔야 합니다.");
            $("#CMN_FLE_ALT_TXT_M1").focus();
            return;
        }
        
        //이미지 첨부 체크
        var file1 = $("#pcFile").val();//PC목록이미지
        var file2 = $("#mobileFile").val();//Mobile 목록 이미지
        file1 = file1.slice(file1.indexOf(".") + 1).toLowerCase();
        file2 = file2.slice(file2.indexOf(".") + 1).toLowerCase();

        if(file1 == ""){
        	alert("PC 목록 이미지를 입력해 주십시오.");
        	$("#pcFile").focus();
        	return;
        }
        if(file2 == ""){
        	alert("MOBILE 목록 이미지를 입력해 주십시오.");
        	$("#mobileFile").focus();
        	return;
        }
        
        if(file1 != "jpg" && file1 != "png" &&  file1 != "gif") {
			alert('PC 목록 이미지는 [jpg, gif, png]형식의 이미지만 업로드 가능합니다.');
			return;
		} 
        if(file2 != "jpg" && file2 != "png" &&  file2 != "gif") {
        	alert('MOBILE 목록 이미지는 [jpg, gif, png]형식의 이미지만 업로드 가능합니다.');
			return;
		} 

        if (confirm("저장 하시겠습니까?"))
        {
            $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/sellerMediaRegist.do", "target" : "_self", "method" : "post"}).submit();
        }
        
    });
    
    $('#goList').on('click', function(){
    	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/sellerMediaList.do", "target" : "_self", "method" : "post"}).submit();
    })
	
});

//-->
</script>

</body>
</html>
