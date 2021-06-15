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
	                <a href="#none">전시관리</a>
	                &gt;
	                <span>브랜드전시-아낙</span>
	            </div><!-- // breadcrumb -->
	
	            <div class="contents-inner"><!-- contents-inner -->
	
	                <h3 class="title">브랜드전시-까사부가티</h3>
	                
	                <div class="tab-a justified" style="margin-top: 20px; width: 100%"><!-- tab -->
	                    <ul class="tab">
	                        <li id="CASA_BASIC_TAB"><a href="javascript:fnCasaChangeTab('BASIC');" >기본정보입력</a></li>
	                        <li id="CASA_MAIN_TAB" class = "active"><a href="javascript:fnCasaChangeTab('MAIN');" >메인화면</a></li>
	                        <li id="CASA_ITEMS_TAB"><a href="javascript:fnCasaChangeTab('ITEMS');" >ITEMS</a></li>
	                    </ul>
	                </div><!-- // tab -->
	
	                <div class="title-box">
	                    <h4 class="title">
	                    	메인 롤링 이미지
	                    </h4>
	                </div>
	                <form name="searchForm" id="searchForm">
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaMstDplYn" value="<c:out value="${commandMap.searchAnaMstDplYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                </form>
	                <form name="frm" id="frm" enctype="multipart/form-data">
	                	
	                	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaMstDplYn" value="<c:out value="${commandMap.searchAnaMstDplYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                    <double-submit:preventer/>
		                 
	                    <div id="anacMainTable" class="table-a">
		        			<table class="core">
								<colgroup>
									<col style="width: 10%;" />
								 	<col style="width: 25%;" />
								 	<col style="width: auto;" />
									<col style="width: 10%;" />
									<col style="width: 15%;" />
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>이미지</th>
										<th>링크</th>
										<th>순서</th>
										<th>사용</th>
									</tr>
								</thead>
								<tbody class="applyAnacMainList">
									<c:choose>
				                       	<c:when test="${not empty detailList }">
											<c:forEach var="rowDetail" items="${detailList }" varStatus="i">
												<tr>
													<td>
														<input type="hidden" name="CBT_MAIN_IDX"  value="<c:out value="${rowDetail.CBT_MAIN_IDX }"/>" />
														 <c:out value="${rowDetail.CBT_MAIN_IDX }"/>
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
													<td class="left">
														<input type="text" name="CBT_MAIN_LNK" id="CBT_MAIN_LNK<c:out value="${rowDetail.CBT_MAIN_IDX }"/>" class="text long CBT_MAIN_LNK<c:out value="${rowDetail.CBT_MAIN_IDX }"/>" value="<c:out value="${rowDetail.CBT_MAIN_LNK }"/>"/>
		                            					<br/><span id="msgbyte<c:out value="${rowDetail.CBT_MAIN_IDX }"/>">0</span><span id="trMsgMaxByte">/200</span>&nbsp;byte
													</td>
													<td>
														<input type="text" name="CBT_MAIN_SRT" class="number center short" value="<c:out value="${rowDetail.CBT_MAIN_SRT }"/>"/>
													</td>
													<td>
														 <input type="radio" name="CBT_MAIN_USE_YN<c:out value="${rowDetail.CBT_MAIN_IDX }"/>" id="stateA<c:out value="${rowDetail.CBT_MAIN_IDX }"/>" class="radio" value="Y" <c:if test="${rowDetail.CBT_MAIN_USE_YN eq 'Y'}"> checked="checked" </c:if> />
							                             <label for="stateA<c:out value="${rowDetail.CBT_MAIN_IDX }"/>">YES</label>
							                             <input type="radio" name="CBT_MAIN_USE_YN<c:out value="${rowDetail.CBT_MAIN_IDX }"/>" id="stateB<c:out value="${rowDetail.CBT_MAIN_IDX }"/>" class="radio" value="N" <c:if test="${rowDetail.CBT_MAIN_USE_YN eq 'N'}"> checked="checked" </c:if> />
							                             <label for="stateB<c:out value="${rowDetail.CBT_MAIN_IDX }"/>">NO</label>
													</td>
												</tr>
											</c:forEach>
				                         </c:when>
	                        		</c:choose>
								</tbody>
							</table>
				 		</div>
	                </form>
	                <c:choose>
		                <c:when test="${not empty detailList }">
							<c:forEach var="rowDetail" items="${detailList }" varStatus="i">
								<c:if test="${rowDetail.CBT_MAIN_IDX eq '1'}">
		                			<div class="section-form"><!-- section-form-a -->
		                				<div class="form-group">                    
			                				<div class="col">
			                					<label class="label"><span>등록일</span></label>
												<div class="field">
													<c:out value="${rowDetail.CBT_MAIN_UPD_NM }"/>(<c:out value="${rowDetail.CBT_MAIN_UPD_ID }"/>), <ui:formatDate value="${rowDetail.CBT_MAIN_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
												</div>
											
			                    			</div>
										</div>
									</div>
			                    </c:if>
							</c:forEach>
					    </c:when>
				    </c:choose>
		            <div class="section-button"><!-- section button -->
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
	
	$(document).on("keyup",".CBT_MAIN_LNK1",function(){
		getStrByte(this,'#msgbyte1', 200, 2);
	});
	$(document).on("keyup",".CBT_MAIN_LNK2",function(){
		getStrByte(this,'#msgbyte2', 200, 2);
	});
	$(document).on("keyup",".CBT_MAIN_LNK3",function(){
		getStrByte(this,'#msgbyte3', 200, 2);
	});
	$(document).on("keyup",".CBT_MAIN_LNK4",function(){
		getStrByte(this,'#msgbyte4', 200, 2);
	});
	$(document).on("keyup",".CBT_MAIN_LNK5",function(){
		getStrByte(this,'#msgbyte5', 200, 2);
	});
	 
	
	$("#CBT_MAIN_LNK1").trigger("keyup");
	$("#CBT_MAIN_LNK2").trigger("keyup");
	$("#CBT_MAIN_LNK3").trigger("keyup");
	$("#CBT_MAIN_LNK4").trigger("keyup");
	$("#CBT_MAIN_LNK5").trigger("keyup");
	  
   
    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
     
        if (confirm("저장 하시겠습니까?")) 
        {	 
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/casaMainModify.do", "target" : "_self", "method" : "post"}).submit();	
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
	fnCasaChangeTab  = function (pageGb) 
	{
	    	if(pageGb=="BASIC") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/casaEdit.do", "target":"_self", "method":"post"}).submit();
	    	if(pageGb=="MAIN") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/casaMainEdit.do", "target":"_self", "method":"post"}).submit();
	    	if(pageGb=="ITEMS") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/casaItemsList.do", "target":"_self", "method":"post"}).submit();
	    	
	};
 
    
});
</script>
</body>
</html>