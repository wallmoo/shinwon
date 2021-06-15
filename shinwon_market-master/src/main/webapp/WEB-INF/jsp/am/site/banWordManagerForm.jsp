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

                <h2 class="title"><span>차단단어 관리</span></h2>

                <h3 class="title"><span>등록</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchBanWordTxt" value="<c:out value="${commandMap.searchBanWordTxt }"/>"/>
                    <input type="hidden" name="searchBanWrdUseYn" value="<c:out value="${commandMap.searchBanWrdUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />       
                </form>
 
                <form id="frm" name="frm">
                    <input type="hidden" id="banWordCheckYn" value="" /> 
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>차단단어 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="BAN_WRD_TXT" id="BAN_WRD_TXT" class="text" maxlength="15"/>
                                    <input type="text" name="hiddenText" id="hiddenText" style="display:none;"/>
                                </td>
                            </tr>  
                            <tr>
                                <th><span>사옹설정 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" id="stateA" name="BAN_WRD_USE_YN" value="Y" class="radio" checked="checked"/>
                                    <label for="stateA">사용</label>
                                    <input type="radio" id="stateB" name="BAN_WRD_USE_YN" value="N" class="radio" />
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
            BAN_WRD_TXT:{required:true} // 금지어
        }
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/banWordManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        
        var $frm = $("#frm"); 
        
        // 금지어 갯수체크
        if("${useCount}" > 2000){
            alert("[금지어] 2,000개가 모두 등록되었습니다.");         
            return;
        }
            
        if($frm.valid()){
            
            banWordTxtCheck(); // 금지어 중복체크
            
            $("#BAN_WRD_TXT").val($.trim($("#BAN_WRD_TXT").val()));
            
            if($("#banWordCheckYn").val() == "Y"){
                if (confirm( "저장 하시겠습니까?")) {
                    $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/banWordManagerRegist.do", "target":"_self", "method":"post"}).submit();
                }               
            }
        }
    });
    
    // 금지어 중복체크
    banWordTxtCheck = function(){
        $.ajax({
            async : false,
            type : "POST",
            data : {"BAN_WRD_TXT":$.trim($("#BAN_WRD_TXT").val())},
            url : "<c:out value="${serverDomain}" />/am/site/banWordManagerTxtCheckAjax.do",
            success : function (data) {
                if(data.successYn == "Y")
                {
                    if(data.resultYn == "N")
                    {
                        alert("이미 사용중인 금지어 입니다.");
                    }
                    
                    $("#banWordCheckYn").val(data.resultYn);
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
    };
    
});
</script>

</body>
</html>
