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
				<h4 class="title">등록</h4>
				
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
				<input type="hidden" name="POP_MST_CHN_GBN" value="P" />
                
				<div class="section-form"><!-- section-form-a -->
					<div class="form-group">
						<label class="label"><span>이벤트명</span></label>
						<div class="field"><c:out value="${row.EVT_MST_TITLE }"/></div>
						<input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
						<input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>" />
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
							<input type="text" class="text EVT_WIN_NM" id="EVT_WIN_NM" name="EVT_WIN_NM" style="width:50%;"/> (<span id="byte_1">0</span><span>/40 byte)</span>
						</div>
					</div>
					<div class="form-group">
						<label class="label"><span>메인카피 <em class="strong">*</em></span></label>
						<div class="field">
							<textarea class="textarea" name="EVT_WIN_MAN_CPY" id="EVT_WIN_MAN_CPY" style="height: 100px;"></textarea>(<span id="byte_2">0</span><span>/2000 byte)</span>
						</div>
					</div>
					<div class="form-group">
						<label class="label"><span>서브카피 </span></label>
						<div class="field">
							<textarea class="textarea" name="EVT_WIN_SUB_CPY" id="EVT_WIN_SUB_CPY" style="height: 100px;"></textarea>(<span id="byte_3">0</span><span>/2000 byte)</span>
						</div>
					</div>
					<div class="form-group">
						<label class="label"><span>주의사항 <em class="strong">*</em></span></label>
						<div class="field">
							<textarea class="textarea" name="EVT_WIN_ATN" id="EVT_WIN_ATN" style="height: 100px;"></textarea>(<span id="byte_4">0</span><span>/2000 byte)</span>
						</div>
					</div>
					<div class="form-group">
				        <label class="label"><span>당첨자 명단  <em class="strong">*</em></span></label>
				        <div class="field">
				            <input type="file" name="file" id="file" class="file" style="width:70%;"/>
				            &nbsp;&nbsp;<i class="icon-file"></i>&nbsp;<a href="javascript:;" class="sampleDownload" data-file_name="eventWinnerSample.xls">샘플파일 다운로드</a>
				        </div>
				        
				    </div>
					<div class="form-group">
						<label class="label"><span>상태 <em class="strong">*</em></span></label>
						<div class="field">
							<input type="radio" id="EVT_WIN_USE_YN1" class="radio" name="EVT_WIN_USE_YN" value="Y" checked="checked" />
							<label for="EVT_WIN_USE_YN1">사용</label>
							<input type="radio" id="EVT_WIN_USE_YN2" class="radio" name="EVT_WIN_USE_YN" value="N" />
							<label for="EVT_WIN_USE_YN2">미사용</label>
						</div>
					</div> 		
				</div>
				
				</form>
				
				<div class="section-button"><!-- section button -->
					<a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
					<a href="#none" id="goList" class="button button-a"><span>목록</span></a>
				</div><!-- // section button -->

				
			</div><!-- // contents-inner -->

		</section><!-- // contents -->
	<form name="fileForm" id="fileForm">
         <input type="hidden" name="fileName" value="" />
    </form>
	</div><!-- // body -->

	<footer><!-- footer -->
		<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	</footer><!-- // footer -->

</div><!-- // container -->

<script type="text/javascript">
$(document).ready(function () 
{
	$(document).on("keyup","#EVT_WIN_NM",function(){
		getStrByte(this,'#byte_1', 40, 2);
	});
	$(document).on("keyup","#EVT_WIN_MAN_CPY",function(){
		getStrByte(this,'#byte_2', 2000, 2);
	});
	$(document).on("keyup","#EVT_WIN_SUB_CPY",function(){
		getStrByte(this,'#byte_3', 2000, 2);
	});
	$(document).on("keyup","#EVT_WIN_ATN",function(){
		getStrByte(this,'#byte_4', 2000, 2);
	});
	
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
    
        	var file = $("input[name='file']").val();
        	if(file == ""){
        		alert("당첨자명단을 등록해 주십시오.");
        		return;
        	}
        	if (confirm( "저장 하시겠습니까?")) {              	 
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
        
    // 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
        var $frm = $("#searchForm"); 
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerList.do", "target":"_self", "method":"post"}).submit();
    });
 // 파일 다운로드
    $(document).on("click", ".sampleDownload", function () {
    	var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='fileName']").val($this.data("file_name"));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/sampleFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
});
</script>
</body>
</html>  