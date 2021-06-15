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
		<form id="frmMainLayout" name="frmMainLayout" method="post">
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
					<a href="#none">시스템 관리</a>
					&gt;
					<span>미니샵 관리</span>
				</div><!-- // breadcrumb -->
	
				<div class="contents-inner"><!-- contents-inner -->
	
					<h3 class="title">미니샵 관리</h3>
	
					<div class="title-box">
						<h4 class="title">수정</h4>
						<%-- <div class="right">
							<a href="<c:out value="${serverDomain }"/>/fr/specialtyshop/planView.do?PLN_MST_IDX=<c:out value="${row.PLN_MST_IDX }"/>&previewYn=Y" class="button button-a small" target="_blank"><span>미리보기</span></a>
						</div> --%>
					</div>
	
					<p>
						<strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
					</p>
					<form name="searchForm" id="searchForm">
						<input type="hidden" name="MNI_SHP_IDX"  id="MNI_SHP_IDX"  value="<c:out value="${row.MNI_SHP_IDX }"/>"/>
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchMniShpUseYn" value="<c:out value="${commandMap.searchMniShpUseYn }"/>"/>
	                    <input type="hidden" name="searchRegType" value="<c:out value="${commandMap.searchRegType }"/>"/>
	                    <input type="hidden" name="searchRegTypeKeyword" value="<c:out value="${commandMap.searchRegTypeKeyword }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
					</form>
					<form name="frm" id="frm" enctype="multipart/form-data">
						<input type="hidden" name="MNI_SHP_IDX"  id="MNI_SHP_IDX"  value="<c:out value="${row.MNI_SHP_IDX }"/>"/>
						<input type="hidden" name="GUBUN_CD"  id="GUBUN_CD"  value="<c:out value="${row.GUBUN_CD }"/>"/>
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchMniShpUseYn" value="<c:out value="${commandMap.searchMniShpUseYn }"/>"/>
	                    <input type="hidden" name="searchRegType" value="<c:out value="${commandMap.searchRegType }"/>"/>
	                    <input type="hidden" name="searchRegTypeKeyword" value="<c:out value="${commandMap.searchRegTypeKeyword }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
						
						<div class="section-form"><!-- section-form-a -->
		                    
		                    <div class="form-group">
		                        <label class="label"><span>매장명 <em class="strong">*</em></span></label>
		                        <div class="field">
		                        	<c:out value="${row.BCNC_NM }"/>   
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>수수료율 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <c:out value="${row.MNI_SHP_RATE }"/>%
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>사용여부 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="radio" name="MNI_SHP_USE_YN" id="stateA" class="radio" value="Y" <c:if test="${row.MNI_SHP_USE_YN eq 'Y' }">checked="checked"</c:if> />
									<label for="stateA">사용</label>
									<input type="radio" name="MNI_SHP_USE_YN" id="stateB" class="radio" value="N" <c:if test="${row.MNI_SHP_USE_YN eq 'N' }">checked="checked"</c:if>/>
									<label for="stateB">미사용</label>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group pcImgDiv" >
		                        <label class="label"><span>PC 매장 이미지<em class="strong">*</em></span></label>
                                <div class="field">
                                	<div id="multiFile1-list">							
										<c:forEach items="${fileList}" var="fileRow" varStatus="i">											
											<c:if test="${fileRow.CMM_FLE_TB_TYPE eq 'P' }">
												<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
												<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
												<i class="icon-file"></i>
												<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
													<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
												</a>
												<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file1" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
												<label for="CMM_FLE_IDX_1">삭제</label>
											</c:if>
										</c:forEach>	
									</div>
									<input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
									<small class="desc">※ 이미지는 1000 X 260 사이즈의 JPG,GIF,PNG 파일만 등록이 가능합니다.</small>
									<p class="img-text">
										<span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
										<input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
									</p>
                                </div>
		                    </div>
		                    
		                    <div class="form-group mobileImgDiv">
		                        <label class="label"><span>MOBILE 매장 이미지<em class="strong">*</em></span></label>
                                <div class="field">
									<div id="multiFile3-list">							
										<c:forEach items="${fileList}" var="fileRow" varStatus="i">		
											<c:if test="${fileRow.CMM_FLE_TB_TYPE eq 'M' }">									
												<c:set var="altTextM1" value="${fileRow.CMN_FLE_ALT_TXT}"/>
												<c:set var="altTextM1Idx" value="${fileRow.CMM_FLE_IDX}"/>
												
												<i class="icon-file"></i>
												<a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
													<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
												</a>
												<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_3" name="CMM_FLE_IDX" data-file_name="file3" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
												<label for="CMM_FLE_IDX_3">삭제</label>
											</c:if>
										</c:forEach>	
									</div>
									<input type="file" name="file3" id="multiFile3" class="file mobileImgFile" data-attach_cnt="1" data-accept="img" />
									<small class="desc">※ 이미지는 640 X 260 사이즈의 JPG,GIF,PNG 파일만 등록이 가능합니다.</small>
									<p class="img-text">
										<span>대체텍스트</span> <input type="text" value="${altTextM1}" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text mobileImgFile" placeholder="20자 이내로 입력하세요."/>
										<input type="hidden" class="mobileImgFile" name="CMN_FLE_ALT_TXT_M1_IDX" value="${altTextM1Idx}"/>
									</p>
                                </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>매장URL</span></label>
		                        <div class="field">
		                            <p class="img-text">
                                        PC : <c:out value="${frontDomain }"/>/pc/product/miniShopProductList.do?MNI_SHP_IDX=${row.MNI_SHP_IDX}<br/>
								   		MOBILE : <c:out value="${mobileDomain }"/>/mobile/product/miniShopProductList.do?MNI_SHP_IDX=${row.MNI_SHP_IDX}
                                    </p>
		                        </div>
		                    </div>
							
						</div>
						
					</form>
	
					<div class="section-button"><!-- section button -->
						<a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
						<a href="#none" id="goList" class="button button-a"><span>목록</span></a>
					</div><!-- // section button -->
					
				</div><!-- // contents-inner -->
				
			</section>
			<!-- // contents -->
			
			<!-- 파일 다운로드용 폼 -->
			<form name="fileForm" id="fileForm">
				 <input type="hidden" name="CMM_FLE_IDX" value=""/>
				 <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
				 <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
			</form>

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

<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.extend.js"></script>

<script type="text/javascript">

	$(document).ready(function() 
	{
		
		//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
		$(".cmmFleIdx").each(function()
		{
			var fileName = $(this).data("file_name");
			$("input[name='"+ fileName +"']").prop("disabled", true);
		});
	
		// 목록 버튼 클릭 이벤트 
		$(document).on("click", "#goList", function() 
		{
			$("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/site/storeManagerList.do", "target" : "_self", "method" : "post"}).submit();
		});
	
		// 등록 이벤트
		$(document).on("click", "#goRegist", function() 
		{
			//PC 새로 첨부한 이미지
			var file1 = $("input[name='file1']").val();
			//PC 기존 첨부된 이미지
			var oldFile1 = $("#CMM_FLE_IDX_1").length;
	
			//PC 새로운 첨부파일도 없고 기존 파일도 없는 경우 || 새로운 첨부파일 없는데 기존 파일 삭제한 경우
			if((file1 == "" && oldFile1 == 0) || (file1 == "" && oldFile1 > 0 && $("#CMM_FLE_IDX_1").is(":checked") == true))
			{
				alert("PC 매장 이미지를 등록해 주십시오.");
				return;			
			}
			else if($.trim($("#CMN_FLE_ALT_TXT_P1").val()) == "")	//대체텍스트 체크
			{
				alert("PC 매장 이미지 대체 텍스트를 입력해 주십시오.");
				$("#CMN_FLE_ALT_TXT_P1").focus();
				return;
			}
				
			//MOBILE 새로 첨부된 이미지
			var file3 = $("input[name='file3']").val();
			//MOBILE 기존 첨부된 이미지
			var oldFile3 = $("#CMM_FLE_IDX_3").length;
	
			//MOBILE 새로운 첨부파일도 없고 기존 파일도 없는 경우 || 새로운 첨부파일 없는데 기존 파일 삭제한 경우
			if((file3 == "" && oldFile3 == 0) || (file3 == "" && oldFile3 > 0 && $("#CMM_FLE_IDX_3").is(":checked") == true))
			{
				alert("MOBILE 매장 이미지를 등록해 주십시오.");
				return;			
			}
			else if($.trim($("#CMN_FLE_ALT_TXT_M1").val()) == "")	//대체텍스트 체크
			{
				alert("MOBILE 매장 이미지 대체 텍스트를 입력해 주십시오.");
				$("#CMN_FLE_ALT_TXT_M1").focus();
				return;
			}
			
			if (confirm("저장 하시겠습니까?")) 
			{
			  	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/site/storeManagerModify.do", "target" : "_self", "method" : "post"}).submit();
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
			$fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
		});
		 
	 	// 파일 삭제 check box 변경 이벤트
		$(document).on("change", ".cmmFleIdx", function () 
		{
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