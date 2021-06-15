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

                <h3 class="title"><span>수정</span></h3>
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
                	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="BRD_DTL_IDX" id="BRD_DTL_IDX" value="<c:out value="${row.BRD_DTL_IDX }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>                        
                    <input type="hidden" name="searchBrdDtlTitleAndContents" value="<c:out value="${commandMap.searchBrdDtlTitleAndContents }"/>"/>
                    <input type="hidden" name="searchBrdDtlUseYn" value="<c:out value="${commandMap.searchBrdDtlUseYn }"/>"/>
                    <input type="hidden" name="searchBrdDtlTopYn" value="<c:out value="${commandMap.searchBrdDtlTopYn }"/>"/> 
                    <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
                    <input type="hidden" name="cmmFleIdx" value=""/>
                    <input type="hidden" id="BRD_DTL_TOP_YN_DB" value="<c:out value="${row.BRD_DTL_TOP_YN }"/>" />
                    <input type="hidden" id="BRD_DTL_USE_YN_DB" value="<c:out value="${row.BRD_DTL_USE_YN }"/>" />
                    <input type="hidden" id="BrdDtlTopYnCnt" value="<c:out value="${commandMap.result }"/>"/> 
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
	                    			<input type="radio" name="BRD_DTL_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${row.BRD_DTL_USE_YN eq 'Y'}">checked</c:if>/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="BRD_DTL_USE_YN" id="stateB" value="N" class="radio" <c:if test="${row.BRD_DTL_USE_YN eq 'N'}">checked</c:if> />
		                            <label for="stateB">미사용</label>
	                    		</td>
	                        </tr>
	                        <c:if test="${resultMap.BRD_MST_TOP_YN eq 'Y' }">
		                        <tr>
		                    		<th><label class="label"><span>상단공지여부</span></label></th>
		                    		<td>
		                    			<input type="checkbox" name="BRD_DTL_TOP_YN" id="stateTopA" value="Y" class="checkbox" <c:if test="${row.BRD_DTL_TOP_YN eq 'Y'}">checked</c:if>/>
	                                	<label for="stateTopA">상단공지</label>
		                    		</td>
		                        </tr>
	                        </c:if>
	                        <c:if test="${resultMap.BRD_MST_TYPE eq Code.BOARD_TYPE_IMAGE }">
		                        <tr>
		                    		<th><label class="label"><span>썸네일<i class="require"><em>필수입력</em></i></span></label></th>
		                    		<td>
		                    			<c:if test="${not empty fileList }">  
		                       				<c:forEach items="${fileList }" var="thumb">
		                       					<c:if test="${thumb.CMM_FLE_TB_TYPE eq Code.IMG_BOARD_TYPE_THUMB }">
		                       						<img src="${cdnDomain}${thumb.CMM_FLE_ATT_PATH}${thumb.CMM_FLE_SYS_NM}" style="width:100px;height:100px;">   
		                       						<input type="checkbox" class="checkbox cmmFleThumbIdx" id="CMM_FLE_THUMB_IDX" name="CMM_FLE_THUMB_IDX" data-file_name="thumb" value="<c:out value="${thumb.CMM_FLE_IDX }"/>" /> 
							                        <label for="CMM_FLE_THUMB_IDX">수정</label>           
							                        <br/><br/>        						
		                       						<input type="file" name="thumb" id="thumb" class="file" style="width:50%;"/>
		                       					</c:if>
		                       				</c:forEach>                          					                            					                       						                            				        
			                            </c:if>  	
		                    		</td>
		                        </tr>
	                        </c:if>
	                        <tr>
	                    		<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="BRD_DTL_TITLE" id="BRD_DTL_TITLE" class="text xlarge" placeholder="최대 40자까지 입력하실 수 있습니다." maxlength="40" value="<c:out value="${row.BRD_DTL_TITLE }"/>"/>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<textarea name="BRD_DTL_CONTENTS" id="BRD_DTL_CONTENTS" style="height: 500px;"><c:out value="${row.BRD_DTL_CONTENTS }"/></textarea>
	                    		</td>
	                        </tr>
	                        
	                        <c:if test="${resultMap.BRD_MST_FLE_YN eq 'Y' }">
		                        <tr>
		                    		<th><label class="label"><span>첨부파일</span></label></th>
		                    		<td>
		                    			<table id="fileView" style="width:50%;">
			                    			<c:choose>
	                            				<c:when test="${not empty fileList }">                            					                            					
	                            					<c:forEach items="${fileList }" var="fileRow" varStatus="i">
	                            						<c:if test="${fileRow.CMM_FLE_TB_TYPE eq Code.IMG_BOARD_TYPE_GENERAL}">	                            				
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
			                            				</c:if>		                            							                            				
			                            			</c:forEach>
			                            				<tr>
						                    				<td>
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
					                    					<input type="file" name="file" id="files[0]" class="file" value=""/>
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
            
            <div class="contents-inner"><!-- contents-inner -->
            	<h3 class="title"><span>덧글목록</span></h3>
            	
            	<div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="#none" id="goDelete" class="button small primary"><span>미전시</span></a>
                </div>
                
                <table class="table-row table-a">
                    <colgroup>
                    	<col style="width: 2%;" />
                        <col style="width: 2%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />                            
                        <col style="width: 10%;" />                            
                    </colgroup>
                    <thead>
                        <tr>
                        	<th></th>
                            <th>NO</th>                                
                            <th>내용</th>
                            <th>등록일</th>                                
                            <th>작성자</th>  
                            <th>전시여부</th>                             
                        </tr>
                    </thead>                        
                    <tbody id="createBoardCommonReplyTable">
					</tbody>
				</table>
				
				<div class="pagination" id="createBoardCommonReplyPageDiv">
				</div>

				<!-- 덧글 목록 폼 -->
                <form id="replyFrm" name="replyFrm">        
                	<input type="hidden" name="BRD_REPLY_DISPLAY_YN" value=""/>                                                 
                    <input type="hidden" name="BRD_MST_IDX" value="<c:out value="${resultMap.BRD_MST_IDX }"/>"/>
                    <input type="hidden" name="BRD_DTL_IDX" value="<c:out value="${row.BRD_DTL_IDX }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>                                       	                
                </form>

            </div><!-- // contents-inner -->
            
            <div style="height:30px;"></div>
            
            <!-- 덧글 등록 폼 -->
            <div class="contents-inner"><!-- contents-inner -->            	
            	<form id="replyInsertFrm" name="replyInsertFrm">	
            		<input type="hidden" name="BRD_MST_IDX" value="<c:out value="${resultMap.BRD_MST_IDX }"/>"/>
                    <input type="hidden" name="BRD_DTL_IDX" value="<c:out value="${row.BRD_DTL_IDX }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>                                   
	                <div class="form-group">	                    
	                    <div class="field">
	                        <textarea name="BRD_REPLY_CONTENTS" id="BRD_REPLY_CONTENTS" rows="5" cols="202" placeholder="[덧글]을 입력하시기 바랍니다." onkeyup="getStrByte(this,'#byte', 600, 3);"></textarea>	  
	                        <br/>
	                        (<span id="byte">0</span>/600)                      
	                    </div>
	                </div>
	            </form>
            </div>
            
            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:;" id="goInsert" class="button button-b"><span>덧글 저장</span></a>
            </div><!-- // section button -->  

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

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<!-- template -->
<script id="createBoardCommonReplyTemplate" type="text/x-jquery-tmpl">                           	
<tr>	
	<td> 
		<input type="checkbox" name="BRD_REPLY_IDX" id="BRD_REPLY_IDX_\${BRD_REPLY_IDX}" class="checkbox brdReplyIdx" value="\${BRD_REPLY_IDX }" data-brd_reply_display_yn="\${BRD_REPLY_DISPLAY_YN}"/>                          				
	</td>                         		
	<td>		                          				                          		
		\${RNUM }
	</td>			                                
	<td class="left">
		\${BRD_REPLY_CONTENTS }
	</td>
	<td>
		\${BRD_REPLY_REG_DT }
	</td>			                                		                                
	<td>
		\${BRD_REPLY_REG_ID }(\${ADM_MST_NM })
	</td>
	{{if BRD_REPLY_DISPLAY_YN == 'N'}}
	<td>미전시</td>
	{{else}}
	<td>전시</td>
	{{/if}}
</tr>                               
</script>
<script>
$(function(){
var BRD_MST_IDX = $("#frm input[name='BRD_MST_IDX']").val();
	
	// 덧글 목록 가져오기
	getCreateBoardCommonReplyListAjax();

	// 덧글 저장 클릭 이벤트	
	$(document).on("click", "#goInsert", function () 
	{			
		if($("#BRD_REPLY_CONTENTS").val() == "")
		{
			alert("덧글내용을 입력해주세요.");
			$("#BRD_REPLY_CONTENTS").focus();
			return;
		}
		$.ajax({
			type: "post",
			url: "<c:out value="${serverDomain}"/>/am/createboard/createBoardCommonReplyInsertAjax.do",
			data: $("#replyInsertFrm").serialize(),			
			async: false,
			success: function(data)
			{
				if(data.result == "success" )
				{
					alert("덧글 등록 되었습니다.");	
					$('textarea').val(''); 
					$("#byte").html("0");
					getCreateBoardCommonReplyListAjax();
				}				
			},
			error : function (err)
	        {
            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
	        }
		});
	});
	
	// 덧글 미전시 클릭 이벤트	
	$(document).on("click", "#goDelete", function () 
	{	
		var brdReplyIdxs = [];
		var brdReplyDisplayYns = [];
		if($("input[name='BRD_REPLY_IDX']:checked").length == 0)
		{
			alert("덧글을 선택해주세요.");
			return;
		}
		else
		{
			$("input[name='BRD_REPLY_IDX']:checked").each(function(){
				brdReplyIdxs[brdReplyIdxs.length] = $(this).val();
				brdReplyDisplayYns[brdReplyDisplayYns.length] = $(this).data("brd_reply_display_yn");
			});

			$.ajax({
				type: "post",
				url: "<c:out value="${serverDomain}"/>/am/createboard/createBoardCommonReplyDelAjax.do",
				data: {"brdReplyIdxs[]": brdReplyIdxs, "brdReplyDisplayYns[]": brdReplyDisplayYns},			
				async: false,
				success: function(data)
				{
					if(data.result == "success" )
					{
						alert("처리 되었습니다.");
						getCreateBoardCommonReplyListAjax();			
					}				
				},
				error : function (err)
		        {
	            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
		        }
			});			
		}
	});
	
	// 상단공지 클릭 이벤트
	$(document).on("click", "#frm input[name='BRD_DTL_TOP_YN']", function () {
        if($("#BRD_DTL_TOP_YN_DB").val() == "N")
        {
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
        }
    });
	
	// 상태(미사용 → 사용) 변경 시 상단공지 사용가능 유무
	$(document).on("change", "#frm input[name='BRD_DTL_USE_YN']", function () {
        if($("#BRD_DTL_USE_YN_DB").val() == "N")
        {
        	// 상태가 미사용이고, 상단공지가 체크되어 있을 때
        	if($("input:checkbox[name='BRD_DTL_TOP_YN']:checked").val() == "Y")
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
		// 고정 첨부파일 행 파일지우기 비활성화
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
    
	//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
	$(".cmmFleThumbIdx").each(function(){
        var fileName = $(this).data("file_name");
        $("input[name='"+ fileName +"']").prop("disabled", true);
	});
	
    //썸네일 삭제를 위한 체크박스 checked상태일 때 첨부 input 활성화
    $(document).on("change", ".cmmFleThumbIdx", function () {
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
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/createboard/create"+ BRD_MST_IDX +"BoardCommonList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        	if($("#CMM_FLE_THUMB_IDX").is(":checked"))
        	{
        		if($("#thumb").val() == "")
        		{
        			alert("[썸네일]반드시 입력해 주십시오.");
        			return;
        		}
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
            
         	// 상단공지는 체크, 상태는 사용 - 상단공지 사용가능 여부 체크
            if($("input:checkbox[name='BRD_DTL_TOP_YN']").is(":checked"))
            { 
            	var flag = 0;            	
            	
           		$.ajax({
      	                async : false,
      	                type : "POST",
      	                data : { "BRD_MST_IDX": BRD_MST_IDX },
      	                url : "<c:out value="${serverDomain}" />/am/createboard/createBoardCommonTopCountAjax.do", 
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
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/createboard/create"+ BRD_MST_IDX +"BoardCommonModify.do", "target":"_self", "method":"post"}).submit();
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

//덧글 목록 가져오기
function getCreateBoardCommonReplyListAjax(curPage)
{		
	var cPage = curPage != undefined ? curPage : "";
	var BRD_DTL_IDX = $("input[name='BRD_DTL_IDX']").val();
	
	$.ajax({
		type: "post",
		url: "<c:out value="${serverDomain}"/>/am/createboard/createBoardCommonReplyListAjax.do",
		data: {"cPage" : cPage, "BRD_DTL_IDX" : BRD_DTL_IDX},	
		dataType : "json",
		async: false,
		success: function(data)
		{
			if(data.list != null)
			{
				var arrayObj = new Array();

				$.each(data.list, function(index,item)
				{
					var obj = new Object();
								
					obj.RNUM = item.RNUM;
					obj.BRD_REPLY_IDX = item.BRD_REPLY_IDX;					
					obj.BRD_REPLY_CONTENTS = item.BRD_REPLY_CONTENTS;
					obj.BRD_REPLY_REG_DT = item.BRD_REPLY_REG_DT;
					obj.BRD_REPLY_REG_ID = item.BRD_REPLY_REG_ID;
					obj.BRD_REPLY_DISPLAY_YN = item.BRD_REPLY_DISPLAY_YN;						
					obj.ADM_MST_NM = item.ADM_MST_NM;
					arrayObj.push(obj);
				});					
					$( "#createBoardCommonReplyTable" ).html($( "#createBoardCommonReplyTemplate" ).tmpl( arrayObj ));
	        		$( "#createBoardCommonReplyPageDiv" ).html("<div class=\"section-pagination\"><h4 class=\"sr-only\">목록 페이징</h4><div class=\"wrap\">" + data.page + "</div></div>");
			}
			else
			{
				$( "#createBoardCommonReplyTable" ).html("<tr><td colspan=\"6\">조회된 데이터가 없습니다.</td></tr>");
			}	
		},
		error : function (err)
	    {
            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
	   	}
	});
};

// 현재 행 삭제
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
