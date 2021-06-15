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
                <h2 class="title"><span>룩북관리</span></h2>
                    <h3 class="title"><span>등록</span></h3>
                    <form name="frm" id="frm" enctype="multipart/form-data" novalidate="novalidate">
                    <table class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;">
                            <col style="width: 85%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>작성자</span></th>
                                <td>admin(관리자)</td>
                            </tr>
                            <tr>
                                <th><span>전시여부</span></th>
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
                                <th><label for="">시즌정보<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                    <select name="CNT_MST_SEASON" id="CNT_MST_SEASON" class="select">
                                        <option value="" selected>선택</option>
                                        <c:forEach var="item" items="${seasonList}" varStatus="status">
                                        	<option value="${item.CMN_COM_IDX}" value="${item.CMN_COM_IDX}">${item.CMN_COM_NM}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>이미지 제목<i class="require"><em>필수입력</em></i></span></th>
                                <td><input type="text" name="CNT_MST_TITLE" id="CNT_MST_TITLE" class="text xlarge"></td>
                            </tr>
                            <tr>
                                <th><label for="">PC 이미지<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                    <div class="tbl_line">
                                        <input type="file" name="" id="pc_files"  class="file">
                                    </div>
                                    <div  class="tbl_line">
                                        이미지 파일은 최대 10개까지 등록하실 수 있습니다.
                                    </div>
                                    <ul id="pc_file_list" class="ui_attatch_file_list cf">
                                    	<!-- 
                                        <li>
                                            <img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
                                            <button type="button" class="button">X</button>
                                        </li>
                                         -->
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="">MOBILE 이미지<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                    <div class="tbl_line">
                                        <input type="file" name="" id="mb_files" class="file">
                                    </div>
                                    <div   class="tbl_line">
                                        이미지 파일은 최대 10개까지 등록하실 수 있습니다.
                                    </div>
                                    <ul id="mb_file_list" class="ui_attatch_file_list cf">
                                    	<!-- 
                                        <li>
                                            <img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
                                            <button type="button" class="button">X</button>
                                        </li>
                                        -->
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th><span>등록일</span></th>
                                <td>
                                <jsp:useBean id="now" class="java.util.Date" />
                                <fmt:formatDate var="reg_date" value="${now}" pattern="yyyy-MM-dd HH:mm:ss " />
                                ${reg_date}
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
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script>

$(function(){
	
	var TMPIDX = 0;
    var PREVIEW_HTML = '';
    PREVIEW_HTML += '<li>';
    PREVIEW_HTML += '<img id="{idx}" src="" alt="이미지">';
    PREVIEW_HTML += '<button type="button" data-idx="{idx}" class="button remove_img">X</button>';
    PREVIEW_HTML += '</li>';

    var renderImagePreview = function($that, pName, pList) {
		var tmpIDX = 'TMP_' + (++TMPIDX);
		var cloneElem = $that.clone();
		cloneElem.attr('name', pName);
		cloneElem.attr('data-idx', tmpIDX);
		
		var prevTempHTML = PREVIEW_HTML.replace(/{idx}/ig, tmpIDX);
				
		$('#' + pList).append(prevTempHTML);
		$('#' + tmpIDX).parent().append(cloneElem);

		cloneElem.hide();
		
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#' + tmpIDX).attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(cloneElem.prop('files')[0]); // convert to base64 string
	    
	    $that.val("");
    }
    
	$('#pc_files').on('change', function(){
		if(this.files.length > 0) {
			
			renderImagePreview($(this), 'pcFile', 'pc_file_list');
		}
	});
	
	$('#mb_files').on('change', function(){
		if(this.files.length > 0) {
			
			renderImagePreview($(this), 'mobileFile', 'mb_file_list');
		}
	});
	$(document).on('click', '.remove_img', function(){
		var curIDX = $(this).attr('data-idx');
		$('#' + curIDX).closest('li').remove();
	});
	
    $(document).on("click", "#goRegist", function() {
    	
        if($.trim($("#CNT_MST_TITLE").val()) == ""){
            alert("제목을 입력해 주십시오.");
            $("#CNT_MST_TITLE").focus();
            return;
        }
        if($('#CNT_MST_SEASON option:selected').val().length <= 0) {
            alert("시즌정보를 입력해주세요.");
            $("#CNT_MST_SEASON").focus();
            return;
        }

        if($('#pc_file_list li').length <= 0 || $('#pc_file_list li').length > 10) {
            alert("PC이미지는 최소 1개 ~ 최대10개 선택해 주십시요");
            return;
        }
        if($('#mb_file_list li').length <= 0 || $('#mb_file_list li').length > 10) {
            alert("MOBILE 이미지는 최소 1개 ~ 최대10개 선택해 주십시요");
            return;
        }

        if (confirm("저장 하시겠습니까?"))
        {

            $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/sellerLookBookRegist.do", "target" : "_self", "method" : "post"}).submit();
        }
        
    });
    
    $('#goRemove').on('click', function(){
    	if(confirm('삭제하시겠습니까?')){
    		
    	}
    });  
    
    $('#goList').on('click', function(){
    	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/sellerLookBookList.do", "target" : "_self", "method" : "post"}).submit();
    });
});
</script>

</body>
</html>
