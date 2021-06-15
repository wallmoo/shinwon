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

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">다중 검색 테스트</h3>
                
                <div class="form-group">
					<div class="field">				
							<a href="javascript:vendorSearch();" class="button button-b small"><span>입점업체 검색</span></a>
							<a href="javascript:brandSearch();" class="button button-b small"><span>브랜드 검색</span></a>
							<a href="javascript:memberSearch();" class="button button-b small"><span>회원 검색</span></a>
							
							<div class="table-a"><!-- col list -->
								<table class="core">
									<colgroup>
										<col style="width: 5%;" />
										<col style="width: 10%;" />
										<col style="width: auto;" />
										<col style="width: 10%;" />
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" class="checkbox checkAll" /></th>
											<th>업체코드</th>
											<th>업체명</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody class="applyVendorList">
		                                <tr class="vendorNodata"><!-- row -->
		                                    <td colspan="4">입점업체를 검색해 주세요.</td>
		                                </tr>
									</tbody>
								</table>
							</div><!-- // col list -->
							
							<div class="table-a"><!-- col list -->
								<table class="core">
									<colgroup>
										<col style="width: 5%;" />
										<col style="width: 10%;" />
										<col style="width: auto;" />
										<col style="width: 10%;" />
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" class="checkbox checkAll" /></th>
											<th>브랜드코드</th>
											<th>브랜드명</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody class="applyBrandList">
		                                <tr class="brandNodata"><!-- row -->
		                                    <td colspan="4">브랜드를 검색해 주세요.</td>
		                                </tr>
									</tbody>
								</table>
							</div><!-- // col list -->
							
							<div class="table-a"><!-- col list -->
								<table class="core">
									<colgroup>
										<col style="width: 5%;" />
										<col style="width: 10%;" />
										<col style="width: 10%;" />
										<col style="width: auto;" />
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" class="checkbox checkAll" /></th>
											<th>기간계고객코드</th>
											<th>고객명</th>
											<th>아이디</th>
										</tr>
									</thead>
									<tbody class="applyMemberList">
		                                <tr class="memberNodata"><!-- row -->
		                                    <td colspan="4">회원을 검색해 주세요.</td>
		                                </tr>
									</tbody>
								</table>
							</div><!-- // col list -->
					</div>
				</div>

            </div><!-- // contents-inner -->

        </section><!-- // contents -->

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<script id="vendorTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="VDR_MST_ERP_IDs" value="\${VDR_MST_ERP_ID}"/></td>
	<td>\${VDR_MST_ERP_ID}<input type="hidden" class="VDR_MST_ERP_ID" name="VDR_MST_ERP_ID\${NUM}" value="\${VDR_MST_ERP_ID}"/></td>
	<td>\${VDR_MST_NM}</td>
	<td>\${VDR_MST_USE_YN}</td>
</tr>
</script>
<script id="brandTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="BND_MST_IDXs" value="\${BND_MST_IDX}"/></td>
	<td>\${BND_MST_IDX}<input type="hidden" class="BND_MST_IDX" name="BND_MST_IDX\${NUM}" value="\${BND_MST_IDX}"/></td>
	<td>\${BND_MST_BRAND_NM}</td>
	<td>\${BND_MST_USE_YN}</td>
</tr>
</script>
<script id="memberTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="MEM_MST_MEM_IDs" value="\${MEM_MST_MEM_ID}"/></td>
	<td>\${MEM_MST_ERP_ID}<input type="hidden" class="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID\${NUM}" value="\${MEM_MST_MEM_ID}"/></td>
	<td>\${MEM_MST_MEM_NM}</td>
	<td>\${MEM_MST_MEM_ID}</td>
</tr>
</script>
<script type="text/javascript">
$(function(){
	
	// 입점업체 다중 검색 팝업 
    vendorMultiSearch = function () {
    	window.open("<c:out value="${serverDomain}"/>/am/site/searchVendorMultiPopup.do","searchVendorMultiPopup","width=800,height=700,scrollbars=yes,target=_blank");
    };
    
	// 브랜드 다중 검색 팝업
    brandMultiSearch = function () {
    	window.open("<c:out value="${serverDomain}"/>/am/site/searchBrandMultiPopup.do","searchBrandMultiPopup","width=800,height=700,scrollbars=yes,target=_blank");
    };
    
	// 회원 다중 검색 팝업
    memberSearch = function () {
    	window.open("<c:out value="${serverDomain}"/>/am/member/searchMemberPopup.do","searchMemberPopup","width=900,height=700,scrollbars=yes,target=_blank");
    };
    
  	//입점업체 중복체크
    fnDuplicationVendorChk = function( selectObj ){
        var bReturn = true;
        var $obj = $(".form-group").find(".applyVendorList .VDR_MST_ERP_ID");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
    
  	//입점업체팝업 입점업체선택시 호출되는 메소드
    fnResultVendor = function(params){
    	var bCheck = true;
    	//입점업체중복체크
    	$.each( params, function( index, el ){
    		if( !fnDuplicationVendorChk( el.VDR_MST_ERP_ID )){
    			alert("["+el.VDR_MST_NM+"] 이미 선택된 입점업체입니다.");
				bCheck = false;
    			return false;
    		}
    	});
    	if( bCheck ){
        	//기본TR삭제
        	$(".form-group").find(".vendorNodata").remove();
        	//배열재정의
        	var arrayObj = new Array();
    		var obj;
    		$.each(params, function(index,item){
        		obj = new Object();
        		obj.VDR_MST_ERP_ID 			= item.VDR_MST_ERP_ID;
        		obj.VDR_MST_NM 				= item.VDR_MST_NM;
        		obj.VDR_MST_USE_YN 			= item.VDR_MST_USE_YN;
        		
        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        	});
    		$( "#vendorTemplate" ).tmpl( arrayObj ).appendTo($(".form-group").find(".applyVendorList"));
    	}
    	return true;
    };
    
  	//브랜드 중복체크
    fnDuplicationBrandChk = function( selectObj ){
        var bReturn = true;
        var $obj = $(".form-group").find(".applyBrandList .BND_MST_IDX");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
    
  	//브랜드팝업 브랜드선택시 호출되는 메소드
    fnResultBrand = function(params){
    	var bCheck = true;
    	//브랜드중복체크
    	$.each( params, function( index, el ){
    		if( !fnDuplicationBrandChk( el.BND_MST_IDX )){
    			alert("["+el.BND_MST_BRAND_NM+"] 이미 선택된 회원입니다.");
				bCheck = false;
    			return false;
    		}
    	});
    	if( bCheck ){
        	//기본TR삭제
        	$(".form-group").find(".brandNodata").remove();
        	//배열재정의
        	var arrayObj = new Array();
    		var obj;
    		$.each(params, function(index,item){
        		obj = new Object();
        		obj.BND_MST_IDX 			= item.BND_MST_IDX;
        		obj.BND_MST_BRAND_NM 		= item.BND_MST_BRAND_NM;
        		obj.BND_MST_USE_YN 			= item.BND_MST_USE_YN;
        		
        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        	});
    		$( "#brandTemplate" ).tmpl( arrayObj ).appendTo($(".form-group").find(".applyBrandList"));
    	}
    	return true;
    };
    
  	//회원 중복체크
    fnDuplicationMemberChk = function( selectObj ){
        var bReturn = true;
        var $obj = $(".form-group").find(".applyMemberList .MEM_MST_MEM_ID");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
    
  	//회원팝업 회원선택시 호출되는 메소드
    fnResultMember = function(params){

  		var bCheck = true;
    	//회원중복체크
    	$.each( params, function( index, el ){
    		if( !fnDuplicationMemberChk( el.MEM_MST_MEM_ID )){
    			alert("["+el.MEM_MST_MEM_ID+"] 이미 선택된 회원입니다.");
				bCheck = false;
    			return false;
    		}
    	});
    	if( bCheck ){
        	//기본TR삭제
        	$(".form-group").find(".memberNodata").remove();
        	//배열재정의
        	var arrayObj = new Array();
    		var obj;
    		$.each(params, function(index,item){
        		obj = new Object();
        		obj.MEM_MST_ERP_ID 			= item.MEM_MST_ERP_ID;
        		obj.MEM_MST_MEM_NM 			= item.MEM_MST_MEM_NM;
        		obj.MEM_MST_MEM_ID 			= item.MEM_MST_MEM_ID;
        		
        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        	});
    		$( "#memberTemplate" ).tmpl( arrayObj ).appendTo($(".form-group").find(".applyMemberList"));
    	}
    	return true;
    };
    
});
</script>
</body>
</html>