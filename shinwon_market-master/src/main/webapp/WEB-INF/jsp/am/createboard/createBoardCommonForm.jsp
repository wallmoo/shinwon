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

                <h2 class="title"><span>${resultMap.BRD_MST_NM }</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                 	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                 	<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                 	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>	                    
                 	<input type="hidden" name="searchBrdDtlTitleAndContents" value="<c:out value="${commandMap.searchBrdDtlTitleAndContents }"/>"/>
                 	<input type="hidden" name="searchBrdDtlUseYn" value="<c:out value="${commandMap.searchBrdDtlUseYn }"/>"/>
                 	<input type="hidden" name="searchBrdDtlTopYn" value="<c:out value="${commandMap.searchBrdDtlTopYn }"/>"/>
                 	<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>	 	                              
                </form>
                
                <form id="frm" name="frm" enctype="multipart/form-data">
                   	<input type="hidden" name="BRD_MST_IDX" value="<c:out value="${resultMap.BRD_MST_IDX }"/>"/>
                   	<input type="hidden" name="BRD_MST_TYPE" value="<c:out value="${resultMap.BRD_MST_TYPE }"/>"/> 
			  		
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>상태</span></label></th>
	                    		<td>
	                    			<input type="radio" name="BRD_DTL_USE_YN" id="stateA" value="Y" class="radio" checked="checked"/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="BRD_DTL_USE_YN" id="stateB" value="N" class="radio" />
		                            <label for="stateB">미사용</label>
	                    		</td>
	                        </tr>
	                        <c:if test="${resultMap.BRD_MST_TOP_YN eq 'Y' }">
		                        <tr>
		                    		<th><label class="label"><span>상단공지여부</span></label></th>
		                    		<td>
		                    			<input type="checkbox" name="BRD_DTL_TOP_YN" id="stateTopA" value="Y" class="checkbox"/>
	                                	<label for="stateTopA">상단공지</label>
		                    		</td>
		                        </tr>
	                        </c:if>
	                        <c:if test="${resultMap.BRD_MST_TYPE eq Code.BOARD_TYPE_IMAGE }">
		                        <tr>
		                    		<th><label class="label"><span>썸네일<i class="require"><em>필수입력</em></i></span></label></th>
		                    		<td>
		                    			<input type="file" name="thumb" id="thumb" class="file"/>	
		                    		</td>
		                        </tr>
	                        </c:if>
	                        <tr>
	                    		<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="BRD_DTL_TITLE" id="BRD_DTL_TITLE" class="text xlarge" placeholder="최대 40자까지 입력하실 수 있습니다." maxlength="40"/>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<textarea name="BRD_DTL_CONTENTS" id="BRD_DTL_CONTENTS" style="height: 500px;"></textarea>
	                    		</td>
	                        </tr>
	                        
	                        <c:if test="${resultMap.BRD_MST_FLE_YN eq 'Y' }">
		                        <tr>
		                    		<th><label class="label"><span>첨부파일</span></label></th>
		                    		<td>
		                    			<table id="fileView" style="width:50%;">
			                    			<tr>	                    				
			                    				<td id="defaultFile">	                    					
			                    					<input type="file" name="file" id="files[0]" class="file" value="" />	                    						                    					                   					 					               		
			                    				</td>	
			                    				<td>
			                    					<input type="button" name="addFile" id="addFile" value="+"/>
			                    					<input type="button" id="delFileData" value="파일 지우기"/>
			                    				</td>
			                    			</tr>	                    													                    				                    				                    		
			                    		</table>
			                    		<small class="desc">* 업로드 가능 파일 : hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf</small>
	 	                            	<small class="desc">* 업로드 용량 : 20MB</small> 
		                    		</td>
		                        </tr>
	                        </c:if>
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
	var BRD_MST_IDX = $("#frm input[name='BRD_MST_IDX']").val();
	// 상단공지 클릭 이벤트
	$(document).on("click", "#frm input[name='BRD_DTL_TOP_YN']", function () {
        if(this.id == "stateTopA")
        {
            $.ajax({
                async : false,
                type : "POST",
                data : { "BRD_MST_IDX": BRD_MST_IDX },                 
                url : "<c:out value="${serverDomain}" />/am/createboard/createBoardCommonTopCountAjax.do",
                success : function (data) 
                {
                    if(data.resultYn == "N" || data.resultYn == "F")		
                    {
                        alert("상단공지 5개 모두 등록되었습니다.");
                        $("#stateTopA").prop("checked", false);
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
	
    // 파일 행 추가 클릭 이벤트
    $("#addFile").click(function(){
    	var fileNum = $("#fileView tr").children().length;
    	
   		$("#fileView").append('<tr><td>' + '<input type="file" class="file" name="file" id="files['+ fileNum +']"/>' + '</td><td>'+'<input type="button" onClick="rowDelete(this)" value="-"/>'+'</td></tr>');	
   		// 고정 첨부파일 행 파일지우기 비활성화
   		$("#delFileData").prop("disabled", true);
    	
    });    
    
    // 고정 첨부 행 파일 지우기
    $("#delFileData").click(function(e){
    	e.preventDefault();
    	
    	$("#defaultFile").find("input").remove();
    	$("#defaultFile").append('<input type="file" name="file" id="files[0]" class="file" value="" />');
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/createboard/create"+ BRD_MST_IDX +"BoardCommonList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        //var $frm = $("#frm"); 
        //if($frm.valid()){ file input disabled 풀려서 같이 사용 못함.. 그냥 체크하는 걸로.
//         	if($("#BRD_CMN_COM_IDX").val() == "")
//             {
//                 alert("[유형]반드시 선택해 주십시오.");
//                 $("#BRD_CMN_COM_IDX").focus();
//                 return;
//             }
        	if($('input[name=thumb]').val() == "")
        	{
        		alert("[썸네일]반드시 입력해 주십시오.");
        		return;
        	}
        
        	if($.trim($("#BRD_DTL_TITLE").val()) == "")
            {
                alert("[제목]반드시 입력해 주십시오.");
                $("#BRD_DTL_TITLE").focus();
                return;
            }

        	try { oEditors.getById["BRD_DTL_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ } //editor 내용을 BRD_DTL_CONTENTS TEXTAREA의 VALUE 값으로 만든다.
            var CONTENTS = stringUtil.getString($.trim($("#BRD_DTL_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#BRD_DTL_CONTENTS").focus();
                return;
            }
        
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/createboard/create"+ BRD_MST_IDX +"BoardCommonRegist.do", "target":"_self", "method":"post"}).submit();
            }
        //}
    });
});

//현재 행 삭제
function rowDelete(row)
{
	$(row).parent().parent().remove();
	
	// 고정 첨부파일 행 파일지우기 활성화
	if($("input[name='file']").length == 1)
	{
		$("#delFileData").prop("disabled", false);
	}
}
//-->
</script>

</body>
</html>
