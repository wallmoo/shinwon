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
	                    	상세/수정-Top7
	                    </h4>
	                </div>
	
	                <p>
	                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
	                </p>
	                <form name="searchForm" id="searchForm">
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaMstDplYn" value="<c:out value="${commandMap.searchAnaMstDplYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                </form>
	                <form name="frm" id="frm" enctype="multipart/form-data">
	                	<input type="hidden" name="ANA_MST_IDX"  value="<c:out value="${row.ANA_MST_IDX }"/>" />
	                	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaMstDplYn" value="<c:out value="${commandMap.searchAnaMstDplYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                    <input type="hidden" name="selctNum"  id="selctNum" value="0"/>
	                    <double-submit:preventer/>
		                <div class="section-form"><!-- section-form-a -->
	 	                    
		                    <div class="form-group">
		                        <label class="label"><span>상태 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="radio" name="ANA_MST_DPL_YN" id="stateA" class="radio" value="Y" <c:if test="${row.ANA_MST_DPL_YN eq 'Y'}"> checked="checked" </c:if> />
		                            <label for="stateA">전시</label>
		                            <input type="radio" name="ANA_MST_DPL_YN" id="stateB" class="radio" value="N" <c:if test="${row.ANA_MST_DPL_YN eq 'N'}"> checked="checked" </c:if> />
		                            <label for="stateB">미전시</label>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>배너수 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <c:out value="${row.ANA_MST_BNR_CNT }"/>
		                            <input type="hidden" name="ANA_MST_BNR_CNT"  value="<c:out value="${row.ANA_MST_BNR_CNT }"/>" />
		                        </div>
		                    </div>
		                     <div class="form-group">                    
		                        <div class="col">
									<label class="label"><span>등록일</span></label>
									<div class="field">
										<c:out value="${row.ANA_MST_REG_NM }"/>(<c:out value="${row.ANA_MST_REG_ID }"/>), <ui:formatDate value="${row.ANA_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
									</div>
		                        </div>
							</div>
		                    
		                </div><!-- // section-form-a -->
		                 
	                    <div id="anacTopTable" class="table-a">
		        			<table class="core">
								<colgroup>
									<col style="width: 5%;" />
								 	<col style="width: auto;" />
									<col style="width: 15%;" />
									<col style="width: 20%;" />
									<col style="width: 20%;" />
									<col style="width: 7%;" />
									<col style="width: 12%;" />
									<col style="width: 7%;" />
								</colgroup>
								<thead>
									<tr>
										<th>순서</th>
										<th>Layout이름</th>
										<th>사이즈(가로X세로)</th>
										<th>이미지</th>
										<th>이미지(마우스오버)</th>
										<th>오버컬러</th>
										<th>상품코드</th>
										<th>링크</th>
									</tr>
								</thead>
								<tbody class="applyAnacTopList">
									<c:choose>
				                       	<c:when test="${not empty detailList }">
											<c:forEach var="rowDetail" items="${detailList }" varStatus="i">
												<tr>
													<td><c:out value="${i.index + 1 }"/>
														<input type="hidden" name="ANA_DTL_IDX"  value="<c:out value="${rowDetail.ANA_DTL_IDX }"/>" />
													</td>
													<td><input type="text" class="text ANA_DTL_LAY_OUT" name="ANA_DTL_LAY_OUT" id="ANA_DTL_LAY_OUT<c:out value="${i.index }"/>" value="<c:out value="${rowDetail.ANA_DTL_LAY_OUT }"/>"/></td>
													<td>
														<input type="number" class="number right short" name="ANA_DTL_WDT" id="ANA_DTL_WDT<c:out value="${i.index }"/>" value="<c:out value="${rowDetail.ANA_DTL_WDT }"/>" />* 
														<input type="number" class="number right short" name="ANA_DTL_HGT" id="ANA_DTL_HGT<c:out value="${i.index }"/>" value="<c:out value="${rowDetail.ANA_DTL_HGT }"/>" />
													</td>
													<td class="left"><input type="file" name="file1<c:out value="${i.index }"/>" id="file1<c:out value="${i.index }"/>" class="file pcImgFile" data-attach_cnt="1" data-accept="img" value=null/>
														<c:if test="${not empty rowDetail.CMM_FLE_IDX1}">
															<br/>
															<div id="multiFile1-list">							
																<c:set var="altTextM1Idx" value="${rowDetail.CMM_FLE_IDX1}"/>
																	
																<i class="icon-file"></i>
																<a href="<c:out value="${cdnDomain}${rowDetail.CMM_FLE_ATT_PATH1}${rowDetail.CMM_FLE_SYS_NM1 }"/>" target="_blank" title="새 창 으로 열립니다.">
																	<c:out value="${rowDetail.CMM_FLE_ORG_NM1 }"/>
																</a>
																<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1<c:out value="${i.index }"/>" name="CMM_FLE_IDX1" data-file_name="file1<c:out value="${i.index }"/>" value="<c:out value="${rowDetail.CMM_FLE_IDX1 }"/>" />
																<label for="CMM_FLE_IDX_1<c:out value="${i.index }"/>">삭제</label>
																	
															</div>
														</c:if>
													</td>
													<td class="left"><input type="file" name="file2<c:out value="${i.index }"/>" id="file2<c:out value="${i.index }"/>" class="file pcImgFile" data-attach_cnt="1" data-accept="img" value=null/>
														<c:if test="${not empty rowDetail.CMM_FLE_IDX2}">
															<br/>
															<div id="multiFile2-list">							
																<c:set var="altTextM1Idx" value="${rowDetail.CMM_FLE_IDX2}"/>
																	
																<i class="icon-file"></i>
																<a href="<c:out value="${cdnDomain}${rowDetail.CMM_FLE_ATT_PATH2}${rowDetail.CMM_FLE_SYS_NM2 }"/>" target="_blank" title="새 창 으로 열립니다.">
																	<c:out value="${rowDetail.CMM_FLE_ORG_NM2 }"/>
																</a>
																<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_2<c:out value="${i.index }"/>" name="CMM_FLE_IDX2" data-file_name="file2<c:out value="${i.index }"/>" value="<c:out value="${rowDetail.CMM_FLE_IDX2 }"/>" />
																<label for="CMM_FLE_IDX_2<c:out value="${i.index }"/>">삭제</label>
																	
															</div>
														</c:if>
													
													</td>
													<td><input type="text" class="text ANA_DTL_OVR_CLR short" name="ANA_DTL_OVR_CLR" id="ANA_DTL_OVR_CLR<c:out value="${i.index }"/>" value="<c:out value="${rowDetail.ANA_DTL_OVR_CLR }"/>" /></td>
													<td>
														<input type="text" class="text PRD_MST_CD short" name="PRD_MST_CD" id="PRD_MST_CD<c:out value="${i.index }"/>" value="<c:out value="${rowDetail.PRD_MST_CD }"/>" />
														<a href="javascript:productPop('<c:out value="${i.index }"/>');" id="productPop"class="button button-b small addAnacTop"><span>검색</span></a>
													</td>
													<td>
														<input type="text" class="text short" name="ANA_DTL_LNK" id="ANA_DTL_LNK<c:out value="${i.index }"/>" value="<c:out value="${rowDetail.ANA_DTL_LNK }"/>" />
														<a href="javascript:fnPreview('<c:out value="${rowDetail.ANA_DTL_LNK }"/>');" class="button button-b small"><span>보기</span></a>
													</td>
												</tr>
											</c:forEach>
				                         </c:when>
	                        		</c:choose>
								</tbody>
							</table>
				 		</div>
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
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacTopList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
     
        if (confirm("저장 하시겠습니까?")) 
        {	 
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacTopModify.do", "target" : "_self", "method" : "post"}).submit();	
        }    
         
    });
    
  //최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
	$(".cmmFleIdx").each(function(){
		var fileName = $(this).data("file_name");
		
		$("#"+fileName).prop("disabled", true);
	});
    
 	// 파일 삭제 check box 변경 이벤트
	$(document).on("change", ".cmmFleIdx", function () {
		var $this = $(this);
		var fileName = $(this).data("file_name");
	 
		if($this.is(":checked"))
		{
			$("#"+fileName).prop("disabled", false);	
		}
		else
		{
			$("#"+fileName).val("");
			$("#"+fileName).prop("disabled", true);
		}
	}); 
 	
	productPop = function (rnum) {
    	
    	$("#selctNum").val(rnum);
    	
        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    };
 	 
  //상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
    	
	  	var rnum = $("#selctNum").val();
    		
    	var prd_mst_cd = params[0].PRD_MST_CD;
    	
    	$("#PRD_MST_CD"+rnum).val(prd_mst_cd);
    				
    	return true;
    };
    fnPreview = function(url){
    	window.open(url);
    };
    
});
</script>
</body>
</html>