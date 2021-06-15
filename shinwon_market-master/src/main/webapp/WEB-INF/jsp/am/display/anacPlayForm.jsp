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
	                    <h4 class="title">등록-PLAY</h4>
	                </div>
	
	                <p>
	                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
	                </p>
	                <form name="searchForm" id="searchForm">
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaPlyDplYn" value="<c:out value="${commandMap.searchAnaPlyDplYn }"/>"/>
                    	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                </form>
	                <form name="frm" id="frm" enctype="multipart/form-data">
	               		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchAnaPlyDplYn" value="<c:out value="${commandMap.searchAnaPlyDplYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
	                    
	                    <double-submit:preventer/>
		                <div class="section-form"><!-- section-form-a -->
		                    <div class="form-group">
		                        <label class="label"><span>상태 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="radio" name="ANA_PLY_DPL_YN" id="stateA" class="radio" value="Y" checked="checked"/>
		                            <label for="stateA">전시</label>
		                            <input type="radio" name="ANA_PLY_DPL_YN" id="stateB" class="radio" value="N" />
		                            <label for="stateB">미전시</label>
		                        </div>
		                    </div>
		                     
		                    <div class="form-group">
		                        <label class="label"><span>구분 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <select id="ANA_PLY_GBN" name="ANA_PLY_GBN" class="select" title="구분">
    		                         	<option value="">선택</option>
    									<option value="C">CF</option>
    									<option value="P">상품</option>
    									<option value="A">애니</option>
    									<option value="B">방송</option> 
    					          	</select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>동영상명 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_PLY_VDO" id="ANA_PLY_VDO" class="text"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>썸네일</span></label>
		                        <div class="field">
		                        	 <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>URL<em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="ANA_PLY_URL" id="ANA_PLY_URL" class="text long"/>
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
	 
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacPlayList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
    	 
     
    	if($.trim($("#ANA_PLY_GBN").val()) == ""){
			alert("구분을 입력해 주십시오.");
			$("#ANA_PLY_GBN").focus();
			return;
		}
    	
    	if($.trim($("#ANA_PLY_VDO").val()) == ""){
			alert("동영상명을 입력해 주십시오.");
			$("#ANA_PLY_VDO").focus();
			return;
		}
    	
    	if($.trim($("#ANA_PLY_URL").val()) == ""){
			alert("동영상명을 입력해 주십시오.");
			$("#ANA_PLY_URL").focus();
			return;
		}
       	
        if (confirm("저장 하시겠습니까?")) 
        {
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacPlayRegist.do", "target" : "_self", "method" : "post"}).submit();
        }    
         
    });
    
 
});
</script>
</body>
</html>