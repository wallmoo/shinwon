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

                <h2 class="title"><span>FAQ</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchBrdFaqTitle" value="<c:out value="${commandMap.searchBrdFaqTitle }"/>"/>
                    <input type="hidden" name="searchBrdFaqContents" value="<c:out value="${commandMap.searchBrdFaqContents }"/>"/>
                    <input type="hidden" name="searchBrdFaqTitleAndContents" value="<c:out value="${commandMap.searchBrdFaqTitleAndContents }"/>"/>
                    <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
                    <input type="hidden" name="serachBrdFaqUseYn" value="<c:out value="${commandMap.serachBrdFaqUseYn }"/>"/>
                    <input type="hidden" name="searchBrdFaqOftenYn" value="<c:out value="${commandMap.searchBrdFaqOftenYn }"/>"/>
				</form>
                
                <form id="frm" name="frm"> 
                	<input type="hidden" name="BRAND_CD" value=""/>
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>유형<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<select class="select" name="BRD_CMN_COM_IDX" id="BRD_CMN_COM_IDX">
	                                	<option value="">선택</option>
	                                	<c:if test="${not empty codes.FAQ_INQUIRY_TYPE_CODE }">
			 	                    		<c:forEach var="faqRow" items="${codes.FAQ_INQUIRY_TYPE_CODE }" varStatus="i">
			 	                    			<option value="<c:out value="${faqRow.CMN_COM_IDX }"/>">
			 	                    				<c:out value="${faqRow.CMN_COM_NM }"/>
			 	                    			</option>	      
				                            </c:forEach>
			                            </c:if>
	                                </select>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>상태</span></label></th>
	                    		<td>
	                    			<input type="radio" name="BRD_FAQ_USE_YN" id="stateA" value="Y" class="radio" checked="checked"/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="BRD_FAQ_USE_YN" id="stateB" value="N" class="radio" />
		                            <label for="stateB">미사용</label>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="BRD_FAQ_TITLE" id="BRD_FAQ_TITLE" class="text xlarge" style="width:80%" placeholder="최대 40자까지 입력하실 수 있습니다." maxlength="40"/>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<textarea class="textarea" name="BRD_FAQ_CONTENTS" id="BRD_FAQ_CONTENTS" style="height: 500px; width:80%;"></textarea>
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
<ui:editor objId="#BRD_FAQ_CONTENTS"/>
<script>
$(function(){
	// 폼체크
    $("#frm").validate({
        rules: {        	
            BRD_FAQ_USE_YN:{required:true}, // 사용 유무
            BRD_CMN_COM_UP_IDX:{required:true},	//유형(대분류)
            BRD_CMN_COM_IDX:{required:true}, // 유형(소분류)
            BRD_FAQ_OFTEN_YN:{required:true}, // 자주하는 FAQ 사용유무
            BRD_FAQ_TITLE:{required:true} // 제목
        }
    });
    
    // 자주하는 FAQ 갯수 확인
    $(document).on("change", "#frm input[name='BRD_FAQ_OFTEN_YN']", function () {
        if(this.id == "stateOftenA")
        {
            $.ajax({
                async : false,
                type : "POST",
                data : null,
                url : "<c:out value="${serverDomain}" />/am/board/faqBoardOftenTopCountAjax.do",
                success : function (data) 
                {
                    if(data.resultYn == "N" || data.resultYn == "F")
                    {
                        alert("TOP FAQ 5개 모두 등록되었습니다.");
                        $("#stateOftenB").prop("checked", true);
                        return;
                    }
                },
                error : function (err)
                {
                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
                }
            });
        }
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/faqBoardList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        
        if($frm.valid()){
        	try { oEditors.getById["BRD_FAQ_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#BRD_FAQ_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#BRD_FAQ_CONTENTS").focus();
                return;
            }
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/faqBoardRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
    // 대 카테고리 변경시 하위 카테고리 로드
    $(document).on("change","#BRD_CMN_COM_UP_IDX",function(){
    	getFaqCategoryList($(this).val(), "BRD_CMN_COM_IDX");
    });
});

//문의 유형 리스트 가져오기
function getFaqCategoryList(CMN_COM_IDX, targetSelectId){
	$.ajax({
		type:"post",
		url : "<c:out value="${serverDomain}" />/am/board/getFaqCategoryListAjax.do",
		data : {"CMN_COM_IDX":CMN_COM_IDX},
		dataType : "json",
		async : false,
		success : function(data){
			$("#"+targetSelectId).html("<option value=\"\">선택</option>");
			$("#BRD_CMN_COM_IDX").html("<option value=\"\">선택</option>");
			if(data.categoryList.length > 0){
				$.each(data.categoryList, function(idx, item){
					$("#"+targetSelectId).append("<option value=\""+ item.CMN_COM_IDX +"\">"+ item.CMN_COM_NM +"</option>");
				});
			}
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
}
//-->
</script>

</body>
</html>
