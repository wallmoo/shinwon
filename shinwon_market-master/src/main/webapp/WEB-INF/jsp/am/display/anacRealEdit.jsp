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
	                    	상세/수정-REAL ANAC
	                    </h4>
	                </div>
	
	                <p>
	                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
	                </p>
	                <form name="searchForm" id="searchForm">
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaMstRalYn" value="<c:out value="${commandMap.searchAnaRalDplYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                </form>
	                <form name="frm" id="frm" enctype="multipart/form-data">
	                	<input type="hidden" name="ANA_RAL_IDX"  value="<c:out value="${row.ANA_RAL_IDX }"/>" />
	                	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaRalDplYn" value="<c:out value="${commandMap.searchAnaRalDplYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                    <double-submit:preventer/>
		                <div class="section-form"><!-- section-form-a -->
	 	                    
		                    <div class="form-group">
		                        <label class="label"><span>상태 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="radio" name="ANA_RAL_DPL_YN" id="stateA" class="radio" value="Y" <c:if test="${row.ANA_RAL_DPL_YN eq 'Y'}"> checked="checked" </c:if> />
		                            <label for="stateA">전시</label>
		                            <input type="radio" name="ANA_RAL_DPL_YN" id="stateB" class="radio" value="N" <c:if test="${row.ANA_RAL_DPL_YN eq 'N'}"> checked="checked" </c:if> />
		                            <label for="stateB">미전시</label>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>NEW사용여부 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="radio" name="ANA_RAL_NEW_YN" id="stateA" class="radio" value="Y" <c:if test="${row.ANA_RAL_NEW_YN eq 'Y'}"> checked="checked" </c:if> />
		                            <label for="stateA">YES</label>
		                            <input type="radio" name="ANA_RAL_NEW_YN" id="stateB" class="radio" value="N" <c:if test="${row.ANA_RAL_NEW_YN eq 'N'}"> checked="checked" </c:if> />
		                            <label for="stateB">NO</label>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>상품코드 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="PRD_MST_CD" id="PRD_MST_CD" class="text" value="<c:out value="${row.PRD_MST_CD }"/>"/>
		                            <a href="javascript:productPop()" id="popProduct"class="button button-a small popProduct"><span>상품검색</span></a>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>기간계상품코드 </span></label>
		                        <div class="field">
		                        	<span id="PRD_MST_ERP_CD"><c:out value="${row.PRD_MST_ERP_CD }"/></span>
		                        </div>
		                    </div>
		                     <div class="form-group">
		                        <label class="label"><span>상품명</span></label>
		                        <div class="field">
		                        	<span id="PRD_MST_NM"><c:out value="${row.PRD_MST_NM }"/></span>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>링크1(SNS)</span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_RAL_SNS_LNK" id="ANA_RAL_SNS_LNK" class="text long" value="<c:out value="${row.ANA_RAL_SNS_LNK }"/>"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>링크2(상세) <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_RAL_DTL_LNK" id="ANA_RAL_DTL_LNK" class="text long" value="<c:out value="${row.ANA_RAL_DTL_LNK }"/>"/>
		                            <a href="javascript:fnPreview('<c:out value="${row.ANA_RAL_DTL_LNK }"/>')" class="button button-a small"><span>보기</span></a>
		                        </div>
		                    </div>
		                    <div class="form-group">                    
		                        <div class="col">
									<label class="label"><span>등록일</span></label>
									<div class="field">
										<c:out value="${row.ANA_RAL_REG_NM }"/>(<c:out value="${row.ANA_RAL_REG_ID }"/>), <ui:formatDate value="${row.ANA_RAL_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
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
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacRealList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
     
        if (confirm("저장 하시겠습니까?")) 
        {	 
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacRealModify.do", "target" : "_self", "method" : "post"}).submit();	
        }    
         
    });
    
    	
	productPop = function (rnum) {
    	
        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    };
 	 
  //상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
    	
	  	var prd_mst_cd = params[0].PRD_MST_CD;
    	var prd_mst_erp_cd  = params[0].PRD_MST_ERP_CD;
    	var prd_mst_nm  = params[0].PRD_MST_NM;
    	
    	$("#PRD_MST_CD").val(prd_mst_cd);
    	$("#PRD_MST_ERP_CD").text(prd_mst_erp_cd);
    	$("#PRD_MST_NM").text(prd_mst_nm);
    				
    	return true;
    };
    fnPreview = function(url){
    	window.open(url);
    };
    
});
</script>
</body>
</html>