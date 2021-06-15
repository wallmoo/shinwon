<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
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
                <a href="#none">마케팅관리</a>
                &gt;
                <span>이벤트관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">이벤트관리</h3>

                <div class="tab-a justified" style="margin-top: 20px;"><!-- tab -->
                    <ul class="tab">
                        <li><a href="#none" id="goBiasicEdit">기본정보</a></li>
                        <li class="active"><a href="#none">응모자</a></li>
                        <li><a href="#none" id="goEventEntryWinnerList">당첨자</a></li>
                    </ul>
                </div><!-- // tab -->

                <div class="title-box">
                    <h4 class="title">응모자 상세정보</h4>                    
                </div>
                <div class="section-form"><!-- section-form-a -->
		        	<form id="searchForm">
		        		<input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
		        		<input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
		        		<input type="hidden" name="EVT_MST_BRAND_CD" value="<c:out value="${commandMap.EVT_MST_BRAND_CD }"/>"/>
		        		<input type="hidden" name="cPageEntry" value="<c:out value="${commandMap.cPageEntry }"/>"/>
	                    <input type="hidden" name="cPageBasic" value="<c:out value="${commandMap.cPageBasic }"/>"/>
	                    <input type="hidden" name="pageSizeBasic" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
	                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
	                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
	                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
	                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
	                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
	                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
	                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
		        	</form>
		        	<form id="frm" name="frm">
	                    <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
	                    <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
	                    <input type="hidden" name="EVT_MST_BRAND_CD" value="<c:out value="${commandMap.EVT_MST_BRAND_CD }"/>"/>
	                    <input type="hidden" name="EVT_BOARD_IDX" value="<c:out value="${row.EVT_BOARD_IDX }"/>"/>
	                    <input type="hidden" name="cPageEntry" value="<c:out value="${commandMap.cPageEntry }"/>"/>
	                    <input type="hidden" name="cPageBasic" value="<c:out value="${commandMap.cPageBasic }"/>"/>
	                    <input type="hidden" name="pageSizeBasic" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
	                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
	                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
	                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
	                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
	                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
	                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
	                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
		        		
		        		<div class="form-group">
	                        <label class="label"><span>상태</span></label>
	                        <div class="field">
	                            <input type="radio" name="EVT_BOARD_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${row.EVT_BOARD_USE_YN eq 'Y'}">checked</c:if>/>
	                            <label for="stateA">사용</label>
	                            <input type="radio" name="EVT_BOARD_USE_YN" id="stateB" value="N" class="radio" <c:if test="${row.EVT_BOARD_USE_YN eq 'N'}">checked</c:if>/>
	                            <label for="stateB">미사용</label>
	                        </div>
	                    </div>   
	                    
	                    <div class="form-group">
	                        <label class="label"><span>작성자</span></label>
	                        <div class="field">
	                            <c:out value="${row.EVT_BOARD_REG_ID }"/>(<c:out value="${row.CUST_NM }"/>)
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>조회수</span></label>
	                        <div class="field">
	                            <c:out value="${row.EVT_BOARD_READ_CNT }"/>
	                        </div>
	                    </div>
						
						<div class="form-group">
	                        <label class="label"><span>등록일</span></label>
	                        <div class="field">
	                        	<ui:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${row.EVT_BOARD_REG_DT }"/> 
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>제목 <em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:out value="${row.EVT_BOARD_TITLE }"/>    
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>내용 <em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<ui:replaceLineBreak content="${row.EVT_BOARD_CONTENTS }"/> 
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
                            <label class="label"><span>첨부파일</span></label> 
                            <div class="field">
	                            <c:choose>
	                            	<c:when test="${not empty fileList }">
	                            		<c:forEach items="${fileList }" var="fileRow" varStatus="i">
											<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
				                    			<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
		 		                    		</a>					                            		
	                            		</c:forEach>
	                            	</c:when>
	                            	<c:otherwise>
	                            		-
	                            	</c:otherwise>
	                            </c:choose>	                            	                            		
                            </div>
                        </div>
	            	</form> 
		        </div><!-- // section-form-a -->  
		        
		        <div class="section-button"><!-- section button -->
                    <a href="javascript:;" id="goRegist" class="button button-b"><span>저장</span></a>
                    <a href="javascript:;" id="goList" class="button button-a"><span>목록</span></a>
                </div><!-- // section button -->                  
            
            </div><!-- // contents-inner -->

        </section><!-- // contents -->
		<!-- 파일 다운로드용 폼 -->
        <form name="fileForm" id="fileForm">
             <input type="hidden" name="CMM_FLE_IDX" value=""/>
             <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
             <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
        </form>
    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">

	$(document).ready(function () {	
	    // 기본정보 탭 클릭 이벤트
	    $(document).on("click", "#goBiasicEdit", function () {
	        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEdit.do", "target":"_self", "method":"post"}).submit();
	    });
	    
	    // 당첨자 탭 클릭 이벤트
	    $(document).on("click", "#goEventEntryWinnerList", function () {
	        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerList.do", "target" : "_self", "method" : "post"}).submit();
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
	 	
	 	// 목록 버튼 클릭 이벤트 
	    $(document).on("click", "#goList", function () {
	       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target":"_self", "method":"post"}).submit(); 
	    });
	 	
	 	// 등록 이벤트
	    $(document).on("click", "#goRegist", function () {
	    	if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryBoardModify.do", "target":"_self", "method":"post"}).submit();
            }
	    });
	});
	
</script>
</body>
</html>