<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./zipHeader.jsp" %>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">우편번호 찾기</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
		
		<h2 class="semantic">우편번호 찾기</h2>
		
		<div class="tab-a justified" style="margin-top: 20px;"><!-- tab -->
             <ul class="tab">
                 <li><a href="<c:out value="${serverDomain}" />/am/common/commonZipCodePopup.do?searchType=BASIC"><span>통합 검색</span></a></li>
                 <li><a href="<c:out value="${serverDomain}" />/am/common/commonZipCodePopup.do?searchType=DORO"><span>도로명 검색</span></a></li>
                 <li class="active"><a href="<c:out value="${serverDomain}" />/am/common/commonZipCodePopup.do?searchType=JIBUN"><span>지번 검색</span></a></li>
                 <li><a href="<c:out value="${serverDomain}" />/am/common/commonZipCodePopup.do?searchType=BUILDING"><span>건물명 검색</span></a></li>
             </ul>
         </div><!-- // tab -->

		<form name="searchForm" id="searchForm" action="<c:out value="${serverDomain}"/>/am/common/commonZipCodePopup.do" method="POST" target="_self">
			<input type="hidden" name="searchYn" id="searchYn" value="Y">
<%-- 			<input type="hidden" name="searchType" id="searchType" value="${commandMap.searchType != null ? commandMap.searchType : 'BASIC'}"> --%>
			<input type="hidden" name="searchType" id="searchType" value="${commandMap.searchType != null ? commandMap.searchType : 'DORO'}">
			<input type="hidden" name="searchSido" id="searchSido" value="<c:out value="${commandMap.searchSido}"/>">
			<input type="hidden" name="searchSigungu" id="searchSigungu" value="<c:out value="${commandMap.searchSigungu}"/>">
			
			<input type="hidden" name="searchDong" id="searchDong" value="<%=searchDong %>">
			<input type="hidden" name="searchJinomain" id="searchJinomain" value="<%=searchJinomain %>">
			<input type="hidden" name="searchJinosub" id="searchJinosub" value="<%=searchJinosub %>">
			<input type="hidden" name="searchMountYn" id="searchMountYn" value="<%=searchMountYn%>">
			<input type="hidden" name="submitYn" id="submitYn">
			<input type="hidden" name="startCount"value="<%=startCount%>">
		</form>
		
        <div class="searchTypeJibun"><!-- step2 지번주소로 찾기 -->
            <p style="padding-left:20px;">
            	-   찾고 싶으신 동/읍/면/리와 번지를 입력해 주세요.<br/>
            	-   <strong class="strong">*</strong> 필수입력사항을 선택(입력) 후, 검색버튼을 클릭해 주세요.
            </p>
            
            <div class="search-zip"><!-- search-zip -->
            	<div>
	                <em class="strong">*</em>
	                <select class="select" id="sido" title="시/도">
	                	<option value="">시/도 선택</option>
	                	<c:forEach var="sidoRow" items="${sidoList}" varStatus="i">
	                		<option value="<c:out value="${sidoRow.CMN_COM_NM}"/>" data-sido_idx="<c:out value="${sidoRow.CMN_COM_ETC1 }"/>" <c:if test="${sidoRow.CMN_COM_NM eq commandMap.searchSido }">selected="selected"</c:if>>
	                			<c:out value="${sidoRow.CMN_COM_NM}"/>
	                		</option>
	                	</c:forEach>
	                </select>
                   	<em class="strong">*</em>
                    <select class="select" id="sigungu" title="시/군/구">
                        <option value="">시/군/구 선택</option>
                    </select>
                    <em class="strong">*</em>
                    <input type="text" class="text" id="dong" maxlength="15" placeholder="동/읍/면 입력" value="<c:out value="${commandMap.searchDong }"/>"/>
            	</div>
            	<div class="mt5">
            		<strong>번지</strong>
	                <input type="checkbox" name="MOUNT_YN" id="MOUNT_YN" value="1" <c:if test="${commandMap.searchMountYn eq '1'}">checked="checked"</c:if>/>
					<label for="MOUNT_YN">산</label>
                    <input type="text" class="text number" id="jinoMain" placeholder="지번_본번 입력" title="지번_본번" value="<%=searchJinomain %>"/>
                    -&nbsp;
                    <input type="text" class="text number" id="jinoSub" placeholder="지번_부번 입력" title="지번_부번" value="<%=searchJinosub %>"/> 
	                <a href="javascript:search();" class="button button-b"><span>검색</span></a>
					<a href="javascript:reset();" class="button"><span>초기화</span></a>                            
            	</div>
            	
			</div><!-- // search-zip -->
            
        </div><!-- // step2 -->
        
		<h2>검색결과 <small style="font-weight:normal;font-size:14px;">(해당 주소를 클릭하면 자동 선택됩니다.)</small></h2>		
		
        <div class="table-a"><!-- col list -->
	        <table class="core">
	            <colgroup>
	                <col style="width: 5%;" />
	                <col style="width: 15%;" />
	                <col style="width: 10%;">
	                <col style="width: auto;" />
	            </colgroup>
	            <thead>
	                <tr>
	                    <th>NO</th>
	                    <th>우편번호</th>
	                    <th> </th>
	                    <th>주소</th>
	                </tr>
	            </thead>
	            <%@ include file="/WEB-INF/jsp/am/search/result/result_postnm.jsp" %>
	        </table>
	    </div><!-- // col list -->
	     <div class="pagination"><!-- pagination -->
	    		<%=wnsearch.getPageLinks(startCount, totalCount, viewResultCount, 10)%> 
	    </div>
	    
	    <a href="javascript:self.close();" class="button button-b" style="float:right;margin-top:10px;"><span> 닫기 </span></a>
	    
	</div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.blockUI.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.slimscroll.min.js"></script>
<script>
//우편번호페이징
function doPostPaging(count) {
	var searchForm = document.searchForm;
	searchForm.startCount.value = count;
	searchForm.submitYn.value="Y";
	searchForm.submit();
}

$(function(){
	
	// 검색 엔터 이벤트 
    $(document).on("keydown", "input[type='text']", function (e) {
        if(e.keyCode == 13){
            search();
            return false;
        }
    });
	
	// 시/군/구 목록 조회
	searchSigungu = function(){
		$.ajax
        ({
            async : false,
            type : "POST",
            data : {"SIDO":$("#sido").val()},
            url : "<c:out value="${serverDomain}" />/am/common/commonZipCodePopupSigunguAjax.do",
            success : function (data) 
            { 
                var str = "<option value=\"\">시/군/구 선택</option>"; 
                
                if(data.list.length > 0){
                	$.each(data.list, function(index,item)
            		{
                        var rowSigungu = item.SIGUNGU;
                       	if($("#searchSigungu").val() != ""){
                       		var selected = rowSigungu == $("#searchSigungu").val() ? "selected" : ""; // 기존 선택된 시/군/구가 있는 경우 selected
                           	str += "<option value=\"" + rowSigungu + "\" "+ selected +">" + rowSigungu + "</option>";                        		
                       	}
                        else{
                        	str += "<option value=\"" + rowSigungu + "\">" + rowSigungu + "</option>";	
                        }
                        
                    });
                }
                
                $("#sigungu").empty();
                $("#sigungu").append(str);
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
            }
        });
	};
	
	// 시/도가 선택 되어 있는 경우 시/군/구 목록 조회
	if("${commandMap.searchSido}" != ""){
		searchSigungu();
	}
	
	// 시/도 선택에 따른 시/군/구 목록 조회
	$(document).on("change","#sido",function(){
		if($(this).val() != ""){
			searchSigungu();
		}else{
			$("#sigungu").empty();
			$("#sigungu").append("<option value=\"\">시/군/구 선택</option>");
		} 
		
		$('#sido').val($(this).val());	
	});
	
	// 지번 검색에서 checkbox 변경 이벤트
	$(document).on("change","#MOUNT_YN",function(){
		if($(this).is(":checked")){
			$(this).val("1");
		}
		else{
			$(this).val("");
		}
	});
	
	// 검색 클릭 이벤트
	search = function(){
		var $searchForm = $('#searchForm');
		$("#submitYn").val('Y');
		$('#searchSido').val($('#sido').val());
		$('#searchSigungu').val($('#sigungu').val());
		
		var isSigunguCheck = true;
		if($('#searchSido').val() == "세종특별자치시"){ //세종시의 경우 시/군/구 유효성 체크하지 않음
			isSigunguCheck = false;
		}	
		
		if( $('#searchSido').val() == "" ){
			alert('[시/도]는 필수 선택사항입니다.');
			$('#sido').focus();
			return;
		}

		if(isSigunguCheck){
			if( $('#searchSigungu').val() == "" ){
				alert('[시/군/구]는 필수 선택사항입니다.');
				$('#sigungu').focus();
				return;
			}
		}
		
		//파라미터 셋팅
		$('#searchDong').val($.trim($('#dong').val()));
		$('#searchJinomain').val($.trim($('#jinoMain').val()));
		$('#searchJinosub').val($.trim($('#jinoSub').val()));
		
		if($("#MOUNT_YN").is(":checked")){
			$("#searchMountYn").val($("#MOUNT_YN").val());
		}
		else{
			$("#searchMountYn").val("");
		}

		if( $('#searchDong').val() == "" ){
			alert('[동/읍/면]은 필수 입력사항입니다.');
			$('#dong').focus();
			return;
		}
	
	
		//$searchForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonZipCodePopup.do", "target":"_self", "method":"post"}).submit();
		$searchForm.submit();
	};
	
	// 초기화 버튼 클릭 이벤트
	reset = function(){
		
		$("#sido").children("option:eq(0)").prop("selected",true);	// 시/도 초기화
		
		// 시/군/구 초기화
		$("#sigungu").children("option:eq(0)").prop("selected",true); 
		$("#searchSigungu").val("");
		
		$("#dong").val("");	// 읍/면/동 초기화
		$("#MOUNT_YN").prop("checked",false);	// 산 checkbox 초기화
		$("#jinoMain").val(""); // 지번 본번 초기화
		$("#jinoSub").val(""); // 지번 부번 초기화

	};
	
	// 선택주소 적용
	setAddrInfo = function(addrIdx){
		var $addrInfo = $('.addr_info');
		
		var zip = $addrInfo.eq(addrIdx).data('zip');	// 우편번호(5자리)
		var doroAddr = $addrInfo.eq(addrIdx).data('doro'); // 도로명주소
		var jibunAddr = $addrInfo.eq(addrIdx).data('jibun'); // 지번주소
		opener.zipcodeCallback(zip,doroAddr,jibunAddr);
		this.close();
	};
});
</script>
</body>
</html>