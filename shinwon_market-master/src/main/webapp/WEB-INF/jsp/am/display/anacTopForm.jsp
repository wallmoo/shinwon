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
	                    <h4 class="title">등록-Top7</h4>
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
		                            <input type="radio" name="ANA_MST_DPL_YN" id="stateA" class="radio" value="Y" checked="checked"/>
		                            <label for="stateA">전시</label>
		                            <input type="radio" name="ANA_MST_DPL_YN" id="stateB" class="radio" value="N" />
		                            <label for="stateB">미전시</label>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>배너수 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="number" name=ANA_MST_BNR_CNT id="ANA_MST_BNR_CNT" class="text number"/>
		                            <a href="#none" id="addAnacTop"class="button button-a small addAnacTop"><span>적용</span></a>
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
								
								</tbody>								
							</table>
				 		</div>
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

<!-- template -->
<script id="anacTopTemplate" type="text/x-jquery-tmpl">
<tr>
	<td>\${NUM}</td>
	<td><input type="text" class="text ANA_DTL_LAY_OUT" name="ANA_DTL_LAY_OUT" id="ANA_DTL_LAY_OUT\${NUM}" /></td>
	<td>
		<input type="number" class="number right short" name="ANA_DTL_WDT" id="ANA_DTL_WDT\${NUM}" />* 
		<input type="number" class="number right short" name="ANA_DTL_HGT" id="ANA_DTL_HGT\${NUM}" />
	</td>
	<td><input type="file" name="file1" id="multiFile1\${NUM}" class="file pcImgFile" data-attach_cnt="1" data-accept="img" /></td>
	<td><input type="file" name="file2" id="multiFile1\${NUM}" class="file pcImgFile" data-attach_cnt="1" data-accept="img" /></td>
	<td><input type="text" class="text ANA_DTL_OVR_CLR short" name="ANA_DTL_OVR_CLR" id="ANA_DTL_OVR_CLR\${NUM}" /></td>
	<td><input type="text" class="text PRD_MST_CD short" name="PRD_MST_CD" id="PRD_MST_CD\${NUM}" /><a href="javascript:productPop('\${NUM}');" id="productPop"class="button button-b small"><span>검색</span></a></td>
	<td><input type="text" class="text short" name="ANA_DTL_LNK" id="ANA_DTL_LNK\${NUM}" /></td>
</tr>
</script>
 

<script type="text/javascript">
$(document).ready(function() {
	 
    fnAnacTopChk1 = function(){
    	var $obj = $("#anacTopTable").find(".applyAnacTopList .ANA_DTL_LAY_OUT");
	   	var len = $obj.length;
	   	var bReturn = -1;
	   	
	   	for(i=1;i<=len;i++)
	   	{
	   		var temp = $("#ANA_DTL_LAY_OUT"+i).val();
	   		if(temp == "")bReturn=i;
	   	}
	   	
        return bReturn;
    };
     
	 
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacTopList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
    	 
     
    	if($.trim($("#ANA_MST_BNR_CNT").val()) == ""){
			alert("배너수를 입력해 주십시오.");
			$("#ANA_MST_BNR_CNT").focus();
			return;
		}
    	 
    	var noVal = fnAnacTopChk1();
    	if(noVal > -1){
    		alert("Layout이름을 입력해 주십시오.");
			$("#ANA_DTL_LAY_OUT"+noVal).focus();
			return;
    	}
    	
        if (confirm("저장 하시겠습니까?")) 
        {
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/display/anacTopRegist.do", "target" : "_self", "method" : "post"}).submit();
        }    
         
    });
    
    
 	// 카드 추가 버튼 클릭 이벤트
    $(document).on("click", ".addAnacTop", function () {
    	addAnacTop(); // 카드 추가
    });
 	
	 //  아낙메인 추가
    function addAnacTop()
    {
	
        var $anacTopBox = $("#anacTopTable");
        var $anacTopList = $anacTopBox.find(".applyAnacTopList");
        var addLength = $("#ANA_MST_BNR_CNT").val();
        //alert("$cardList.length : "+$cardList.length);
        var arrayObj = new Array();
        
        if(addLength==""||addLength==null||addLength < 1)
        {
        	alert("배너수를 입력해 주십시오.");
			$("#ANA_MST_BNR_CNT").focus();
			return;
        }
        if(addLength > 99)
        {
        	alert("배너수를 100이하로 입력해 주십시오");
			$("#ANA_MST_BNR_CNT").focus();
			return;
        }
        
   		removeAnacTop();
   		
        for(var i = 0 ; i < addLength ; i++)
        {
            var obj = new Object();
            obj.NUM = i + 1;// productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
            arrayObj.push(obj);    
        }
        $("#anacTopTemplate").tmpl(arrayObj).appendTo($anacTopList);
    }
    function removeAnacTop()
    {
    	 var $cardBox = $("#anacTopTable");
         var $cardList = $cardBox.find(".applyAnacTopList");
         
         $cardList.children("tr").each(function() {
             
           
                 $(this).remove();
              
         });
    }
    
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
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", "#ANA_MST_BNR_CNT", function (e) {
        if(e.keyCode == 13){
            $("#addAnacTop").trigger("click");
            return false;
        }
    });
});
</script>
</body>
</html>