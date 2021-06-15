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
	                    <h4 class="title">등록</h4>
	                </div>
	
	                <p>
	                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
	                </p>
	                <form name="searchForm" id="searchForm">
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchMniShpUseYn" value="<c:out value="${commandMap.searchMniShpUseYn }"/>"/>
	                    <input type="hidden" name="searchRegType" value="<c:out value="${commandMap.searchRegType }"/>"/>
	                    <input type="hidden" name="searchRegTypeKeyword" value="<c:out value="${commandMap.searchRegTypeKeyword }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                </form>
	                <form name="frm" id="frm" enctype="multipart/form-data">
	                	<input type="hidden" name="BCNC_CD" id="BCNC_CD" value=""/>
	                	<input type="hidden" name="COMP_CD" id="COMP_CD" value=""/>
	                	
		                <div class="section-form"><!-- section-form-a -->
		                    <div class="form-group">
		                        <label class="label"><span>ERP매장코드</span></label>
		                        <div class="field">
									<p class="img-text">
	                                 	<span id="BCNC_CD_SPAN">* 매장 조회 후 선택된 매장의 ERP매장코드 자동으로 불러옴</span> 
	                             	</p>		                            	
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>매장명 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="BCNC_NM" id="BCNC_NM" class="text" readonly/>
			                        <a href="javascript:;" id="findStore" class="button button-b small"><span>조회</span></a>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>수수료율 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="MNI_SHP_RATE" id="MNI_SHP_RATE" class="text small"/>%
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>사용여부 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="radio" name="MNI_SHP_USE_YN" id="stateA" class="radio" value="Y" checked="checked"/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="MNI_SHP_USE_YN" id="stateB" class="radio" value="N" />
		                            <label for="stateB">미사용</label>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group pcImgDiv" >
		                        <label class="label"><span>PC 매장 이미지<em class="strong">*</em></span></label>
                                <div class="field">
                                	<div id="multiFile1-list">							
									</div>
                                    <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
                                    <small class="desc">※ 이미지는 1000 X 260 사이즈의 JPG,GIF,PNG 파일만 등록이 가능합니다.</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    </p>
                                </div>
		                    </div>
		                    <div class="form-group mobileImgDiv">
		                        <label class="label"><span>MOBILE 매장 이미지<em class="strong">*</em></span></label>
                                <div class="field">
									<div id="multiFile3-list">							
									</div>
                                    <input type="file" name="file2" id="multiFile3" class="file mobileImgFile" data-attach_cnt="1" data-accept="img" />
                                    <small class="desc">※ 이미지는 640 X 260 사이즈의 JPG,GIF,PNG 파일만 등록이 가능합니다.</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text mobileImgFile" placeholder="20자 이내로 입력하세요."/>
                                    </p>
                                </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>매장URL</span></label>
		                        <div class="field">
		                            <p class="img-text">
                                        <span>* 자동생성</span> 
                                    </p>
		                        </div>
		                    </div>
		                </div><!-- // section-form-a -->
	                </form>
	
	                <div class="section-button"><!-- section button -->
	                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
	                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
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

<script type="text/javascript">
$(document).ready(function() {
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/site/storeManagerList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {    	
    	
    	if($("#BCNC_NM").val() == ""){
			alert("매장명을 입력해 주십시오.");
			$("#BCNC_NM").focus();
			return;
		}
    	
    	if($("#MNI_SHP_RATE").val() == ""){
			alert("수수료율을 입력해 주십시오.");
			$("#MNI_SHP_RATE").focus();
			return;
		}
    	
    	//이미지 첨부 체크    	
   		var file = $("input[name='file']").val();
   		
   		if(file == ""){
   			alert("PC 매장 이미지를 등록해 주십시오.");
   			return;
   		}else if($.trim($("#CMN_FLE_ALT_TXT_P1").val()) == ""){//대체텍스트 체크
   			alert("PC 매장 이미지 대체 텍스트를 입력해 주십시오.");
   			$("#CMN_FLE_ALT_TXT_P1").focus();
   			return;
   		}

   		var file2 = $("input[name='file2']").val();
   		
   		if(file2 == ""){
   			alert("MOBILE 매장 이미지를 등록해 주십시오.");
   			return;
   		}else if($.trim($("#CMN_FLE_ALT_TXT_M1").val()) == ""){//대체텍스트 체크
   			alert("MOBILE 매장 이미지 대체 텍스트를 입력해 주십시오.");
   			$("#CMN_FLE_ALT_TXT_M1").focus();
   			return;
   		}
    	
        if (confirm("저장 하시겠습니까?")) 
        {
            $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/site/storeManagerRegist.do", "target" : "_self", "method" : "post"}).submit();
        }    
        
    });
    
    // 매장 조회 팝업
    $(document).on("click", "#findStore", function () {
        popup("<c:out value="${serverDomain}" />/am/site/searchShopPopup.do", "900", "500", "yes", "searchStore");
    });
    
    $(document).on("click", "input[name='BCNC_NM']", function ()
    {
    	popup("<c:out value="${serverDomain}" />/am/site/searchShopPopup.do", "900", "500", "yes", "searchStore");
    });
    
 	// 팝업에서 선택한 매장 
    fnResultErpShop = function(obj)
    {
    	$("#BCNC_CD").val(obj.SHOP_CD);
    	$("#BCNC_NM").val(obj.SHOP_NM);
    	$("#BCNC_CD_SPAN").html(obj.SHOP_CD);
    	$("#COMP_CD").val(obj.COMP_CD);
    	
    	return true;
    };
    
});
</script>
</body>
</html>