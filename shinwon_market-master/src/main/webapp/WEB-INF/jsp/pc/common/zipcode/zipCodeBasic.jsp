<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./zipHeader.jsp" %>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-popup">
 
<div id="popContainer"><!-- popContainer -->

    <h1 class="title">우편번호 찾기</h1>

    <div id="popWrapper" class="zip-search"><!-- popWrapper -->

        <ul class="ct tab-a"><!-- tab-a -->
            <li class="active"><a href="javascript:;"><span>통합 검색</span></a><span class="blind">현재위치</span></li>
            <li><a href="<c:out value="${protocol == true ? serverSslDomain : frontDomain}" />/pc/common/commonZipCodePopup.do?searchType=DORO"><span>도로명 검색</span></a></li>
            <li><a href="<c:out value="${protocol == true ? serverSslDomain : frontDomain}" />/pc/common/commonZipCodePopup.do?searchType=JIBUN"><span>지번 검색</span></a></li>
            <li><a href="<c:out value="${protocol == true ? serverSslDomain : frontDomain}" />/pc/common/commonZipCodePopup.do?searchType=BUILDING"><span>건물명 검색</span></a></li>
        </ul><!-- tab-a -->
        
        <form name="searchForm" id="searchForm" action="<c:out value="${domain}"/>/pc/common/commonZipCodePopup.do" method="POST" target="_self">
	        	<input type="hidden" name="searchYn" id="searchYn" value="Y">
<%-- 				<input type="hidden" name="searchType" id="searchType" value="${commandMap.searchType != null ? commandMap.searchType : 'BASIC'}"> --%>
				<input type="hidden" name="searchType" id="searchType" value="${commandMap.searchType != null ? commandMap.searchType : 'BASIC'}">
				<input type="hidden" name="searchDong" id="searchDong" value="<%=searchDong%>">
				<input type="hidden" name="searchDoro" id="searchDoro" value="<%=searchDoro%>">
				<input type="hidden" name="searchLoad" id="searchLoad" value="<%=searchLoad%>">
				<input type="hidden" name="submitYn" id="submitYn" >
				<input type="hidden" name="startCount"value="<%=startCount%>">
			</form>

        <div class="search"><!-- search -->
            <div class="holder">
                <div>
                    <label for="loadName"><strong>지번/도로명 </strong></label>
                    <span class="article">
                        <input type="text" id="loadName" class="text" style="width: 270px;" value="<%=searchLoad %>"/>
                    </span>
                    <a href="javascript:search();" class="btn_st0 btn_rd small"><span>검색</span></a>
                </div>
                <ul class="list list-a">
                    <li>지번주소 : 동/읍/면/리 이름을 입력하세요.     예) 역삼동, 화도읍, 장유면</li>
                    <li>도로명주소 (새주소) : 도로명을 입력하세요    예) 중앙로, 불정로 432번길</li>
                </ul>
            </div>
        </div><!-- // search -->

        <h2 class="title"><strong>검색 결과</strong> <span class="desc dotum">(해당 주소를 클릭하면 자동 선택됩니다.)</span></h2>

        <table class="table-a"><!-- table-a -->
        <caption>번호, 주소, 우편번호로 구성된 우편번호 건물명 검색 결과 목록입니다.</caption>
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
        <tbody>
            <%@ include file="/WEB-INF/jsp/pc/search/result/result_postnm.jsp" %>
        </tbody>
        </table><!-- // table-a -->
        <div class="section-pagination"><!-- section pagination -->
	       		<%=wnsearch.getPageLinks(startCount, totalCount, viewResultCount, 10)%> 
	    </div>

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
	
	
	// 검색 클릭 이벤트
	search = function(){
		var $searchForm = $('#searchForm');
		
		//파라미터 셋팅
		$('#searchLoad').val($.trim($('#loadName').val()));
		$("#submitYn").val('Y');
		//$searchForm.attr({"action":"<c:out value="${domain}"/>/pc/common/commonZipCodePopup.do", "target":"_self", "method":"post"}).submit();
		$searchForm.submit();
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