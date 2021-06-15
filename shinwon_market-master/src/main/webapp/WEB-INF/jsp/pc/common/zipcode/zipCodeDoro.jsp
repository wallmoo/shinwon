<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/common/zipcode/zipHeader.jsp" %>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-popup">

	<div id="popContainer"><!-- popContainer -->
	
	    <h1 class="title">우편번호 찾기</h1>
	
	    <div id="popWrapper" class="zip-search"><!-- popWrapper -->
	
	        <ul class="ct tab-a"><!-- tab-a -->
	            <li><a href="<c:out value="${protocol == true ? serverSslDomain : frontDomain}" />/pc/common/commonZipCodePopup.do?searchType=BASIC"><span>통합 검색</span></a></li>
	            <li class="active"><a href="javascript:;"><span>도로명 검색</span></a><span class="blind">현재위치</span></li>
	            <li><a href="<c:out value="${protocol == true ? serverSslDomain : frontDomain}" />/pc/common/commonZipCodePopup.do?searchType=JIBUN"><span>지번 검색</span></a></li>
	            <li><a href="<c:out value="${protocol == true ? serverSslDomain : frontDomain}" />/pc/common/commonZipCodePopup.do?searchType=BUILDING"><span>건물명 검색</span></a></li>
	        </ul><!-- tab-a -->
	
	        <form name="searchForm" id="searchForm" action="<c:out value="${domain}"/>/pc/common/commonZipCodePopup.do" method="POST" target="_self">
	        	<input type="hidden" name="searchYn" id="searchYn" value="Y">
<%-- 				<input type="hidden" name="searchType" id="searchType" value="${commandMap.searchType != null ? commandMap.searchType : 'BASIC'}"> --%>
				<input type="hidden" name="searchType" id="searchType" value="${commandMap.searchType != null ? commandMap.searchType : 'DORO'}">
				<input type="hidden" name="searchSido" id="searchSido" value="<%=searchSido%>">
				<input type="hidden" name="searchSigungu" id="searchSigungu" value="<%=searchSigungu%>">
				
				<input type="hidden" name="searchDoro" id="searchDoro" value="<%=searchDoro%>">
				<input type="hidden" name="searchBuildMainNo" id="searchBuildMainNo" value="<%=searchBuildMainNo%>">
				<input type="hidden" name="searchBuildSubNo" id="searchBuildSubNo" value="<%=searchBuildSubNo%>">
				<input type="hidden" name="submitYn" id="submitYn">
				<input type="hidden" name="startCount"value="<%=startCount%>">
			</form>
	        
	        <ul class="list list-a">
	            <li>찾고 싶으신 도로명과 건물번호를 입력해 주세요.</li>
	            <li><span class="essential"><em class="blind">필수입력 표시</em></span> 필수입력사항을 선택(입력) 후, 검색버튼을 클릭해 주세요.</li>
	        </ul>
	        
	        <div class="search"><!-- search -->
	            <div class="holder">
	                <div>
	                    <span class="article">
	                        <span class="essential"><em class="blind">필수입력</em></span>
	                        <select class="sel_chg" id="sido" title="시/도">
                            	<option value="">시/도 선택</option>
                            	<c:forEach var="sidoRow" items="${sidoList}" varStatus="i">
                            		<option value="<c:out value="${sidoRow.CMN_COM_NM}"/>" data-sido_idx="<c:out value="${sidoRow.CMN_COM_ETC1 }"/>" <c:if test="${sidoRow.CMN_COM_NM eq commandMap.searchSido }">selected="selected"</c:if>>
                            			<c:out value="${sidoRow.CMN_COM_NM}"/>
                            		</option>
                            	</c:forEach>
                            </select>
	                    </span>
	                    <span class="article">
	                        <span class="essential"><em class="blind">필수입력</em></span>
	                        <select class="sel_chg" id="sigungu" title="시/군/구">
	                            <option value="">시/군/구 선택</option>
	                        </select>
	                    </span>
	                    <span class="article">
	                        <span class="essential"><em class="blind">필수입력</em></span>
	                        <input type="text" class="text" id="doro" maxlength="35" placeholder="도로명 입력" title="도로명" value="<c:out value="${commandMap.searchDoro }"/>"/>
	                    </span>
	                </div>
	                <div class="mt10">
	                    <label for="buildNo"><strong>건물번호</strong></label>
	                    <span class="article">
	                        <!-- <span class="essential"><em class="blind">필수입력</em></span> -->
	                        <input type="text" class="text small number" id="buildMainNo" title="건물번호 본번" placeholder="본번" value="<%=searchBuildMainNo%>"/>
	                        <input type="text" class="text small number" id="buildSubNo" title="건물번호 부번" placeholder="부번" value="<%=searchBuildSubNo%>"/>
	                    </span>
	                    <a href="javascript:search();" class="btn_st0 btn_rd small"><span>검색</span></a>
	                    <a href="javascript:reset();" class="btn_st0 btn_blk777 small"><span>초기화</span></a>
	                </div>
	            </div>
	        </div><!-- // search -->
	
	        <h2 class="title"><strong>검색 결과</strong> <span class="desc dotum">(해당 주소를 클릭하면 자동 선택됩니다.)</span></h2>
	
	        <table class="table-a"><!-- table-a -->
	        <caption>번호, 주소, 우편번호로 구성된 우편번호 도로명 검색 결과 목록입니다.</caption>
	        <colgroup>
	            <col style="width: 10%;" />
	            <col style="width: 15%;" />
	            <col style="width: 13%;" />
	            <col style="width: auto;" />
	        </colgroup>
	        <thead>
	            <tr>
	                <th scope="col"><span>NO</span></th>
	                <th scope="col"><span>우편번호</span></th>
	                <th scope="col" colspan="2"><span>주소</span></th>
	            </tr>
	        </thead>
	           <%@ include file="/WEB-INF/jsp/pc/search/result/result_postnm.jsp" %>
	        </table><!-- // table-a -->
	        
	        <div class="section-pagination"><!-- section pagination -->
	       		<%=wnsearch.getPageLinks(startCount, totalCount, viewResultCount, 10)%> 
            </div><!-- // section pagination -->
	
	        <div class="section-button"><!-- section-button -->
	            <a href="javascript:self.close();" class="btn_st1 btn_blk777 large"><span>닫기</span></a>
	        </div><!-- // section-button -->
	
	    </div><!-- // popWrapper -->
	</div><!-- // popContainer -->

<script>
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
            url : "<c:out value="${domain}"/>/pc/common/commonZipCodePopupSigunguAjax.do",
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
                com.sel_chg($("#sigungu"), 'chg');
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
	$(document).on("click","#sido",function(){
		if($(this).val() != ""){
			searchSigungu();
		}else{
			$("#sigungu").empty();
			$("#sigungu").append("<option value=\"\">시/군/구 선택</option>");
			com.sel_chg($("#sigungu"), 'chg');
		} 
		
		$('#sido').val($(this).val());	
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
			alert('[시/도]를 선택해주세요.');
			$('#sido').focus();
			return;
		}

		if(isSigunguCheck){
			if( $('#searchSigungu').val() == "" ){
				alert('[시/군/구]를 선택해주세요.');
				$('#sigungu').focus();
				return;
			}
		}
		
		//파라미터 셋팅
		$('#searchDoro').val($.trim($('#doro').val()));
		$('#searchBuildMainNo').val($.trim($('#buildMainNo').val()));
		$('#searchBuildSubNo').val($.trim($('#buildSubNo').val()));
	
		if( $('#searchDoro').val() == "" ){
			alert("[도로명]을 입력해주세요.");
			$('#doro').focus();
			return;
		}
		
		/* if( $('#searchBuildMainNo').val() == "" ){
			alert("[건물번호 본번]을 입력해주세요.");
			$('#buildMainNo').focus();
			return;
		} */
		
		//$searchForm.attr({"action":"<c:out value="${domain}"/>/pc/common/commonZipCodePopup.do", "target":"_self", "method":"post"}).submit();
		$searchForm.submit();
	};
	
	// 초기화 버튼 클릭 이벤트
	reset = function(){
		// 시/도 초기화
		com.sel_chg($("#sido"), 'reset');
		// 시/군/구 초기화
		com.sel_chg($("#sigungu"), 'chg');
		
		$("#searchSigungu").val("");
		
		$("#doro").val(""); // 도로명 초기화
		$("#buildMainNo").val(""); 	// 건물번호 본번 초기화
		$("#buildSubNo").val(""); 	// 건물번호 본번 초기화
		
	};
	
	var $addrInfo = "";
	// 도로명 선택주소 적용
	setDoroAddrInfo = function(addrIdx){
		$addrInfo = $('.doroInfo');
		
		var zip = $addrInfo.eq(addrIdx).data('zip');	// 우편번호(5자리)
		var doroAddr = $addrInfo.eq(addrIdx).data('doro'); // 도로명주소
		var jibunAddr = $addrInfo.eq(addrIdx).data('jibun'); // 지번주소
		opener.zipcodeCallback(zip,doroAddr,jibunAddr);
		this.close();
	};
	
	// 지번 선택주소 적용
	setJibunAddrInfo = function(addrIdx){
		$addrInfo = $('.jibunInfo');
		
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