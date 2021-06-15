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

                <h2 class="title"><span>공지사항</span></h2>

                <h3 class="title"><span>수정</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchBrdNtsTitle" value="<c:out value="${commandMap.searchBrdNtsTitle }"/>"/>
                    <input type="hidden" name="searchBrdNtsContents" value="<c:out value="${commandMap.searchBrdNtsContents }"/>"/>
                    <input type="hidden" name="searchBrdNtsTitleAndContents" value="<c:out value="${commandMap.searchBrdNtsTitleAndContents }"/>"/>
                    <input type="hidden" name="searchBrdNtsUseYn" value="<c:out value="${commandMap.searchBrdNtsUseYn }"/>"/>
                    <input type="hidden" name="searchBrdNtsTopYn" value="<c:out value="${commandMap.searchBrdNtsTopYn }"/>"/>	
                    <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/> 
				</form>
                
                <form id="frm" name="frm" enctype="multipart/form-data"> 
                	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="BRD_NTS_IDX" id="BRD_NTS_IDX" value="<c:out value="${row.BRD_NTS_IDX }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
					<input type="hidden" name="searchBrdNtsTitle" value="<c:out value="${commandMap.searchBrdNtsTitle }"/>"/>
					<input type="hidden" name="searchBrdNtsContents" value="<c:out value="${commandMap.searchBrdNtsContents }"/>"/>
					<input type="hidden" name="searchBrdNtsTitleAndContents" value="<c:out value="${commandMap.searchBrdNtsTitleAndContents }"/>"/>
					<input type="hidden" name="searchBrdNtsUseYn" value="<c:out value="${commandMap.searchBrdNtsUseYn }"/>"/>
					<input type="hidden" name="searchBrdNtsTopYn" value="<c:out value="${commandMap.searchBrdNtsTopYn }"/>"/>	
					<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>                     
                    <input type="hidden" name="cmmFleIdx" value=""/>
                    <input type="hidden" name="BRD_NTS_GUBUN_CD" value="<c:out value="${row.BRD_NTS_GUBUN_CD }"/>"/>
                    <input type="hidden" id="BRD_NTS_TOP_YN_DB" value="<c:out value="${row.BRD_NTS_TOP_YN }"/>" />
                    <input type="hidden" id="BRD_NTS_USE_YN_DB" value="<c:out value="${row.BRD_NTS_USE_YN }"/>" />
                    <input type="hidden" id="BrdNtsTopYnCnt" value="<c:out value="${commandMap.result }"/>"/>
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>상태</span></label></th>
	                    		<td>
	                    			<input type="radio" name="BRD_NTS_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${row.BRD_NTS_USE_YN eq 'Y' }">checked="checked"</c:if>/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="BRD_NTS_USE_YN" id="stateB" value="N" class="radio" <c:if test="${row.BRD_NTS_USE_YN eq 'N' }">checked="checked"</c:if>/>
		                            <label for="stateB">미사용</label>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>작성자</span></label></th>
	                    		<td>
	                    			<c:out value="${row.BRD_NTS_REG_ID }"/>(<c:out value="${row.ADM_MST_NM }"/>)
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>상단공지여부</span></label></th>
	                    		<td>
	                    			<input type="checkbox" name="BRD_NTS_TOP_YN" id="stateTopA" value="Y" class="checkbox" <c:if test="${row.BRD_NTS_TOP_YN eq 'Y' }">checked="checked"</c:if>/>
                                	<label for="stateTopA">상단공지</label>
	                    		</td>
	                        </tr>
	                        <%-- <tr>
	                    		<th><label class="label"><span>유형<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<select class="select" name="BRD_CMN_COM_IDX" id="BRD_CMN_COM_IDX">
                                    	<option value="">선택</option>
                                    	<c:if test="${not empty codeList }">
                                        	<c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                           		<option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${row.BRD_CMN_COM_IDX eq codeRow.CMN_COM_IDX}">selected="selected"</c:if>>
                                                	<c:out value="${codeRow.CMN_COM_NM }"/>
                                            	</option>
                                        	</c:forEach>
                                    	</c:if>
                                	</select>
                                
                                 	<!-- 상품기술정보 하위 카테고리 -->
                                	<select class="select" name="BRD_CMN_COM_SUB_IDX" id="BRD_CMN_COM_SUB_IDX" style="display:none;">
                                	</select>
	                    		</td>
	                        </tr> --%>
	                        <tr>
	                    		<th><label class="label"><span>게시판 url </span></label></th>
	                    		<td>
	                    			<a href="${frontDomain }/pc/customer/noticeBoardView.do?BRD_NTS_IDX=${row.BRD_NTS_IDX}&BRD_NTS_TOP_YN=${row.BRD_NTS_TOP_YN}/>" target="_blank" title="새 창 으로 열립니다.">
                                       <c:out value="${frontDomain }"/>/pc/customer/noticeBoardView.do?BRD_NTS_IDX=<c:out value="${row.BRD_NTS_IDX}"/>&BRD_NTS_TOP_YN=<c:out value="${row.BRD_NTS_TOP_YN}"/>
                                    </a>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="BRD_NTS_TITLE" id="BRD_NTS_TITLE" class="text xlarge" placeholder="최대 40자까지 입력하실 수 있습니다." style="width:80%;" maxlength="40" value="<c:out value="${row.BRD_NTS_TITLE }"/>"/>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<textarea class="textarea" name="BRD_NTS_CONTENTS" id="BRD_NTS_CONTENTS" style="height: 500px; width:80%;"> <c:out value="${row.BRD_NTS_CONTENTS }"/></textarea>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>첨부파일</span></label></th>
	                    		<td>
	                    			<table id="fileView" style="width:50%;">	
                            			<c:choose>
                            				<c:when test="${not empty fileList }">                            					                            					
                            					<c:forEach items="${fileList }" var="fileRow" varStatus="i">		                            				
		                            				<tr>
		                            					<td>
		                            						<i class="icon-file"></i>
		                            						<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
			                                        			<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
	 		                                    			</a>		 		                                    			
	 		                                    			<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" /> 
				                         					<label for="CMM_FLE_IDX">삭제</label>
		                            					</td>			                            					
		                            				</tr>			                            							                            				
		                            			</c:forEach>
		                            				<tr>
					                    				<td id="defaultFile">
					                    					<input type="file" name="file" id="files[0]" class="file" />
					                    				</td>
					                    				<td>
					                    					<input type="button" name="addFile" id="addFile" value="+"/>
	                    									<input type="button" id="delFileData" value="파일 지우기"/>	
				                    					</td>
				                    				</tr>				                    				
                            				</c:when>	
                            				<c:otherwise>
                            					<tr>
				                    				<td id="defaultFile">
				                    					<input type="file" name="file" id="files[0]" class="file" />
				                    				</td>
				                    				<td>
				                    					<input type="button" name="addFile" id="addFile" value="+"/>
	                    								<input type="button" id="delFileData" value="파일 지우기"/>	
			                    					</td>
				                    			</tr>			                    								                    			
                            				</c:otherwise>                            				                         				
                           				</c:choose>	 
                           			</table>       	                            			              		
 	                            	<small class="desc">* 업로드 가능 파일 : hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf</small>
 	                            	<small class="desc">* 업로드 용량 : 20MB</small>        
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
		<!-- 파일 다운로드용 폼 -->
		<form name="fileForm" id="fileForm">
             <input type="hidden" name="CMM_FLE_IDX" value=""/>
             <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
             <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
        </form>
    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<ui:editor objId="#BRD_NTS_CONTENTS"/>
<script>
$(function(){
var BRD_NTS_GUBUN_CD = $("#frm select[name='BRD_NTS_GUBUN_CD']").val(); 
 	
	// 상단공지 클릭 이벤트
	$(document).on("click", "#frm input[name='BRD_NTS_TOP_YN']", function () {
		if($(this).is(":checked"))
	    {
		     $.ajax({
		         async : false,
		         type : "POST",
		         data : { "BRD_NTS_GUBUN_CD": BRD_NTS_GUBUN_CD },
		         url : "<c:out value="${serverDomain}" />/am/board/noticeBoardTopCountAjax.do",
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
	
	// 상태(미사용 → 사용) 변경 시 상단공지 사용가능 유무
	$(document).on("change", "#frm input[name='BRD_NTS_USE_YN']", function () {
        if($("#BRD_NTS_USE_YN_DB").val() == "N")
        {
        	// 상태가 미사용이고, 상단공지가 체크되어 있을 때
        	if($("input:checkbox[name='BRD_NTS_TOP_YN']:checked").val() == "Y")
        	{
        		$.ajax({
	                async : false,
	                type : "POST",
	                data : { "BRD_NTS_GUBUN_CD": BRD_NTS_GUBUN_CD },
	                url : "<c:out value="${serverDomain}" />/am/board/noticeBoardTopCountAjax.do",
	                success : function (data) 
	                {
	                    if(data.resultYn == "N" || data.resultYn == "F")
	                    {
	                        alert("상단공지 5개 모두 등록되었습니다.");
	                        $("#stateB").prop("checked", true);
	                        return;
	                    }
	                },
	                error : function (err)
	                {
	                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
	                }
        		});
        	}            
        }
    });
	
	// 파일 행 추가 클릭 이벤트
    $("#addFile").click(function(){
    	var fileNum = $("#fileView tr").children().length;
    	
    	$("#fileView").append('<tr><td>' + '<input type="file" class="file" name="file" id="files['+ fileNum +']"/>' + '</td><td>'+'<input type="button" onClick="rowDelete(this)" value="-"/>'+'</td></tr>');	
		//고정 첨부파일 행 파일지우기 비활성화
		$("#delFileData").prop("disabled", true);
    	
    });
  
 	// 고정 첨부 행 파일 지우기
    $("#delFileData").click(function(e){
    	e.preventDefault();
    	$("#defaultFile").find("input").remove();
    	$("#defaultFile").append('<input type="file" name="file" id="files[0]" class="file" value="" />');
    });
	
    //파일 삭제를 위한 체크박스 클릭 이벤트
	$(".cmmFleIdx").click(function(){
		var cmmFleIdx = "";
		$("input[name='CMM_FLE_IDX']:checked").each(function(){
			cmmFleIdx = cmmFleIdx + $(this).val() + ",";
		});
		$("input[name='cmmFleIdx']").val(cmmFleIdx);		
	});
	
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/noticeBoardList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        //var $frm = $("#frm"); 
       // if($frm.valid()){    	   
    	   
    	   if($("#BRD_CMN_COM_IDX").val() == "")
            {
                alert("[유형]반드시 선택해 주십시오.");
                $("#BRD_CMN_COM_IDX").focus();
                return;
            }
    	   	
        	if($.trim($("#BRD_NTS_TITLE").val()) == "")
            {
                alert("[제목]반드시 입력해 주십시오.");
                $("#BRD_NTS_TITLE").focus();
                return;
            }
        	
        	try { oEditors.getById["BRD_NTS_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ } //editor 내용을 BRD_NTS_CONTENTS TEXTAREA의 VALUE 값으로 만든다.
            var CONTENTS = stringUtil.getString($.trim($("#BRD_NTS_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#BRD_NTS_CONTENTS").focus();
                return;
            }
      		
            // 상단공지는 체크, 상태는 사용 - 상단공지 사용가능 여부 체크
            if($("input:checkbox[name='BRD_NTS_TOP_YN']").is(":checked"))
            { 
            	var flag = 0;            	
            	
           		$.ajax({
      	                async : false,
      	                type : "POST",
      	                data : { "BRD_NTS_GUBUN_CD": BRD_NTS_GUBUN_CD },
      	                url : "<c:out value="${serverDomain}" />/am/board/noticeBoardTopCountAjax.do", 
      	                success : function (data) 
      	                {       	                	
      	                    if(data.resultYn == "N")
      	                    {   	                    	
      	                        alert("상단공지 5개 모두 등록되었습니다.");   	
      	                        flag = 1;
      	                    }   	                      	               
      	                },
      	                error : function (err)
      	                {
      	                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
      	                }
      	            });           	
            	if(flag == 1)
            	{            		
            		return;	
            	}   
            }
            
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/noticeBoardModify.do", "target":"_self", "method":"post"}).submit();
            }
        //}
    });
    
    // 파일 다운로드
    $(document).on("click", ".file-list-title", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
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
