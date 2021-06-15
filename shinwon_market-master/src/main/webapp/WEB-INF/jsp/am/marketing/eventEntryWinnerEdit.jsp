<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
	<a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

	<aside id="navigation"><!-- navigation -->
		<nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
		</nav>
	</aside><!-- // navigation -->

	<div id="body"><!-- body -->

		<section id="contents"><!-- contents -->

			<div id="breadcrumb"><!-- breadcrumb -->
				<a href="#none"><i class="icon-home em"></i> HOME</a>
				&gt;
				<a href="#none">프로모션관리</a>
				&gt;
				<span>이벤트관리</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">이벤트관리</h3>
				<div class="tab-a justified" style="margin-top: 20px;"><!-- tab -->
                    <ul class="tab">
                        <li><a href="#none" id="goBiasicEdit">기본정보</a></li>
                        <li><a href="#none" id="goEventEntryList">응모자확인&당첨자 선정</a></li>
                        <li class="active"><a href="#none" id="goEventEntryWinnerList">당첨자 발표</a></li>
                    </ul>
                </div><!-- // tab -->
				<h4 class="title">수정</h4>
				
				<p>
					<strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
				</p>
				
				<form name="tabForm" id="tabForm">
	                <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
	                <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPageBasic }"/>"/>
	                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
	                <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
	                <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
	                <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
	                <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
	                <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
	                <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
	                <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                </form>
				<form id="frm" name="frm" enctype="multipart/form-data"> 
				<input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
				<input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>" />
				<div class="section-form"><!-- section-form-a -->
					<div class="form-group">
						<label class="label"><span>이벤트명</span></label>
						<div class="field"><c:out value="${row.EVT_MST_TITLE }"/></div>
						<input type="hidden" name="EVT_WIN_IDX" value="<c:out value="${commandMap.EVT_WIN_IDX }"/>" />
					</div>
					<div class="form-group">
		            	<label class="label"><span>이벤트 상세 URL<em class="strong">*</em></span></label>
		                <div class="field">
		                   	<c:if test="${(row.EVT_MST_PC_YN eq 'Y') && (row.EVT_MST_MB_YN eq 'N')}">
		                       	PC : <c:out value="${frontDomain }"/>/pc/customer/eventView.do?EVT_MST_IDX=${row.EVT_MST_IDX}&EVT_MST_TYPE=${row.EVT_MST_TYPE }
		                   	</c:if>
		                    <c:if test="${(row.EVT_MST_PC_YN eq 'N') && (row.EVT_MST_MB_YN eq 'Y')}">
		                       	MOBILE : <c:out value="${mobileDomain }"/>/mobile/customer/eventView.do?EVT_MST_IDX=${row.EVT_MST_IDX}&EVT_MST_TYPE=${row.EVT_MST_TYPE }
		                    </c:if>  
		                    <c:if test="${(row.EVT_MST_PC_YN eq 'Y') && (row.EVT_MST_MB_YN eq 'Y')}">
		                      	PC : <c:out value="${frontDomain }"/>/pc/customer/eventView.do?EVT_MST_IDX=${row.EVT_MST_IDX}&EVT_MST_TYPE=${row.EVT_MST_TYPE }<br/>
		                       	MOBILE : <c:out value="${mobileDomain }"/>/mobile/customer/eventView.do?EVT_MST_IDX=${row.EVT_MST_IDX}&EVT_MST_TYPE=${row.EVT_MST_TYPE }
		                    </c:if>	
		                </div>
		            </div>
					<div class="form-group">
		            <label class="label"><span>작성자</span></label>
		            	<div class="field">
		                	<c:out value="${row.EVT_MST_REG_ID }"/>(<c:out value="${row.EVT_MST_REG_NM }"/>) <ui:formatDate value="${row.EVT_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
		                </div>
		            </div>											
					<div class="form-group">
						<label class="label"><span>제목 <em class="strong">*</em></span></label>
						<div class="field">
							<c:out value="${rowWin.EVT_WIN_NM }"/>
						</div>
					</div>
					<div class="form-group">
						<label class="label"><span>메인카피 <em class="strong">*</em></span></label>
						<div class="field">
							<textarea class="textarea" name="EVT_WIN_MAN_CPY" id="EVT_WIN_MAN_CPY" style="height: 100px;"><c:out value="${rowWin.EVT_WIN_MAN_CPY }"/></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="label"><span>서브카피 </span></label>
						<div class="field">
							<textarea class="textarea" name="EVT_WIN_SUB_CPY" id="EVT_WIN_SUB_CPY" style="height: 100px;"><c:out value="${rowWin.EVT_WIN_SUB_CPY }"/></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="label"><span>주의사항 <em class="strong">*</em></span></label>
						<div class="field">
							<textarea class="textarea" name="EVT_WIN_ATN" id="EVT_WIN_ATN" style="height: 100px;"><c:out value="${rowWin.EVT_WIN_ATN }"/></textarea>
						</div>
					</div>
					<div class="form-group">
				        <label class="label"><span>당첨자 명단  <em class="strong">*</em></span></label>
				        <div class="field">
					        <div id="multiFile1-list">							
								<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
									<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
										<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
										<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
										<i class="icon-file"></i>
						                <a href="/nas/upload<c:out value="${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
						                	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
						                </a>
										<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
	                        			<label for="CMM_FLE_IDX">삭제</label> 
									</c:if>
								</c:forEach>	
							</div>
				        
				            <input type="file" name="file" id="file" class="file"/>
				        </div>
				    </div>
					<div class="form-group">
						<label class="label"><span>상태 <em class="strong">*</em></span></label>
						<div class="field">
							<input type="radio" id="EVT_WIN_USE_YN1" class="radio" name="EVT_WIN_USE_YN" value="Y" <ui:select v="${rowWin.EVT_WIN_USE_YN }" t="Y" g="checked"/> />
							<label for="EVT_WIN_USE_YN1">사용</label>
							<input type="radio" id="EVT_WIN_USE_YN2" class="radio" name="EVT_WIN_USE_YN" value="N" <ui:select v="${rowWin.EVT_WIN_USE_YN }" t="N" g="checked"/> />
							<label for="EVT_WIN_USE_YN2">미사용</label>
						</div>
					</div> 		
				</div>
				
				</form>
				
				<div class="section-button"><!-- section button -->
					<a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
					<a href="#none" id="goList" class="button button-a"><span>목록</span></a>
				</div><!-- // section button -->
				<div class="section-form"><!-- section-form-a -->
					<div class="form-group">
						<label class="label"><span>LMS발송</span></label>
						
						<div class="field">
							<div class="right" style="margin-bottom:5px;" ><a href="#none" id="goRegistLms" class="small button button-b"><span>당첨자에게 LMS발송하기</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<textarea class="textarea" name="LMS" id="LMS" style="height: 50px;"></textarea>
						</div>
						
					</div>
				</div>
				
			</div><!-- // contents-inner -->

		</section><!-- // contents -->

	</div><!-- // body -->

	<footer><!-- footer -->
		<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	</footer><!-- // footer -->

</div><!-- // container -->

<script type="text/javascript">
$(document).ready(function () 
{
	 $(document).on("click", "#goList", function () {
	        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerList.do", "target":"_self", "method":"post"}).submit();
	    });
	    
	    // 기본정보 탭 클릭 이벤트
	    $(document).on("click", "#goBiasicEdit", function () {
	        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEdit.do", "target":"_self", "method":"post"}).submit();
	    });
	    
	    // 응모자 탭 클릭 이벤트
	    $(document).on("click", "#goEventEntryList", function () {
	        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target" : "_self", "method" : "post"}).submit();
	    });
	    
	 // 당첨자 탭 클릭 이벤트
	    $(document).on("click", "#goEventEntryWinnerList", function () {
	        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerList.do", "target" : "_self", "method" : "get"}).submit();
	    });
	   
		
    // 폼체크
    $("#frm").validate({
        rules: {
        	EVT_WIN_NM : { required:true },
        	EVT_WIN_MAN_CPY : { required:true },
        	EVT_WIN_ATN : { required:true }
        }
    });

    // 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        var $frm = $("#frm"); 
        if($frm.valid()){
    		
        	if($("#CMM_FLE_IDX_1").is(":checked"))
        	{
	        	var file = $("input[name='file']").val();
	        	if(file == ""){
	        		alert("당첨자명단을 등록해 주십시오.");
	        		return;
	        	}
        	}
        	if (confirm( "저장 하시겠습니까?")) {              	 
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
        
    // 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
        var $frm = $("#searchForm"); 
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerList.do", "target":"_self", "method":"post"}).submit();
    });
    
    $(".cmmFleIdx").each(function(){
        var fileName = $(this).data("file_name");
        $("input[name='"+ fileName +"']").prop("disabled", true);
	});
    
    $(document).on("change", ".cmmFleIdx", function () {
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
    
    // 저장 이벤트
    $(document).on("click", "#goRegistLms", function () 
    {
        var $frm = $("#frm"); 
        
        if($("#LMS").val == ""){
        	alert("LMS 내용을 입력하세요");
        	$("#LMS").focus();
        	return;
        }else{        	
        	if (confirm( "LMS 발송을 하시겠습니까?")) {              	 
        		$.ajax({
    				type: "post",
    				url: "<c:out value="${serverDomain}"/>/am/marketing/eventWinnerLmsAjax.do",
    				data: {"EVT_MST_IDX": "<c:out value="${commandMap.EVT_MST_IDX}" />", "LMS": $('#LMS').val() },			
    				async: false,
    				success: function(data)
    				{
    					if(data.result == "success" )
    					{
    						alert("처리 되었습니다.");
    						$("#LMS").val('');
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
    
});
</script>
</body>
</html>  