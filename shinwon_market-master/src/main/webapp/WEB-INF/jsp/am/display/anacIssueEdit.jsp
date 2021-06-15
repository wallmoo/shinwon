<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>
</head>
<body class="basic">

	<div id="skipNavigation">
		<!-- skipNavigation -->
		<a href="#contents" class="sr-only">본문으로 바로가기</a>
	</div>
	<!-- // skipNavigation -->

	<header>
		<!-- header -->
		<%@ include file="/WEB-INF/jsp/am/include/top.jsp"%>
	</header>
	<!-- // header -->

	<div id="container" class="st-container">
		<!-- container -->
		<form id="frmTopLayout" name="frmTopLayout" method="post">
			<input type="hidden" id="selectMenuCode" name="selectMenuCode"
				value="<c:out value="${selectMenuCode }" />" />
		</form>

		<aside id="navigation">
			<!-- navigation -->
			<nav>
				<%@ include file="/WEB-INF/jsp/am/include/left.jsp"%>
			</nav>
		</aside>
		<!-- // navigation -->

		<div id="body">
			<!-- body -->

			<section id="contents"><!-- contents -->

				<div id="breadcrumb"><!-- breadcrumb -->
	                <a href="#none"><i class="icon-home em"></i> HOME</a>
	                &gt;
	                <a href="#none">전시관리</a>
	                &gt;
	                <span>브랜드전시-아낙</span>
	            </div><!-- // breadcrumb -->
	
	            <div class="contents-inner"><!-- contents-inner -->
	
	                <h3 class="title">브랜드전시-아낙</h3>
	
	                <div class="title-box">
	                    <h4 class="title">
	                    	상세/수정-ISSUE
	                    </h4>
	                </div>
	
	                <p>
	                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
	                </p>
	                <form name="searchForm" id="searchForm">
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaIsuDplYn" value="<c:out value="${commandMap.searchAnaIsuDplYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                </form>
	                <form name="frm" id="frm" enctype="multipart/form-data">
	                	<input type="hidden" name="ANA_ISU_IDX"  value="<c:out value="${row.ANA_ISU_IDX }"/>" />
	                	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaIsuDplYn" value="<c:out value="${commandMap.searchAnaIsuDplYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                    <double-submit:preventer/>
		                <div class="section-form"><!-- section-form-a -->
	 	                    
	 	                    <div class="form-group">
		                        <label class="label"><span>상태 </span></label>
		                        <div class="field">
		                            <input type="radio" name="ANA_ISU_DPL_YN" id="stateA" class="radio" value="Y" <c:if test="${row.ANA_ISU_DPL_YN eq 'Y'}"> checked="checked" </c:if> />
		                            <label for="stateA">전시</label>
		                            <input type="radio" name="ANA_ISU_DPL_YN" id="stateB" class="radio" value="N" <c:if test="${row.ANA_ISU_DPL_YN eq 'N'}"> checked="checked" </c:if>/>
		                            <label for="stateB">미전시</label>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>NEW사용여부 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="radio" name="ANA_ISU_NEW_YN" id="stateA" class="radio" value="Y" <c:if test="${row.ANA_ISU_NEW_YN eq 'Y'}"> checked="checked" </c:if>/>
		                            <label for="stateA">YES</label>
		                            <input type="radio" name="ANA_ISU_NEW_YN" id="stateB" class="radio" value="N" <c:if test="${row.ANA_ISU_NEW_YN eq 'N'}"> checked="checked" </c:if> />
		                            <label for="stateB">NO</label>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>신청하기</span></label>
		                        <div class="field">
		                            <input type="radio" name="ANA_ISU_APL_YN" id="stateA" class="radio" value="Y" <c:if test="${row.ANA_ISU_APL_YN eq 'Y'}"> checked="checked" </c:if>/>
		                            <label for="stateA">전시</label>
		                            <input type="radio" name="ANA_ISU_APL_YN" id="stateB" class="radio" value="N" <c:if test="${row.ANA_ISU_APL_YN eq 'N'}"> checked="checked" </c:if>/>
		                            <label for="stateB">미전시</label>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이슈명1 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_ISU_NM1" id="ANA_ISU_NM1" class="text long" value="<c:out value="${row.ANA_ISU_NM1 }"/>"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>이슈명2 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_ISU_NM2" id="ANA_ISU_NM2" class="text long" value="<c:out value="${row.ANA_ISU_NM2 }"/>"/>
		                        </div>
		                    </div>
		                     <div class="form-group">
		                        <label class="label"><span>일정 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" class="text datepicker s-datepicker" name="ANA_ISU_ST_DT" id="ANA_ISU_ST_DT" value="<ui:formatDate value="${row.ANA_ISU_ST_DT }" pattern="yyyy.MM.dd"/>"/>~
		                            <input type="text" class="text datepicker s-datepicker" name="ANA_ISU_ED_DT" id="ANA_ISU_ED_DT" value="<ui:formatDate value="${row.ANA_ISU_ED_DT }" pattern="yyyy.MM.dd"/>" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>썸네일</span></label>
		                        <div class="field">
		                        	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_1">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>상세이미지</span></label>
		                        <div class="field">
		                       	 	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
										<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '2'}">
											<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
											<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
											<i class="icon-file"></i>
											<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
											<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_2" name="CMM_FLE_IDX2" data-file_name="file2" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
											<label for="CMM_FLE_IDX_2">삭제</label>
										</c:if>
									 </c:forEach>
		                        	 <input type="file" name="file2" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>내용1 <em class="strong">*</em></span></label>
		                        <div class="field">
		                        	 <textarea class="textarea ANA_ISU_CTS1" name="ANA_ISU_CTS1" id="ANA_ISU_CTS1" style="height: 60px;"><c:out value="${row.ANA_ISU_CTS1 }"/></textarea>
		                        	 <span id="msgbyte1">0</span><span id="trMsgMaxByte">/280</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>내용2-1</span></label>
		                        <div class="field">
		                        	 <input type="text" name="ANA_ISU_CTS2_1" id="ANA_ISU_CTS2_1" class="text long ANA_ISU_CTS2_1" value="<c:out value="${row.ANA_ISU_CTS2_1 }"/>"/>
		                        	 <span id="msgbyte2">0</span><span id="trMsgMaxByte">/50</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>내용2-2</span></label>
		                        <div class="field">
		                        	 <input type="text" name="ANA_ISU_CTS2_2" id="ANA_ISU_CTS2_2" class="text long ANA_ISU_CTS2_2" value="<c:out value="${row.ANA_ISU_CTS2_2 }"/>"/>
		                        	 <span id="msgbyte3">0</span><span id="trMsgMaxByte">/50</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>내용3-1</span></label>
		                        <div class="field">
		                        	 <input type="text" name="ANA_ISU_CTS3_1" id="ANA_ISU_CTS3_1" class="text long ANA_ISU_CTS3_1" value="<c:out value="${row.ANA_ISU_CTS3_1 }"/>"/>
		                        	 <span id="msgbyte4">0</span><span id="trMsgMaxByte">/50</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>내용3-2</span></label>
		                        <div class="field">
		                        	 <input type="text" name="ANA_ISU_CTS3_2" id="ANA_ISU_CTS3_2" class="text long ANA_ISU_CTS3_2" value="<c:out value="${row.ANA_ISU_CTS3_2 }"/>"/>
		                        	 <span id="msgbyte5">0</span><span id="trMsgMaxByte">/50</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>EVENT LINK</span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_ISU_EVT_LNK" id="ANA_ISU_EVT_LNK" class="text long" value="<c:out value="${row.ANA_ISU_EVT_LNK }"/>"/>
		                        </div>
		                    </div>
		                    <div class="form-group">                    
		                        <div class="col">
									<label class="label"><span>등록일</span></label>
									<div class="field">
										<c:out value="${row.ANA_ISU_REG_NM }"/>(<c:out value="${row.ANA_ISU_REG_ID }"/>), <ui:formatDate value="${row.ANA_ISU_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
									</div>
		                        </div>
							</div>
	 	                    
		                </div><!-- // section-form-a -->

	                </form>
	
	                <div class="section-button"><!-- section button -->
	                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
	                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
	                </div><!-- // section button -->
	
	            </div><!-- // contents-inner -->

			</section>
			<!-- // contents -->

		</div>
		<!-- // body -->
		<footer>
			<!-- footer -->
			<%@ include file="/WEB-INF/jsp/am/include/footer.jsp"%>
		</footer>
		<!-- // footer -->
	</div>
	<!-- // container -->
	
 
 
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<%-- <script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.extend.js"></script> --%>

 
<script type="text/javascript">
$(document).ready(function() {
	
	
	$(document).on("keyup",".ANA_ISU_CTS1",function(){
		getStrByte(this,'#msgbyte1', 280, 2);
	});
	$(document).on("keyup",".ANA_ISU_CTS2_1",function(){
		getStrByte(this,'#msgbyte2', 50, 2);
	});
	$(document).on("keyup",".ANA_ISU_CTS2_2",function(){
		getStrByte(this,'#msgbyte3', 50, 2);
	});
	$(document).on("keyup",".ANA_ISU_CTS3_1",function(){
		getStrByte(this,'#msgbyte4', 50, 2);
	});
	$(document).on("keyup",".ANA_ISU_CTS3_2",function(){
		getStrByte(this,'#msgbyte5', 50, 2);
	});
    
	$("#ANA_ISU_CTS1").trigger("keyup");
	$("#ANA_ISU_CTS2_1").trigger("keyup");
	$("#ANA_ISU_CTS2_2").trigger("keyup");
	$("#ANA_ISU_CTS3_1").trigger("keyup");
	$("#ANA_ISU_CTS3_2").trigger("keyup");
	
	
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacIssueList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
     
        if (confirm("저장 하시겠습니까?")) 
        {	 
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacIssueModify.do", "target" : "_self", "method" : "post"}).submit();	
        }    
         
    });
    
    $(".cmmFleIdx").each(function(){
		var fileName = $(this).data("file_name");
		$("input[name='"+ fileName +"']").prop("disabled", true);
	});
    
 	// 파일 삭제 check box 변경 이벤트
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
    	
	 
    
});
</script>
</body>
</html>