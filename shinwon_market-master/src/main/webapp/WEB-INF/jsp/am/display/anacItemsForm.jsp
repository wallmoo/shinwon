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
	                    <h4 class="title">등록-ITEMS</h4>
	                </div>
	
	                <p>
	                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
	                </p>
	                <form name="searchForm" id="searchForm">
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaItmDplYn" value="<c:out value="${commandMap.searchAnaItmDplYn }"/>"/>
                    	<input type="hidden" name="searchAnaItmCtg" value="<c:out value="${commandMap.searchAnaItmCtg }"/>"/>
                    	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                </form>
	                <form name="frm" id="frm" enctype="multipart/form-data">
	               		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaItmDplYn" value="<c:out value="${commandMap.searchAnaItmDplYn }"/>"/>
                    	<input type="hidden" name="searchAnaItmCtg" value="<c:out value="${commandMap.searchAnaItmCtg }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                    
	                    <double-submit:preventer/>
		                <div class="section-form"><!-- section-form-a -->
		                    <div class="form-group">
		                        <label class="label"><span>상태 </span></label>
		                        <div class="field">
		                            <input type="radio" name="ANA_ITM_DPL_YN" id="stateA" class="radio" value="Y" checked="checked"/>
		                            <label for="stateA">전시</label>
		                            <input type="radio" name="ANA_ITM_DPL_YN" id="stateB" class="radio" value="N" />
		                            <label for="stateB">미전시</label>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>상품명 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_ITM_PRD_NM" id="ANA_ITM_PRD_NM" class="text long ANA_ITM_PRD_NM"/>
		                            <span id="msgbyte1">0</span><span id="trMsgMaxByte">/30</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>상품코드 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_ITM_PRD_MST_CD" id="ANA_ITM_PRD_MST_CD" class="text"/>
		                            <a href="javascript:productPop()" id="popProduct"class="button button-a small popProduct"><span>상품검색</span></a>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>상품스펙 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_ITM_PRD_SPC" id="ANA_ITM_PRD_SPC" class="text long ANA_ITM_PRD_SPC"/>
		                            <span id="msgbyte2">0</span><span id="trMsgMaxByte">/70</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>상품색상</span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_ITM_CLR" id="ANA_ITM_CLR" class="text long ANA_ITM_CLR"/>
		                            <span id="msgbyte3">0</span><span id="trMsgMaxByte">/50</span>&nbsp;byte
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>NEW 활성화 </span></label>
		                        <div class="field">
		                            <input type="checkbox" class="checkbox" name="ANA_ITM_NEW_YN" id="ANA_ITM_NEW_YN" value="Y"/>
		                            <label for="ANA_ITM_NEW_YN" >체크 시 ITEMS에서 NEW 이미지 활성화</label>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>BEST 활성화 </span></label>
		                        <div class="field">
		                            <input type="checkbox" class="checkbox" name="ANA_ITM_BST_YN" id="ANA_ITM_BST_YN" value="Y"/>
		                            <label for="ANA_ITM_BST_YN" >체크 시 ITEMS에서 BEST 이미지 활성화</label>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>anac이미지등록</span></label>
		                        <div class="field">
		                        	 <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>anac카테고리<em class="strong">*</em></span></label>
		                        <div class="field">
		                        	 <select id="ANA_ITM_CTG" name="ANA_ITM_CTG" class="select" title="카테고리">
    									<option value="">선택</option>
    									<c:forEach items="${categoryList}" var="data">
     									<option value="<c:out value="${data.CMN_COM_IDX}"/>">
     									    <c:out value="${data.CMN_COM_NM}"/>
     									</option> 
     								</c:forEach> 
    					           </select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>MD's Talk<em class="strong">*</em></span></label>
		                        <div class="field">
		                        	 <textarea class="textarea ANA_ITM_MD_TAK" name="ANA_ITM_MD_TAK" id="ANA_ITM_MD_TAK" style="height: 60px;"></textarea>
		                        	 <span id="msgbyte4">0</span><span id="trMsgMaxByte">/290</span>&nbsp;byte
		                        </div>
		                    </div>
		                </div><!-- // section-form-a -->
 	                </form>
	
	                <div class="section-button"><!-- section button -->
	                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
	                    <a href="#none" id="goRegist" class="button button-b"><span>등록</span></a>
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
	$(document).on("keyup",".ANA_ITM_PRD_NM",function(){
		getStrByte(this,'#msgbyte1', 30, 2);
	});
	$(document).on("keyup",".ANA_ITM_PRD_SPC",function(){
		getStrByte(this,'#msgbyte2', 70, 2);
	});
	$(document).on("keyup",".ANA_ITM_CLR",function(){
		getStrByte(this,'#msgbyte3', 50, 2);
	});
	$(document).on("keyup",".ANA_ITM_MD_TAK",function(){
		getStrByte(this,'#msgbyte4', 290, 2);
	});
	
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacItemsList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
    	 
     
    	if($.trim($("#ANA_ITM_PRD_NM").val()) == ""){
			alert("상품명을 입력해 주십시오.");
			$("#ANA_ITM_PRD_NM").focus();
			return;
		}
    	
    	if($.trim($("#ANA_ITM_PRD_MST_CD").val()) == ""){
			alert("기간계 상품코드를 입력해 주십시오.");
			$("#ANA_ITM_PRD_MST_CD").focus();
			return;
		}
    	
    	if($.trim($("#ANA_ITM_PRD_SPC").val()) == ""){
			alert("상품스펙을 입력해 주십시오.");
			$("#ANA_ITM_PRD_SPC").focus();
			return;
		}
    	
    	if($.trim($("#ANA_ITM_CTG").val()) == ""){
			alert("카테고리를 입력해 주십시오.");
			$("#ANA_ITM_CTG").focus();
			return;
		}
    	
    	if($.trim($("#ANA_ITM_MD_TAK").val()) == ""){
			alert("MD's Talk를 입력해 주십시오.");
			$("#ANA_ITM_MD_TAK").focus();
			return;
		}
   
        if (confirm("저장 하시겠습니까?")) 
        {
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacItemsRegist.do", "target" : "_self", "method" : "post"}).submit();
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
    	
    	$("#ANA_ITM_PRD_MST_CD").val(prd_mst_cd);
    	//$("#PRD_MST_ERP_CD").text(prd_mst_erp_cd);
    	$("#ANA_ITM_PRD_NM").val(prd_mst_nm);
    	$("#ANA_ITM_PRD_NM").trigger("keyup");
    	return true;
    };
});
</script>
</body>
</html>