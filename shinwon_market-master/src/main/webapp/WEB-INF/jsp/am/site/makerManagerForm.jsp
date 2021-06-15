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

                <h2 class="title"><span>제조사 관리</span></h2>

                <h3 class="title"><span>등록</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                 	<input type="hidden" name="searchMakerNm" value="<c:out value="${commandMap.searchMakerNm }"/>"/>
                 	<input type="hidden" name="searchMrkMstUseYn" value="<c:out value="${commandMap.searchMrkMstUseYn }"/>"/>
                </form>
                
                <form id="frm" name="frm">
                	<input type="hidden" id="makerCheckYn" value="" />
                	<input type="hidden" id="checkMaker" value="" />
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <!-- <tr>
                                <th><span>제조사코드 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<small class="desc">시스템자동부여</small>    
                                </td>
                            </tr>  --> 
                            <tr>
                                <th><span>제조사명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="MRK_MST_BRAND_NM" id="MRK_MST_BRAND_NM" class="text" placeholder="제조사명을 입력하세요." maxlength="15"/>
		                            <input type="text" name="hiddenText" id="hiddenText" style="display:none;"/>
		                            <a href="#none" id="makerCheck" class="button button-c small"><span>중복확인</span></a>
		                            <small style="margin-left:10px;">띄어쓰기를 삼가해주세요.</small>
                                </td>
                            </tr>                            
                            <tr>
                                <th><span>사용설정 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" name="MRK_MST_USE_YN" id="stateA" value="Y" class="radio" checked="checked"/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="MRK_MST_USE_YN" id="stateB" value="N" class="radio" />
		                            <label for="stateB">미사용</label>
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

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>

<script>    
$(function(){  
        
	// 폼체크
    $("#frm").validate({
        rules: {
        	MRK_MST_BRAND_NM:{required:true} // 제조사명
        }
    });
	
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/makerManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
 	// 제조사명 중복 체크
    $(document).on("click", "#makerCheck", function () {
        var $obj = $("#MRK_MST_BRAND_NM");
        var value = $.trim($obj.val());
        
        $("#checkMaker").val(value);	// 중복체크한 maker
        
        if(value == "")
        {
            alert("[제조사명] 필수입력 사항입니다.");
            $obj.focus();
            return;
        }
        else
        {
            
	        $.ajax({
	            async : false,
	            type : "POST",
	            data : {"MRK_MST_BRAND_NM":$.trim($("#MRK_MST_BRAND_NM").val())},
	            url : "<c:out value="${serverDomain}" />/am/site/makerManagerNmCheckAjax.do",
	            success : function (data) {
	                if(data.successYn == "Y")
	                {
	                    if(data.resultYn == "N")
	                    {
	                        alert("이미 사용중인 제조사 입니다.");
	                    }
	                    else
	                    {
	                        alert("사용가능한 제조사 입니다.");
	                    }
	                    
	                    $obj.focus();
	                    $("#makerCheckYn").val(data.resultYn);
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
	
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        
        $("#MRK_MST_BRAND_NM").val($.trim($("#MRK_MST_BRAND_NM").val()));
        
		if($frm.valid()){
        	var $chkObj = $("#makerCheckYn");
            var $obj = $("#makerCheck");
            if($chkObj.val() == "Y")
            {
            	if($("#checkMaker").val() == $("#MRK_MST_BRAND_NM").val()){
            		if (confirm( "저장 하시겠습니까?")) {
                		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/makerManagerRegist.do", "target":"_self", "method":"post"}).submit();
                    }          		
            	}
            	else{
            		alert("제조사 중복을 확인해 주십시오.");
                    $obj.focus();
                    return;
            	}
            }
            else if($chkObj.val() == "N")
            {
            	if($("#checkMaker").val() == $("#MRK_MST_BRAND_NM").val()){
		            alert("이미 사용중인 제조사 입니다.");
		            $obj.focus();
		            return;
            	}
            	else{
            		alert("제조사 중복을 확인해 주십시오.");
                    $obj.focus();
                    return;	
            	}
            }
            else
            {
                alert("제조사 중복을 확인해 주십시오.");
                $obj.focus();
                return;
            }
        }
    });
    
});
</script>

</body>
</html>