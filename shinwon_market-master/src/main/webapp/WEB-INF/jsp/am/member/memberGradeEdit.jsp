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

            <h2 class="title"><span>회원등급 등록</span></h2>

            <h3 class="title"><span>기본설정</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
			</form>
			
			<form id="frm" name="frm">
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
				<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
				<input type="hidden" name="MEM_GRD_CD" value="<c:out value="${row.MEM_GRD_CD }"/>"/>
	            <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                <colgroup>
	                    <col style="width: 15%;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th><span>회원등급 명<i class="require"><em>필수입력</em></i></span></th>
	                        <td>
	                        	<input type="text" name ="MEM_GRD_NM" class="text xlarge" value="<c:out value="${row.MEM_GRD_NM }"/>" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <th><span>회원등급 설명</span></th>
	                        <td>
	                            <input type="text" name ="MEM_GRD_DESC" class="text xlarge" value="<c:out value="${row.MEM_GRD_DESC }"/>" placeholder="회원등급 설명"/>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th><span>구매금액 조건<i class="require"><em>필수입력</em></i></span></th>
	                        <td>
	                            <input type="text" name="MEM_AMT_CDT_MIN" id="MEM_AMT_CDT_MIN" class="text" value="<fmt:formatNumber value="${row.MEM_AMT_CDT_MIN }" groupingUsed="true" />"/> 이상 ~ <input type="text" name="MEM_AMT_CDT_MAX" id="MEM_AMT_CDT_MAX" class="text" value="<fmt:formatNumber value="${row.MEM_AMT_CDT_MAX }" groupingUsed="true" />"/>
	                            / <input type="text" name="MEM_AMT_CDT_DESC" id="MEM_AMT_CDT_DESC" class="text large" value="<c:out value="${row.MEM_AMT_CDT_DESC }"/>"/>
	                        </td>
	                    </tr>
	                    <!-- 상세/수정에만 노출 -->
	                    <tr>
	                        <th><span>사용여부</span></th>
	                        <td>
	                            <input type="radio"	id="stateB" name="MEM_GRD_USE_YN" class="radio"  value="Y" <c:if test="${row.MEM_GRD_USE_YN eq 'Y' }">checked="checked"</c:if>/>
	                            <label for="stateB">사용</label>
	                            <input type="radio" id="stateC" name="MEM_GRD_USE_YN" class="radio"  value="N" <c:if test="${row.MEM_GRD_USE_YN eq 'N' }">checked="checked"</c:if> />
	                            <label for="stateC">미사용</label>
	                        </td>
	                    </tr>
	                    <!-- // 상세/수정에만 노출 -->
	                </tbody>
	            </table><!-- // table -->
            

            	<h3 class="title"><span>혜택설정</span></h3>

                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>E포인트</span></th>
                            <td>
                                <input type="text" name="MEM_GRD_E_PIT" id="MEM_GRD_E_PIT" value="<fmt:formatNumber value="${row.MEM_GRD_E_PIT }" groupingUsed="true" />" class="text large"/> P 지급
                            </td>
                        </tr>
                        <tr>
                            <th><span>APP전용 E포인트</span></th>
                            <td>
                                <input type="text" name="MEM_GRD_APP_PIT" id="MEM_GRD_APP_PIT" value="<fmt:formatNumber value="${row.MEM_GRD_APP_PIT }" groupingUsed="true" />" class="text large"/> P 지급
                            </td>
                        </tr>
                        <tr>
                            <th><span>생일기념 E포인트</span></th>
                            <td>
                                <input type="text" name="MEM_GRD_BRT_PIT" id="MEM_GRD_BRT_PIT" value="<fmt:formatNumber value="${row.MEM_GRD_BRT_PIT }" groupingUsed="true" />" class="text large"/> P 지급
                            </td>
                        </tr>
                        <tr>
                            <th><span>추가 적립포인트</span></th>
                            <td>
                                <input type="text" name="MEM_GRD_ADD_PIT" id="MEM_GRD_ADD_PIT" value="<fmt:formatNumber value="${row.MEM_GRD_ADD_PIT }" groupingUsed="true" />" class="text large"/> %
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
<script>
$(function(){
	
    $("#frm").validate({
        rules: {
        	MEM_GRD_CD:{required:true}, // 회원등급
        	MEM_GRD_USE_YN : {required:true}
        },
        messages :
	    {	
        	MEM_GRD_CD: {required:"[회원등급]은 필수 정보입니다."},
        	MEM_GRD_USE_YN : {required:"[사용설정]은 필수 정보입니다."}
	    },
	    showErrors:
	    	function(errorMap, errorList){
		       if(this.numberOfInvalids()) { 
		    	   var errorOobjId = $(errorList[0].element).attr('id');
		    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
		    	   caption = caption.replace('*','').replace(/\s/gi,'');
		    	   if(caption != null && caption != "") 
		    	   {
		    	       alert('[' + caption + '] ' + errorList[0].message);
		    	   }
		    	   else
		    	   {
		    	       alert(errorList[0].message);
		    	   }
		    	   $(errorList[0].element).focus();
	       }
	    }
    });
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/member/memberGradeList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
	// 등록
	$(document).on("click", "#goRegist", function () {
		var $frm = $("#frm");
		if($frm.valid())
		{
			if(confirm("저장하시겠습니까?"))
			{
				//숫자 콤마 제거
				$("#MEM_AMT_CDT_MIN").val(removeComma($("#MEM_AMT_CDT_MIN").val()));
				$("#MEM_AMT_CDT_MAX").val(removeComma($("#MEM_AMT_CDT_MAX").val()));
				$("#MEM_GRD_E_PIT").val(removeComma($("#MEM_GRD_E_PIT").val()));
				$("#MEM_GRD_APP_PIT").val(removeComma($("#MEM_GRD_APP_PIT").val()));
				$("#MEM_GRD_BRT_PIT").val(removeComma($("#MEM_GRD_BRT_PIT").val()));
				$("#MEM_GRD_ADD_PIT").val(removeComma($("#MEM_GRD_ADD_PIT").val()));
				$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/memberGradeModify.do", "target":"_self", "method":"post"}).submit();
			}
		}
	});
	
});
//-->
</script>

</body>
</html>
