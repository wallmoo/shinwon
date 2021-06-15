<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-event"><!-- page class : page-event -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->
	
		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
		    <div id="breadcrumb" class="wrap">
		        <div class="holder">
		            <span>홈</span>
		            <span class="gt">&gt;</span>
		            <strong class="warning">EVENT</strong>
		        </div>
		    </div>
		</div><!-- // breadcrumb -->

		<div class="container"><!-- container -->
		<div class="wrap"><!-- wrap -->

			<div class="section-title">
			    <h3 class="title"><span>EVENT</span></h3>
			
			    <div class="more">
			        <select class="select">
						<option value="">진행중인 다른 이벤트 선택 </option>
						<c:if test="${not empty ingEventList }">
							 <c:forEach var="ingEventRow" items="${ingEventList }">
								 <option value="<c:out value="${ingEventRow.EVT_MST_IDX }"/>" ><c:out value="${ingEventRow.EVT_MST_TITLE }"/></option>
							 </c:forEach>
						 </c:if>
					</select>
			    </div>
			</div>
	
			<h4 class="title title-event">
				<span>
					[<c:out value="${row.EVT_MST_GUBUN eq 'Y' ? '단독' : '본사' }"/> 이벤트] 
					<ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/>
				</span>
			</h4>
			
			<div class="event-view-body"><!-- event-view-body -->
                <div class="holder">
                    <img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>">
                </div>
            </div><!-- // event-view-body -->

            <p class="info">
                <span class="primary">상업적 게시글, 미풍양속에 위반되는 게시글, 이벤트 성격에 맞지 않는 게시글은 미통보 삭제될 수 있으니 양해바랍니다.</span>
            </p>

            <div class="bbs-status"><!-- bbs-status -->
                <div class="page">
                    <strong class="xlarge primary">게시글 : <fmt:formatNumber value="${totalCount }" groupingUsed="true"/>개</strong>
                </div>
            </div><!-- // bbs-status -->
            
            <form name="boardFrm" id="boardFrm" enctype="multipart/form-data">
            <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${row.EVT_MST_IDX }"/>"/>
			<input type="hidden" name="BRAND_CD" value="<c:out value="${commandMap.BRAND_CD }"/>"/>
			<input type="hidden" name="EVT_BOARD_IDX" value="<c:out value="${boardRow.EVT_BOARD_IDX }"/>"/>
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			<double-submit:preventer/>
	            <table class="bbs-form fixed" cellspacing="0"><!-- bbs-form -->
	            <caption></caption>
	            <colgroup>
	                <col style="width: 135px;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <tbody>
	                <tr>
	                    <th><span>제목<span class="icon require"><em>필수입력</em></span></span></th>
	                    <td>
	                        <input type="text" class="text xlarge" id="EVT_BOARD_TITLE" name="EVT_BOARD_TITLE" maxlength="50" value="<c:out value="${boardRow.EVT_BOARD_TITLE }"/>" />
	                    </td>
	                </tr>
	                <tr>
	                    <th><span>내용<span class="icon require"><em>필수입력</em></span></span></th>
	                    <td>
	                        <textarea class="textarea" id="EVT_BOARD_CONTENTS" name="EVT_BOARD_CONTENTS" maxlength="500">${boardRow.EVT_BOARD_CONTENTS }</textarea>
	                    </td>
	                </tr>
	                <tr>
	                    <th><span>파일 첨부</span></th>
	                    <td id="fileTd">
	                        <input id="file" name="file" type="file" class="file"/>
	                        <p class="message">
                           		10MB 이하의 파일만 업로드 가능합니다
	                        </p>
	                         
	                        <c:if test="${not empty fileList }">  
	                            <c:forEach items="${fileList}" var="fileRow" varStatus="i">		                            	
	          						<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
	                       				<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
	                    			</a>			 		                                
	                    			<i class="icon-file"></i>    			
	                    			<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" /> 
	         						<label for="CMM_FLE_IDX">삭제</label>
								</c:forEach>
							</c:if>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // bbs-form -->
            </form>

            <div class="section-button text-right"><!-- section button -->
                <div class="pull-left">
                    <a href="javascript:;" id="goBoardList" class="button large"><span>목록</span></a>
                </div>
                <div class="pull-right">
                    <a href="javascript:;" id="goModify" class="button warning large"><span>등록</span></a>
                </div>
            </div><!-- // section button -->
			
			<form id="frm" name="frm">
            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
            	<input type="hidden" name="searchEvtMstStatus" value="<c:out value="${commandMap.searchEvtMstStatus }"/>" />
            	<input type="hidden" name="searchEvtMstGubun" value="<c:out value="${commandMap.searchEvtMstGubun }"/>"/>
            	<input type="hidden" name="EVT_MST_IDX" value=""/>
            	<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
            </form>
            
            <div class="hr hr-a" aria-hidden="true"><!-- hr --></div>
			
			<div class="section-button"><!-- section button -->
			    <a href="javascript:;" id="goList" class="button primary large"><span>이벤트목록</span></a>
			</div><!-- // section button -->
			
			<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>
			
			<!-- 파일 다운로드용 폼 -->
	        <form name="fileForm" id="fileForm">
	             <input type="hidden" name="CMM_FLE_IDX" value=""/>
	             <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
	             <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
	        </form>
        
		</div><!-- wrap -->
		</div><!-- // container -->

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script src="<c:out value="${cdnDomain}" />/pc/js/jquery.form.js"></script>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
	$(function()
	{
		//console.log(location.pathname);
		//console.log(location.search);
		
		//전체 이벤트 목록
		$(document).on("click","#goList",function()
		{
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventList.do", "target":"_self", "method":"get"}).submit();
		});
		
		//게시판형 이벤트 상세
		$(document).on("click","#goBoardList",function()
		{
			$("#boardFrm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/boardEventView.do", "target":"_self", "method":"get"}).submit();
		});
		
		// 진행중인 이벤트 선택
		$(document).on("change", ".select", function ()
		{
			$("#frm").find("input[name='EVT_MST_IDX']").val($(this).val());
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventView.do","target":"_self","method":"get"}).submit();
		});
		
		//게시판형 이벤트 등록
		$(document).on("click","#goModify",function()
		{
			var $boardFrm = $("#boardFrm");
			if($.trim($("#EVT_BOARD_TITLE").val()) == "")
			{
				alert("[제목]반드시 입력해주세요.");
				$("#EVT_BOARD_TITLE").focus();
				return false;
			}
			
			if($.trim($("#EVT_BOARD_CONTENTS").val()) == "")
			{
				alert("[내용]반드시 입력해주세요.");
				$("#EVT_BOARD_CONTENTS").focus();
				return false;
			}
			
			if (confirm( "수정 하시겠습니까?")) 
            {
            	$.showOverlay(true, {
		            isIndicator: true
		        });
				
            	var options = {
	           	    	type:"POST",
	           	   		dataType:"json",       	        
	           	        success: function(data) {
	           	        	if(data.isSuccessYn == "Y")
	           	        	{
	           	        		alert(data.resultMsg);
	           	        		$("#boardFrm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/boardEventView.do", "target":"_self", "method":"get"}).submit();
	           	        	}
	           	        	else
	           	        	{
	           	        		alert(data.resultMsg);	
	           	        		$("#fileTd").find("#file").remove();
	           	        		$("#fileTd").prepend("<input type=\"file\" name=\"file\" class=\"file\" id=\"file\"/>");  
	           	        		if($("#CMM_FLE_IDX").is(":checked"))
	               	 			{
	           	        			$("#CMM_FLE_IDX").prop("checked",false);
	               	 				$("#file").prop("disabled", true);	
	               	 			}
	           	        		$.showOverlay(false, {
						            isIndicator: true
						        });
	           	        	}
	           	         },  
	    		       	 error:function(err)
	    		         {
	    		             alert("오류가 발생하였습니다.\n[" + err.status + "]");
	    		             $.showOverlay(false, {
					            isIndicator: true
					         });
	    		         }
	           	     };
	           	
				$boardFrm.attr("action", "<c:out value="${frontDomain}"/>/pc/customer/boardEventUpdate.do");
	           	$boardFrm.ajaxSubmit(options);
            }
		});
		
		// 첨부파일 있는경우 파일첨부 비활성화 초기화
	    if($("#CMM_FLE_IDX").val() != undefined)
	    {
	    	$("input[name='file']").prop("disabled", true);
	    }
	    
	    // 첨부파일 삭제 체크박스 클릭한 경우 파일 첨부 활성화    
	    $("#CMM_FLE_IDX").on("click", function () 
	    {
	    	if($(this).is(":checked"))
	        {
	           	$("input[name='file']").prop("disabled", false);
	        }
	    	else
	    	{
	    		$("input[name='file']").prop("disabled", true);
	    		$("input[name='file']").val("");
	    	}
	    });
	    
		// 파일 다운로드
	    $(document).on("click", ".file-list-title", function () 
	    {
	        var $fileForm = $("#fileForm");
	        var $this = $(this);
	        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
	        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
	        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
	        $fileForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
	    });
	});

//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>